import 'package:flutter/material.dart';
import '../firebase_options.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../UI/PaddingButton.dart';

import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// Adding a SingleTickerProviderStateMixin to the class grants the ability to act as a
// SINGLE TickerProvider.
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController is a special type of Animation object that generates a new value
  // whenever it is asked to do so by the TickerProvider.
  late AnimationController controller;

  // Animation is a special type of object that generates a new value whenever the
  // AnimationController ticks.
  late Animation animation;

  // Initialize Firebase services
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeFirebase();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,

      // Using animations requires that the upper and lower bounds of the animation are
      // between [0-1]
      //upperBound: 100.0,
    );

    // Start the animation
    controller.forward();

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.addListener(() {
      // We just need to call setState() here so Flutter knows to rebuild the widget with
      // the new changes.
      setState(() {});
    });
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
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: Duration(milliseconds: 300),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            PaddingButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
                //Go to login screen.
              },
            ),
            PaddingButton(
              text: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
                //Go to registration screen.
              },
            ),
          ],
        ),
      ),
    );
  }

  // The dispose() method is called when the State object is removed, which is permanent.
  // This callback is where you should unsubscribe and cancel all animations, streams,
  // etc.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
