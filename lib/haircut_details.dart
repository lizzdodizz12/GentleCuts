// haircut_details.dart
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HaircutDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haircut Details'),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(LucideIcons.scissors, size: 80, color: Colors.brown[700]),
            SizedBox(height: 20),
            Text(
              'Haircut Service',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Our professional barbers offer a wide range of styles, from classic to modern cuts, ensuring you get the perfect look every time.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price: ₱200',
              style: TextStyle(fontSize: 18, color: Colors.green[700]),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Booking action can be added here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Booking Confirmed'),
                      content: Text('Your Haircut has been booked successfully!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(LucideIcons.calendar),
                label: Text('Book Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
