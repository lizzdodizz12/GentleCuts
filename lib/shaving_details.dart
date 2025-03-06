// shaving_details.dart
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShavingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shaving Details'),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(LucideIcons.shieldCheck, size: 80, color: Colors.brown[700]),
            SizedBox(height: 20),
            Text(
              'Shaving Service',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Experience a smooth and clean shave from our experts.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price: ₱100',
              style: TextStyle(fontSize: 18, color: Colors.green[700]),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Booking action
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Booking Confirmed'),
                      content: Text('Your Shaving appointment has been booked successfully!'),
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
