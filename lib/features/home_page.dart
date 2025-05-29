import 'package:flutter/material.dart';
import 'package:supbase/Utils/auth_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthService authService =AuthService();
  logOut(){
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IconButton(onPressed: (){

        logOut();
      },
          icon: Icon(Icons.logout,size: 50,)),),
    );
  }
}
