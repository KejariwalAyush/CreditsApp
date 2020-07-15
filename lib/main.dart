import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewards_converter/login.dart';
import 'package:rewards_converter/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

bool isLoggedIn = false;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoggedIn = false;
      _getCredentials();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credits App',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds:
            LoginPage(), //isLoggedIn ? MyHomePage() : LoginPage(),
        title: Text(
          'Credits App',
          overflow: TextOverflow.visible,
          style: GoogleFonts.lemonada(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        loadingText: Text('Loading Credentials'),
      ), //MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  void _getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('login');
    name = prefs.getString('name');
    email = prefs.getString('email');
    imageUrl = prefs.getString('imageUrl');
  }
}
