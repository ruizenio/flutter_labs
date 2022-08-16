import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Labs",
      debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Labs"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text("Success"),
          ),
        ),
      ),
    );
  }
}