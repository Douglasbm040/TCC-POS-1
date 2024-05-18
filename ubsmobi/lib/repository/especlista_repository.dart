import 'dart:convert';

import 'package:ubsmobi/models/especilista_model.dart';
import 'package:ubsmobi/repository/utils/urls.dart';
import 'package:http/http.dart' as http;

class EspecialistaRepository {
  Future<List<EspecialistaModel>> getEspecialistas() async {
    try {
      final url = Uri.parse("${UtilsUrl.IPPORT}/especialist");
      print(url);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        final List<dynamic> jsonDataList = jsonDecode(response.body);
        print(jsonDataList);
        return jsonDataList
            .map((jsonData) => EspecialistaModel.fromJson(jsonData))
            .toList();
      } else {
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data. Error: $e');
    }
  }
}
