import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String firstName;

  @HiveField(2)
  late String lastName;

  @HiveField(3)
  late String username;

  @HiveField(4)
  late String email;

  @HiveField(5)
  late String password;

  @HiveField(6)
  late String createdAt;

  @HiveField(7)
  late String updatedAt;
}
