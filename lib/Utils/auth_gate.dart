

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase/features/home_page.dart';
import 'package:supbase/features/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return Scaffold(
              body:  Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            );
          }
         final seesion = snapshot.hasData?snapshot.data!.session:null;

          if(seesion !=null){
            return HomePage();
          }else{
            return LoginScreen();
          }

        });
  }
}
