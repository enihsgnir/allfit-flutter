import 'package:freezed_annotation/freezed_annotation.dart';

part 'inquiry.freezed.dart';
part 'inquiry.g.dart';

@freezed
class Inquiry with _$Inquiry {
  const factory Inquiry({
    required String id,
    required String nickname,
    required String email,
    required String title,
    required String contents,
    required bool isReplyAllowed,
    required DateTime createdAt,
    DateTime? deletedAt,
  }) = _Inquiry;

  factory Inquiry.fromJson(Map<String, dynamic> json) =>
      _$InquiryFromJson(json);
}
