import 'package:flutter/material.dart';

void animateTransition(BuildContext context, Widget page) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation.drive(
            Tween<double>(begin: 0, end: 1),
          ),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return page;
      },
    ),
  );
}
