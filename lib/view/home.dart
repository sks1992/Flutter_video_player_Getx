import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_video_player/view/home_view.dart';
import 'package:getx_video_player/view/navigation_page.dart';
import 'package:getx_video_player/view/remote_video.dart';
import 'assets_video_in_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key:  ValueKey<String>('home_page'),
        appBar: AppBar(
          title: Text("Video Player"),
          centerTitle: true,
          actions: [
            IconButton(
              key:  ValueKey<String>('push_tab'),
              onPressed: () {
                Get.to(NavigationPage());
              },
              icon: Icon(Icons.navigation),
            ),
          ],
          bottom:  TabBar( //This widget appears across the bottom of the app bar
            isScrollable: true,//Whether this tab bar can be scrolled horizontally.
            tabs: <Widget>[ //1
              Tab(
                icon: Icon(Icons.cloud),
                text: "Remote",
              ),
              Tab(icon: Icon(Icons.insert_drive_file), text: "Asset"),
              Tab(icon: Icon(Icons.list), text: "List example"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            RemoteVideo(),
            HomeView(),
            AssetsVideoInList(),
          ],
        ),
      ),
    );
  }
}

/**
 * 1. bottom => Typically a list of two or more Tab widgets.
    The length of this list must match the controller's TabController.length and the length of the TabBarView
 */
