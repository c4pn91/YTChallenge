import 'package:flutter/material.dart';
import 'package:ytchallenge/models/response_model.dart';
import 'package:ytchallenge/pages/video_details.dart';
import 'package:ytchallenge/services/main_service.dart';
import 'package:ytchallenge/theme/theme.dart';
import 'package:ytchallenge/utils/strings_utils.dart';

class VideoList extends StatelessWidget {

  final List<Item> listVideo;
  final _pageController = new PageController();
  VideoList(this.listVideo);

  getNextVideos() {
    if (_pageController.position.pixels >= _pageController.position.maxScrollExtent) {
      MainService.instance.fetchMainVideos();
    }
  }

  @override
  Widget build(BuildContext context) {

    /*
    _pageController.addListener(() {
      getNextVideos();
    });
    */

    return ListView.builder(
      controller: _pageController,
      itemBuilder: (context, index) { // ignore: missing_return
        if (index < this.listVideo.length) {
          return _Video(video: this.listVideo[index], index: index, ctx: context);
        }
      },
    );
  }
}

class _Video extends StatelessWidget {

  final Item video;
  final int index;
  final BuildContext ctx;

  const _Video({ @required this.video, @required this.index, @required this.ctx });

  @override
  Widget build(BuildContext context) {
    final item = Column(
      children: <Widget>[
        _CardImage(video),
        _CardBody(video),
        SizedBox( height: 15 ),
      ],
    );

    return GestureDetector(
      child: item,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoDetails(video)
            )
        );
      },
    );
  }
}

class _CardButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 15, horizontal: 0 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: CircleBorder(),
            child: Icon( Icons.share, color: Colors.amber, ),
            padding: EdgeInsets.symmetric( vertical: 10, horizontal: 10 ),
          ),

          //SizedBox( width: 10 ),
          /*
          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: Icon( Icons.mobile_screen_share ),
          ),
          */
        ],
      ),
    );
  }
}

class _CardBody extends StatelessWidget {

  final Item video;

  const _CardBody( this.video );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        // child: Text( (video.snippet.description != null) ? video.snippet.description : '', style: TextStyle(color: Colors.blue), overflow: TextOverflow.fade, maxLines: 2, softWrap: false,)
        child: ListTile(
          leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(video.snippet.avatarChannel)
                  )
              )),
          title: Text(video.snippet.title),
          subtitle: Text("${StringUtils.getViewCount(int.parse(video.statistics.viewCount))} de vistas  •  Hace ${StringUtils.getTimeSinceUpload(video.snippet.publishedAt)}"),
          dense: true,
        ),
    );
  }
}

class _CardImage extends StatelessWidget {

  final Item video;

  const _CardImage( this.video );

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: EdgeInsets.symmetric( vertical: 0 ),
      child: ClipRRect(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(0), topRight: Radius.circular(0) ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                  child: (video.snippet.thumbnails.high.url != null)
                      ? FadeInImage(
                    placeholder: AssetImage('assets/load.gif'),
                    image: NetworkImage(video.snippet.thumbnails.high.url),
                  ) : Image( image: AssetImage('assets/no_image.png',), width: 50, height: 50,)
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            _CardTitle(video),
            Positioned(
                bottom: 0,
                right: 0,
                child: _CardTopInfo(video)
            ),
            /*
            Positioned(
              bottom: 0,
              left: -10,
              child: _CardButtons(),
            )
            */
          ],
        ),
      ),
    );

    return card;
  }
}

class _CardTitle extends StatelessWidget {

  final Item video;

  const _CardTitle( this.video );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 8, vertical: 10 ),
      child: Text(
        video.snippet.channelTitle,
        style: TextStyle( fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}

class _CardTopInfo extends StatelessWidget {

  final Item video;
  //final int index;

  const _CardTopInfo(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10),
      margin: EdgeInsets.only( bottom: 10 ),
      child: Row(
        children: <Widget>[
          Text('${StringUtils.getViewCount(int.parse(video.statistics.dislikeCount))} Dislikes  •  ${StringUtils.getViewCount(int.parse(video.statistics.likeCount))} Likes',
            style: TextStyle(
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
