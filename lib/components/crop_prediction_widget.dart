import 'package:flutter/material.dart';

class CropPredictionWidget extends StatelessWidget {
  final String cropName;
  final String prediction;

  const CropPredictionWidget({Key? key, required this.cropName, required this.prediction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          const Text(
            'Crop Prediction',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            cropName,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            prediction,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
