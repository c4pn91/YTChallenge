import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:ytchallenge/models/response_model.dart';
import 'package:ytchallenge/utils/strings_utils.dart';


class VideoDetails extends StatefulWidget {

  final Item video;

  VideoDetails(this.video);

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {


  YoutubePlayerController _controller;

  @override
  void initState() {
    String videoURL = 'https://www.youtube.com/watch?v=${widget.video.id}';

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.snippet.channelTitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(widget.video.snippet.avatarChannel)
                        )
                    )),
                title: Text(widget.video.snippet.title),
                subtitle: Text("${StringUtils.getViewCount(int.parse(widget.video.statistics.viewCount))} de vistas  •  Hace ${StringUtils.getTimeSinceUpload(widget.video.snippet.publishedAt)}  •  ${StringUtils.getViewCount(int.parse(widget.video.statistics.dislikeCount))} Dislikes  •  ${StringUtils.getViewCount(int.parse(widget.video.statistics.likeCount))} Likes"),
                dense: false,
                isThreeLine: true,
              ),
              Divider(),
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(widget.video.snippet.description, textAlign: TextAlign.start, maxLines: 11, style: TextStyle(fontSize: 15),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
