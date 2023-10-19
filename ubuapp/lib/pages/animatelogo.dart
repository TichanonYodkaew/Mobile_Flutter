// animatelogo.dart
import 'package:flutter/material.dart';
import 'dart:math';

class AnimateLogoPage extends StatefulWidget {
  const AnimateLogoPage({super.key});

  @override
  State<AnimateLogoPage> createState() {
    return _AnimateLogoPageState();
  }
}

class _AnimateLogoPageState extends State<AnimateLogoPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  var random = Random();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0, end: 800).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => build0(context);

  Widget build2(BuildContext context) {
    return Stack(children: [
      ...List.generate(
          1000,
          (i) => Positioned(
                child: Container(
                    width: 10,
                    height: 10,
                    color: Color.fromRGBO(random.nextInt(255),
                        random.nextInt(255), random.nextInt(255), 1)),
                top: i * random.nextDouble() * 10,
                left: animation.value + random.nextDouble() * 10,
              ))
    ]);
  }

  Container box1 = Container(width: 10, height: 10, color: Colors.red);
  Container box2 = Container(width: 10, height: 10, color: Colors.green);
  Container box3 = Container(width: 10, height: 10, color: Colors.blue);

  Widget build1(BuildContext context) {
    return Stack(children: [
      Positioned(child: box1, top: animation.value, left: 200),
      Positioned(child: box2, top: 100, left: animation.value),
      Positioned(child: box3, top: animation.value, left: animation.value),
    ]);
  }

  Widget build0(BuildContext context) {
    return Stack(children: [
      Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(size: animation.value), //Text('$value'),
          )),
    ]);
  }
}
