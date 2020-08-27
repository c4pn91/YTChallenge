import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytchallenge/services/main_service.dart';
import 'package:ytchallenge/widgets/video_list.dart';

class MainPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    final responseYoutube = Provider.of<MainService>(context).videos;

    return Scaffold(
      body: (responseYoutube.length == 0)
          ? Center(child: CircularProgressIndicator(),)
          : VideoList(responseYoutube),
    );
  }
}