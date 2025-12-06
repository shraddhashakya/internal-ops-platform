import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final bool isLoading;
  final String displayedText;
  final bool showButton1;
  final bool showButton2;
  final String? error;

  const OnboardingState({this.isLoading = true, this.displayedText = '', this.showButton1 = false, this.showButton2 = false, this.error});

  OnboardingState copyWith({bool? isLoading, String? displayedText, bool? showButton1, bool? showButton2, String? error}) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      displayedText: displayedText ?? this.displayedText,
      showButton1: showButton1 ?? this.showButton1,
      showButton2: showButton2 ?? this.showButton2,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, displayedText, showButton1, showButton2, error];
}
