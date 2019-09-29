import 'package:card_flip_animation/animator.dart';
import 'package:card_flip_animation/flip_page2.dart';
import 'package:card_flip_animation/flip_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

import 'fade_route.dart';

class FlipPage extends StatefulWidget {
  static PageRoute newInstance() => FadeRoute((c) => FlipPage());

  @override
  _FlipPageState createState() => _FlipPageState();
}

class _FlipPageState extends State<FlipPage> with TickerProviderStateMixin {
  FlipAnimator _animator;

  @override
  void initState() {
    _animator = FlipAnimator(this);
    super.initState();
  }

  Matrix4 _pMatrix(num pValue) => Matrix4(
        1.0, 0.0, 0.0, 0.0, //
        0.0, 1.0, 0.0, 0.0, //
        0.0, 0.0, 1.0, pValue * 0.001, //
        0.0, 0.0, 1.0, 1.0,
      );

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;
    final stack = Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: GestureDetector(
            onTap: _animator.flip,
            child: Material(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text('Page 1'),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: GestureDetector(
            // onTap: _animator.flip,
            onTap: () => Navigator.push(context, FlipRoute((c) => FlipPage2())),
            child: Material(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text('Page 2'),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return Hero(
      tag: 'fab-to-flip',
      child: AnimatedBuilder(
        animation: _animator.flipAnimation,
        child: stack,
        builder: (context, widget) {
          return Transform(
            transform: _pMatrix(2.0)..rotateY(_animator.flipAnimation.value),
            child: widget,
            alignment: FractionalOffset.center,
          );
        },
      ),
    );
  }
}
