import 'package:flash_chat/component/rounded_boutton.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth=FirebaseAuth.instance;
  bool showspanner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspanner,
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                              child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                  onChanged: (value) {
                    email=value;

                    
                    //Do something with the user input.
                  },
                  decoration: ktextfieldDecoration.copyWith(
                      hintText: 'Enter your Email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                 obscureText: true,
                textAlign: TextAlign.center,
                  onChanged: (value) {
                    password=value;
                   
                  },
                  decoration: ktextfieldDecoration.copyWith(
                      hintText: 'Enter your passwoerd')),
              SizedBox(
                height: 24.0,
              ),
              Roundedboutton(
                title: 'LOg In',
                colour: Colors.lightBlueAccent,
                onpressed: () async
                {
                  setState(() {
                    showspanner=true;
                  });
                  
                  try{
                  final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(user!=null)
                  {
                    Navigator.popAndPushNamed(context, ChatScreen.id);

                  }
                   setState(() {
                       showspanner=false;
                  });
                  }
                  catch(e)
                  {
                    print(e);
                  }
                 
               
                
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
