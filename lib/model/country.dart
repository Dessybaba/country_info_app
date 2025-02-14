import 'dart:convert';

// Function to convert JSON response into a List of Country objects
List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  final String name;
  final String officialName;
  final String capital;
  final String region;
  final String subregion;
  final int population;
  final List<String> borders;
  final List<String> timezones;
  final String flagUrl;
  final String coatOfArmsUrl;
  final String countryCode;
  final String currencyName;
  final String currencySymbol;

  Country({
    required this.name,
    required this.officialName,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.borders,
    required this.timezones,
    required this.flagUrl,
    required this.coatOfArmsUrl,
    required this.countryCode,
    required this.currencyName,
    required this.currencySymbol,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"]["common"] ?? "Unknown",
      officialName: json["name"]["official"] ?? "Unknown",
      capital: (json["capital"] != null && json["capital"].isNotEmpty)
          ? json["capital"][0]
          : "N/A",
      region: json["region"] ?? "N/A",
      subregion: json["subregion"] ?? "N/A",
      population: json["population"] ?? 0,
      borders:
          json["borders"] != null ? List<String>.from(json["borders"]) : [],
      timezones:
          json["timezones"] != null ? List<String>.from(json["timezones"]) : [],
      flagUrl: json["flags"]?["png"] ?? "",
      coatOfArmsUrl: json["coatOfArms"]?["png"] ?? "",
      countryCode: json["cca2"] ?? "N/A",
      currencyName: json["currencies"] != null
          ? json["currencies"].entries.first.value["name"]
          : "Unknown",
      currencySymbol: json["currencies"] != null
          ? json["currencies"].entries.first.value["symbol"]
          : "N/A",
    );
  }
}
