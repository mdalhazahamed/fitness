import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/const/dimensions.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteDetails extends StatelessWidget {
  const FavouriteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    fit: BoxFit.cover, image: AssetImage("assets/alhaz2.jpeg")),
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
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.backgroudColor,
                      size: 30.sp,
                    ))
              ],
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
                color: Color(0xFF090D22),
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
                                color: Colors.grey,
                                size: 16.sp,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Bosila, Dhaka",
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.height15),
                          Text(
                            "Description",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.sp),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Food is the necessity of life. It provides nutrition, sustenance and growth to human body. Food can be classified into cereals, pulses, nuts and oilseeds, vegetable, fruits, milk and milk products and flesh food. Food comprises protein, facts, carbohydrates, vitamins, minerals salts and water. Most of the food items contain all these in varying properties. Oil and ghee are exclusively fats while sugarcane and starch contain high amount of carbohydrates. Accordingly, food items are termed as protein rich, vitamin rich, fat rich food etc",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
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
    );
  }
}
