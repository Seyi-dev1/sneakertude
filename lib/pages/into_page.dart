import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneakertude/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset(
                  'lib/images/logo.png',
                  height: 240,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              //title
              const Text(
                'Just Do It',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(
                height: 24,
              ),

              //subtitle
              const Text(
                'Brand new sneakers and custom kicks made with premiunm quality.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 48,
              ),

              //start now button
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
