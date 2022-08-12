import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile extends Equatable {
  @JsonKey(includeIfNull: false)
  int? mathsScore;

  @JsonKey(includeIfNull: false)
  int? computerScienceScore;

  @JsonKey(includeIfNull: false)
  int? generalKnowledgeScore;

  UserProfile(
      {this.mathsScore, this.computerScienceScore, this.generalKnowledgeScore});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  String toString() {
    String message =
        'UserProfile->\nmathsScore: $mathsScore\ncomputerScienceScore: $computerScienceScore\ngeneralKnowledgeScore: $generalKnowledgeScore';
    return message;
  }

  @override
  List<Object?> get props =>
      [mathsScore, computerScienceScore, generalKnowledgeScore];
}
