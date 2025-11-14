import 'package:flutter/material.dart';
import '../models/kyc_model.dart';

enum PartnerType { individual, proprietorship, privateLimited, partnershipFirm, llp }

class KycViewModel extends ChangeNotifier {
  // Current step
  int currentStep = 0;

  // Models
  PersonalDetails personal = PersonalDetails();
  BankDetails bank = BankDetails();
  DocumentDetails documents = DocumentDetails();

  // Controllers (example subset)
  final panController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  // Step navigation
  void nextStep() {
    if (currentStep < 2) {
      currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }

  void reset() {
    currentStep = 0;
    notifyListeners();
  }

  Future<void> submitKyc() async {
    // Combine all model data and send to API
    // print or call service layer here
  }
}
