import 'package:flutter/material.dart';
import 'package:splash_login/screens/article_screen.dart';
import 'package:splash_login/screens/home_screen.dart';
import 'package:splash_login/screens/loc_chart_screen.dart';
import 'package:splash_login/screens/my_chart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List screens = [
    const HomeScreen(),
    const ArticleScreen(),
    const LocChartScreen(),
    const MyChartScreen(),
  ];

  int currentIndex = 0;

  onTap(int index) {
    setState(() {
      debugPrint("Inside set Sate***$index");
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedLabelStyle: const TextStyle(fontSize: 15.0),
        unselectedLabelStyle: const TextStyle(fontSize: 15.0),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Article'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'Prashna'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}
