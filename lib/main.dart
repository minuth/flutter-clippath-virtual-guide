import 'package:flutter/material.dart';
import 'package:using_clippath/octagon_clipper.dart';
import 'package:using_clippath/open_umbrellar_clipper.dart';
import 'package:using_clippath/start_clipper.dart';
import 'package:using_clippath/triangle_clipper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clippath Virtual guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              ClipPath(
                child: Image.asset("asset/landscape.jpg",),
                clipper: StarClipper(),
              ),
              ClipPath(
                child: Image.asset("asset/landscape.jpg"),
                clipper: TriangleClipper(),
              ),
              ClipPath(
                child: Image.asset("asset/landscape.jpg"),
                clipper: OctagonClipper(),
              ),
              ClipPath(
                child: Image.asset("asset/landscape.jpg"),
                clipper: OpenUmbrellarClipper(),
              ),
            ],
        ),
      )
    );
  }
}