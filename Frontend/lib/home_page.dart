import 'package:flutter/material.dart';
import 'add_new_diecast.dart';
import 'profile_page.dart';
import 'custom_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mockup Data Diecast
  final List<Map<String, dynamic>> _items = [
    {'title': 'LCD Model McLaren Senna GTR', 'scale': '1/18', 'qty': 1},
    {'title': 'UT Model Porsche 903 Carrera', 'scale': '1/18', 'qty': 1},
    {'title': 'UT Model Porsche 903', 'scale': '1/18', 'qty': 1},
    {'title': 'Almost Real RUF CTR Anniv', 'scale': '1/18', 'qty': 1},
    {'title': 'AutoArt Porsche 991.2 GT2 RS', 'scale': '1/18', 'qty': 1},
    {'title': 'Norev Porsche 911 S/T', 'scale': '1/18', 'qty': 1},
    {'title': 'Tomica Limited Vintage Neo Land Cruiser Merapi Edition', 'scale': '1/64', 'qty': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE), // Warna background disamakan dengan Profile
      
      // --- TULISAN DIPINDAH KE SINI ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        // Tombol back tidak dimunculkan di Dashboard karena ini halaman utama
        automaticallyImplyLeading: false, 
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
      
      body: Column(
        children: [
          // --- FILTER DROPDOWN ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15), // Padding atas ditambah sedikit
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('Filter by', style: TextStyle(fontSize: 14)),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
                  items: ['Semua', 'Skala 1/8', 'Skala 1/64', 'Brand'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    // Logic filter bisa ditambahkan di sini nanti
                    print(newValue);
                  },
                ),
              ),
            ),
          ),

          // --- LIST ITEM (SCROLLABLE) ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return _buildItemCard(item);
              },
            ),
          ),
        ],
      ),

      // --- BOTTOM NAVIGATION BAR CUSTOM ---
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }

  // Widget untuk Card per item
  Widget _buildItemCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4), // Warna card
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2), // Efek border tipis
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          // Gambar Placeholder (Kotak abu-abu)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(width: 15),
          
          // Info Teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text('Scale: ${item['scale']}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                Text('Quantity: ${item['qty']}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          
          // Icon Edit di Pojok Kanan Atas
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.edit_outlined, size: 20, color: Colors.black54),
          )
        ],
      ),
    );
  }
}