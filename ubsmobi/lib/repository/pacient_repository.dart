import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ubsmobi/models/paciente_model.dart';
import 'package:ubsmobi/repository/utils/urls.dart';

class PacientRepository {
  var apiUrl = 'http://192.168.1.185:8000/pacient/5';

  Future<PacienteModel> getPacient() async {
    var url = Uri.parse("${UtilsUrl.IPPORT}/pacient/5");
    
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return PacienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
