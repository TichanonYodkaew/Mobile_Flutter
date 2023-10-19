import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:ubuapp/mockup/data.dart';
import 'package:ubuapp/pages/animatelogo.dart';
import 'package:ubuapp/widgets/coursecard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> courses = [];

  void _addCourses() {
    setState(() {
      //courses.add(randomCourse());
      var newCourse = randomCourse();
      courses.add(newCourse);
      uploadData(newCourse);
    });
  }

  void uploadData(List<dynamic> course) async{
    final pb = PocketBase('http://127.0.0.1:8090');
    final body = <String, dynamic>{
      "courseid": course[0],
      "title": course[1],
      "lecturer": course[2]
    };
    await pb.collection('courses').create(body: body);
    print('Done....');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Image.asset('images/logo.png'),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 40.0),
            onPressed: () {
              //Navigator.of().... //MaterialPageRoute()
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: toAnimatePage,
              icon: Icon(Icons.access_alarm),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, int i) => CourseCard(course: courses[i]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCourses,
        tooltip: 'Add Course',
        child: const Icon(Icons.add),
      ),
    );
  }

  void toAnimatePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AnimateLogoPage(),
    ));
  }
}
