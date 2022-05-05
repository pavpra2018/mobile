import 'package:flutter/material.dart';
import 'package:splash_login/screens/posting_screen.dart';
import 'package:splash_login/screens/home_screen.dart';
import 'package:splash_login/screens/cur_loc_chart_screen.dart';
import 'package:splash_login/screens/my_chart_screen.dart';
import '../../gene/colors.dart' as custcolor;
import '../model/member.dart';

class MainScreen extends StatefulWidget {
  final Member membData;
  const MainScreen({Key? key, required this.membData}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  getCurScreen() {
    switch (currentIndex) {
      case 0:
        {
          return HomeScreen(
            membData: widget.membData,
          );
        }
      case 1:
        {
          return PostingScreen(
            membData: widget.membData,
          );
        }

      case 2:
        {
          return CurLocChartScreen(
            membData: widget.membData,
          );
        }
      case 3:
        {
          return MyChartScreen(
            membData: widget.membData,
          );
        }
      default:
        {
          return HomeScreen(
            membData: widget.membData,
          );
        }
    }
  }

  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: custcolor.AppColor.pageTextWhite,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: custcolor.AppColor.primaryColor.withOpacity(1.0),
        unselectedItemColor: Colors.black54.withOpacity(0.4),
        selectedLabelStyle: const TextStyle(fontSize: 15.0),
        unselectedLabelStyle: const TextStyle(fontSize: 15.0),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Postings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'Prashna'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}
