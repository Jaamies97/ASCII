import 'package:flutter/material.dart';

import 'asciicalculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axel\'s server demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                tabs: [
                  Tab(text: "ASCII",),
                  Tab(text: "Picture",),
                ],
            ),
            title: const Text("Server project demo"),
          ),
          body: TabBarView(
              children: [
                Center(
                  child: asciihome(),
                ),
                const Center(
                  child: Text("Hi"),
                ),
              ],
          ),
        ),
      ),
    );
  }
}