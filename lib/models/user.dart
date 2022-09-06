import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum Gender {
  male,
  female,
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? phone,
    Gender? gender,
    String? address,
    required DateTime createdAt,
    DateTime? deletedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
