import 'package:dio/dio.dart';
class DioHelper{
  static Dio ?dio;
  static void init(){
    dio=Dio(
      BaseOptions(
        baseUrl: "https://raw.githubusercontent.com/Biuni/"


      )
    );


  }

  static Future<Response>getData({
    String ?endpoint,
    Map<String,dynamic>?query
    
}
      
      )async{
    return await dio!.get('PokemonGO-Pokedex/master/pokedex.json',queryParameters: query);


    
  }


}