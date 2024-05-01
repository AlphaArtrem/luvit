import 'package:equatable/equatable.dart';

///Data model for user profiles
class UserProfileData extends Equatable {
  ///Constructor for [UserProfileData]
  const UserProfileData({
    required this.images,
    required this.name,
    required this.description,
    required this.likeCount,
    required this.location,
    required this.age,
    required this.tags,
  });

  ///Factory constructor to parse [json] form Realtime Database
  ///to [UserProfileData]
  factory UserProfileData.fromJson(Map<String, dynamic> json) {
    return UserProfileData(
      images: json['images'] != null && json['images'] is List
          ? (json['images'] as List).cast<String>()
          : [],
      name: json['name'] != null && json['name'] is String
          ? json['name'] as String
          : '',
      description: json['description'] != null && json['description'] is String
          ? json['description'] as String
          : '',
      likeCount: int.tryParse(json['likeCount'].toString()) ?? 0,
      location: json['location'] != null && json['location'] is String
          ? json['location'] as String
          : '',
      age: int.tryParse(json['age'].toString()) ?? 0,
      tags: json['tags'] != null && json['tags'] is List
          ? (json['tags'] as List).cast<String>()
          : [],
    );
  }

  ///User profile images
  final List<String> images;

  ///User display name
  final String name;

  ///User description
  final String description;

  ///User likeCount
  final int likeCount;

  ///User location
  final String location;

  ///User age
  final int age;

  ///User tags
  final List<String> tags;

  ///Convert [UserProfileData] to [Map]
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    map['name'] = name;
    map['description'] = description;
    map['likeCount'] = likeCount;
    map['location'] = location;
    map['age'] = age;
    map['tags'] = tags;
    return map;
  }

  @override
  List<Object?> get props => [
        images,
        name,
        description,
        likeCount,
        location,
        age,
        tags,
      ];
}
