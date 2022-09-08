abstract class HttpClientInterface {
  Future<dynamic> get({String id});
  Future<dynamic> post({required Map<String, dynamic> obj});
  Future<dynamic> put({required String id, required Map<String, dynamic> obj});
  Future<dynamic> delete({required String id});
}