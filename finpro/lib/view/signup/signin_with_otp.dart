import 'package:finpro/view/signup/set_password_screen.dart';
import 'package:finpro/view/widgets/custom_button.dart';
import 'package:finpro/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../core/utils/navigationHelper.dart';
import '../../core/utils/validators.dart';
import '../widgets/common_appbar.dart';
import 'otp_screen.dart';

class SigninWithOtp extends StatefulWidget {
  const SigninWithOtp({super.key});

  @override
  State<SigninWithOtp> createState() => _SigninWithOtpState();
}

class _SigninWithOtpState extends State<SigninWithOtp> {
  final _formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Sign OTP"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: mobileController,
                  label: 'Mobile Number',
                  hint: 'Enter Mobile Number',
                  keyboard: TextInputType.phone,
                  validator: Validators.mobile,   // ✅ Common validation used
                ),
        
                const SizedBox(height: 20),
        
                CustomButton(
                  text: "Get OTP",
                  onTap: () {
                    if (_formKey.currentState!.validate())
                    {  //  form validation check
                      NavigationHelper.push(
                        context,
                        OtpScreen(form: 'login',                      // Example next screen
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
