import 'package:flutter/material.dart';
import 'package:finpro/view/widgets/common_appbar.dart';
import 'package:finpro/view/widgets/custom_button.dart';
import 'package:finpro/view/widgets/custom_textfield.dart';

import '../../core/utils/validators.dart';
// import your Validators if needed

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  // Obscure toggle for PIN fields
  bool obscureNewPin = true;
  bool obscureConfirmPin = true;

  @override
  void dispose() {
    otpController.dispose();
    newPinController.dispose();
    confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Set Password"),
      body: Form(
        key:_formKey ,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                label: "OTP",
                controller: otpController,
                keyboard: TextInputType.number,
                hint: 'Enter OTP',
                validator: Validators.otp,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: "New PIN",
                controller: newPinController,
                obscure: obscureNewPin,
                keyboard: TextInputType.number,
                hint: 'Enter New PIN',
                suffixIcon: IconButton(
                  icon: Icon(
                      obscureNewPin ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      obscureNewPin = !obscureNewPin;
                    });
                  },
                ),
                validator: Validators.pinNew,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: "Confirm PIN",
                controller: confirmPinController,
                obscure: obscureConfirmPin,
                keyboard: TextInputType.number,
                hint: 'Re-enter PIN',
                suffixIcon: IconButton(
                  icon: Icon(obscureConfirmPin
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      obscureConfirmPin = !obscureConfirmPin;
                    });
                  },
                ),
                validator: Validators.pin,
              ),
              const SizedBox(height: 30),

              CustomButton(
                text: "Submit",
                onTap: () {
                  if (_formKey.currentState!.validate()) {   //  VALIDATION CHECK

                  }
                  // Handle submit logic here
                  final otp = otpController.text.trim();
                  final newPin = newPinController.text.trim();
                  final confirmPin = confirmPinController.text.trim();

                  if (newPin != confirmPin) {
                   /* ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("PINs do not match")),
                    );*/
                    return;
                  }

                  // Continue with your API call or logic
                  print("OTP: $otp, New PIN: $newPin");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
