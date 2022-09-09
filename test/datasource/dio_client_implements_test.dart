import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/datasource/dio_client_implements.dart';
import 'package:frontend/datasource/http_client_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../data/studant_json_mock.dart';

class DioClientMock extends Mock implements DioClientImplements {}

void main() {
  group('grupo de testes para o método get', () {
    HttpClientInterface http = DioClientMock();
    when(() => http.get()).thenAnswer((_) async => studentsJson);
    test(
        'deve verificar se o retorno da chamada do método get é uma lista e seu o seu tamanho é igual a 5',
        () async {
      when(() => http.get()).thenAnswer((_) async => studentsJson);
      var response = await http.get();
      expect(response, isList);
      expect(response.length, equals(5));
    });

    test(
        'deve verificar se o nome do primeiro item da lista é um Map e o name é Luiz Carlos de Lima',
        () async {
      when(() => http.get(id: '01')).thenAnswer((_) async => studentsJson[0]);

      var response = await http.get(id: '01');
      expect(response, isMap);
      expect(response['name'], equals('Luiz Carlos de Lima'));
    });
  });
}
