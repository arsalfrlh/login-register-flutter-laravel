<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

// gunakan ini untuk api auth = php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
// untuk menggunakan api authentication menghapus tanda // pada api=>[ \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class, di file "kernel.php"

class SessionApiController extends Controller
{
    public function register(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'alamat' => 'required',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json(['message' => 'ada kesalahan', 'data' => $validator->errors()]);
        }

        $register = [
            'name' => $request->name,
            'email' => $request->email,
            'alamat' => $request->alamat,
            'password' => Hash::make($request->password),
        ];

        $user = User::create($register);
        $data = [
            'token' => $user->createToken('auth_token')->plainTextToken,
            'token_type' => 'Bearer',
        ];

        return response()->json(['message' => 'Register Berhasil', 'data' => $data]);
    }

    public function login(Request $request){
        $validator = Validator::make($request->all(),[
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json(['message' => 'ada kesalahan', 'data' => $validator->errors()]);
        }

        $login = $request->all();
        
        if(Auth::attempt($login)){
            $data = [
                'token' => Auth::user()->createToken('auth_token')->plainTextToken,
                'token_type' => 'Bearer',
            ];

            return response()->json(['message' => 'Login Berhasil', 'data' => $data]);
        }else{
            return response()->json(['message' => 'Username atau Password Anda Salah', 'data' => null]);
        }
    }

    public function logout(Request $request){
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Logout Berhasil']);
    }
}
