import 'package:flutter/material.dart';

void main()
{
  runApp(
      MyCard()
  );
}

// In order to use hot reload I need to use a stateful | stateless widget
class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        // appBar: AppBar(
        //   title: Text("Presentation card"),
        //   backgroundColor: Colors.teal,
        // ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("images/Portrait.jpg"),
                ),
              ),
              SizedBox(height: 10.0),
              Text('Salvador Lemus',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text('FLUTTER DEVELOPER',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 15.0,
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5
                ),
              ),
              SizedBox(
                height: 50,
                child: Divider(
                  color: Colors.teal.shade100,
                  thickness: 1.5,
                  indent: 100.0,
                  endIndent: 100.0,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text('+52 1 55 2251 0633',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'SourceSansPro',
                      fontSize: 15.0
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text('salvadorlemus.06@outlook.com',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 15.0
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
