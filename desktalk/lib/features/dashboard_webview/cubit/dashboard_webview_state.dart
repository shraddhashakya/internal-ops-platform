import 'package:equatable/equatable.dart';

class DashboardWebviewState extends Equatable {
  final bool isLoading;
  final String? error;
  final Uri? url;

  const DashboardWebviewState({this.isLoading = true, this.error, this.url});

  DashboardWebviewState copyWith({bool? isLoading, String? error, Uri? url}) {
    return DashboardWebviewState(isLoading: isLoading ?? this.isLoading, error: error ?? this.error, url: url ?? this.url);
  }

  @override
  List<Object?> get props => [isLoading, error, url];
}
