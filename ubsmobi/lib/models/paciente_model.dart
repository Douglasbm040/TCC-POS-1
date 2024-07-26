import 'dart:convert';

class PacienteModel {
  String nome;
  String nsus;

  PacienteModel({required this.nome, required this.nsus});

  factory PacienteModel.fromJson(Map<String, dynamic> json) {
    return PacienteModel(
      nome:  utf8.decode((json['nome'].toString().codeUnits)),
      nsus: json['n_sus'],
    );
  }
}
