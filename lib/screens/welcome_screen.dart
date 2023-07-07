import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/chat_screen.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,

      // Using animations requires that the upper and lower bounds of the animation are
      // between [0-1]
      //upperBound: 100.0,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    // Start the animation
    controller.forward();

    // Reverse the animation
    // controller.reverse(from: 1.0);

    controller.addListener(() {
      // We just need to call setState() here so Flutter knows to rebuild the widget with
      // the new changes.
      setState(() {});
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    height: animation.value * 80,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                    //Go to login screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.routeName);
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
