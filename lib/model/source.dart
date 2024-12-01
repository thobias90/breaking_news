import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  final String? id; // ID can be nullable.
  final String name; // Name should be non-nullable (always required).

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
