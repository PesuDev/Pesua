class CourseArguments {
  final String title;

  CourseArguments(this.title);
}

class OtpArguments {
  final String phone;
  final int customerId;
  final String token;

  OtpArguments(this.phone, this.customerId, this.token);
}
