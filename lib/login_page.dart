import 'package:flutter/material.dart';
import 'package:training/globalvar.dart';

class LoginPage extends StatefulWidget {
  final String routes = "/login_page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validasi input
  String? _usernameError;
  String? _passwordError;

  void _login() {
    setState(() {
      // Validasi input, cek apakah kosong
      _usernameError =
          _usernameController.text.isEmpty ? 'Username is required' : null;
      _passwordError =
          _passwordController.text.isEmpty ? 'Password is required' : null;

      // Jika tidak ada error, cek apakah username dan password valid
      if (_usernameError == null && _passwordError == null) {
        // Cek apakah username dan password sesuai dengan global variables
        if (_usernameController.text == GlobalVariables.validUsername &&
            _passwordController.text == GlobalVariables.validPassword) {
          Navigator.pushReplacementNamed(context, '/profil_page');
        } else {
          // Tampilkan dialog error jika username atau password salah
          _showErrorDialog('Invalid username or password');
        }
      }
    });
  }

  // Fungsi untuk menampilkan dialog error
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Mengganti Text dengan Image
              Image.asset(
                'assets/login_icon.jpeg', // Ganti dengan path gambar Anda
                height: 150, // Sesuaikan tinggi gambar
              ),
              SizedBox(height: 20),
              Text(
                'Yuk masuk dengan akun kamu',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),

              // Username TextField
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  errorText: _usernameError,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Password TextField
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true, // Menyembunyikan password
                decoration: InputDecoration(
                  errorText: _passwordError,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),

              // Tombol Login
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Color.fromRGBO(84, 190, 142, 1)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
