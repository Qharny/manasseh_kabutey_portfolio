import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'About Me',
                textStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
          const SizedBox(height: 20),
          AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText(
                "I'm a passionate Flutter developer with a keen interest in creating beautiful and functional mobile applications. With a background in [Your Background], I bring a unique perspective to every project I work on.",
                textStyle: TextStyle(fontSize: 18, color: Colors.grey[800]),
                duration: const Duration(milliseconds: 3000),
                fadeOutBegin: 0.9,
                fadeInEnd: 0.1,
              ),
            ],
            totalRepeatCount: 1,
          ),
        ],
      ),
    );
  }
}