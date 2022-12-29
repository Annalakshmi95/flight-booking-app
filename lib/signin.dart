
import 'package:firebase_auth/firebase_auth.dart';





import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laxmiflight_booking_app/authendicationservice.dart';
import 'package:laxmiflight_booking_app/flight_app_start_page.dart';
import 'package:laxmiflight_booking_app/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _newkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:const EdgeInsets.only(top: 50,left: 15),
            child:Container(
            child:Text("LOGIN",
            style: TextStyle(fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.grey),
            ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Column(
                  children: [
                    Form(
                      
                      child: TextFormField(
                        validator:((value) {
                          if(value!.isEmpty){
                            return "please enter the mail";
                          }
                          return null;
                        }),
                        decoration :InputDecoration(
                          hintText: "email",
                        hintStyle: TextStyle(fontSize: 20),
                        suffixIcon: Icon(Icons.email),suffixIconColor: Colors.black),
                        controller: emailcontroller,
                    ),
                    ),
                    TextFormField(
                      validator: (((value) {
                        if(value!.isEmpty){
                          return "please enter the password";
                      }
                      return null;
                    })),
                    decoration:InputDecoration(hintText: "password",
                        hintStyle: TextStyle(fontSize: 20),
                        suffixIcon: Icon(Icons.key),suffixIconColor: Colors.black),
                        controller: passwordcontroller,
                    ),
                  ],
                ),
              ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(50),
              child:Container(
              child: ElevatedButton(
                onPressed:()async {
                  await Authenticationservice(FirebaseAuth.instance)
                  .firebaseLongin(emailcontroller.text.trim(), passwordcontroller.text.trim())                 
                  .then ((value){
                  if(value == "signed in"){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlightAppStartPage(),));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("enter the correct value"),
                        backgroundColor: Colors.yellow,));
                        }
                   });
               },
               child: Text("signedin",
               style: TextStyle(fontSize: 20,color: Colors.black),)),
              ),
              ),
               Row(
              children: [Padding(padding: const EdgeInsets.only(top: 10,left: 50),
              child: Container(
                child: Text("dont't have an account?",
                style: TextStyle(fontSize: 20,
                color: Colors.black),),
                
              ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp(),)); 
                },
                child: Text("sign Up",
                style:TextStyle(fontSize: 24,
                color:Colors.green,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),)
                )
                
              ],
              )
        ],
      ),
    );
  }
}