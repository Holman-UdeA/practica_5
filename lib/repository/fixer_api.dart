import 'dart:convert';
import 'package:http/http.dart' as http;

class FixerService {
  final String apiKey = '8542773dc01bb2790c3291ffd751d99a';

  Future<Map<String, dynamic>> getRates(String base) async {
    final url = Uri.parse('https://data.fixer.io/api/latest?access_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return {
          'rates': data['rates'],
          'date': data['date'],
          'base': data['base']
        };
      } else {
        throw Exception(data['error']['info']);
      }
    } else {
      throw Exception('Error en la red');
    }
  }
}