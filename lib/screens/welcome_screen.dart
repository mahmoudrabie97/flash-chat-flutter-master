import 'dart:ffi';
import 'package:flash_chat/component/rounded_boutton.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {
  static String id='/welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
  
    super.initState();
    controller =AnimationController
    (
      duration: Duration(seconds: 3),
      vsync: this,
      
    );
    animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(()
    {
      setState(() {
        
      });
    });
    @override
    Void dispose()
    {
      controller.dispose();
      super.dispose();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat',],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Roundedboutton(title: 'Log in ',colour: Colors.lightBlueAccent,onpressed: () {
            Navigator.pushNamed(context, LoginScreen.id);
            {
              
            }
            
          },),
           Roundedboutton(title: 'Register ',colour: Colors.blueAccent,onpressed: () {
            Navigator.pushNamed(context, RegistrationScreen.id);
            {
              
            }
            
          },),
            
          ],
        ),
      ),
    );
  }
}
