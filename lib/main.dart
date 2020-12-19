import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InputBox',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: InputBox(),
    );
  }
}

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool loggedIn = false;
  String _email, _userName, _password;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (str) {
                    return !str.contains("@") ? "Not a Valid Email" : null;
                  },
                  onSaved: (str) {
                    _email = str;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "UserName",
                  ),
                  validator: (str) {
                    return str.toString().length > 5
                        ? "Not a Valid UserName"
                        : null;
                  },
                  onSaved: (str) {
                    _userName = str;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (str) {
                    return str.length > 5 ? "Not a Valid Password" : null;
                  },
                  obscureText: true,
                  onSaved: (str) {
                    _password = str;
                  },
                ),
                RaisedButton(
                  onPressed: onPressed,
                  child: Text("Submit"),
                )
              ],
            )),
      ),
    );
  }

  void onPressed() {
    var form = formkey.currentState;
    if (form.validate()) {
      form.save();
    }
  }
}
