import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class DashboardScreen extends StatelessWidget {
  final String userName;

  const DashboardScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Good morning, $userName'),
              accountEmail: const Text('johndoe@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Implement logout logic here
              },
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Crops',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Enhanced Weather Widget
            WeatherWidget(
              temperature: 75,
              condition: 'Sunny',
            ),

            SizedBox(height: 20),

            // Crop Recommendations
            CropRecommendationWidget(
              cropName: 'Corn',
              recommendation: 'Corn does best with warm, sunny growing weather.',
            ),

            SizedBox(height: 20),

            // Enhanced Pie Chart
            PieChartWidget(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

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

class CropRecommendationWidget extends StatelessWidget {
  final String cropName;
  final String recommendation;

  const CropRecommendationWidget({Key? key, required this.cropName, required this.recommendation})
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
            'Crop Recommendation',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            cropName,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            recommendation,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: PieChart(
        PieChartData(
          sections: generateRandomData(),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  List<PieChartSectionData> generateRandomData() {
    const int totalSections = 5;
    const double totalValue = 100.0;

    final Random rnd = Random();
    final List<double> sectionValues = [];

    for (int i = 0; i < totalSections; i++) {
      if (i == totalSections - 1) {
        sectionValues.add(totalValue - sectionValues.reduce((a, b) => a + b));
      } else {
        double value = rnd.nextDouble() * (totalValue / totalSections);
        sectionValues.add(value);
      }
    }

    final List<PieChartSectionData> sections = sectionValues.map((value) {
      final Color color = Color.fromRGBO(rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256), 1);

      return PieChartSectionData(
        color: color,
        value: value,
        title: '${value.toStringAsFixed(2)}%',
        radius: 60,
      );
    }).toList();

    return sections;
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Farm App',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: const DashboardScreen(userName: 'John'),
  ));
}
