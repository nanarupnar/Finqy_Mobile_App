import 'package:flutter/material.dart';
//import '../screens/add_lead/step1_applicant_screen.dart';

class FabMenu extends StatefulWidget {
  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isOpen) ...[
          _fabItem("Add Lead", Icons.person_add, () {
           /* Navigator.push(context, MaterialPageRoute(
                builder: (_) => const Step1ApplicantScreen()));*/
          }),
          _fabItem("Quick Lead", Icons.flash_on, () {}),
          _fabItem("Link Share", Icons.link, () {}),
        ],
        FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () => setState(() => isOpen = !isOpen),
          child: Icon(isOpen ? Icons.close : Icons.add),
        ),
      ],
    );
  }

  Widget _fabItem(String text, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: onTap,
        label: Text(text),
        icon: Icon(icon),
      ),
    );
  }
}
