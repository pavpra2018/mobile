import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:splash_login/model/dashboard.dart';
import 'package:splash_login/model/member.dart';
import 'package:splash_login/model/your_post.dart';

import 'package:splash_login/services/location.dart';
import 'package:splash_login/services/networking.dart';

const horoURL = "http://10.0.2.2:5002/local-astro-mnc/us-central1/horoscope";
const dashURL = "http://10.0.2.2:5002/local-astro-mnc/us-central1/memberdash";

class AstromncService {
  Future<dynamic> getcurrentHoro() async {
    Location location = Location();
    await location.getCurrentLocation();
    DateTime? locDtTm = location.timestamp;

    var data = {
      'lattitude': location.lattitude,
      'longitude': location.longitude,
      'day': locDtTm!.day,
      'year': locDtTm.year,
      'month': locDtTm.month,
      'hours': locDtTm.hour,
      'minutes': locDtTm.minute,
      'second': locDtTm.second,
      'offset': (locDtTm.timeZoneOffset).inHours
    };
    ;
    NetworkHelper networkHelper = NetworkHelper(horoURL, data);
    var member = await networkHelper.getData();
    Member memberData = Member.fromJson(member);

    memberData.memName = "India";
    memberData.memEndDate = locDtTm;
    memberData.memID = "*****";
    memberData.memBcity = location.lattitude.toString().substring(0, 6) +
        ' (lat)'
            "   " +
        location.longitude.toString().substring(0, 6) +
        ' (lon)';
    return memberData;
  }

  Future<dynamic> getDashData(String selDate, String memID) async {
    DateFormat selDateformat = DateFormat("dd-MMM-yyyy");
    DateTime locDtTm = selDateformat.parse(selDate);

    var data = {
      "stday": locDtTm.day,
      "stmonth": locDtTm.month,
      "styear": locDtTm.year,
      "memID": memID,
    };

    try {
      //Length error handling
      NetworkHelper networkHelper = NetworkHelper(dashURL, data);
      Map<String, dynamic> dashscoreMap = await networkHelper.getData();

      DashScore dashScoreData = DashScore.fromJson(dashscoreMap);
      debugPrint(dashScoreData.dashList.length.toString());
      debugPrint(dashScoreData.dashList[8].planet.toString());
      return dashScoreData;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getPostData(String memID) async {
    final _firestore = FirebaseFirestore.instance;
    final memberSnapShot =
        await _firestore.collection("memberposting").doc(memID).get();
    Map<String, dynamic>? memberSnapData = memberSnapShot.data();
    debugPrint(memberSnapData.toString());
    PostList postListData = PostList.fromJson(memberSnapData!);
    return postListData;
  }
}
