import 'package:base/Models/taskData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/taskScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap everything in a ChangeNotifierProvider so that we can use the
    // ChangeNotifierProvider.of(context) method to access the ChangeNotifier
    // class
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

// TODO Change app name in the next files :
// app/src/main/kotlin/com/example/base/MainActivity.kt :: 1
// app/src/main/AndroidManifest.xml  :: 2 & 4
// app/src/debug/AndroidManifest.xml :: 2
// app/build.gradle  :: 47
