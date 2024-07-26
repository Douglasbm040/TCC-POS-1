import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ubsmobi/models/paciente_model.dart';
import 'package:ubsmobi/models/usuario_model.dart';
import 'package:ubsmobi/repository/utils/urls.dart';

class PacientRepository {
  var apiUrl = 'http://192.168.1.185:8000/pacient/5';

  Future<PacienteModel> getPacient(int id) async {
    var url = Uri.parse("${UtilsUrl.IPPORT}/pacient/$id");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return PacienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<UsuarioModel?> login(String email, String senha) async {
    var url = Uri.parse("${UtilsUrl.IPPORT}/login");

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email, 'senha': senha}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      if (response.body == "null") {
        return null;
      } else {
        return UsuarioModel.fromJson(jsonDecode(response.body));
      }
    } else {
      throw Exception('Não logado :${response.statusCode}');
    }
  }

  Future<bool?> cadastro(String endereco, String email, String senha,
      String nsus, String nome) async {
    var url = Uri.parse("${UtilsUrl.IPPORT}/criarusuario");

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'endereco': endereco,
        'email': email,
        'senha': senha,
        'n_sus': nsus,
        'nome': nome,
        'rua': " "
      }),
    );

    if (response.statusCode == 201) {
      return true;
      //return UsuarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Usuário não criado : ${response.statusCode}');
    }
  }
}
