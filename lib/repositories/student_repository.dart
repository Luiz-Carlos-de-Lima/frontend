import 'package:frontend/models/modality_model.dart';
import 'package:frontend/models/student_model.dart';
import 'package:frontend/services/http_client_interface.dart';

class StudentRepository {
  HttpClientInterface httpClient;

  StudentRepository({required this.httpClient});

  Future<List<StudentModel>> getAllStudent() async {
    Map studentResponse = await httpClient.get();
    List<StudentModel> studentModelList = [];
    if (studentResponse['valido']) {
      List<Map<String, dynamic>>? studentListJson = studentResponse['data'];

      if (studentListJson != null) {
        for (Map student in studentListJson) {
          List<ModalityModel> modalityModelList = [];
          if (student['modality'] != null && student['modality'].isNotEmpty) {
            for (Map modality in student['modality']) {
              modalityModelList.add(
                ModalityModel(
                    name: modality['name'],
                    value: modality['value'],
                    status: modality['status'],
                    graduationLevel: modality['graduationLevel'],
                    startDate: modality['startDate'],
                    payDay: modality['payDay']),
              );
            }
          }
          studentModelList.add(
            StudentModel(
              name: student['name'],
              email: student['email'],
              cpf: student['cpf'],
              modality: modalityModelList,
              birthDate: student['birthDate'],
            ),
          );
        }
      }

      return studentModelList;
    } else {
      return studentModelList;
    }
  }

  Future<StudentModel> getStudent(String id) async {
    Map<String, dynamic> studentResponse = await httpClient.get(id: id);
    StudentModel student;
    if (studentResponse['valido']) {
      Map studentJson = studentResponse['data'];
      List<ModalityModel> modalityModelList = [];
      if (studentJson['modality'] != null &&
          studentJson['modality'].isNotEmpty) {
        for (Map modality in studentJson['modality']) {
          modalityModelList.add(ModalityModel(
              name: modality['name'],
              value: modality['value'],
              status: modality['status'],
              graduationLevel: modality['graduationLevel'],
              startDate: modality['startDate'],
              payDay: modality['payDay']));
        }
      }

      student = StudentModel(
        name: studentJson['name'],
        email: studentJson['email'],
        cpf: studentJson['cpf'],
        modality: modalityModelList,
        birthDate: studentJson['birthDate'],
      );

      return student;
    } else {
      student = StudentModel(
        name: studentJson['name'],
        email: studentJson['email'],
        cpf: studentJson['cpf'],
        modality: modalityModelList,
        birthDate: studentJson['birthDate'],
      );

      return student;
    }
  }
}
