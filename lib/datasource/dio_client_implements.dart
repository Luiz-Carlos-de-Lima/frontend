import 'package:dio/dio.dart';
import 'package:frontend/datasource/http_client_interface.dart';

class DioClientImplements implements HttpClientInterface {
  final Dio dio = Dio();

  String url;

  DioClientImplements({required this.url});

  @override
  Future get({String? id}) async {
    try {
      if (id != null) {
        var response = await dio.get('$url/$id');
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw Exception();
        }
      } else {
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw Exception();
        }
      }
    } catch (error) {
      return error;
    }
  }

  @override
  Future post({required Map<String, dynamic> obj}) async {
    try {
      var response = await dio.post(url, data: obj);
      if (response.statusCode == 200) {
        return {"valido": true, "data": response.data};
      } else {
        return {"valido": false, "error": "error"};
      }
    } catch (error) {
      return {"valido": false, "error": error};
    }
  }

  @override
  Future delete({required String id}) async {
    try {
      var response = await dio.delete('$url/$id');
      return {"valido": true, "data": response.data};
    } catch (error) {
      return {"valido": false, "error": error};
    }
  }

  @override
  Future<Map<String, dynamic>> put(
      {required String id, required Map<String, dynamic> obj}) async {
    try {
      var response = await dio.put('$url/$id', data: obj);
      return {"valido": true, "data": response.data};
    } catch (error) {
      return {"valido": false, "error": error};
    }
  }
}
