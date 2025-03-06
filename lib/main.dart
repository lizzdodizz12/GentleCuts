import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'view_services.dart';        // Import the view services screen
import 'book_appointment.dart';     // Import the book appointment screen
import 'profile.dart';              // Import the profile screen
import 'GentleCuts.dart';           // Import Firebase connection file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GentleCutsFirebase.initializeFirebase();  // Initialize Firebase
  runApp(GentleCutsApp());
}

class GentleCutsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gentle Cuts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAdminLoggedIn = false;  // To track if admin is logged in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gentle Cuts'),
        backgroundColor: Colors.blue[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(LucideIcons.user, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    isAdminLoggedIn ? 'Admin Panel' : 'User Panel',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            if (isAdminLoggedIn) ...[
              ListTile(
                leading: Icon(LucideIcons.layoutDashboard),
                title: Text('Dashboard'),
                onTap: () {
                  // Navigate to Dashboard Screen (create a separate file for this if needed)
                },
              ),
              ListTile(
                leading: Icon(LucideIcons.settings),
                title: Text('Manage Services'),
                onTap: () {
                  // Navigate to Manage Services Screen (create a separate file for this if needed)
                },
              ),
              ListTile(
                leading: Icon(LucideIcons.calendar),
                title: Text('Appointments'),
                onTap: () {
                  // Navigate to Appointments Screen (create a separate file for this if needed)
                },
              ),
              ListTile(
                leading: Icon(LucideIcons.logOut),
                title: Text('Logout'),
                onTap: () {
                  setState(() {
                    isAdminLoggedIn = false;  // Log out admin
                  });
                  Navigator.pop(context);
                },
              ),
            ] else ...[
              ListTile(
                leading: Icon(LucideIcons.logIn),
                title: Text('Admin Login'),
                onTap: () async {
                  // Simple login simulation (replace with actual authentication)
                  bool loggedIn = await _showAdminLoginDialog(context);
                  if (loggedIn) {
                    setState(() {
                      isAdminLoggedIn = true;
                    });
                  }
                },
              ),
            ],
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(LucideIcons.scissors, size: 80, color: Colors.brown[700]),
            SizedBox(height: 20),
            Text(
              'Welcome to Gentle Cuts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Book your appointment with ease'),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
                );
              },
              icon: Icon(LucideIcons.calendar),
              label: Text('Book an Appointment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewServicesScreen()),
                );
              },
              icon: Icon(LucideIcons.cat),
              label: Text('View Services'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              icon: Icon(LucideIcons.user),
              label: Text('Profile'),
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

  Future<bool> _showAdminLoginDialog(BuildContext context) async {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isLoggedIn = false;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Admin Login'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Check admin credentials (replace with actual authentication)
                if (usernameController.text == 'admin' &&
                    passwordController.text == 'password') {
                  isLoggedIn = true;
                }
                Navigator.pop(context);
              },
              child: Text('Login'),
            ),
          ],
        );
      },
    );
    return isLoggedIn;
  }
}
