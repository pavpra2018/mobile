import 'package:astromnc360/model/member.dart';
import 'package:astromnc360/services/location.dart';
import 'package:astromnc360/services/networking.dart';

// const horoURL = "http://localhost:5002/local-astro-mnc/us-central1/horoscope";
const horoURL = "http://10.0.2.2:5002/local-astro-mnc/us-central1/horoscope";

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

    NetworkHelper networkHelper = NetworkHelper(horoURL, data);

    var member = await networkHelper.getData();
    Member memberData = Member.fromJson(member);
    return memberData;
  }
}
