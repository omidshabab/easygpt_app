import 'package:easygpt/constants/config.dart';
import 'package:http/http.dart' as http;

Future<String> getResponse(String message) async {
  var response = await http.post(
    Uri.parse(Config.baseUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_API_KEY',
    },
    body: '{ "prompt": "$message", "max_tokens": 60 }',
  );
  return response.body;
}
