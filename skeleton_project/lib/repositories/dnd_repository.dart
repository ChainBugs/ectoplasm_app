import 'package:http/http.dart' as http;

class DnDRepository {
  final String baseUrl;

  DnDRepository(this.baseUrl);

  getClasses() async {
    final path = "/classes";
    final uri = Uri(path: "$baseUrl$path");
    final response = await http.get(
      uri,
    );
    print(response.body);
  }
}
