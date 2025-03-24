import 'package:empher/models/post.dart';
import 'package:flutter/material.dart';

class PostVerificationPill extends StatelessWidget {
  final AIFactCheck aiFactCheck;
  const PostVerificationPill({super.key, required this.aiFactCheck});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pillColor(),
      ),
      padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 10.0),
      child: Text(pillText(), style: TextStyle(color: Colors.white)),
    );
  }

  String pillText() {
    switch (aiFactCheck) {
      case AIFactCheck.accurate:
        return "Accurate";
      case AIFactCheck.mostlyAccurate:
        return "Mostly True";
      case AIFactCheck.partiallyAccurate:
        return "Partially True";
      case AIFactCheck.notCorrect:
        return "False";
      case AIFactCheck.copied:
        return "Copied";
      case AIFactCheck.unverified:
        return "Unverified";
    }
  }

  Color pillColor() {
    switch (aiFactCheck) {
      case AIFactCheck.accurate:
        return Colors.green;
      case AIFactCheck.mostlyAccurate:
        return Colors.lightGreen;
      case AIFactCheck.partiallyAccurate:
        return Colors.yellow;
      case AIFactCheck.notCorrect:
        return const Color.fromARGB(255, 255, 47, 33);
      case AIFactCheck.copied:
        return Colors.orange;
      case AIFactCheck.unverified:
        return Colors.grey.withValues(alpha: 0.8);
    }
  }
}
