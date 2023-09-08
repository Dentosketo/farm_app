import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/user_inputs_screen.dart';
import 'screens/marketplace_screen.dart';
import 'screens/community_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Provide the ThemeProvider
      child: const FarmApp(),
    ),
  );
}

class FarmApp extends StatelessWidget {
  const FarmApp({Key? key}) : super(key: key); // Remove super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainScreen(),
      routes: {
  '/settings': (context) => const SettingsScreen(),
  '/user_inputs': (context) => const UserInputsScreen([]),
  '/dashboard': (context) => const DashboardScreen(userName: 'John'), // Remove 'const'
},

    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(userName: 'John'),
    const MarketplaceScreen(),
    CommunityScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
