import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Container(
            height: 52.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xF202835),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Container(
              height: 52.h,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search videos podcasts or blog",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}