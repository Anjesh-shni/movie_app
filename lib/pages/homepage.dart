import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../constant/dynamic_dimension.dart';
import 'main_page.dart';


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
                        color: Colors.white,
                        width: 1,
                        ),
                      ),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "search here",
                    hintStyle:  TextStyle(color: Colors.grey[700]),
                    prefixIcon:  Icon(Icons.search,color: Colors.grey.shade700,),
                    suffixIcon: const Icon(Icons.clear,color: Colors.black,)
                  ),
                  style:const TextStyle(color: Colors.white),
                 ),
               ),
               Container(
                margin:const EdgeInsets.only(right: 20,),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey
                  ),
                  child: const Icon(Icons.search,color: Colors.black,),
               ),
             ],
           ),
           
          // body section where movie list shows
          SizedBox(height: Dimen.font20),
           Expanded(
              child:ListView.builder(
                itemCount: _filterData.length,
                itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left:30.0),
                      child: ListTile(
                        title: Text(_filterData[index].toString()),
                      ),
                    );
                  })
            // child: SingleChildScrollView(
            //   child: MainPage(),
            // ),
          ),
        ],
      ),
    );
  } 
}