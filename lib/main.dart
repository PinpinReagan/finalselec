import 'package:flutter/material.dart';
import 'package:newproject/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the AppBar
      body: Stack(
        children: <Widget>[
          // Background image positioned at the top and covering the entire screen
          Positioned(
            top: 0, // Image starts from the top of the screen
            left: 0,
            right: 0,
            child: Image.asset(
              'images/backround1.jfif', // Path to your background image
              fit: BoxFit.cover, // Ensures the image fully covers the screen
              height: MediaQuery.of(context).size.height, // Full screen height
            ),
          ),
          // Content overlaid on top of the background image
          Center(
            child: Container(
              width: double.infinity, // Ensures it takes full width
              height: double.infinity, // Ensures it takes full height
              child: Stack(
                children: <Widget>[
                  // Position "TRADITIONAL" text at the top of the screen
                  Positioned(
                    top: 530, // Adjust this value to move the text up or down
                    left: 12, // Adjust this value to move the text left or right
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.black, Colors.red],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds),
                      child: Text(
                        'TRADITIONAL',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ensure the text color is set to white
                        ),
                      ),
                    ),
                  ),
                  // Position "CHRISTMAS" text under "TRADITIONAL"
                  Positioned(
                    top: 580, // Adjust this value to move the text up or down
                    left: 30,
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.black, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'CHRISTMAS',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ensure the text color is set to white
                        ),
                      ),
                    ),
                  ),
                  // Position "RECIPES IN THE PHILIPPINES" text further down
                  Positioned(
                    top: 650, // Adjust this value to position the text lower
                    left: 80,
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.red, Colors.black], // Gradient for "RECIPES IN THE PHILIPPINES"
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'RECIPES IN THE PHILIPPINES',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                    ),
                  ),
                  // Positioned button at the bottom
                  Positioned(
                    bottom: 50, // Position the button from the bottom
                    left: 50,   // Adjust the left margin
                    right: 50,  // Adjust the right margin
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(1.0), Colors.red.withOpacity(1.0)], // Gradient for the button
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // Transparent background to inherit gradient
                          minimumSize: Size(double.infinity, 80), // Full width button
                          shadowColor: Colors.transparent, // Remove shadow
                          foregroundColor: Colors.white, // Set the text color to white
                        ),
                        child: Text(
                          'Start Cooking',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
