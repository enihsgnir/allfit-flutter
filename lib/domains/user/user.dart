import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String authUid,
    required String email,
    required String nickname,
    String? phone,
    required List<Address> addresses,
    required int mainAddressIndex,
    required String wayToEnter,
    required AlterService service,
    required bool commercialAgreement,
    required DateTime createdAt,
    DateTime? deletedAt,
  }) = _User;

  const User._();

  String get mainAddress => addresses[mainAddressIndex].toFormatted();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  static const homeKo = "집";
  static const workKo = "회사";

  const factory Address({
    String? alias,
    required String postCode,
    required String roadAddress,
    required String detailAddress,
  }) = _Address;

  const Address._();

  bool get isHome => alias == homeKo;
  bool get isWork => alias == workKo;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  String toFormatted() {
    return "$roadAddress, $detailAddress";
  }
}

@freezed
class AlterService with _$AlterService {
  const factory AlterService({
    required String category,
    required DateTime createdAt,
    required String status,
    required String cost,
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
    return user.nickname;
  }
}
