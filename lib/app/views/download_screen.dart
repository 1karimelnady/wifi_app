// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wifi_app/app/widgets/progress_indicator.dart';
// import '../controllers/app_controllers.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart';

// // class DownloadScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Downloading...')),
// //       body: BlocBuilder<AppCubit, AppState>(
// //         builder: (context, state) {
// //           if (state is AppDownloading) {
// //             return Center(
// //               child: ProgressBar(progress: state.progress),
// //             );
// //           } else if (state is AppDownloadComplete) {
// //             return Center(child: Text('Download Complete!'));
// //           } else if (state is AppError) {
// //             return Center(child: Text('Error: ${state.message}'));
// //           } else {
// //             return Center(child: Text('Press Start to Download'));
// //           }
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // نستدعي الـ Cubit علشان نبدأ التحميل
// //           context
// //               .read<AppCubit>()
// //               .downloadApk('192.168.1.1', 'ARM64'); // استبدل بـ IP الـ Admin
// //         },
// //         child: Icon(Icons.download),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart';

// // class DownloadScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Downloading...')),
// //       body: BlocBuilder<AppCubit, AppState>(
// //         builder: (context, state) {
// //           if (state is AppDownloading) {
// //             return Center(
// //               child: ProgressBar(progress: state.progress),
// //             );
// //           } else if (state is AppDownloadComplete) {
// //             return Center(child: Text('Download Complete!'));
// //           } else if (state is AppError) {
// //             return Center(child: Text('Error: ${state.message}'));
// //           } else {
// //             return Center(child: Text('Press Start to Download'));
// //           }
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           context
// //               .read<AppCubit>()
// //               .downloadApk('192.168.1.1', 'ARM64'); // استبدل بـ IP الـ Admin
// //         },
// //         child: Icon(Icons.download),
// //       ),
// //     );
// //   }
// // }

// // class DownloadScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Downloading...')),
// //       body: BlocBuilder<AppCubit, AppState>(
// //         builder: (context, state) {
// //           if (state is AppDownloading) {
// //             return Center(
// //               child: ProgressBar(progress: state.progress),
// //             );
// //           } else if (state is AppDownloadComplete) {
// //             return Center(child: Text('Download Complete!'));
// //           } else if (state is AppError) {
// //             return Center(child: Text('Error: ${state.message}'));
// //           } else {
// //             return Center(child: Text('Press Start to Download'));
// //           }
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           context
// //               .read<AppCubit>()
// //               .downloadApk('192.168.1.1', 'ARM64'); // استبدل بـ IP الـ Admin
// //         },
// //         child: Icon(Icons.download),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controllers/app_controllers.dart'; // تأكد من استيراد AppCubit

// class DownloadScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Downloading...')),
//       body: BlocBuilder<AppCubit, AppState>(
//         builder: (context, state) {
//           if (state is AppDownloading) {
//             return Center(
//               child: ProgressBar(progress: state.progress),
//             );
//           } else if (state is AppDownloadComplete) {
//             return Center(child: Text('Download Complete!'));
//           } else if (state is AppError) {
//             return Center(child: Text('Error: ${state.message}'));
//           } else {
//             return Center(child: Text('Press Start to Download'));
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // استبدل بـ IP الـ Admin ونوع المعالج المناسب
//           context.read<AppCubit>().downloadApk('192.168.1.1', 'ARM64');
//         },
//         child: Icon(Icons.download),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_app/app/controllers/app_controllers.dart';
import 'package:wifi_app/app/widgets/progress_indicator.dart';

class DownloadScreen extends StatelessWidget {
  final AppController _controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloading...')),
      body: Obx(() {
        if (_controller.isDownloading.value) {
          return Center(
            child: ProgressBar(progress: _controller.progress.value),
          );
        } else if (_controller.errorMessage.value.isNotEmpty) {
          return Center(
              child: Text('Error: ${_controller.errorMessage.value}'));
        } else {
          return Center(child: Text('Press Start to Download'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.downloadApk(context, '192.168.1.1', 'ARM64');
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
