import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifi_app/services/api_services.dart';

class UserCubit extends Cubit<String?> {
  final ApiService apiService;

  UserCubit(this.apiService) : super(null);

  Future<void> sendProcessorType(String processorType) async {
    try {
      await apiService.sendProcessorType(processorType);
      emit(processorType);
    } catch (e) {
      print('Error sending processor type: $e');
    }
  }
}
