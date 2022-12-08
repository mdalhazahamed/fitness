import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/view/widgets/nav_home_callenges.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../route/route.dart';
import '../../../../style/style.dart';
import '../../details/favourite_details.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //collectionName
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('challenges');

  //queryName

  late Future<QuerySnapshot> _futureDatQuiz;
  late Future<QuerySnapshot> _futureDataQuizResult;

  @override
  void initState() {
    _futureDatQuiz = _refference.where('qoiz', isEqualTo: true).get();
    _futureDataQuizResult =
        _refference.where('qoiz_result', isEqualTo: true).get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(mainMenu);
              },
              child: Text(
                "Quiz Now",
              ),
            ),
          ),
          SizedBox(height: 10.h),
          navHomeCallenges(
            "Best Quiz Results",
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 200.h,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDatQuiz,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return bestQuiz(items);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          SizedBox(height: 10.h),
          navHomeCallenges(
            "All Results",
          ),
          SizedBox(height: 15.h),
          Container(
            height: 300.h,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDataQuizResult,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return allResult(items);
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
              'location': e['location'],
            'description': e['description'],
          })
      .toList();
  return listItems;
}

ListView bestQuiz(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map calleages = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () => Get.toNamed(favouriteDetails,
              arguments: FavouriteDetails(calleages)),
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
                Column(
                  children: [
                    SizedBox(height: 2.w),
                    Text(calleages['name'],
                        style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                    Text(calleages['nickname'],
                        style: TextStyle(fontSize: 15.sp, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  calleages['position'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

ListView allResult(List<Map<dynamic, dynamic>> items) {
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
              onTap: () => Get.toNamed(favouriteDetails,
                  arguments: FavouriteDetails(calleages)),
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
                  style: style18(Colors.white),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      calleages['position'],
                      style: style14,
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
                          style: style14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Trainer",
                          style: style14,
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
