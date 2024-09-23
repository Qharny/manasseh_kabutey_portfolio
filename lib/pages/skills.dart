import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SkillsSection extends StatelessWidget {
  final List<String> skills = [
    'flutter', 'html', 'css', 'js', 'php', 'kotlin', 'nodejs', 'tailwind'
  ];

  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          const SizedBox(height: 20),
          AnimationLimiter(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(
                skills.length,
                (index) => AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: 4,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/skills/${skills[index]}.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}