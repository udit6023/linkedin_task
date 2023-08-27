import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wellfyn_assignment/modal/api_modal.dart'; 
class apifunc{
  static Future<dynamic> get_func1() async {
    final response=await http.get(Uri.parse('https://api.mfapi.in/mf/119063'));
    var decode=jsonDecode(response.body)['meta'];
    if(response.statusCode==200){
      

    print(decode);
     return decode;
    }else{
      throw Exception('Unable to fetch products from the REST API');
    }
    
  }
  static Future<List> get_func2() async {
    final response=await http.get(Uri.parse('https://api.mfapi.in/mf/119063'));
    List decode=jsonDecode(response.body)['data'];

    if(response.statusCode==200){
      print(decode);
     return decode;
    }else{
      throw Exception('Unable to fetch products from the REST API');
    }
    
  }
}