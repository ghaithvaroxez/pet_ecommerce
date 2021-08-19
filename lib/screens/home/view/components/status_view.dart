import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/status/model/status_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StatusView extends StatefulWidget {
  List<StatusAll> status;
  int index;
  StatusView(this.status,this.index);
  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  VideoPlayerController _controller;
  List<StatusAll>before=[];
  List<StatusAll>after=[];
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //    widget.url)
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    before=widget.status.sublist(0,widget.index);
    after=widget.status.sublist(widget.index,widget.status.length-1);
if(widget.status.length>1)
    after.add(widget.status[widget.status.length-1]);
    consolePrint(widget.index.toString());
    storyController = StoryController();
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
progressPosition: ProgressPosition.top,
            controller: storyController,
            onComplete: () { Navigator.pop(context);},
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
             storyController.previous();
              }
              if (direction == Direction.up) {
             storyController.next();
              }
            },
            storyItems:
            [
...List<StoryItem>.generate(after.length, (index) => after[index].type=="image"
    ? StoryItem.pageImage(
    url: Api.imagePath + after[index].image,
    duration: Duration(seconds: after[index].duration),
    controller: storyController)
    : StoryItem.pageVideo(
    Api.imagePath + after[index].image,
    duration: Duration(seconds: after[index].duration),
    controller: storyController)),

              ...List<StoryItem>.generate(before.length, (index) => before[index].type=="image"
    ? StoryItem.pageImage(
    url: Api.imagePath + before[index].image,
    duration: Duration(seconds: before[index].duration),
    controller: storyController)
    : StoryItem.pageVideo(
    Api.imagePath + before[index].image,
    duration: Duration(seconds: before[index].duration),
    controller: storyController)),

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