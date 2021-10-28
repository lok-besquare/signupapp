import 'package:flutter/material.dart';

void main() {
  runApp(SignUpPage());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   final String img_url =
//       'https://p.kindpng.com/picc/s/20-203381_sign-up-icon-png-login-and-signup-icon.png';
//   final snackBar = SnackBar(content: Text('You have successfully signed up.'));
//   final username = TextEditingController();
//   final email = TextEditingController();
//   final password = TextEditingController();

//   Widget build(BuildContext context) {}
// }

class SignUpPage extends StatefulWidget {
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final snackBar = SnackBar(content: Text('You have successfully signed up.'));
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String _DropdownChoice = 'Male';
  bool _isButtonDisabled = false;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  // ignore: non_constant_identifier_names
  List<DropdownMenuItem<String>> get itemsList {
    List<DropdownMenuItem<String>> itemsList = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
      DropdownMenuItem(child: Text("Other"), value: "Other"),
      DropdownMenuItem(
          child: Text("Rather not to say"), value: "Rather not to say"),
    ];
    return itemsList;
  }

  void initState() {
    _username.addListener(checkAllEnter);
    _email.addListener(checkAllEnter);
    _password.addListener(checkAllEnter);
    super.initState();
  }

  void checkAllEnter() {
    setState(() {
      if (_username.text.isNotEmpty &&
          _email.text.isNotEmpty &&
          _password.text.isNotEmpty) {
        _isButtonDisabled = true;
      } else {
        _isButtonDisabled = false;
      }
    });
  }

//   void buttonStatus() {
//  ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: const Text('Awesome! Successful sign in.'),
//                       ) ,

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Sign-Up Page'),
            ),
            body: ListView(
              children: <Widget>[
                SizedBox(height: 5),
                Center(
                  child: new Text(
                    "Welcome to Sign-Up App!",
                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.network(
                  "assets/sign-up.png",
                  width: 200,
                  height: 200,
                  // fit: BoxFit.cover,
                ),
                TextFormField(
                  // ignore: deprecated_member_use
                  controller: _username,
                  maxLength: 20,
                  style: new TextStyle(),
                  decoration: InputDecoration(
                    icon: Icon(IconData(57938, fontFamily: 'MaterialIcons')),
                    labelText: 'Name',
                    hintText: 'Enter your name...',
                  ),
                ),
                TextFormField(
                  // ignore: deprecated_member_use
                  controller: _email,
                  maxLength: 20,
                  // style:TextStyle(color:Colors.amber,
                  // :20,
                  // ),
                  decoration: InputDecoration(
                    icon: Icon(IconData(57473, fontFamily: 'MaterialIcons')),
                    labelText: 'Email',
                    hintText: 'Enter your email...',
                  ),
                ),
                TextFormField(
                  // ignore: deprecated_member_use
                  controller: _password,
                  maxLength: 20,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(IconData(58490, fontFamily: 'MaterialIcons')),
                    labelText: 'Password',
                    hintText: 'Enter your password...',
                  ),
                ),
                DropdownButtonFormField(
                    value: _DropdownChoice,
                    decoration: InputDecoration(
                        icon:
                            Icon(IconData(60881, fontFamily: 'MaterialIcons')),
                        labelText: 'Please select your gender'),
                    items: itemsList,
                    onChanged: (String? storeNewOption) {
                      setState(() {
                        _DropdownChoice = storeNewOption!;
                      });
                    }),
                SizedBox(height: 8),
                Container(
                  child: ElevatedButton(
                    onPressed: !_isButtonDisabled
                        ? null
                        : () {
                            scaffoldMessengerKey.currentState!
                                .showSnackBar(SnackBar(
                              content: const Text(
                                  'You have successfully signed up!'),
                            )); // _scaffoldKey.currentState.showSnackBar(new SnackBar(content: ''));
                            // Respond to button press
                          },
                    child: Text('Submit'),
                  ),
                ),
              ],

              // child: TextField(
              //   controller: _controller,
              // ),
            )));
  }
}
