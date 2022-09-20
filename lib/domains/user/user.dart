import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String authUid,
    required String email,
    String? name,
    String? phone,
    String? address,
    String? wayToEnter,
    required AlterService service,
    required bool commercialAgreement,
    required DateTime createdAt,
    DateTime? deletedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AlterService with _$AlterService {
  const factory AlterService({
    required String category,
    required DateTime createdAt,
    required String status,
    DateTime? deletedAt,
  }) = _AlterService;

  factory AlterService.fromJson(Map<String, dynamic> json) =>
      _$AlterServiceFromJson(json);
}

extension UserExtension on User? {
  String get username {
    final user = this;
    if (user == null) {
      return "(알 수 없음)";
    }

    final name = user.name;
    if (name != null) {
      return name;
    }

    final email = user.email;
    return email.split("@")[0];
  }
}
