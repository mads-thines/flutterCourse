import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  initState() {
    super.initState();

    boxController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );

    boxAnimation = Tween(begin: pi / 2 * 0.1, end: pi / 2 * 0.15).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOut,
      ),
    );

    boxController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });

    boxController.forward();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    catAnimation = Tween(begin: -25.0, end: -80.0).animate(CurvedAnimation(
      parent: catController,
      curve: Curves.easeInOut,
    ));
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      boxController.forward();
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      boxController.stop();
      catController.forward();
    }
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation() {
    // Saves the Cat instance and reuses it inside of the builder to improve performance.
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0,
          left: 0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: -8.0,
      top: 0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 125.0,
          width: 10.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: boxAnimation.value,
            alignment: Alignment.topRight,
            child: child,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: -8.0,
      top: 0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 125.0,
          width: 10.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: -boxAnimation.value,
            alignment: Alignment.topLeft,
            child: child,
          );
        },
      ),
    );
  }
}
