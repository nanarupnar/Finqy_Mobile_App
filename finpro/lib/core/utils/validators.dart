class Validators {
  //  Mobile Number Validation
  static String? mobile(String? value) {
    if (value == null || value.isEmpty) return 'Enter Mobile Number';
    final reg = RegExp(r'^[6-9]\d{9}$');
    if (!reg.hasMatch(value)) return 'Invalid Mobile Number';
    return null;
  }

  //  PIN Validation
  static String? pin(String? value) {
    if (value == null || value.isEmpty) return 'Enter PIN';
    if (value.length < 4) return 'PIN must be 4 digits';
    return null;
  }
  static String? pinNew(String? value) {
    if (value == null || value.isEmpty) return 'Enter New PIN';
    if (value.length < 4) return 'PIN must be 4 digits';
    return null;
  }

  //  Email Validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Enter Email';
    final reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!reg.hasMatch(value)) return 'Invalid Email Address';
    return null;
  }
  //  OTP Validation (New)
  static String? otp(String? value) {
    if (value == null || value.isEmpty) return 'Please enter OTP';
    if (value.length != 6) return 'OTP must be 6 digits';
    return null;
  }
  //  Empty check
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required Field';
    return null;
  }
}
