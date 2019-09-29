import 'package:card_flip_animation/flip_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _navToNextPage() {
      Navigator.push(context, FlipPage.newInstance());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flip Animator'),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab-to-flip',
        onPressed: _navToNextPage,
        tooltip: 'Next',
        child: Icon(Icons.add),
      ),
    );
  }
}
