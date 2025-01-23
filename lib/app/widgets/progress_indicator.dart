// // import 'package:flutter/material.dart';

// // class ProgressIndicatorWidget extends StatelessWidget {
// //   final double progress;

// //   const ProgressIndicatorWidget({Key? key, required this.progress})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Text('Progress: ${(progress * 100).toStringAsFixed(0)}%'),
// //         LinearProgressIndicator(value: progress),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// // class ProgressBar extends StatelessWidget {
// //   final int progress;
// //   const ProgressBar({required this.progress});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Text('$progress%'),
// //         SizedBox(height: 20),
// //         LinearProgressIndicator(value: progress / 100),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class ProgressBar extends StatelessWidget {
//   final int progress;

//   const ProgressBar({required this.progress});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('$progress%', style: TextStyle(fontSize: 24)),
//         SizedBox(height: 20),
//         LinearProgressIndicator(value: progress / 100),
//       ],
//     );
//   }
// }

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
