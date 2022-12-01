import 'package:fitness/ui/view/botton_nav_controller/pages/home/bolg_page.dart';

import 'package:flutter/material.dart';

import 'media/podocast_page.dart';
import 'media/video_page.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0XFF090D22),
        appBar: AppBar(
          backgroundColor: Color(0XFF090D22),
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Videos",
              ),
              Tab(
                text: "Pocdasts",
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Container(
                child: MediaVideoPage(),
              ),
              Container(
                child: MediaPodcastPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
