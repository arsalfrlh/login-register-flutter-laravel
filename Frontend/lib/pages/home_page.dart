import 'package:auth/models/user.dart';
import 'package:auth/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? _user; //menyimpan class User kedalam variabel dan isi data class Usernya boleh null
  final ApiService _apiService = ApiService(); //menyimpan class ApiService kedalam variabel

  @override
  void initState() {
    super.initState();
    _fetchUser (); //memanggil function fetchUser()
  }

  void _fetchUser () async {
    User? user = await _apiService.getUser (); //variabel user menyimpan class User| dan berisi class ApiService dan memanggil function getUser()
    setState(() {
      _user = user; //menyimpan data user dari class ApiService ke class User
    });
  }

  void _logout() async {
    await _apiService.logout(); //memanggil class ApiService dan function logout()
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); //mengarahkan ke halaman login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: _logout, icon: Icon(Icons.logout), //saat di klik memanggil function _logout()
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: _user == null
      ? Center(child:  CircularProgressIndicator()) //isi jika data user null
      : Padding( //isi jika data user ada
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${_user!.name}', style: TextStyle(fontSize: 20)), //menampilkan nama user dari class User yang sudah di isi
            Text('Email: ${_user!.email}', style: TextStyle(fontSize: 20)),
            Text('Alamat: ${_user!.alamat}', style: TextStyle(fontSize: 20)),
          ],
        ),
        ),
    );
  }
}
