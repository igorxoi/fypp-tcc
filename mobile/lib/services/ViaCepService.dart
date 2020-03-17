import 'package:http/http.dart' as http;
import 'package:mobile/model/Cep.dart';

class ViaCepService {
  static Future<Cep> fetchCep({String cep}) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      Map<String, String> body = response.body as Map<String, String>;
      return Cep.fromJson(body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}