import 'package:heal_tether_task/src/global_export.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


final networkServiceProvider = Provider<NetworkServiceImpl>((_) {
  return NetworkServiceImpl();
});

class NetworkServiceImpl implements NetworkService {
  final http.Client _client = http.Client();

  final Map<String, String> _presetHeaders = {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  @override
  Future<http.Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final url = Uri.parse('${HealTUrls.BASE_URL}$uri').replace(queryParameters: queryParameters);

    final response = await _client.get(
      url,
      headers: _presetHeaders,
    );

    _logRequest('GET', url.toString(), headers: _presetHeaders);
    _logResponse(response);

    return response;
  }


  void _logRequest(String method, String url, {Map<String, String>? headers, String? body}) {
    if (kDebugMode) {
      print('--> $method $url');
      print('Headers: $headers');
      if (body != null) print('Body: $body');
    }
  }

  void _logResponse(http.Response response) {
    if (kDebugMode) {
      print('<-- ${response.statusCode} ${response.request?.url}');
      print('Response: ${response.body}');
    }
  }
}

extension ResponseExtension on http.Response {
  bool get isSuccess  => statusCode == HttpStatus.ok || statusCode == HttpStatus.created;
}
