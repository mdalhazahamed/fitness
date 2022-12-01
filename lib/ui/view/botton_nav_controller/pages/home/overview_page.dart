import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/widgets/details/details_page.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/home/see_all_product.dart';
import 'package:fitness/ui/view/widgets/nav_home-categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  //collectionName
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('videos');

  //queryName
  late Future<QuerySnapshot> _futureDataNewestPodcast;
  late Future<QuerySnapshot> _futureDataRecommededVideos;


  @override
  void initState() {
    _futureDataNewestPodcast =
        _refference.where('newest_podcast', isEqualTo: true).get();
    
_futureDataRecommededVideos =
        _refference.where('recommended_videos', isEqualTo: true).get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //tabs
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: navHomeCategories(
              "Newest Podcast",
              () => Get.toNamed(seeAllProduct,
                  arguments: SeeAllProduct('newest_podcast')),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 140.h,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDataNewestPodcast,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return newestPodcast(items);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          SizedBox(height: 20.h),
          navHomeCategories(
            "Recommended Videos",
            () => Get.toNamed(seeAllProduct,
                arguments: SeeAllProduct('recommended_videos')),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 170.h,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDataRecommededVideos,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return recommendedVideos(items);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}

List<Map> parseData(QuerySnapshot querySnapshot) {
  List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
  List<Map> listItems = listDocs
      .map((e) => {
            'img': e['img'],
            'name': e['name'],
            'date': e['date'],
            'subtitle': e['subtitle'],
            'title': e['title'],
          })
      .toList();
  return listItems;
}

ListView newestPodcast(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(videosDetails, arguments: ViewDetails(thisItem)),
          child: Container(
            width: 280.w,
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(thisItem["img"][0]),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.w, left: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    thisItem['title'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    thisItem['subtitle'],
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        thisItem['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Text("-"),
                      SizedBox(width: 10),
                      Text(
                        thisItem['date'],
                        style: TextStyle(color: Colors.white),
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

ListView recommendedVideos(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 14.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(videosDetails, arguments: ViewDetails(thisItem)),
          child: Container(
            width: 280.w,
            height: 170.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(thisItem["img"][0]),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.w, left: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    thisItem['title'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    thisItem['date'],
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
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
