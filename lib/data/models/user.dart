class User {
  final String userID;
  final String userName;

  const User({required this.userID, required this.userName});

  // Named constructor for creating an empty user
  const User.empty()
      : userID = '',
        userName = '';
}
