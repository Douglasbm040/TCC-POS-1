class PacienteModel {
  String nome;
  String nsus;

  PacienteModel({required this.nome, required this.nsus});

  factory PacienteModel.fromJson(Map<String, dynamic> json) {
    return PacienteModel(
      nome: json['nome'],
      nsus: json['n_sus'],
    );
  }
}
