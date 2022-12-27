import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsTabs extends StatefulWidget {
  const ReviewsTabs({super.key});

  @override
  State<ReviewsTabs> createState() => _ReviewsTabsState();
}

class _ReviewsTabsState extends State<ReviewsTabs> {
  List _reviews = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("reviews").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _reviews.add({
          "img": qn.docs[i]["img"],
          "name": qn.docs[i]["name"],
          "work": qn.docs[i]["work"],
          "rating": qn.docs[i]["rating"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _reviews.length,
      primary: false,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 65.h,
                    width: 65.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_reviews[index]["img"]),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _reviews[index]["name"],
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        _reviews[index]["work"],
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0XFFF0BE3D),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    _reviews[index]["rating"],
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(width: 10.w),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
