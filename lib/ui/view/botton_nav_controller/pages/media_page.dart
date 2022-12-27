import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import '../../../style/style.dart';
import '../../auth/login_screen.dart';
import '../../widgets/back_dialog_box.dart';
import 'media/media_bolg_page.dart';
import 'media/podocast_page.dart';
import 'media/video_page.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 30.h,
              elevation: 0,
              bottom: TabBar(
                labelColor: AppColors.backgroudColor,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 4,
                indicatorColor: AppColors.backgroudColor,
                labelStyle: style18(Colors.white),
                tabs: [
                  Tab(
                    text: "Videos",
                  ),
                  Tab(
                    text: "Pocdasts",
                  ),
                  Tab(
                    text: "Blog",
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
                  Container(
                    child: MediaBlogPage(),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () => _onBackButtonPressed(
              context,
            ));
  }
}

Future<bool> _onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackDialogBox();
      });
  return exitApp ?? false;
}
