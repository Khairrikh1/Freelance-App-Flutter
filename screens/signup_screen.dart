import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Ensure this import is correct
import '../home_content.dart'; // Correct import for HomeContent

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _auth = FirebaseAuth.instance;

  // Function to handle user signup
  Future<void> _signUp() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        if (mounted) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign Up successful!')),
          );

          // Navigate to HomeContent screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeContent()),
          );
        }
      } catch (e) {
        String errorMessage = 'Error: ${e.toString()}';
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'email-already-in-use':
              errorMessage = 'This email is already in use.';
              break;
            case 'weak-password':
              errorMessage = 'The password is too weak.';
              break;
            case 'invalid-email':
              errorMessage = 'The email address is badly formatted.';
              break;
            default:
              errorMessage = 'An unknown error occurred.';
          }
        }

        if (mounted) {
          // Show error message if signup fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              const SizedBox(height: 40),

              // Email input field with improved contrast
              TextField(
                controller: _emailController,
                style: const TextStyle(
                    color: Colors.black), // Darker text for better visibility
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white
                      .withOpacity(0.9), // Lighter background for contrast
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                      color: Colors.black54), // Darker hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
              const SizedBox(height: 15),

              // Password input field with improved contrast
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.black), // Darker text for better visibility
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white
                      .withOpacity(0.9), // Lighter background for contrast
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      color: Colors.black54), // Darker hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
              const SizedBox(height: 15),

              // Confirm Password input field with improved contrast
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.black), // Darker text for better visibility
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white
                      .withOpacity(0.9), // Lighter background for contrast
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                      color: Colors.black54), // Darker hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
              const SizedBox(height: 30),

              // Sign Up button with modern design
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Redirect to Login screen with styled text
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
