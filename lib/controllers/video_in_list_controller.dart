import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoInListController extends GetxController {

  late VideoPlayerController videoPlayerController; //create an instance of videoPlayerController class instance

  ChewieController? chewieController; //create instance of chewieController

  @override
  void onInit() {
    super.onInit();
    initializePlayer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    videoPlayerController.dispose();
    chewieController!.dispose();

    super.onClose();
  }


  Future<void> initializePlayer() async{
/*Constructs a VideoPlayerController playing a video from obtained from the network.
* it will initialize when onInit Called */
    videoPlayerController = VideoPlayerController.asset(
        'assets/sk.mp4');
//it mean this future function will wait till videoPlayerController initialize
    await Future.wait([videoPlayerController.initialize()]);

    //create instance of chewieController
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController, //The controller for the video you want to play
        autoPlay: true,//Play the video as soon as it's displayed
        looping: true,//Whether or not the video should loop
        aspectRatio: 3/2,
        materialProgressColors: ChewieProgressColors(//The colors to use for the Material Progress Bar. By default, the Material player uses the colors from your Theme.
            playedColor: Colors.redAccent,
            handleColor: Colors.lightBlueAccent,
            backgroundColor: Colors.yellow,
            bufferedColor: Colors.lightGreen
        ),
        placeholder: Container(//The placeholder is displayed underneath the Video before it is initialized or played.
          color: Colors.greenAccent,
        ),
        autoInitialize: true //Initialize the Video on Startup. This will prep the video for playback.
    );

    update();
  }

}
//A Future is used to represent a potential value, or error, that will be available at some time in the future.

//update() => Rebuilds GetBuilder each time you call update(); Can take a List of ids, that will only update the matching GetBuilder( id: ), ids can be reused among GetBuilders like group tags. The update will only notify the Widgets, if condition is true.