import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/my_packages/status_view/controller/story_controller.dart';
import 'package:pets/my_packages/status_view/utils.dart';
import 'package:pets/my_packages/status_view/widgets/story_view.dart';
import 'package:pets/screens/status/model/status_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
StatusAll status;
int index;
  VideoApp(this.status,this.index);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //    widget.url)
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    consolePrint(widget.index.toString());
    storyController = StoryController() ;
    // for(int i=0;i<widget.index;i++) {
    //   storyController.next();
    //   storyController.next();
    //   storyController.next();
    // consolePrint("i="+i.toString());
    // }
  }
  StoryController storyController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body:
          StoryView(
            controller: storyController,
              onComplete: () { Navigator.pop(context);},
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Navigator.pop(context);
                }
              },
              storyItems:
            [



                        widget.status.type == "image"
                            ? StoryItem.pageImage(
                                url: Api.imagePath + widget.status.image,
                                duration: Duration(seconds: widget.status.duration),
                                controller: storyController)
                            : StoryItem.pageVideo(
                                Api.imagePath + widget.status.image,
                            duration: Duration(seconds: widget.status.duration),
                                controller: storyController),

            ]
      ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    storyController.dispose();
  }
}