import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class NetworlHelper{

  NetworlHelper(this.url);

  final String url;

  Future getData() async{

    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String data = response.body;

      var decodedjson = jsonDecode(data);
      return decodedjson;

  } else{
      print(response.statusCode);
    }
  }

}