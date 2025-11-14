import 'package:flutter/material.dart';
import '../widgets/common_appbar.dart';
import 'home_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens =  [
    HomeScreen(),       // 0 - Home
    HomeScreen(),       // 1 - Add Lead
    HomeScreen(),       // 2 - Wallet Team
    HomeScreen(),       // 3 - And Connector
  ];

  final List<String> _titles = [
    "Finqy",            // 0
    "Add Lead",         // 1
    "Wallet Team",      // 2
    "And Connector",    // 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: _titles[_selectedIndex],
        showBack: false,
        leading: IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () {
            print("Profile tapped");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              print("Menu tapped");
            },
          ),
        ],
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Add Lead"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: "Wallet Team"),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: "And Connector"),
        ],
      ),
    );
  }


}
