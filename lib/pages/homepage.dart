import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title:const Text("Movie App"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
        
      ),
    );
  } 
}