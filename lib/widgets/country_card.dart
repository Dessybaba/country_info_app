import 'package:country_info_app/model/country.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryCard({super.key, required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        leading: country.flagUrl.isNotEmpty
            ? Image.network(
                country.flagUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported),
              )
            : const Icon(Icons.flag), // Placeholder for missing flag
        title: Text(country.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Capital: ${country.capital}"), // Handle null capital
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
