import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
         gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,childAspectRatio: 1,
         ), 
         itemCount: 20,
         itemBuilder: (context,index){
           return Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.white,
               boxShadow: const [
                 BoxShadow(
                   color: Colors.black,
                   blurRadius: 5.0,
                 ), 
                 BoxShadow(
                   color: Colors.green,
                   offset: Offset(-5, 0),
                 ),
                 BoxShadow(
                 color: Colors.green,
                 offset: Offset(5, 0),
                 ),
               ],
             ),
             child: const Center(
               child: Text("Movie"),
             ),
           );
         }
        ),
      ],
    );
  }
}