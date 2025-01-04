import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_content.dart'; // Import HomeContent directly from lib
import 'photographers_page.dart'; // Import PhotographersPage directly from lib
import 'screens/login_screen.dart'; // Import the LoginScreen
import 'screens/signup_screen.dart'; // Correct import for the SignUpScreen

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDibjj5xx_GGKvX5KE5IcJpjV4f9GmU_sw",
      projectId: "datamate-8d8ac",
      storageBucket: "datamate-8d8ac.firebasestorage.app",
      messagingSenderId: "445368116048",
      appId: "1:445368116048:web:5d203f49f5e1dbc4a64255",
      measurementId: "G-5ZDE402V05",
    ),
  ); // Initialize Firebase
  runApp(const PhotoMateApp());
}

class PhotoMateApp extends StatelessWidget {
  const PhotoMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Start at the login screen
      routes: {
        '/login': (context) => const LoginScreen(), // Removed successMessage
        '/signup': (context) => const SignUpScreen(), // Route for signup
        '/home': (context) => const HomePage(), // Route for the main app
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    PhotographersPage(),
    Center(
      child: Text(
        'Profile',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.blueGrey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Photographers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
