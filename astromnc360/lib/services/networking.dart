import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  final Object data;

  NetworkHelper(this.url, this.data);

  Future getData() async {
    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(data), headers: {'content-type': 'application/json'});
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("inside Error");
    }
  }
}
