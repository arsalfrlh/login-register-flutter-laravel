import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auth/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<Map<String, dynamic>> register(String name, String email, String alamat, String password) async { //parameter function menyimpan data yang user dimasukan user
    final response = await http.post( //method post
      Uri.parse('$baseUrl/register'), //url API
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({ //data json di encode yg berisi Map dan diisi arraykey dan parameter function
        'name': name, //array key| parameter function
        'email': email,
        'alamat': alamat,
        'password': password
        }), 
    );
    return jsonDecode(response.body); //mengembalikan data json yg sudah di decode
  }

  Future<Map<String, dynamic>> login(String email, String password) async{
    final response = await http.post( //method post
      Uri.parse('$baseUrl/login'),//url API
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}), //data json di encode yg berisi Map dan diisi arraykey dan parameter function
    );
    return jsonDecode(response.body); //mengembalikan data json yg sudah di decode
  }

  Future<User?> getUser() async{
    final prefs = await SharedPreferences.getInstance(); //menyimpan Shrared di variabel
    final token = prefs.getString('token'); //mengambil data di arraykey token bertipe data String

    final response = await http.get( //method get
      Uri.parse('$baseUrl/user'), //url API
      headers: {'Authorization': 'Bearer $token'}, //token typenya Bearer
    );

    if(response.statusCode == 200){ //jika response berhasil dilakukan
      return User.fromJson(jsonDecode(response.body)); //mengembalikan dan mengisi data pada class User di simpan di named construktor dan data json sudah di decode
    }else{
      return null; //jika gagal maka data akan kosong
    }
  }

  Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance(); //menyimpan Shrared di variabel
    final token = prefs.getString('token'); //mengambil data di arraykey token bertipe data String

    await http.post( //method get
      Uri.parse('$baseUrl/logout'), //url API
      headers: {'Authorization': 'Bearer $token'}, //token typenya Bearer
    );

    await prefs.remove('token'); //menghapus token pada SharedPrefences
  }
}
