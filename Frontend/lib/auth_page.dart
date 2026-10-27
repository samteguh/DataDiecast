import 'package:flutter/material.dart';
import 'home_page.dart';

// ==========================================
// HALAMAN SIGN IN
// ==========================================
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dekorasi Background
          Positioned(top: -50, left: -50, child: _buildCircleDecoration()),
          Positioned(bottom: -50, right: -50, child: _buildCircleDecoration()),
          
          // Form Card
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                  color: const Color(0xFFF4F4F4),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30),
                        
                        _buildTextField('Username'),
                        const SizedBox(height: 15),
                        _buildTextField('Password', obscureText: true),
                        const SizedBox(height: 30),
                        
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
                                  (Route<dynamic> route) => false,
                                );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3F4E88),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: OutlinedButton(
                            onPressed: () {
                               // Pindah ke Sign Up
                               Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUpPage()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black87,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Sign up'),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Forgot password',
                          style: TextStyle(color: Colors.blue, fontSize: 12, decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// HALAMAN SIGN UP
// ==========================================
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -50, left: -50, child: _buildCircleDecoration()),
          Positioned(bottom: -50, right: -50, child: _buildCircleDecoration()),
          
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                  color: const Color(0xFFF4F4F4),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Sign up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30),
                        
                        _buildTextField('Username'),
                        const SizedBox(height: 15),
                        _buildTextField('Email'),
                        const SizedBox(height: 15),
                        _buildTextField('Password', obscureText: true),
                        const SizedBox(height: 30),
                        
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3F4E88),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Sign up'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: OutlinedButton(
                            onPressed: () {
                               // Kembali ke Login
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInPage()));
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black87,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// WIDGET BANTUAN (Biar kode tidak berulang)
// ==========================================

Widget _buildCircleDecoration() {
  return Container(
    width: 200,
    height: 200,
    decoration: const BoxDecoration(
      color: Color(0xFF3F4E88),
      shape: BoxShape.circle,
    ),
  );
}

Widget _buildTextField(String hint, {bool obscureText = false}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: hint,
      labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
      filled: true,
      fillColor: const Color(0xFFE0E0E0), // Warna abu-abu textfield
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    ),
  );
}