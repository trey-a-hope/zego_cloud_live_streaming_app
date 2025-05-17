import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_cloud_live_streaming_app/data/models/user.dart';
import 'package:zego_cloud_live_streaming_app/presentation/bloc/user_event.dart';

part 'user_state.dart';

/// Manages the state of the current user throughout the application
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<UpdateUser>(_onUpdateUser);
    on<ClearUser>(_onClearUser);
  }

  /// Handles the UpdateUser event by creating a new User instance
  void _onUpdateUser(UpdateUser event, Emitter<UserState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      final user = User(
        userID: event.userId,
        userName: event.userName,
      );
      emit(state.copyWith(
        user: user,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  /// Handles the ClearUser event by clearing the user data
  void _onClearUser(ClearUser event, Emitter<UserState> emit) {
    emit(state.copyWith(
      user: null,
      isLoading: false,
      error: null,
    ));
  }
}
