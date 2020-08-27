import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  var _title;

  VideoPlayerPage(this._title);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState(_title);
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  var _title;
  VideoPlayerController _videoPlayerController;

  _VideoPlayerPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        child: _videoPlayerController.value.initialized ?
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController),
        ) : Container(

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    String url = "http://gslb.miaopai.com/stream/oxX3t3Vm5XPHKUeTS-zbXA__.mp4";
    _videoPlayerController = VideoPlayerController.network(url);
    _videoPlayerController.initialize().then((value) => {
      setState(()=>{

      })
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}
