import 'package:auth/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:auth/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(); //TextEditing di simpan ke variabel
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService(); //class ApiService di simpan ke variabel

  void _login() async{
    final response = await _apiService.login(_emailController.text, _passwordController.text); //variabel response menyimpan class ApiService dan memanggil function login dan berisi parameter TextEditing| TextEditing.text utk mengambil text yg diisi 
    if(response['message'] == 'Login Berhasil'){ //jika arraykey message = Login Berhasil
      final prefs = await SharedPreferences.getInstance(); //menyimpan Shrared di variabel
      await prefs.setString('token', response['data']['token']); //menympan data ke token bertipe String| di arraykey data token pada variable response
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())); //mengalihkan halaman ke class HomePage
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));
        }, icon: Icon(Icons.add))],
        backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')), //controllernya berisi variabel_emailController seperti name pada html
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true), //obscureText: true untuk menyembunyikan text
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _login, child: Text('login')), //jika di klik akan memanggil function _login()
          ],
        ),
      ),
    );
  }
}
