import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytchallenge/pages/library_page.dart';
import 'package:ytchallenge/pages/notifications_page.dart';
import 'package:ytchallenge/pages/subs_page.dart';
import 'package:ytchallenge/pages/trends_page.dart';

import 'main_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _ButtomNavBar(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navModel = Provider.of<_NavModel>(context);

    return PageView(
      controller: navModel._pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        TrendsPage(),
        SubsPage(),
        NotificationsPage(),
        LibraryPage(),
      ],
    );
  }

}

class _ButtomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navModel = Provider.of<_NavModel>(context);

    return BottomNavigationBar(
        currentIndex: navModel.currentPage,
        onTap: (i) => navModel.currentPage = i,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,), title: Text("Principal",),),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), title: Text("Tendencias")),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), title: Text("Suscripciones")),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text("Notificaciones")),
          BottomNavigationBarItem(icon: Icon(Icons.folder), title: Text("Biblioteca")),
        ]
    );
  }

}

class _NavModel with ChangeNotifier {

  int _currentPage = 0;
  PageController _pageController = PageController();

  int get currentPage => this._currentPage;

  set currentPage(int page) {
    this._currentPage = page;
    _pageController.animateToPage(page, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}