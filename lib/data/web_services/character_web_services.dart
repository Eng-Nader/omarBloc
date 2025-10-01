
import 'package:dio/dio.dart';
import '../../constants/constant.dart';
import '../models/api_erroe.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  Future<dynamic> getCharacters() async {
    try {
      Response response = await dio.get('${baseUrl}Characters');
      List<dynamic> characters = response.data;

      return characters;
    } catch (e) {
        return ApiErroe.handler(e); 
    }
  }
  Future<List<dynamic>> getQuotes() async {
    try {
      Response response = await dio.get(
        'https://api.gameofthronesquotes.xyz/v1/random/51',
      );
      List<dynamic> quotes = response.data;
      print(quotes);
      return quotes;
    } catch (e) {
      return [];
    }
  }
}
