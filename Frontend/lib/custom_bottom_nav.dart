import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add_new_diecast.dart';
import 'profile_page.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex; // 0 untuk Home, 1 untuk Add, 2 untuk Profile

  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1. Tombol Home
          _buildNavItem(
            context,
            icon: Icons.home_outlined,
            index: 0,
            destinationPage: const HomePage(),
          ),
          
          // 2. Tombol Add
          _buildNavItem(
            context,
            icon: Icons.add_circle_outline,
            index: 1,
            destinationPage: const AddNewDiecastPage(),
          ),
          
          // 3. Tombol Profile
          _buildNavItem(
            context,
            icon: Icons.person_outline,
            index: 2,
            destinationPage: const ProfilePage(),
          ),
        ],
      ),
    );
  }

  // Widget bantuan untuk membuat tombol seragam
  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required Widget destinationPage,
  }) {
    bool isActive = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Jika yang diklik adalah halaman yang sedang aktif, jangan lakukan apa-apa
          if (isActive) return;

          // LOGIKA BARU: 
          // Selalu hapus semua history (termasuk Login) dan buka halaman tujuan.
          // KECUALI jika tujuannya adalah Home (index 0), kita set Dashboard sebagai root baru.
          
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
              transitionDuration: Duration.zero, // Tanpa animasi
              reverseTransitionDuration: Duration.zero,
            ),
            // Jika tujuannya Home (index 0), hapus semua history sampai habis.
            // Jika tujuannya Add/Profile, sisakan Dashboard (index 0) sebagai history pertama.
            (route) => index == 0 ? false : route.isFirst,
          );
        },
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            // Jika aktif, background biru. Jika tidak, transparan.
            color: isActive ? const Color(0xFF3F4E88) : Colors.transparent,
            borderRadius: BorderRadius.circular(15), // Lengkungan seragam
          ),
          child: Icon(
            icon,
            size: 28,
            // Jika aktif, ikon putih. Jika tidak, hitam.
            color: isActive ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}