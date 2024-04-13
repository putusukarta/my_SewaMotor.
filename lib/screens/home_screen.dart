import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sewa Motor'),
        centerTitle: true, // Title di tengah
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 32, // Ukuran teks lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Warna teks berubah menjadi biru
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            _buildMotorCard(
              context,
              'Honda Vario',
              'Rp 50.000/hari',
              'assets/images/icon5_flutter.png',
              'https://wa.me/6287851213365',
            ),
            SizedBox(height: 20),
            _buildMotorCard(
              context,
              'Yamaha NMAX',
              'Rp 70.000/hari',
              'assets/images/icon4_flutter.png',
              'https://wa.me/6287851213365',
            ),
            SizedBox(height: 20),
            _buildMotorCard(
              context,
              'Honda Beat',
              'Rp 60.000/hari',
              'assets/images/icon6_flutter.png',
              'https://wa.me/6287851213365',
            ),
            // Add more motor cards here
          ],
        ),
      ),
    );
  }

  Widget _buildMotorCard(BuildContext context, String brand, String price, String image, String whatsappLink) {
    return GestureDetector(
      onTap: () {
        // Add action to navigate or do something when the card is tapped
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand,
                    style: TextStyle(
                      fontSize: 24, // Ukuran teks merek lebih besar
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Harga Sewa: $price',
                    style: TextStyle(
                      fontSize: 18, // Ukuran teks harga sedikit lebih besar
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Theme.of(context).primaryColor,
              child: GestureDetector(
                onTap: () {
                  _launchWhatsApp(whatsappLink);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      color: Colors.white, // Warna ikon putih
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Hubungi via WhatsApp',
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchWhatsApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}