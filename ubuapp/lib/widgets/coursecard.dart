import 'package:flutter/material.dart';
import 'package:ubuapp/pages/coursedetailpage.dart';

class CourseCard extends StatelessWidget {
  final dynamic course;
  const CourseCard({
    super.key,
    this.course,
    });

  @override
  Widget build(BuildContext context) {
    final url = 'https://picsum.photos/id/${course[0] % 1000}/800/250';
    return InkWell(
        onTap: () {
          print('tab tab tab ${course[0]} ${course[1]}');
        },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            //image: AssetImage('${course[3]}'), // ใช้ backgroundImage
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    '${course[1]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  ),  
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CourseDetailPage(
                            course: course,
                          ), // course
                        ));
                      },
                    ),
                ],
              ),
              SizedBox(height: 2),
              Text(
                '${course[0]}', // แสดงรหัสวิชา
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${course[2]}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
