import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skeleton_project/models/dndClass.dart';

class DnDRepository {
  final String baseUrl;

  DnDRepository(this.baseUrl);

  Future<List<DnDClass>> getClasses() async {
    final path = "/api/classes";
    final response = await http.get(
      Uri.https(baseUrl, path),
    );
    if (response.statusCode == 200) {
      final decodedRespone = jsonDecode(response.body);
      final results = decodedRespone['results'] as List<dynamic>;
      final dndClasses = results.map((classEntry) {
        final dndClass = DnDClass.fromJson(classEntry);
        return dndClass;
      }).toList();
      return dndClasses;
    } else {
      return [];
    }
  }
}
