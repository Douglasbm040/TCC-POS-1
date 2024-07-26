import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ubsmobi/models/consulta_model.dart';
import 'package:ubsmobi/models/paciente_model.dart';
import 'package:ubsmobi/repository/utils/urls.dart';

class ConsultaRepository {
  var apiUrl = 'consulta/marcadaspacient/5';

  Future<List<ConsultaModel>> getConsultas(int idpaciente) async {
    var url =
        Uri.parse("${UtilsUrl.IPPORT}/consulta/marcadaspacient/$idpaciente");
    var response = await http.get(url);
    print("statusCode :");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => ConsultaModel.fromJson(data)).toList();
    } else {
      throw Exception('Falha ao carregar consultas');
    }
  }

  Future<Map<String, dynamic>> postConsultDay(
      Map<String, String> consult) async {
    final url = Uri.parse('${UtilsUrl.IPPORT}/consulta/marcar');
    print(consult);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(consult),
    );

    if (response.statusCode == 200) {
      print("asdas");
      return jsonDecode(response.body);
    } else {
      print("qiuwyeiuriquwyeori");
      throw Exception('Failed to post consult day');
    }
  }

  Future<void> deleteConsulta(
      String idEspecialista, String idPaciente, DateTime data) async {
    final url = Uri.parse('${UtilsUrl.IPPORT}/consulta/cancelar');
    print(data.toString());
    final Map<String, dynamic> body = {
      'esp': idEspecialista,
      'pac_des_nome': idPaciente,
      'date': DateFormat('yyyy-MM-dd').format(data),
    };
    print(body);

    final response = await http.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Consulta deletada com sucesso.');
    } else {
      throw Exception('Falha ao deletar consulta: ${response.statusCode}');
    }
  }
}
