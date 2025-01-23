part of 'app_controllers.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppDeviceInfoSent extends AppState {}

class AppDownloading extends AppState {
  final int progress;
  AppDownloading(this.progress);
}

class AppDownloadComplete extends AppState {}

class AppError extends AppState {
  final String message;
  AppError(this.message);
}
