import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';

import 'package:fitness/ui/view/botton_nav_controller/details/reviews_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../const/dimensions.dart';

class FavouriteDetails extends StatefulWidget {
  FavouriteDetails(this.favourite);

  Map favourite;
  @override
  _FavouriteDetailsState createState() => _FavouriteDetailsState();
}

class _FavouriteDetailsState extends State<FavouriteDetails>
    with SingleTickerProviderStateMixin {
//add to favourite
  addtoFavourite() async {
    FirebaseFirestore.instance
        .collection('challenges')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc()
        .set(
      {
        'img': widget.favourite['img'][0],
        'location': widget.favourite['location'],
        'description': widget.favourite['description'],

        // 'fa-cost': widget.detailsData['list_cost'],
      },
    ).whenComplete(() {
      Fluttertoast.showToast(
          msg: "Added to favourite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white,
          fontSize: 13.0);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> checkFav(
      BuildContext context) async* {
    yield* FirebaseFirestore.instance
        .collection("Users-Favourite")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .orderBy("fav-image", descending: widget.favourite['img'][0])
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Favourite", style: TextStyle(fontSize: 18.sp)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_outlined, size: 25.sp),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              //background image
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: Dimensions.popularFoodImgSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.favourite['img'][0]),
                    ),
                  ),
                ),
              ),
              //icon widgets
              Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ),
              //introduction widgets
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize - 20,
                child: Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height20),
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    size: 16.sp,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    widget.favourite['location'],
                                    style: TextStyle(fontSize: 12.sp),
                                  )
                                ],
                              ),
                              SizedBox(height: Dimensions.height15),
                              Text(
                                "Description",
                                style: TextStyle(fontSize: 24.sp),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                widget.favourite['description'],
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //exandabletext widget
            ],
          ),
        ));
  }
}
