import 'dart:convert';

import 'package:brisas_wifi/models/UsuariosDTO.dart';
import 'package:http/http.dart' as http;

Future<PerfilUsuario> loginUsuario(LoginUsuario input) async {
  try {
    final url = Uri.parse(
        'https://brisas-wifi-production.up.railway.app/usuarios/auth/login');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    //Realizar la solicitud post
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode({
        'correo' : input.correo,
        'password' : input.password
      })
      );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return PerfilUsuario.fromJson(responseData);
    } else {
      throw Exception(
          'Error en el login: ${response.statusCode}, body: ${response.body}');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
