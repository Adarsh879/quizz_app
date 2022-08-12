// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      mathsScore: json['mathsScore'] as int?,
      computerScienceScore: json['computerScienceScore'] as int?,
      generalKnowledgeScore: json['generalKnowledgeScore'] as int?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mathsScore', instance.mathsScore);
  writeNotNull('computerScienceScore', instance.computerScienceScore);
  writeNotNull('generalKnowledgeScore', instance.generalKnowledgeScore);
  return val;
}
