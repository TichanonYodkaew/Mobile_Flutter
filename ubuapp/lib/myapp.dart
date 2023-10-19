import 'package:flutter/material.dart';
import 'package:ubuapp/mockup/data.dart';
import 'package:ubuapp/pages/animatelogo.dart';
import 'package:ubuapp/pages/coursedetailpage.dart';
import 'package:ubuapp/pages/login.dart';
import 'package:ubuapp/pages/myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UBU Classroom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => Login(),
        '/home': (context) => const MyHomePage(title: 'UBU App'),
        '/detail': (context) => CourseDetailPage(course: randomCourse()),
        '/animate': (context) => AnimateLogoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}