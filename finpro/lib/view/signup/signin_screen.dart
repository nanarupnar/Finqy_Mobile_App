import 'package:finpro/view/signup/otp_screen.dart';
import 'package:finpro/view/signup/signin_with_otp.dart';
import 'package:finpro/view/signup/signup_screen.dart';
import 'package:finpro/view/widgets/custom_button.dart';
import 'package:finpro/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../core/utils/navigationHelper.dart';
import '../../core/utils/validators.dart';
import '../widgets/common_appbar.dart';
import 'forgot_pin_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final mobileController = TextEditingController();
  final pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Sign In",showBack: false,),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: mobileController,
                    label: 'Mobile Number',
                    hint: 'Enter Mobile Number',
                    keyboard: TextInputType.phone,

                    validator: Validators.mobile,
                  ),
                  const SizedBox(height: 20),
          
                  CustomTextField(
                    label: "PIN",
                    controller: pinController,
                    obscure: true,
                    keyboard: TextInputType.number,
                    hint: 'Enter',
                    suffixIcon: IconButton(
                      icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    validator: Validators.pin,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "Sign In",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {   //  VALIDATION CHECK
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignupScreen()),
                        );
                      }
                    },
                  ),
          
                  const SizedBox(height: 15),
          
                  Center(
                    child: TextButton(
                      onPressed: () {
                        NavigationHelper.push(
                          context,
                          ForgotPinScreen(                      // Example next screen
                            //   mobile: mobileController.text,
                          ),
                        );
                      },
                      child: const Text("Forgot PIN?"),
                    ),
                  ),
          
                  Center(
                    child: TextButton(
                      onPressed: () {
                        NavigationHelper.push(
                          context,
                          SigninWithOtp(                      // Example next screen
                          ),
                        );

                      },
                      child: const Text("Sign in using OTP"),
                    ),
                  ),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        NavigationHelper.push(
                          context,
                          SignupScreen(                      // Example next screen
                          ),
                        );
                        /*   NavigationHelper.push(
                          context,
                          KycScreen(partnerType: PartnerType.individual),
                        );*/
                      },
                      child: const Text("Create an Account"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
