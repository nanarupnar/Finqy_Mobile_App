import 'package:flutter/material.dart';
import '../../helpers/form_helper.dart';
import '../../viewmodels/kyc_viewmodel.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/common_appbar.dart';

class KycScreen extends StatefulWidget {
  final PartnerType partnerType;
  const KycScreen({super.key, required this.partnerType});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final _formKey = GlobalKey<FormState>();
  final viewModel = KycViewModel();
  final Map<String, TextEditingController> _controllers = {};

  @override
  Widget build(BuildContext context) {
    final config = getKycFieldConfig(widget.partnerType);

    return Scaffold(
      appBar: CommonAppBar(title: 'KYC Registration'),
      body: SafeArea(
        child: Column(
          children: [
            // Expanded to prevent layout overflow
            Expanded(
              child: Form(
                key: _formKey,
                child: Stepper(
                  type: StepperType.vertical,
                  currentStep: viewModel.currentStep,
                  physics: const AlwaysScrollableScrollPhysics(),

                  onStepContinue: () {
                    if (_formKey.currentState!.validate()) {
                      if (viewModel.currentStep < 2) {
                        setState(() => viewModel.nextStep());
                      } else {
                        viewModel.submitKyc();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('KYC Submitted Successfully')),
                        );
                      }
                    }
                  },
                  onStepCancel: () {
                    if (viewModel.currentStep > 0) {
                      setState(() => viewModel.previousStep());
                    }
                  },

                  controlsBuilder: (context, details) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (viewModel.currentStep > 0)
                            OutlinedButton(
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                            ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(viewModel.currentStep == 2
                                ? 'Submit'
                                : 'Next'),
                          ),
                        ],
                      ),
                    );
                  },

                  steps: [
                    Step(
                      title: const Text('Personal'),
                      isActive: viewModel.currentStep >= 0,
                      state: viewModel.currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                      content: buildDynamicFields(config['personal']),
                    ),
                    Step(
                      title: const Text('Bank & KYC'),
                      isActive: viewModel.currentStep >= 1,
                      state: viewModel.currentStep > 1
                          ? StepState.complete
                          : StepState.indexed,
                      content: buildDynamicFields(config['bank']),
                    ),
                    Step(
                      title: const Text('Documents'),
                      isActive: viewModel.currentStep >= 2,
                      state: viewModel.currentStep == 2
                          ? StepState.editing
                          : StepState.indexed,
                      content: buildDynamicFields(config['documents']),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds dynamic KYC input fields
  Widget buildDynamicFields(List<String> fields) {
    return Column(
      children: fields.map((field) {
        _controllers.putIfAbsent(field, () => TextEditingController());
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomTextField(
            label: field,
            hint: 'Enter $field',
            controller: _controllers[field]!,
            validator: (value) =>
            (value == null || value.isEmpty) ? '$field is required' : null,
          ),
        );
      }).toList(),
    );
  }
}
