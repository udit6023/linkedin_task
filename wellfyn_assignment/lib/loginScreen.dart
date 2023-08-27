import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellfyn_assignment/authScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _pinController = TextEditingController();
  String _storedPin = '';

 

 

  void _savePin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pin', pin);
    setState(() {
      _storedPin = pin;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pinController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: height/2,
              child: TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                decoration: InputDecoration(
                  labelText: 'Enter PIN',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:(){
                if(_pinController.text.isNotEmpty){
                     setState(() {
                  _savePin(_pinController.text);
                  print(_pinController.text);
                });
                }
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthScreen()));
               
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}