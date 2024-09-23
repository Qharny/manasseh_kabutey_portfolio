import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EducationSection extends StatelessWidget {
  final List<Map<String, String>> educationList = [
    {
      'year': '2020 - 2024',
      'degree': 'Bachelor of Science in Computer Science',
      'institution': 'University of Example',
    },
    {
      'year': '2018 - 2020',
      'degree': 'Associate Degree in Software Development',
      'institution': 'Community College of Technology',
    },
  ];

  EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: educationList.length,
            itemBuilder: (context, index) {
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: index == 0,
                isLast: index == educationList.length - 1,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Colors.blue.shade900,
                ),
                endChild: _RightChild(
                  degree: educationList[index]['degree']!,
                  institution: educationList[index]['institution']!,
                ),
                startChild: _LeftChild(
                  year: educationList[index]['year']!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LeftChild extends StatelessWidget {
  const _LeftChild({
    required this.year,
  });

  final String year;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        year,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    required this.degree,
    required this.institution,
  });

  final String degree;
  final String institution;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              degree,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              institution,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}