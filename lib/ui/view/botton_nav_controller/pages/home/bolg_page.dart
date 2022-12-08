import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BolgPage extends StatefulWidget {
  const BolgPage({Key? key}) : super(key: key);

  @override
  State<BolgPage> createState() => _BolgPageState();
}

class _BolgPageState extends State<BolgPage> {
  var _dotPosition = 0;
  List _grid_view_items = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  //queryName

  fetchProducts() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("grid_view_items").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _grid_view_items.add({
          "img": qn.docs[i]["img"],
          "title": qn.docs[i]["title"],
          "subtitle": qn.docs[i]["subtitle"],
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
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GridView.builder(
        itemCount: _grid_view_items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Get.toNamed(videosDetails);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage((_grid_view_items[index]['img'][0])),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 48.h, left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_grid_view_items[index]['title'],
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(_grid_view_items[index]['subtitle'],
                        style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
