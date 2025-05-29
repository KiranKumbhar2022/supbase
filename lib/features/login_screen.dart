import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supbase/Utils/auth_repository.dart';
import 'package:supbase/features/signup_screen.dart';

import '../Utils/inout_Widget.dart';
import '../home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthService authService= AuthService();

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool isLoad=false;
  login()async{
    isLoad = true;
    try{
      await authService.signIn(emailController.text, passController.text).then((onValue){
        setState(() {
           isLoad=false;
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        });
      });
    }catch(e){
      print("ERROR++++++++++++$e");
      setState(() {
        isLoad=false;
      });
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
              child: Text("Login Here",
               style: GoogleFonts.cormorantGaramond(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
            ),

            inputWidget(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter Email',
              prefixIcon: Icons.email,
              textPaddingHorizontal: MediaQuery.of(context).size.width*0.03,
            ),
            inputWidget(
              controller: passController,
              labelText: 'Password',
              hintText: 'Enter password',
              prefixIcon: Icons.key,
              textPaddingHorizontal: MediaQuery.of(context).size.width*0.03,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
              child: ElevatedButton(onPressed: (){
                login();
              },
                  style: commonButtonStyle(),
                  child:isLoad==true?CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ):
                  Text("Login",
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
                Text("don't have an account? ",
                  style: GoogleFonts.cormorantGaramond(

                  ),
                ),
                GestureDetector(
                  onTap: ()=>Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SignupScreen())),
                  child: Text("  SignUp",
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


