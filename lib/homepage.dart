import 'package:flutter/material.dart';

class Homepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your App Title"),
        // Add any additional appbar configuration here
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetings(),
              _buildServiceSelection(),
              SizedBox(height: 20),
              _buildBannerImage(),
              SizedBox(height: 10),
              _buildPartnerStoreInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Hi, abidin",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            "Pilih layanan yang sesuai dengan kebutuhan",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSelection() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildServiceCard(
            icon: Icons.auto_fix_high_outlined,
            label1: "Home",
            label2: "Maintenance",
          ),
          SizedBox(width: 20),
          _buildServiceCard(
            icon: Icons.home_repair_service,
            label1: "Build And",
            label2: "Renovate",
          ),
          SizedBox(width: 20),
          _buildServiceCard(
            icon: Icons.design_services,
            label1: "Design",
            label2: "Inspiration",
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String label1,
    required String label2,
  }) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                icon,
                size: 80,
              ),
            ),
            SizedBox(height: 10),
            Text(
              label1,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              label2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/Banner.jpg', // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }

Widget _buildPartnerStoreInfo() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Official Partner Store',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward_ios, size: 18), // Arrow icon
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Located in downtown',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 10), // Space between text and list view
        SizedBox(
          height: 100, // Specify the height of each image
          child: ListView( // Wrapping with ListView
            scrollDirection: Axis.horizontal, // Make the list scroll horizontally
            children: [
              _buildImage('assets/image1.jpg'),
              _buildImage('assets/image2.jpg'),
              _buildImage('assets/image3.jpg'),
              // Add more images as needed
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildImage(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 150, // Adjust the width of each image
      ),
    ),
  );
}

}
