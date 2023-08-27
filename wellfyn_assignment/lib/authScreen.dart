import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellfyn_assignment/homeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _pinController = TextEditingController();
  String _storedPin = '';


 @override
  void initState() {
    super.initState();
    _loadStoredPin();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pinController.dispose();
    super.dispose();
  }
  void _login() {
    String enteredPin = _pinController.text;
    if (enteredPin == _storedPin) {
      // Navigate to the next screen or perform the desired action
      print('Login successful');
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // Display an error message
      Fluttertoast.showToast(
                                     msg: "Oops wrong pin",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                 );
      print('Invalid PIN');
    }
  }

   void _loadStoredPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedPin = prefs.getString('pin')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Screen'),
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
                  _login();
                });
                }
               
              },
              child: Text('Check Details'),
            ),
          ],
        ),
      ),
    );
  }
}