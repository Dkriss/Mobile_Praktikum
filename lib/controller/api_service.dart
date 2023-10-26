import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:modul_mobile/controller/api.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Api> fetchApiData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return apiFromJson(response.body);
    } else {
      throw Exception('Failed to load data from the server');
    }
  }
}

void main() async {
  final apiService = ApiService(baseUrl: 'https://jsonplaceholder.typicode.com');
  try {
    Api apiData = await apiService.fetchApiData('todos/1');
    if (kDebugMode) {
      print(apiData.title);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

