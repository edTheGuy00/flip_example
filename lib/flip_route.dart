import 'dart:math';

import 'package:flutter/material.dart';

class FlipRoute<T> extends PageRoute<T> {
  FlipRoute(this.builder, {this.flipDuration = 400});
  final WidgetBuilder builder;
  final int flipDuration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: flipDuration);

  Matrix4 _pMatrix(num pValue) => Matrix4(
        1.0, 0.0, 0.0, 0.0, //
        0.0, 1.0, 0.0, 0.0, //
        0.0, 0.0, 1.0, pValue * 0.001, //
        0.0, 0.0, 1.0, 1.0,
      );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final anim = Tween<double>(begin: 0.0, end: pi).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    ));
    return Transform(
      transform: _pMatrix(2.0)..rotateY(anim.value),
      child: child,
      alignment: FractionalOffset.center,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String get barrierLabel => null;
}
