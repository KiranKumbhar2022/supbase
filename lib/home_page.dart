import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final supabase=Supabase.instance.client;
  TextEditingController data1=TextEditingController();
  TextEditingController data2=TextEditingController();
  bool isLoad=false;

  Future<void> insertData()async{
    isLoad=true;
    await supabase.from("sample").insert({
      'name':'kk',
      'age':21
    }).then((onValue){
      setState(() {
        isLoad=false;
      });
    }).onError((error,stackTrace){
      print("ERROR+++++++++++$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add data",
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: data1,
                decoration: InputDecoration(
                  hintText: "Enter Data1",

                ),
              ),
              TextFormField(
                controller: data2,
                decoration: InputDecoration(
                  hintText: "Enter Data2",

                ),
              ),
              MaterialButton(onPressed: (){
                insertData();
              },
                minWidth: 120,
                height: 40,
                color: Colors.red,
              child: isLoad==true?
                  CircularProgressIndicator(
                    color: Colors.white,
                  ):
              Text("ADD Data"),)
            ],
          ),
        ),
      ),
    );
  }
}
