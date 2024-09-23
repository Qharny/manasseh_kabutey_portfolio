import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class WorkExperienceSection extends StatelessWidget {
  final List<Map<String, String>> experienceList = [
    {
      'year': '2023 - Present',
      'position': 'Flutter Developer',
      'company': 'TechCorp Inc.',
      'description': 'Developing and maintaining mobile applications using Flutter.',
    },
    {
      'year': '2022 - 2023',
      'position': 'Mobile Development Intern',
      'company': 'StartUp Solutions',
      'description': 'Assisted in the development of Android applications using Kotlin.',
    },
  ];

  WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: experienceList.length,
            itemBuilder: (context, index) {
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: index == 0,
                isLast: index == experienceList.length - 1,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Colors.blue.shade900,
                ),
                endChild: _RightChild(
                  position: experienceList[index]['position']!,
                  company: experienceList[index]['company']!,
                  description: experienceList[index]['description']!,
                ),
                startChild: _LeftChild(
                  year: experienceList[index]['year']!,
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
    required this.position,
    required this.company,
    required this.description,
  });

  final String position;
  final String company;
  final String description;

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
              position,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              company,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}