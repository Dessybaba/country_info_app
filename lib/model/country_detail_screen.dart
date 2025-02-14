import 'package:flutter/material.dart';
import '../model/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({Key? key, required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(country.flagUrl, width: 150, height: 100),
            ),
            const SizedBox(height: 20),
            Text("Capital: ${country.capital}",
                style: const TextStyle(fontSize: 18)),
            Text("Region: ${country.region}",
                style: const TextStyle(fontSize: 18)),
            Text("Population: ${country.population}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
