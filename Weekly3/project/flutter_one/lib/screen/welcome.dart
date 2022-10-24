import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Stack(
        children: [
          Image.asset("assets/bg.jpg"),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(100, 22, 44, 33),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Coding Bootcamp Penghasil Programmer dengan Kualitas Tinggi di Indonesia",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Alterra Academy adalah coding bootcamp indonesia untuk semua orang, baik dengan background IT & non-IT untuk menjadi Programmer dengan kualitas terbaik di Industri saat ini.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Pelajari Lebih Lanjut',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
