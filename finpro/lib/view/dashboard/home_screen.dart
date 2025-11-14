import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final manageItems = [
    {"icon": Icons.pie_chart, "title": "Dashboards"},
    {"icon": Icons.group, "title": "Manage Teams"},
    {"icon": Icons.people_alt, "title": "Leads"},
    {"icon": Icons.credit_score, "title": "Test My Loan"},
    {"icon": Icons.policy, "title": "Test My Policy"},
    {"icon": Icons.credit_card, "title": "Test My Card"},
    {"icon": Icons.car_crash, "title": "Car Par Loan"},
    {"icon": Icons.manage_accounts, "title": "Personal Finance Manager"},
    {"icon": Icons.account_balance, "title": "My Loan Bhai"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //  Banner Slider (Replace later)
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Manage", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: manageItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1),
              itemBuilder: (context, index) {
                return _menuButton(
                  icon: manageItems[index]["icon"] as IconData,
                  title: manageItems[index]["title"] as String,
                );
              },
            ),

            const SizedBox(height: 20),

            const Text("Quick Links", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // ADD Quick Items similarly
          ],
        ),
      ),
    );
  }

  Widget _menuButton({required IconData icon, required String title}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: Colors.red),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
