import 'dart:convert';

class ConsultaModel {
  DateTime data_marcada;
  String especialista;
  String idespecialista;
  String especialidade;
  int n_filas;

  ConsultaModel({
    required this.data_marcada,
    required this.especialista,
    required this.idespecialista,
    required this.especialidade,
    required this.n_filas,
  });

  factory ConsultaModel.fromJson(Map<String, dynamic> json) {
    return ConsultaModel(
      data_marcada: DateTime.parse(json['data_marcada'].toString()),
      especialista: utf8.decode(json['especialista'].toString().codeUnits),
      idespecialista: json['idespecialista'].toString(),
      especialidade: utf8.decode((json['especialidade'].toString().codeUnits)),
      n_filas: json['n_fila'],
    );
  }
}
