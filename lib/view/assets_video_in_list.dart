import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:getx_video_player/controllers/video_in_list_controller.dart';
import 'package:getx_video_player/reuseable_widget/video_list_card.dart';

class AssetsVideoInList extends StatelessWidget {
  const AssetsVideoInList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        VideoListCard(title: "Item a"),
        VideoListCard(title: "Item b"),
        VideoListCard(title: "Item c"),
        VideoListCard(title: "Item d"),
        VideoListCard(title: "Item e"),
        VideoListCard(title: "Item f"),
        VideoListCard(title: "Item g"),
        Card(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.cake),
                title: Text("Video video"),
              ),
              Stack(
                  alignment: FractionalOffset.bottomRight +
                      const FractionalOffset(-0.1, -0.1),
                  children: <Widget>[
                    GetBuilder<VideoInListController>(
                      init: VideoInListController(),
                      //here controller is instance of HomeController
                      builder: (controller) => Expanded(
                        child: Center(
                          child: controller.chewieController != null &&
                                  controller.chewieController!
                                      .videoPlayerController.value.isInitialized
                              ? Chewie(controller: controller.chewieController!)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text('Lading')
                                  ],
                                ),
                        ),
                      ),
                    ),
                    Image.asset('assets/flutter-mark-square-64.png'),
                  ]),
            ],
          ),
        ])),
        VideoListCard(title: "Item h"),
        VideoListCard(title: "Item i"),
        VideoListCard(title: "Item j"),
        VideoListCard(title: "Item k"),
        VideoListCard(title: "Item l"),
      ],
    );
  }
}
