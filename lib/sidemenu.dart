import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            color: Colors.deepPurple, // Ganti warna latar belakang drawer
            alignment: Alignment.centerLeft,
            child: const Row(
              children: [
                Icon(
                  Icons.note_alt_outlined, 
                  color: Colors.white, // Warna ikon
                ),
                SizedBox(width: 10),
                Text(
                  'I used to know you',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.deepPurple), // Ganti warna ikon
            title: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.black87), // Ganti warna teks
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.deepPurple), // Ganti warna ikon
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.black87), // Ganti warna teks
            ),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}