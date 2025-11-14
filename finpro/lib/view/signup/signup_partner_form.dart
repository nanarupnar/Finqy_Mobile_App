import 'package:finpro/view/dashboard/main_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/navigationHelper.dart';
import '../../core/utils/validators.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_checkbox_row.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'otp_screen.dart';
//import 'otp_screen.dart';

class SignupPartnerForm extends StatefulWidget {
  const SignupPartnerForm({super.key});

  @override
  State<SignupPartnerForm> createState() => _SignupPartnerFormState();
}

class _SignupPartnerFormState extends State<SignupPartnerForm> {
  final  firstNameController = TextEditingController();
  final  lastNameController = TextEditingController();
  bool keepMeSignedIn = false;
  String? termsError;
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
                controller: firstNameController,
                label: "First Name",
                hint: "Ente r your first name",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter First Name' : null,
                keyboard: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
              ),
              CustomTextField(
                controller: lastNameController,
                label: "Last Name",
                hint: "Enter your last name",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter Last Name' : null,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
              ),

              CommonCheckBoxRow(
                isChecked: keepMeSignedIn,
                onChanged: (val) {
                  setState(() {
                    keepMeSignedIn = val!;
                    if (keepMeSignedIn) termsError = null;
                  });
                },
                labelType: "1", // or "2"
                errorText: termsError,
              ),
              const SizedBox(height: 20),

              CustomButton(
                text: "Next",
                onTap: ()
                {
                  NavigationHelper.push(
                    context,
                    MainTabScreen(                      // Example next screen
                    ),
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
