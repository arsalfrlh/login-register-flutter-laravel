import 'package:auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:auth/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController(); //TextEditing di simpan ke variabel
  final _alamatController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService(); //class ApiService di simpan ke variabel

  void _register() async{
    final response = await _apiService.register(_nameController.text, _emailController.text, _alamatController.text, _passwordController.text); //variabel response menyimpan class ApiService dan memanggil function login dan berisi parameter TextEditing| TextEditing.text utk mengambil text yg diisi 
    if(response['message'] == 'Register Berhasil'){ //jika arraykey message = Register Berhasil
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
        title: Text('Register'),
        actions: [IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }, icon: Icon(Icons.add))],
        backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nama Anda')), //controllernya berisi variabel_emailController seperti name pada html
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _alamatController, decoration: InputDecoration(labelText: 'Alamat')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true), //obscureText: true untuk menyembunyikan text
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _register, child: Text('register')), //jika di klik akan memanggil function _register()
          ],
        ),
      ),
    );
  }
}
