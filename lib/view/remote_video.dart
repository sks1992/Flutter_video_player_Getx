import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_video_player/controllers/remote_video_controller.dart';

class RemoteVideo extends StatelessWidget {
  const RemoteVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GetBuilder<RemoteVideoController>(
            init: RemoteVideoController(),
            builder: (controller) => Expanded(
              child: Column(
                children: [
                  Container(padding: EdgeInsets.all(10.0)),
                  const Text('With remote mp4'),
                  Container(
                    child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Center(
                            child: controller.chewieController != null &&
                                    controller
                                        .chewieController!
                                        .videoPlayerController
                                        .value
                                        .isInitialized
                                ? Chewie(
                                    controller: controller.chewieController!)
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
