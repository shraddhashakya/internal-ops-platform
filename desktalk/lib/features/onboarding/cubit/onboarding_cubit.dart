import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  final String _targetText = 'Welcome\nUSER-8848';

  void loadInitialData() {
    // Simulate loading
    emit(state.copyWith(isLoading: false));
    _startTypewriter();
  }

  void _startTypewriter() {
    const int totalDurationMs = 2000;
    final int charCount = _targetText.length;
    final int delayPerChar = totalDurationMs ~/ charCount;

    Timer.periodic(Duration(milliseconds: delayPerChar), (timer) {
      if (state.displayedText.length < charCount) {
        emit(state.copyWith(displayedText: state.displayedText + _targetText[state.displayedText.length]));
      } else {
        timer.cancel();
        _startButtonAnimations();
      }
    });
  }

  Future<void> _startButtonAnimations() async {
    emit(state.copyWith(showButton1: true));
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(showButton2: true));
  }
}
