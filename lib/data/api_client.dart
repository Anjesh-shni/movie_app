import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  
  final String appBaseurl;

  ApiClient({required this.appBaseurl}){
   baseUrl=appBaseurl;
    timeout  =const Duration(seconds: 10);
  }
  
  Future<Response> getData(String uri)async{
   try{
    Response response = await get(uri);
    return response;
   }catch(e){
    return Response(statusCode: 1,statusText: e.toString());
   }
  }
}