import 'package:flutter/material.dart';
import '../models/user_input.dart'; // Import your UserInput model

class UserInputsScreen extends StatelessWidget {
  final List<UserInput> userInputs;

  const UserInputsScreen(this.userInputs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Inputs'),
      ),
      body: ListView.builder(
        itemCount: userInputs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userInputs[index].data),
          );
        },
      ),
    );
  }
}
