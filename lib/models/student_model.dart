import 'package:frontend/models/modality_model.dart';

class StudentModel {
  String? id;
  String name;
  String email;
  String cpf;
  String phone;
  String address;
  String city;
  String state;
  List<ModalityModel> modality;
  DateTime birthDate;

  StudentModel(
      {this.id,
      required this.name,
      required this.email,
      required this.cpf,
      required this.phone,
      required this.address,
      required this.city,
      required this.state,
      required this.modality,
      required this.birthDate});

  static Map<String, dynamic> toJson(StudentModel model) {
    List<Map<String, dynamic>> listModality = [];
    for (int i = 0; i < model.modality.length; i++) {
      listModality.add(ModalityModel.toJson(model.modality[i]));
    }

    return {
      'name': model.name,
      'email': model.email,
      'cpf': model.cpf,
      'modality': listModality,
      'birthDate': model.birthDate.toString()
    };
  }

  static StudentModel fromJson(Map<String, dynamic> json) {
    return StudentModel(
        name: json['name'],
        email: json['email'],
        cpf: json['cpf'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        modality: json['modality'],
        birthDate: json['birthDate']);
  }
}
