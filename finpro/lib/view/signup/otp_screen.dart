import 'package:finpro/view/dashboard/main_tab_screen.dart';
import 'package:finpro/view/signup/signup_partner_form.dart';
import 'package:flutter/material.dart';
import '../../core/utils/navigationHelper.dart';
import '../../core/utils/validators.dart';
import '../widgets/common_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key,required this.form});

  String form;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CommonAppBar(title: "Verify OTP"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

                CustomTextField(
                  label: "OTP",
                  controller: otpController,
                  obscure: true,
                  keyboard: TextInputType.number,
                  hint: 'Enter OTP',
                  validator: Validators.otp,

                ),

              const SizedBox(height: 20),
              CustomButton(
                text: "Verify",
                onTap: () {
                  if(widget.form=="Signup")
                    {
                      NavigationHelper.push(
                        context,
                        SignupPartnerForm(                      // Example next screen
                        ),
                      );
                    }
                  else{
                     Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainTabScreen()),
                        (route) => false,
                  );
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
