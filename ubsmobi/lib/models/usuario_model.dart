// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsuarioModel {
  String nome;
  int id_pessoa;
  int id_paciente;
  String n_sus;
  UsuarioModel({
    required this.nome,
    required this.id_pessoa,
    required this.id_paciente,
    required this.n_sus,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      nome: utf8.decode((json['nome'].toString().codeUnits)),
      id_pessoa: json['id_pessoa'],
      id_paciente: json['id_paciente'],
      n_sus: json['n_sus'],
    );
  }
}
