import './user_data.dart';

class User{
    final int id;
    final String name;
    final String profileName;
    final UserData userData;

    User(this.id, this.name, this.profileName, this.userData);
}