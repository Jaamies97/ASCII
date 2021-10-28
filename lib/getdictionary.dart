import 'package:http/http.dart' as http;

fetchdata(String url)async{
  http.Response response = await http.get(Uri.parse(url),
  headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });
  return response.body;
}