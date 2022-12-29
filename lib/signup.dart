
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laxmiflight_booking_app/authendicationservice.dart';
import 'package:laxmiflight_booking_app/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final GlobalKey <FormState> _newkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scffoldkey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left:15),
              child: Container(
                child: Text("logout",
                style: TextStyle(fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.blue[100]),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Form(
                  key: _newkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: ((value) {
                            if (value!.isEmpty){
                              return "please enter the name";
                            }
                            return null;
                          }),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(fontSize: 20),
                          suffixIcon: Icon(Icons.person),suffixIconColor: Colors.black),
                          controller: nameController,
                      ),
                      TextFormField(
                        validator: ((value) {
                            if (value!.isEmpty){
                              return "please enter the mobile number";
                            }
                            return null;
                          }),
                        decoration: InputDecoration(
                          hintText: "MobileNumber",
                          hintStyle: TextStyle(fontSize: 20),
                          suffixIcon: Icon(Icons.mobile_screen_share),suffixIconColor: Colors.black),
                          controller: mobileNumbercontroller,
                      ),
                      TextFormField(
                        validator: ((value) {
                            if (value!.isEmpty){
                              return "please enter the email";
                            }
                            return null;
                          }),
                        decoration: InputDecoration(
                          hintText: "email",
                          hintStyle: TextStyle(fontSize: 20),
                          suffixIcon: Icon(Icons.email),suffixIconColor: Colors.black),
                          controller: emailcontroller,
                      ),
                      TextFormField(
                        validator: ((value) {
                            if (value!.isEmpty){
                              return "please enter the password";
                            }
                            return null;
                          }),
                        decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(fontSize: 20),
                          suffixIcon: Icon(Icons.key),suffixIconColor: Colors.black),
                          controller: passwordcontroller,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                          if(_newkey.currentState!.validate()){
                            print("valid");
                            } else {
                              print("please enter all fields ");
                            }
      
                        },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: ElevatedButton(
                  onPressed: ()async{
                    await Authenticationservice(FirebaseAuth.instance)
                    .firebaseregister(emailcontroller.text.trim(), passwordcontroller.text.trim())
                    .then((value) {
                      if(value == "signed up"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage(),));
                      }
                    });
                  },
                  child: Text("signedup",
                  style: TextStyle(fontSize: 20,color: Colors.black),)), 
              ),
            ),
          ]));
    
    
  }
}