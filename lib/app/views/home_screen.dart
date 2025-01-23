// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart';
// import 'download_screen.dart';

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('WIFI App Updater')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => DownloadScreen()),
// //             );
// //           },
// //           child: Text('Start Update'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart';
// import 'download_screen.dart';

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('WIFI App Updater')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             // هنا بنستخدم BlocProvider.value علشان ننقل الـ Cubit
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => DownloadScreen(),
// //               ),
// //             );
// //           },
// //           child: Text('Start Update'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('WIFI App Updater')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             // هنا بنستخدم BlocProvider.value علشان ننقل الـ Cubit
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => BlocProvider.value(
// //                   value: context.read<AppCubit>(),
// //                   child: DownloadScreen(),
// //                 ),
// //               ),
// //             );
// //           },
// //           child: Text('Start Update'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart'; // تأكد من استيراد AppCubit
// import 'download_screen.dart'; // تأكد من استيراد DownloadScreen

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('WIFI App Updater')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // هنا بنستخدم BlocProvider.value علشان ننقل الـ Cubit
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BlocProvider.value(
//                   value: context.read<AppCubit>(),
//                   child: DownloadScreen(),
//                 ),
//               ),
//             );
//           },
//           child: Text('Start Update'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'download_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WIFI App Updater')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => DownloadScreen()); // نروح لشاشة التحميل
          },
          child: Text('Start Update'),
        ),
      ),
    );
  }
}
