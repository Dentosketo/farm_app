import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherWidget extends StatelessWidget {
  final int temperature;
  final String condition;

  const WeatherWidget({Key? key, required this.temperature, required this.condition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/weather/sunny.svg',
            width: 64,
            height: 64,
          ),
          const SizedBox(height: 16),
          const Text(
            'Today',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            '$temperature°F',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            'Weather: $condition',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
