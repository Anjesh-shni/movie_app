import 'package:flutter/material.dart';
import 'package:movie_app/reusable_widget/big_text.dart';
import '../constant/dynamic_dimension.dart';
import 'main_page.dart';


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
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10,),
         Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 40),
          child:Center(
            child: BigText(text: "Search for movie",
            color: Colors.white,
            size: 16,
            ),
           ),
          ),
          const SizedBox(height: 20,),

          //Search field
           Container(
            margin: const EdgeInsets.only(left: 30,right: 30),
             child: TextField( 
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Type something",
                hintStyle:  TextStyle(color: Colors.grey[700]),
                prefixIcon:  Icon(Icons.search,color: Colors.grey.shade600,),
                suffixIcon: const Icon(Icons.clear,color: Colors.black,)
              ),
              style:const TextStyle(color: Colors.white),
             ),
           ),
          //  Container(
          //   height: 45,
          //   width: 45,
          //   decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: Colors.grey
          //   ),
          //   child:const Center(
          //     child: Icon(
          //       Icons.search,
          //     color: Colors.black,)),
          //   ),

          // body section where movie list shows
          SizedBox(height: Dimen.font20),
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: MainPage(),
            ),
          ),
        ],
      ),
    );
  } 
}