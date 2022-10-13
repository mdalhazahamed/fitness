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
        backgroundColor: Color(0xE5E5E5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
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
                color: Colors.white,
                child: MediaVideos(),
              ),
              Container(
                color: Colors.white,
                child: MediaPodcasts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
