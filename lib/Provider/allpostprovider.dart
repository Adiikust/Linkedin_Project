

import 'dart:convert';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/Model/all_post_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../View/AllPost_Profile/App&Profile_View.dart';

class AllPostProvider with ChangeNotifier {
  var postData = [];

  // getAllPost() async {
  //   print("this is my data ");
  //   try {
  //     var response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),);
  //     print("this is my data ${response.body.toString()}");
  //     // if(response.statusCode == 200){
  //       postData = jsonDecode(response.body);
  //       print("this is our data ${response.body.toString()}");
  //     // }
  //     print("this is my data ");
  //      notifyListeners();
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
}