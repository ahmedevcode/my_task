import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:tasks3/home/webview/web_view.dart';

class login_body extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      await _googleSignIn.signIn();


      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => web_view()),
      );
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  Future<void> _handleFacebookSignIn(BuildContext context) async {
    try {
      final result = await _facebookAuth.login();

      if (result.status == LoginStatus.success) {

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => web_view()),
        );
      } else {
        print('Facebook Sign-In Error: ${result.message}');
      }
    } catch (error) {
      print('Facebook Sign-In Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _handleGoogleSignIn(context),
              child: Text('Sign in with Google'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleFacebookSignIn(context),
              child: Text('Sign in with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
