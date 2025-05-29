import 'package:supabase_flutter/supabase_flutter.dart';

// mixin IAuthRepo{
//
// }

// class AuthRepository with IAuthRepo {
//   final sup=Supabase.instance;
//
//     void signUp(String email, String password) async{
//       final auth=await sup.client.auth.signUp(
//         email: email,
//           password: password);
//     }
// }
class AuthService{
  final SupabaseClient sup=Supabase.instance.client;
  Future<AuthResponse> signIn(String email , String password)async{
    return await sup.auth.signInWithPassword(
      email: email,
        password: password
    );}

  Future<AuthResponse> signUp(String email, String password)async{
    return await sup.auth.signUp(
      email: email,
        password: password);
  }

  Future<void> signOut()async{
      await sup.auth.signOut();
  }

  String? getCurrentUser(){
    final session = sup.auth.currentSession;
    final user= session?.user;
    return user?.email;
  }


}