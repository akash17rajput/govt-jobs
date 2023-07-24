import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:govt_job_app/Home_Screen.dart';

import 'Api/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Govt_Job_App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light, // Set initial theme brightness to light
      ),
      home: const MyHome(),
    );
  }
}
