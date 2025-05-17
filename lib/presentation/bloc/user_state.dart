part of 'user_bloc.dart';

/// Represents the state of user data in the application
class UserState {
  final User? user;
  final bool isLoading;
  final String? error;

  const UserState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  /// Creates a copy of the current state with optional parameter updates
  UserState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) =>
      UserState(
        user: user ?? this.user,
        isLoading: isLoading == true ? true : false,
        error: error,
      );
}
