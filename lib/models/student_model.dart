import 'package:frontend/models/modality_model.dart';

class StudentModel {
  String name;
  String email;
  String cpf;
  List<ModalityModel> modality;
  DateTime birthDate;

  StudentModel(
      {required this.name,
      required this.email,
      required this.cpf,
      required this.modality,
      required this.birthDate});

  static Map<String, dynamic> toMap(StudentModel model) {
    List<Map<String, dynamic>> listModality = [];
    for (int i = 0; i < model.modality.length; i++) {
      listModality.add(ModalityModel.toMap(model.modality[i]));
    }

    return {
      'name': model.name,
      'email': model.email,
      'cpf': model.cpf,
      'modality': listModality,
      'birthDate': model.birthDate.toString()
    };
  }
}
