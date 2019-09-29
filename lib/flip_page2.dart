import 'package:flutter/material.dart';

class FlipPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Material(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text('Page 1'),
            ),
          ),
        ),
      ),
    );
  }
}
