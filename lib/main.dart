import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchs/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Run(),
    );
  }
}

class Run extends StatefulWidget {
  const Run({Key? key}) : super(key: key);

  @override
  _RunState createState() => _RunState();
}

int _currentIndex = 0;

class _RunState extends State<Run> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [const Home(), Container(), Container(), Container()];
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 100;
    var _height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Transform.rotate(
            angle: 33,
            child: const Icon(FeatherIcons.barChart2, color: Colors.black)),
        actions: [
          SvgPicture.asset(
            "assets/slider.svg",
            width: _width * 1.5,
            height: _height * 1.5,
            // color: Colors.red,
          ),
          SizedBox(width: _width * 4),
          SvgPicture.asset(
            "assets/bag.svg",
            width: _width * 2,
            height: _height * 2,
            // color: Colors.red,
          ),
          SizedBox(width: _width * 4),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: Colors.transparent,
        items: [
          /// Home
          DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Colors.brown,
              unselectedColor: Colors.grey[200]),
    
          /// Likes
          DotNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              selectedColor: Colors.brown,
              unselectedColor: Colors.grey[200]),
    
          /// Search
          DotNavigationBarItem(
              icon: const Icon(Icons.search),
              selectedColor: Colors.brown,
              unselectedColor: Colors.grey[200]),
    
          /// Profile
          DotNavigationBarItem(
              icon: const Icon(Icons.person),
              selectedColor: Colors.brown,
              unselectedColor: Colors.grey[200]),
        ],
      ),
    );
  }
}
