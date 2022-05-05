import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:splash_login/model/artl_app.dart';
import 'package:splash_login/screens/det_post_art_screen.dart';

import '../gene/colors.dart' as custcolor;

class ListContent extends StatelessWidget {
  ListContent({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> artlcapp = ArtlApp().artlcapp;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: _listView(),
            )
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return Container(
      color: custcolor.AppColor.pageTextWhite,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: artlcapp.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            child: ListTile(
              leading: CircleAvatar(
                radius: 15.0,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: custcolor.AppColor.pageTitle),
                ),
                backgroundColor:
                    custcolor.AppColor.gradientThird.withOpacity(0.5),
              ),
              title: Text(artlcapp[index]['value']),
              subtitle: const Text('Tap to Read More...'),
              onTap: () {
                Get.to(() => DetPostArtScreen(
                      descr: "123",
                      title: "All good",
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
