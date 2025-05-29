import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supbase/Utils/auth_repository.dart';
import 'package:supbase/features/home_page.dart';
import 'package:supbase/features/login_screen.dart';

import '../Utils/inout_Widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  AuthService authService= AuthService();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool isLoad=false;
  registerNow()async{
    isLoad=true;
    try{
      await authService.signUp(
          emailController.text,
          passController.text).then((onValue){
            setState(() {
              isLoad=false ;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            });
      });
    }catch(e){
      print("ERROR+++++++++++++++$e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("Supabase",
                style: GoogleFonts.cormorantGaramond(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("SignUp Here",
                style: GoogleFonts.cormorantGaramond(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
            ),

            inputWidget(
              labelText: 'Name',
              hintText: 'Enter Full Name',
              prefixIcon: Icons.person,
              textPaddingHorizontal: MediaQuery.of(context).size.width*0.03,
            ),
            inputWidget(
              labelText: 'Email',
              hintText: 'Enter Email',
              prefixIcon: Icons.email,
              textPaddingHorizontal: MediaQuery.of(context).size.width*0.03,
            ),
            inputWidget(
              labelText: 'Password',
              hintText: 'Enter password',
              prefixIcon: Icons.key,
              textPaddingHorizontal: MediaQuery.of(context).size.width*0.03,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
              child: ElevatedButton(onPressed: (){
                registerNow();
              },
                  style: commonButtonStyle(),
                  child:isLoad==true? CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ):
                  Text("Sign Up",
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,

                    ),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text("--OR --"),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account? ",
                  style: GoogleFonts.cormorantGaramond(

                  ),
                ),
                GestureDetector(
                  onTap: ()=>Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>LoginScreen())),
                  child: Text("  SignIn",
                    style: GoogleFonts.cormorantGaramond(
                        color: Colors.blueAccent
                    ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
