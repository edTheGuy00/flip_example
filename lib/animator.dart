import 'package:flutter/widgets.dart';
import 'dart:math';

class FlipAnimator {
  FlipAnimator(this.vsync) {
    flipController = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 300));

    flipAnimation = Tween<double>(begin: 0.0, end: pi).animate(CurvedAnimation(
      parent: flipController,
      curve: Curves.easeIn,
    ));
  }

  final TickerProvider vsync;
  AnimationController flipController;
  Animation<double> flipAnimation;

  bool flipped = false;

  Future flip() async {
    try {
      if (flipped) {
        await flipController.reverse().orCancel;
        flipped = false;
      } else {
        await flipController.forward().orCancel;
        flipped = true;
      }
    } on TickerCanceled {
      print("Animation Failed");
    }
  }

  dispose() {
    flipController.dispose();
  }
}
