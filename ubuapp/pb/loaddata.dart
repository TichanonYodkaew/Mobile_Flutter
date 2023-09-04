// dart run pb/loaddata.dart

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:ubuapp/mockup/data.dart';

void main(){
  print('hello world');
}

void loaddata(id,title,lecturer) async{
  List<dynamic> courses = [];
  final pb = PocketBase('http://127.0.0.1:8090');
    final body = <String, dynamic>{
    "courseid": id,
    "title": title,
    "lecturer": lecturer
    };
    await pb.collection('courses').create(body: body);
  print('Done....');
}
