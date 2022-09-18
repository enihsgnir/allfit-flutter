import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq.freezed.dart';
part 'faq.g.dart';

@freezed
class FAQ with _$FAQ {
  const factory FAQ({
    required String id,
    required String category,
    required String title,
    required String contents,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FAQ;

  factory FAQ.fromJson(Map<String, dynamic> json) => _$FAQFromJson(json);
}
