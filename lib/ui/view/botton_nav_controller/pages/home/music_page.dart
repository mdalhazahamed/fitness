import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/blog_details_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/music_details.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../details/video_details_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('all_products');

  //queryName
  late Future<QuerySnapshot> _futureDataMusic;

  @override
  void initState() {
    _futureDataMusic = _refference.where('music_songs', isEqualTo: true).get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          AspectRatio(
            aspectRatio: 0.7,
            child: FutureBuilder<QuerySnapshot>(
                future: _futureDataMusic,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.hasData) {
                    List<Map> items = parseData(snapshot.data);
                    return newestPodcastMusic(items);
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
            'description': e['description'],
            'profile_img': e['profile_img'],
            'position': e['position'],
            'name': e['name'],
            'date': e['date'],
            'subtitle': e['subtitle'],
            'title': e['title'],
            'like': e['like'],
            'rating': e['rating'],
            'music': e['music'],
          })
      .toList();
  return listItems;
}

GridView newestPodcastMusic(List<Map<dynamic, dynamic>> items) {
  return GridView.builder(
    itemCount: items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
    ),
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return InkWell(
        onTap: () => Get.toNamed(musicDetailsPage,
            arguments: MusicDetailsPage(thisItem)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage((thisItem['img'])),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 48.h, left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(thisItem['title'],
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(thisItem['subtitle'],
                    style: TextStyle(fontSize: 15.sp, color: Colors.white)),
              ],
            ),
          ),
        ),
      );
    },
  );
}
