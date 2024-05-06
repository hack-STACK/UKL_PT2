import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Ganti dengan URL gambar profil
            ),
            const SizedBox(height: 20),
            const Text(
              'Nama Pengguna',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'email@domain.com', // Ganti dengan email pengguna
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '+62 1234567890', // Ganti dengan nomor telepon pengguna
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Verifikasi Email'),
              subtitle: const Text('Belum diverifikasi'),
              onTap: () {
                // Tambahkan fungsi untuk verifikasi email
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Verifikasi Nomor Telepon'),
              subtitle: const Text('Belum diverifikasi'),
              onTap: () {
                // Tambahkan fungsi untuk verifikasi nomor telepon
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () {
                // Tambahkan navigasi ke halaman profil
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Pembayaran'),
              onTap: () {
                // Tambahkan navigasi ke halaman pembayaran
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                // Tambahkan navigasi ke halaman pengaturan
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                // Tambahkan fungsi logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
