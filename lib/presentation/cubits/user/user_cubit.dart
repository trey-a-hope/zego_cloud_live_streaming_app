import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clerk_auth/src/models/client/user.dart';

class UserCubit extends Cubit<User?> {
  UserCubit() : super(null);

  void saveUser(User user) => emit(user);

  void clearUser() => emit(null);
}
