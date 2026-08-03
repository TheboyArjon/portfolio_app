import 'package:flutter/material.dart';

class AnimatedAvatar extends StatefulWidget {
  final String initials;

  const AnimatedAvatar({super.key, required this.initials});

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar> {
  bool _highlighted = false;

  static const _baseColor = Color(0xFF2196F3);
  static const _highlightColor = Color(0xFFFF6F00);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _highlighted = !_highlighted),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut,
        width: _highlighted ? 128 : 104,
        height: _highlighted ? 128 : 104,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              _highlighted ? _highlightColor : _baseColor,
              _highlighted
                  ? _highlightColor.withOpacity(0.6)
                  : _baseColor.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: (_highlighted ? _highlightColor : _baseColor)
                  .withOpacity(0.4),
              blurRadius: _highlighted ? 24 : 12,
              spreadRadius: _highlighted ? 2 : 0,
            ),
          ],
        ),
        child: const CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/profile.jpeg',
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}