
// import 'dart:convert';
// import 'package:http/http.dart';

// class THttpHelper {
//   static const String _baseurl = 'https://app-url.com';

//   static Future<Map<String, dynamic>> get(String endpoint) async {
//     final response = await http.get(Uri.parse('$_baseurl/$endpoint'));
//     return _handleResponse(response);
//   }

//   static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
//     final response = await http.post(
//       Uri.parse(int '$_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
//     final response = await http.put(
//       Uri.parse(int '$_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }
  
//   static Future<Map<String, dynamic>> delete(String endpoint, dynamic data) async {
//     final response = await http.delete(Uri.parse('$_baseurl/$endpoint'));
//     return _handleResponse(response);
//   }

//   static Map<String, dynamic> _handleResponse(http.Response response) {
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }