import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add_new_diecast.dart';
import 'login_page.dart';
import 'custom_bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE), // Background abu-abu terang
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3F4E88), size: 20),
          onPressed: () {
            Navigator.maybePop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'DataDiecast',
          style: TextStyle(
            color: Color(0xFF3F4E88),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- CARD PROFILE ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9), // Warna card
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Judul
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Avatar Placeholder
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Username & Icon Edit
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'username',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.edit, size: 16, color: Colors.black54),
                      ],
                    ),
                    const SizedBox(height: 5),

                    // Email
                    const Text(
                      'youremail@email.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFBDBDBD), // Warna abu-abu pudar
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Tombol Logout
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC97C7C), // Warna merah pudar (soft red)
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Logout', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Teks Forgot Password
                    const Text(
                      'Forgot password',
                      style: TextStyle(
                        color: Color(0xFF3F4E88), // Warna biru dongker
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR CUSTOM ---
      // Gunakan CustomBottomNav dengan index 2 (Profile)
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }
}