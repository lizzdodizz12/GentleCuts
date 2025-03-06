import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[200],
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('johndoe@email.com', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            ProfileItem(
              icon: Icons.phone,
              title: 'Phone Number',
              value: '+63 912 345 6789',
            ),
            ProfileItem(
              icon: Icons.calendar_today,
              title: 'Birth Date',
              value: 'January 1, 2000',
            ),
            ProfileItem(
              icon: Icons.location_on,
              title: 'Address',
              value: 'Davao City, Philippines',
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Handle profile editing here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Edit Profile'),
                    content: Text('Profile editing coming soon!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  ProfileItem({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[700]),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(value, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
