import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'custom_bottom_nav.dart';

class AddNewDiecastPage extends StatefulWidget {
  const AddNewDiecastPage({super.key});

  @override
  State<AddNewDiecastPage> createState() => _AddNewDiecastPageState();
}

class _AddNewDiecastPageState extends State<AddNewDiecastPage> {
  String? _selectedScale; // Variabel untuk menyimpan pilihan skala

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            children: [
              // --- CARD FORM ---
              Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9), // Warna card sedikit lebih terang dari background
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul Form
                    const Center(
                      child: Text(
                        'Add New Diecast',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Field Manufacturer & Model (Pakai Row agar sejajar)
                    _buildLabeledField('Manufacturer'),
                    const SizedBox(height: 12),
                    _buildLabeledField('Model name'),
                    const SizedBox(height: 12),
                    
                    // Field Image (Hanya teks di kiri, kotak input kosong di kanan)
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text('Add image', style: TextStyle(fontSize: 14)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Field Scale (Dropdown)
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text('Scale', style: TextStyle(fontSize: 14)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: const Text('', style: TextStyle(fontSize: 12)),
                                value: _selectedScale,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down, color: Colors.black54, size: 20),
                                items: ['1/18', '1/24', '1/64'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: const TextStyle(fontSize: 12)),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedScale = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Field Quantity (Dengan tombol minus dan plus kecil)
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text('Quantity', style: TextStyle(fontSize: 14)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.remove_circle_outline, size: 18, color: Colors.black54),
                                const Text('1', style: TextStyle(fontSize: 14)),
                                const Icon(Icons.add_circle_outline, size: 18, color: Colors.black54),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),

                    // Tombol Cancel & Add
                    Row(
                      children: [
                        // Tombol Cancel
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.maybePop(context); // Kembali tanpa menyimpan
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE0E0E0),
                                foregroundColor: Colors.black87,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text('Cancel', style: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Tombol Add
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // Logika simpan data ke database nanti di sini
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3F4E88),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text('Add', style: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR CUSTOM ---
      // Gunakan CustomBottomNav dengan index 1 (Add New Diecast)
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }

  // Widget bantuan untuk membuat baris Label dan TextField
  Widget _buildLabeledField(String label) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(label, style: const TextStyle(fontSize: 14)),
        ),
        Expanded(
          flex: 5,
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}