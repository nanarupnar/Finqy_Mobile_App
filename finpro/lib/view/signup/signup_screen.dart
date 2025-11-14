import 'package:flutter/material.dart';

import '../../core/utils/validators.dart';
import '../widgets/common_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'otp_screen.dart';
//import 'otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Sign Up"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                controller: mobileController,
                label: 'Mobile Number',
                hint: 'Enter Mobile Number',
                keyboard: TextInputType.phone,
                validator: Validators.mobile,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Continue",
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OtpScreen(form:'Signup')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
