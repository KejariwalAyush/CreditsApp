import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:rewards_converter/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyHomePage.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits App Login'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: RaisedButton.icon(
                  // color: Colors.transparent,
                  onPressed: () {
                    signInWithGoogle().whenComplete(() {
                      setState(() {
                        isLoggedIn = true;
                        setCredentials();
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MyHomePage();
                          },
                        ),
                      );
                    });
                  },
                  icon: Icon(
                    Icons.power_settings_new,
                    // color: Colors.amber,
                    size: 50,
                  ),
                  label: Text(
                    isLoggedIn != null && isLoggedIn
                        ? 'Continue as ${name == null ? 'Last User' : name}'
                        : 'Signin with Google',
                    textAlign: TextAlign.center,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            isLoggedIn != null && isLoggedIn
                ? RaisedButton(
                    onPressed: () {
                      setState(() {
                        isLoggedIn = false;
                        signOutGoogle();
                      });
                    },
                    child: Text('SignOut'),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void setCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', isLoggedIn);
  }
}

// Future<String> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return 'signInWithGoogle succeeded: $user';
// }

// void signOutGoogle() async{
//   await googleSignIn.signOut();

//   print("User Sign Out");
// }
