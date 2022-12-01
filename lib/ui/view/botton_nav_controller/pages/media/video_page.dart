import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MediaVideoPage extends StatefulWidget {
  const MediaVideoPage({Key? key}) : super(key: key);

  @override
  State<MediaVideoPage> createState() => _MediaVideoPageState();
}

class _MediaVideoPageState extends State<MediaVideoPage> {
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('videos');

  //queryName
  late Future<QuerySnapshot> _futureDataMediaVideos;

  @override
  void initState() {
    _futureDataMediaVideos =
        _refference.where('media_videos', isEqualTo: true).get();

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
                future: _futureDataMediaVideos,
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

GridView newestPodcast(List<Map<dynamic, dynamic>> items) {
  return GridView.builder(
    itemCount: items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
    ),
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage((thisItem['img'][0])),
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
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(thisItem['subtitle'],
                  style: TextStyle(fontSize: 16.sp, color: Colors.white)),
            ],
          ),
        ),
      );
    },
  );
}
