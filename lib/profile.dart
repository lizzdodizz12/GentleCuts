import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "";
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('loggedInUsername');

    if (savedUsername != null) {
      setState(() {
        username = savedUsername;
      });

      // Fetch user data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: savedUsername)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userData == null
            ? Center(child: CircularProgressIndicator()) // Show loading spinner
            : Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue[200],
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  // Text(
                  //   userData?['name'] ?? 'No Name',
                  //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(height: 5),
                  Text(userData?['username'] ?? 'No Username',
                      style: TextStyle(fontSize: 24,  color: const Color.fromARGB(255, 0, 0, 0))),
                  SizedBox(height: 30),
                  ProfileItem(
                    icon: Icons.phone,
                    title: 'Phone Number',
                    value: userData?['phone'] ?? 'Not provided',
                  ),
                  ProfileItem(
                    icon: Icons.calendar_today,
                    title: 'Birth Date',
                    value: userData?['birthdate'] ?? 'Not provided',
                  ),
                  ProfileItem(
                    icon: Icons.location_on,
                    title: 'Address',
                    value: userData?['address'] ?? 'Not provided',
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
