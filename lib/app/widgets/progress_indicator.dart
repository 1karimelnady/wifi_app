import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int progress;
  const ProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$progress%'),
        SizedBox(height: 20),
        LinearProgressIndicator(value: progress / 100),
      ],
    );
  }
}
