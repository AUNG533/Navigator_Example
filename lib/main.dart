// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _route = <String, WidgetBuilder>{
    '/page1': (BuildContext context) => MyApp(),
    '/page2': (BuildContext context) => Page2(),
    '/page3': (BuildContext context) => Page3(),
    '/page4': (BuildContext context) => Page4(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _route,
      title: 'Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/page2');
            Navigator.pushReplacementNamed(context, '/page2');
          },
          //child: Text("Next Page"),
          child: Text("Login"),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page3');
          },
          child: Text("Page 3 ->"),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page3"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page4');
          },
          child: Text("Page 4 ->"),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page4"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            // Navigator.pushNamedAndRemoveUntil(context, '/page1', (route) => false);
            // Navigator.pushNamedAndRemoveUntil(
            //     context, '/page4', ModalRoute.withName('/page1'));
            Navigator.popUntil(context, ModalRoute.withName('/page2'));
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
