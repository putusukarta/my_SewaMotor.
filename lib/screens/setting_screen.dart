import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _buildRecommendationSection(),
            SizedBox(height: 20),
            _buildMotorList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi Motor',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Warna teks biru
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Temukan motor terbaik untuk perjalanan Anda',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey, // Warna teks abu-abu
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMotorList() {
    return Column(
      children: [
        _buildMotorItem(
          'assets/images/icon5_flutter.png',
          'Honda Vario',
          'Rp 50.000',
          '150 CC',
        ),
        _buildMotorItem(
          'assets/images/icon4_flutter.png',
          'Yamaha NMAX',
          'Rp 70.000',
          '155 CC',
        ),
        _buildMotorItem(
          'assets/images/icon6_flutter.png',
          'Honda Beat',
          'Rp 60.000',
          '125 CC',
        ),
      ],
    );
  }

  Widget _buildMotorItem(String imagePath, String motorName, String rentalPrice, String cc) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    motorName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    rentalPrice,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue, // Warna teks biru
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'CC: $cc',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Warna teks abu-abu
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
