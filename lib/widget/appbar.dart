import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.laptop, color: Colors.black),
      actions: [
        for (final item in ['Home', 'About', 'Projects', 'Contact'])
          _AnimatedAppBarItem(
            title: item,
            textColor: const Color(0xFF0A0A32),
            hoverColor: Colors.yellow,
            fontsize: 25,
          ),
      ],
    );
  }
}

class _AnimatedAppBarItem extends StatefulWidget {
  final String title;
  final Color textColor;
  final Color hoverColor;
  final int fontsize;

  const _AnimatedAppBarItem({
    required this.title,
    required this.textColor,
    required this.hoverColor,
    required this.fontsize,
  });

  @override
  _AnimatedAppBarItemState createState() => _AnimatedAppBarItemState();
}

class _AnimatedAppBarItemState extends State<_AnimatedAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _isHovered ? widget.hoverColor : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered ? widget.hoverColor : widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
