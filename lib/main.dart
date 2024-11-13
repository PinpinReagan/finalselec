import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login_page.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: const FirebaseOptions(
apiKey: "AIzaSyDT252r9KxIO5Jmb0DGsd_TVHeVtrbVlPc",
appId: "1:262343154177:android:bffb86e7b60f251736fe00",
messagingSenderId: "262343154177",
projectId: "finaloutput-f17c1"));

runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'CHRISTMAS RECIPES',
debugShowCheckedModeBanner: false, // This line removes the debug banner
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: const Color.fromARGB(255, 255, 255, 255)),
useMaterial3: true,
),
home: LoginPage(),
);
}
}