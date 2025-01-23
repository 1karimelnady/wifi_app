import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DownloadButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Start Download'),
    );
  }
}
