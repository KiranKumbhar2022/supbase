import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase/Utils/auth_gate.dart';
import 'package:supbase/features/login_screen.dart';
import 'package:supbase/features/signup_screen.dart';

import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://txdjnhhqkvbgjjemhndy.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR4ZGpuaGhxa3ZiZ2pqZW1obmR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc3MTA5MTgsImV4cCI6MjA2MzI4NjkxOH0.eiBP2hJTpuskEk9-Bb86cw5FA043kIXs7bJykVp8eOo");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      home:  AuthGate(),
      //Hello Anish
      //hello im kk
      // from Any Life
    );
  }
}
