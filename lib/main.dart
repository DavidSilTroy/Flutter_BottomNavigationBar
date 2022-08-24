import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/screens/screen_1.dart';
import 'package:flutter_bottom_navigation_bar/screens/screen_2.dart';
import 'package:flutter_bottom_navigation_bar/screens/screen_3.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _incrementCounter() {
    setState(() {
      _currentIndex++;
    });
  }

  List<BottomNavigationBarItem> _btnScreens() {
    var btnScreenList = <BottomNavigationBarItem>[];
    for (var i = 0; i < _screens.length; i++) {
      btnScreenList.add(const BottomNavigationBarItem(
        icon: Icon(
          Icons.circle,
          // color: Colors.black,
        ),
        label: '',
      ));
    }
    return btnScreenList;
  }

  final List<Widget> _screens = <Widget>[
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: ((value) {
          setState(() {
            _currentIndex = value;
          });
        }),
        children: _screens,
      ),
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(color: Colors.blueAccent),
        padding: const EdgeInsets.only(left: 75, right: 75),
        child: BottomNavigationBar(
          unselectedItemColor: const Color.fromARGB(245, 140, 138, 138),
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          iconSize: 15,

          elevation: 0,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Color.fromARGB(0, 68, 137, 255),
          items: _btnScreens(),
          currentIndex: _currentIndex,
          // type: BottomNavigationBarType.fixed,
          onTap: ((value) {
            _pageController.animateToPage(value,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.ease);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
