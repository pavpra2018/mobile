import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splash_login/model/member.dart';
import 'package:splash_login/model/your_post.dart';
import 'package:get/get.dart';
import 'package:splash_login/services/astromnc_service.dart';

import '../gene/colors.dart' as custcolor;
import 'det_post_art_screen.dart';

// ignore: must_be_immutable
class PostingScreen extends StatelessWidget {
  final Member membData;
  const PostingScreen({Key? key, required this.membData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            custcolor.AppColor.primaryColor.withOpacity(0.8),
            custcolor.AppColor.gradientSecond
          ],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          YourPosting(memID: membData.memID!),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class YourPosting extends StatelessWidget {
  late String memID;
  YourPosting({Key? key, required this.memID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.09,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Your Postings',
                        style: TextStyle(
                          fontSize: 20,
                          color: custcolor.AppColor.pageTitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: _listPost(memID),
            )
          ],
        ),
      ),
    );
  }

  Widget _listPost(String memID) {
    return Container(
      color: custcolor.AppColor.pageTextWhite,
      child: FutureBuilder(
        future: Future.wait([_getPostData(memID)]),
        builder: (BuildContext context, AsyncSnapshot postData) {
          Widget child;

          if (postData.hasData) {
            PostList postListData = postData.data[0];
            List<YourPostData> postDataList = postListData.postDataList;
            child = ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: postDataList.length,
              itemBuilder: (BuildContext context, int index) {
                YourPostData item = postDataList[index];
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
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    subtitle:
                        Text(DateFormat('dd-MMM-yyy').format(item.postDate)),
                    trailing: const Icon(Icons.read_more),
                    onTap: () {
                      Get.to(() => DetPostArtScreen(
                            descr: item.posting,
                            title: item.title,
                          ));
                    },
                  ),
                );
              },
            );
          } else {
            child = Container();
          }
          return child;
        },
      ),
    );
  }

  Future<PostList> _getPostData(String memID) async {
    AstromncService astromncService = AstromncService();
    PostList postData = await astromncService.getPostData(memID);
    return postData;
  }
}
