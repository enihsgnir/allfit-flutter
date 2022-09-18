import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? phone,
    required String address,
    required String wayToEnter,
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
