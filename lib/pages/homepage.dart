import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/api_constant_url.dart';
import 'package:movie_app/reusable_widget/big_text.dart';
import 'package:movie_app/reusable_widget/small_text.dart';

import '../controller/movie_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _data=[];
  List<String> _filterData=[];
  final _searchQuery=new TextEditingController();
  Timer? _debounce;
  String searchText='';



  @override
  void initState(){
    super.initState();
    _data.add("Jankpur");
    _data.add("Kathmandu");
    _data.add("Biratnagar");
    _data.add("Lahan");
    _data.add("chabhil");
    _data.add("Dhungedhara");
    _data.add("Enaruwa");
    _data.add("Ithari");
    _data.add("Gongbu");
    _data.add("Hatiban");
    _data.add("jorpati");
    _data.add("kumripTi");
    _data.add("lalitpur");
    _data.add("lubu");
    _data.add("Manthali");
    _data.add("nakhu");
    _data.add("orisas");

    _filterData=this._data;
  
    _searchQuery.addListener(() {
      _onSearchChanged();
    });
  }


  
  _onSearchChanged(){
    if(_debounce?.isActive??false) _debounce?.cancel();
    _debounce=Timer(const Duration(microseconds: 100),
    (){
      if(this.searchText!=_searchQuery.text){
        this._filterData=this._data;
        setState(() {
          this._filterData=this._filterData
          .where((element) =>
           element.toString().toLowerCase()
          .contains(_searchQuery.text.toString().toLowerCase()),).toList();
        });
      }
      this.searchText=_searchQuery.text;
     }
    );
  }
  @override
  void dispose(){
    _searchQuery.removeListener(_onSearchChanged());
    _searchQuery.dispose();
    _debounce?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          //Search field
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(left: 20,right:10,),
                 child: TextField( 
                  controller: _searchQuery,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 1,
                        ),
                      ),
                      enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                        ),
                      ),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "search here",
                    hintStyle:  TextStyle(color: Colors.grey[700]),
                    prefixIcon:  Icon(Icons.search,color: Colors.grey.shade700,),
                    suffixIcon: GestureDetector(
                      onTap: (){},
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black,
                        ),
                      ),
                  ),
                  style:const TextStyle(color: Colors.white),
                 ),
               ),
               GestureDetector(
                onTap: (){

                },
                 child: Container(
                  margin:const EdgeInsets.only(right: 20,),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                    ),
                    child: const Icon(Icons.search,color: Colors.black,),
                 ),
               ),
             ],
           ),
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
            padding:const EdgeInsets.only(left: 23,bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: BigText(text: "Popular searches",
              color: Colors.black,
              size: 18,),
            ),
           ),
           // body section where movie list shows
           const SizedBox(height:5),
            GetBuilder<MovieController>(
              builder: (movieController){
                return movieController.isloaded
                ?const Center(child: CircularProgressIndicator(
                  color: Colors.green,
                  ),
                  )
                :Expanded(
                child:GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 1.3,
                 ),
                  itemCount:_filterData.length,
                  itemBuilder:(context,index){
                      return Container(
                        margin:  const EdgeInsets.only(left:20,right: 20,bottom: 20),
                         padding: const EdgeInsets.all(10),
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                         image:const DecorationImage(
                         image: AssetImage("assets/images/logo.jpg"),
                      fit: BoxFit.cover
                    ),                   
                   ),
                   child:  SmallTxt(
                    text:_filterData[index].toString(),
                   color:Colors.white,
                   size: 16,
                   ),
                );
               }),
              // child: SingleChildScrollView(
              //   child: MainPage(),
              //),
               );
              },
            
          ),
        ],
      ),
    );
  } 
}