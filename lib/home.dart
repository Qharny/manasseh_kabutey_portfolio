import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about.dart';
import 'package:my_portfolio/pages/contact.dart';
import 'package:my_portfolio/pages/education.dart';
import 'package:my_portfolio/pages/hero.dart';
import 'package:my_portfolio/pages/project.dart';
import 'package:my_portfolio/pages/skills.dart';
import 'package:my_portfolio/pages/work.dart';

import 'widget/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      appBar: AnimatedAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroPage(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),  // Add this line
            EducationSection(),
            WorkExperienceSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}