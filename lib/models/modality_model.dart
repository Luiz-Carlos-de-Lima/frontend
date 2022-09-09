class ModalityModel {
  String name;
  double value;
  String status = 'ATIVO';
  int graduationLevel;
  DateTime startDate;
  int payDay;

  ModalityModel({
    required this.name,
    required this.value,
    required this.status,
    required this.graduationLevel,
    required this.startDate,
    required this.payDay,
  });

  static Map<String, dynamic> toJson(ModalityModel model) {
    return {
      'name': model.name,
      'value': model.value,
      'status': model.status.toString(),
      'graduationLevel': model.graduationLevel,
      'startDate': model.startDate.toString(),
      'payDay': model.payDay
    };
  }

  static ModalityModel fromJson(Map<String, dynamic> json) {
    return ModalityModel(
        name: json['name'],
        value: json['value'],
        status: json['status'],
        graduationLevel: json['graduationLevel'],
        startDate: json['startDate'],
        payDay: json['payDay']);
  }
}
