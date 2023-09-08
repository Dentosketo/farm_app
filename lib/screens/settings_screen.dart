import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const SettingsList(),
    );
  }
}

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Privacy Policy'),
          onTap: () {
            // Add navigation logic here
          },
        ),
        ListTile(
          title: const Text('Terms of Use'),
          onTap: () {
            // Add navigation logic here
          },
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: false, // Replace with your dark mode logic
          onChanged: (bool newValue) {
            // Add dark mode toggle logic here
          },
        ),
        ListTile(
          title: const Text('Delete Account'),
          onTap: () {
            // Add delete account logic here
            // This action will permanently delete the user's account
          },
        ),
        // Add more settings options as needed
      ],
    );
  }
}
