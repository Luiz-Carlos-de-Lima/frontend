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

  static Map<String, dynamic> toMap(ModalityModel model) {
    return {
      'name': model.name,
      'value': model.value,
      'status': model.status.toString(),
      'graduationLevel': model.graduationLevel,
      'startDate': model.startDate.toString(),
      'payDay': model.payDay
    };
  }
}
