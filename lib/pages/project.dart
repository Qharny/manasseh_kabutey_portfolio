import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'Flutter Weather App',
      description: 'A beautiful weather app built with Flutter.',
      imageUrl: 'assets/projects/weather_app.png',
      projectUrl: 'https://github.com/yourusername/weather-app',
    ),
    Project(
      title: 'Task Manager',
      description: 'A productivity app to manage your daily tasks.',
      imageUrl: 'assets/projects/task_manager.png',
      projectUrl: 'https://github.com/yourusername/task-manager',
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured e-commerce app with Flutter and Firebase.',
      imageUrl: 'assets/projects/ecommerce_app.png',
      projectUrl: 'https://github.com/yourusername/ecommerce-app',
    ),
    // Add more projects as needed
  ];

  ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Projects',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          const SizedBox(height: 20),
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: projects.map((project) => StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: ProjectCard(project: project),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl,
  });
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 1.05).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: () => _launchURL(widget.project.projectUrl),
        child: ScaleTransition(
          scale: _animation,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    widget.project.imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.project.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _launchURL(widget.project.projectUrl),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('View Project'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}