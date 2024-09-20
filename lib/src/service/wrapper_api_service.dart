import 'dart:convert';
import 'package:http/http.dart' as http;

class WrapperApiService {
  final String baseUrl = "https://unipi.prod.up.cineca.it/api";

  Future<Map<String, dynamic>> getClientId(String domain) async {
    final url = "$baseUrl/Clienti/cercaPerDominio?dominio=$domain";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load client ID');
    }
  }

  Future<List<dynamic>> getLessons(String calendarId, String clientId, DateTime startDate, DateTime endDate) async {
    final url = "$baseUrl/Impegni/getImpegniCalendarioPubblico";

    final body = json.encode({
      "mostraImpegniAnnullati": true,
      "mostraIndisponibilitaTotali": false,
      "linkCalendarioId": calendarId,
      "clienteId": clientId,
      "pianificazioneTemplate": false,
      "dataInizio": startDate.toUtc().toIso8601String(),
      "dataFine": endDate.toUtc().toIso8601String()
    });

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch lessons');
    }
  }
}
