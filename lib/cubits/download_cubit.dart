import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadCubit extends Cubit<double> {
  DownloadCubit() : super(0.0);

  void updateProgress(double progress) {
    emit(progress);
  }
}
