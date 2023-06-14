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
        appBar: AppBar(
          title: Text("Presentation card"),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100,
              color: Colors.red,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 100,
                    width: 100,
                    color: Colors.yellow,),
                  Container(height: 100,
                    width: 100,
                    color: Colors.green,)
                ],
              ),
              Container(width: 100,
                color: Colors.blue,)
            ],
          ),
        ),
      ),
    );
  }
}
