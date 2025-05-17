import 'package:equatable/equatable.dart';

/// Base class for all user-related events
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

/// Event to update the current user's information
class UpdateUser extends UserEvent {
  final String userId;
  final String userName;

  const UpdateUser({required this.userId, required this.userName});

  @override
  List<Object?> get props => [userId, userName];
}

/// Event to clear the current user's information
class ClearUser extends UserEvent {}
