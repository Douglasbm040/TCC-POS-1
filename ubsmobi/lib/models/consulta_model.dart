class ConsultaModel {
  String data_marcada;
  String especialista;
  String idespecialista;
  String especialidade;

  ConsultaModel(
      {required this.data_marcada,
      required this.especialista,
      required this.idespecialista,
      required this.especialidade});

  factory ConsultaModel.fromJson(Map<String, dynamic> json) {
    return ConsultaModel(
      data_marcada: json['data_marcada'],
      especialista: json['especialista'].toString(),
      idespecialista: json['idespecialista'].toString(),
      especialidade: json['especialidade'],
    );
  }
}
