
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/models/modality_model.dart';
import 'package:frontend/models/student_model.dart';
import 'package:frontend/services/dio_client_implements.dart';
import 'package:frontend/services/http_client_interface.dart';

main() {
  group("sequencia de testes para o método get", () {
    test(
        'Deve verificar se o retorno não é valido já que a url vai estar incorreta',
        () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: 'http://localhost:9090/urlErrada');

      Map<String, dynamic> response = await httpCliente.get();

      expect(response['valido'], false);
    });
    test('deve retornar um valido falso já que o id é um valor invalido',
        () async {
      String id = '123456valorInvalido12345';
      HttpClientInterface httpCliente =
          DioClientImplements(url: 'http://localhost:3003/api/student');

      Map<String, dynamic> response = await httpCliente.get(id: id);
      expect(response['valido'], false);
    });

    test(
        'deve verificar se o retorno é valido se o servidor e a base de dados estiverem ativos e o retorno do data deve ser um lista',
        () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: 'http://localhost:3003/api/student');

      Map<String, dynamic> response = await httpCliente.get();

      expect(response['valido'], true);
      expect(response['data'], isList);
    });

    test(
        'deve verificar se o retorno é valido se o servidor e a base de dados estiverem ativos e o retorno do data deve ser um Map',
        () async {
      String id = '63124fc2593b0b9cf8f41b5d';
      HttpClientInterface httpCliente =
          DioClientImplements(url: 'http://localhost:3003/api/student');

      Map<String, dynamic> response = await httpCliente.get(id: id);

      expect(response['valido'], true);
      expect(response['data'], isMap);
    });
  });

  group('sequencia de testes para o médoto push', () {
    test('deve retornar um valido false já que a url vai estar incorreta',
        () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: "http://localhost:urlIncorreta");

      var response = await httpCliente.post(obj: {'name': 'valorIncorreto'});

      expect(response['valido'], false);
    });

    test(
        "deve retornar um valido true já que os dados vão ser passados de forma correta",
        () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: "http://localhost:3003/api/student");

      ModalityModel modality = ModalityModel(
          name: 'Muay thai',
          value: 150,
          status: 'ATIVO',
          graduationLevel: 0,
          startDate: DateTime.now(),
          payDay: 5);

      StudentModel student = StudentModel(
          name: 'Débora vitoria Santos Bach de Lima',
          email: 'debora316@gmail.com',
          cpf: '07731020940',
          modality: [modality],
          birthDate: DateTime.parse('1999-08-03'));

      Map response = await httpCliente.post(obj: StudentModel.toMap(student));

      expect(response['valido'], true);
      expect(response['data'], isMap);
    });
  });

  group('sequencia de teste para o método put', () {
    test(
        "deve retornar um valido true com os dados atualizados podemos passa um dado ou o obj inteiro",
        () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: "http://localhost:3003/api/student");

      Map response = await httpCliente
          .put(id: "631253018481880139ac38ec", obj: {"cpf": '02581054959'});

      expect(response['valido'], true);
      expect(response['data'], isMap);
    });
  });

  group('sequencia de teste para o método delete', () {
    test('deve retornar valido false pois o id vai estar errado', () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: "http://localhost:3003/api/student");
      String id = '3153e57302271iderrado';

      Map response = await httpCliente.delete(id: id);
      expect(response['valido'], false);
    });

    test('deve retornar valido valido', () async {
      HttpClientInterface httpCliente =
          DioClientImplements(url: "http://localhost:3003/api/student");
      String id = '63153df3302271bebab5afe5';

      Map response = await httpCliente.delete(id: id);
      expect(response['valido'], true);
    });
  });
}
