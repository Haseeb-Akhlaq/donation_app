class User {
  String userId;
  String userName;
  String email;
  String numberOfDonations;
  String numberOfMealsShared;
  String profilePic;

  User(
      {this.userId,
      this.userName,
      this.email,
      this.numberOfDonations,
      this.numberOfMealsShared,
      this.profilePic});

  User.fromMap(Map<dynamic, dynamic> map) {
    this.userId = map['messageId'] ?? '';
    this.userName = map['message'] ?? '';
    this.email = map['messageType'] ?? '';
    this.numberOfDonations = map['messageSenderId'] ?? '';
    this.numberOfMealsShared = map['userName'] ?? '';
    this.profilePic = '';
  }
}
