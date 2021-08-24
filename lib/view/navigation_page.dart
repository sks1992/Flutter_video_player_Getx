import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_video_player/controllers/home_controller.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigationView"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            init: HomeController(),
            //here controller is instance of HomeController
            builder: (controller) => Expanded(
              child: Center(
                child: controller.chewieController != null &&
                    controller.chewieController!.videoPlayerController.value
                        .isInitialized
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
        ],
      ),
    );
  }
}
