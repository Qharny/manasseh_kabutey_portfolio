import 'package:flutter/material.dart';
import 'package:my_portfolio/hero.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.laptop,
          color: Colors.white,
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "About",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Project",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Contact",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroPage(),
          ],
        ),
      ),
    );
  }
}
