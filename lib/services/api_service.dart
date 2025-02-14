import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/country.dart';

class ApiService {
  static const String apiUrl = "https://restcountries.com/v3.1/all";

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);

        // ✅ Convert JSON to Country objects
        List<Country> countries =
            jsonResponse.map((json) => Country.fromJson(json)).toList();

        // ✅ Sort countries alphabetically by name
        countries.sort((a, b) => a.name.compareTo(b.name));

        return countries;
      } else {
        throw Exception("Failed to fetch countries");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
