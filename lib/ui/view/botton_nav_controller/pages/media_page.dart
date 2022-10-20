import 'package:fitness/ui/view/widgets/tabs/media_podasts_tabs.dart';
import 'package:fitness/ui/view/widgets/tabs/media_videos_tabs.dart';
import 'package:flutter/material.dart';

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
                child: MediaVideos(),
              ),
              Container(
                child: MediaPodcasts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
