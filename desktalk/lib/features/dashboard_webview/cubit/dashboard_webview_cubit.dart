import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_webview_state.dart';

class DashboardWebviewCubit extends Cubit<DashboardWebviewState> {
  DashboardWebviewCubit() : super(const DashboardWebviewState());

  void loadInitialData() {
    try {
      // Set the initial URL (you can make this dynamic later)
      emit(state.copyWith(isLoading: false, url: Uri.parse('http://10.0.2.2:4200/')));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
