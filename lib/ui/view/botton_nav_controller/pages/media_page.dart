import 'package:fitness/ui/view/widgets/tabs/grid_view_page.dart';

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
                child: GridViewDetails(),
              ),
              Container(
                child: GridViewDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
