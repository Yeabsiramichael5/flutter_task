import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Username and Password Input Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserInputField(),
        ),
      ),
    );
  }
}

class UserInputField extends StatefulWidget {
  @override
  _UserInputFieldState createState() => _UserInputFieldState();
}

class _UserInputFieldState extends State<UserInputField> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _username = '';
  String _password = '';
  bool _isPasswordVisible = false;

  void _showUsername() {
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Enter your username',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16), 

        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible, 
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible; 
                });
              },
            ),
          ),
        ),
        SizedBox(height: 16), 

        ElevatedButton(
          onPressed: _showUsername,
          child: Text('Show Username and Password'),
        ),
        SizedBox(height: 16), 

        Text(
          'Username: $_username\nPassword: $_password',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}