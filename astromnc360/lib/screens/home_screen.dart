import 'package:astromnc360/screens/video_items.dart';
import 'package:flutter/material.dart';

import 'package:astromnc360/model/member.dart';
import 'package:astromnc360/screens/birth_chart_screen.dart';
import 'package:astromnc360/screens/curr_loc_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    final membData = ModalRoute.of(context)!.settings.arguments as Member;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter Video Player Demo'),
        centerTitle: true,
      ),
      body: Container(),
      bottomNavigationBar: ConvexAppBar(
          backgroundColor: const Color(0xFFf6941d),
          color: Colors.white,
          style: TabStyle.reactCircle,
          items: const [
            TabItem(icon: Icons.list, title: 'Home'),
            TabItem(icon: Icons.calendar_today, title: 'Chart'),
            TabItem(icon: Icons.assessment, title: 'locChart'),
          ],
          initialActiveIndex: 1,
          onTap: (int i) {
            if (i == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BirthChartScreen(
                    membData: membData,
                  ),
                ),
              );
            } else if (i == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrLocScreen(),
                ),
              );
            }
          }),
    );
  }
}
