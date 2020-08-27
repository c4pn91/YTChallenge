import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytchallenge/pages/home_page.dart';
import 'package:ytchallenge/pages/video_details.dart';
import 'package:ytchallenge/services/main_service.dart';
import 'package:ytchallenge/theme/theme.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainService(),),
        ],
        child: MaterialApp(
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/" : (BuildContext context) => MyApp(),
          },
        ),
      )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
        seconds: 3
    ), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image(image: AssetImage('assets/youtube_icon.png'), width: 100, height: 100,),
        )
    );
  }



}