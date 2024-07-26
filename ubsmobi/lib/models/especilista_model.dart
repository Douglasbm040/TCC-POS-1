import 'dart:convert';

class EspecialistaModel {
  final int idPessoa;
  final String nome;
  final String especialidade;
  final int idEspecialista;

  EspecialistaModel({
    required this.idPessoa,
    required this.nome,
    required this.especialidade,
    required this.idEspecialista,
  });

  factory EspecialistaModel.fromJson(Map<String, dynamic> json) {
    return EspecialistaModel(
      idPessoa: json['id_pessoa'],
      nome:  utf8.decode((json['nome'].toString().codeUnits)),
      especialidade:  utf8.decode((json['especialidade'].toString().codeUnits)),
      idEspecialista: json['id_especialista'],
    );
  }
}
