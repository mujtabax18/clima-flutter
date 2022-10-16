
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper{
  NetworkingHelper(@required this.url);
  final String url;
  Future getData() async{
    print('test neworking in serveices in getdata');
    http.Response response= await http.get(Uri.parse(url));
    if(response.statusCode==200) {
      String data=response.body;
      var jasondata=jsonDecode(data);
    return jasondata;
    }
    else{
      print('error: '+ response.statusCode.toString());
    }
  }

}