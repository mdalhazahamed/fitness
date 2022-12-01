import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/view/widgets/nav_home_callenges.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../style/style.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  //collectionName
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('callenges');

  //queryName

  late Future<QuerySnapshot> _futureDataMostPopularMeal;
  late Future<QuerySnapshot> _futureDataMoreMEal;

  @override
  void initState() {
    _futureDataMostPopularMeal = _refference.where('most_popular_meal', isEqualTo: true).get();
    _futureDataMoreMEal = _refference.where('more_meal', isEqualTo: true).get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          navHomeCallenges(
            "Most Popular Meals",
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 200.h,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDataMostPopularMeal,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return mostPopularMeal(items);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          SizedBox(height: 10.h),
          navHomeCallenges(
            "More Meals",
          ),
          SizedBox(height: 15.h),
          Container(
            height: 300.h,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDataMoreMEal,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return moreMeal(items);
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
            'nickname': e['nickname'],
            'position': e['position'],
            'rating': e['rating'],
            'total': e['total'],
            'food': e['food'],
          })
      .toList();
  return listItems;
}

ListView mostPopularMeal(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map calleages = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () {
            // Get.toNamed(favouriteDetails);
          },
          child: Container(
            width: 120.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Color(0xFF202835),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Container(
                    height: 110.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          calleages['img'][0],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 32.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20.sp,
                        color: Color(0xFFF0BE3D),
                      ),
                      SizedBox(width: 5.w),
                      Text(calleages['rating'], style: style16(Colors.white))
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  calleages['food'],
                  style: style18,
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

ListView moreMeal(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    //physics: NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map calleages = items[i];
      return Padding(
        padding: EdgeInsets.only(left: 16.w, top: 16),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(calleages['img'][0]),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  calleages['name'],
                  style: style,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      calleages['position'],
                      style: style14(Colors.white),
                    ),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.circle,
                      size: 6.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 6.w),
                    Row(
                      children: [
                        Text(
                          calleages['total'],
                          style: style14(Colors.grey),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Trainer",
                          style: style14(Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
