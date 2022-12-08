import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/const/dimensions.dart';

import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'overview_page.dart';

class SeeAllProduct extends StatefulWidget {
  var compare;
  SeeAllProduct(this.compare);
  @override
  State<SeeAllProduct> createState() => _SeeAllProductState();
}

class _SeeAllProductState extends State<SeeAllProduct> {
  //collectionName

  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('all_products');

  //queryName
  late Future<QuerySnapshot> _futureDataNewestPodcast;
  late Future<QuerySnapshot> _futureDataRecommededVideos;

  @override
  void initState() {
    _futureDataNewestPodcast =
        _refference.where(widget.compare, isEqualTo: true).get();
    _futureDataRecommededVideos =
        _refference.where(widget.compare, isEqualTo: true).get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF090D22),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              Icon(Icons.arrow_back, size: 25, color: AppColors.backgroudColor),
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Color(0XFF090D22),
        title: Text(
          "See All",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _futureDataNewestPodcast,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.hasData) {
            List<Map> items = parseData(snapshot.data);
            return forYouBuildGridview(items);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

ListView forYouBuildGridview(List<Map<dynamic, dynamic>> shoppingItems) {
  return ListView.builder(
    itemCount: shoppingItems.length,
    itemBuilder: (_, i) {
      Map thisItem = shoppingItems[i];
      return InkWell(
        onTap: () => Get.to(DetailsPage(thisItem)),
        child: Container(
          height: 90.h,
          child: Card(
            color: Colors.white,
            elevation: 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(thisItem["img"][0]),
                      ),
                    ),
                    child: Icon(Icons.play_arrow,
                        color: Colors.white, size: 40.sp),
                  ),
                  SizedBox(width: Dimensions.width20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        thisItem['title'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            thisItem['subtitle'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Icon(
                            Icons.circle,
                            size: 8.sp,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            thisItem['date'],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
