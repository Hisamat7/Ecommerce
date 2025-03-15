class UserProfile {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String locationName;
  final String profileImg;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.locationName,
    required this.profileImg,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      locationName: json['location_name'] ?? '',
      profileImg: json['profile_img'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'mobile_number': mobileNumber,
      'location_name': locationName,
      'profile_img': profileImg,
    };
  }
}
