import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'haircut_details.dart';            // Import the Haircut Details screen
import 'hair_coloring_details.dart';      // Import the Hair Coloring Details screen
import 'beard_trim_details.dart';         // Import the Beard Trim Details screen
import 'shaving_details.dart';            // Import the Shaving Details screen

class ViewServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ServiceTile(
            icon: LucideIcons.scissors,
            title: 'Haircut',
            description: 'Classic and modern styles.',
            price: '₱200',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HaircutDetailsScreen()),
              );
            },
          ),
          ServiceTile(
            icon: LucideIcons.brush,
            title: 'Hair Coloring',
            description: 'Full and partial coloring services.',
            price: '₱500',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HairColoringDetailsScreen()),
              );
            },
          ),
          ServiceTile(
            icon: LucideIcons.award,
            title: 'Beard Trim',
            description: 'Sharp and precise trims.',
            price: '₱150',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeardTrimDetailsScreen()),
              );
            },
          ),
          ServiceTile(
            icon: LucideIcons.shieldCheck,
            title: 'Shaving',
            description: 'Smooth and clean shaves.',
            price: '₱100',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShavingDetailsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String price;
  final VoidCallback? onTap;

  ServiceTile({
    required this.icon,
    required this.title,
    required this.description,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[700]),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(price, style: TextStyle(color: Colors.green[700])),
        onTap: onTap,
      ),
    );
  }
}
