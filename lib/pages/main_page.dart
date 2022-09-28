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
        Container(
            margin:  const EdgeInsets.all(30),
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://images.unsplash.com/photo-1664154026818-b49c159c91d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),),
              color: Colors.grey,
            ),
            child:const Center(child: Text("Try premium"),),
           ),
        Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
           gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,childAspectRatio: 1.3,
           ), 
           itemCount: 20,
           itemBuilder: (context,index){
             return Container(
               margin: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.white,
                 image:const DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1664073412845-f44940c3c2c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),
                  fit: BoxFit.cover
                  ),                   
                 ),
               child: const Center(
                 child: Text("Movie"),
               ),
             );
           }
          ),
        ),
      ],
    );
  }
}