import 'package:flutter/material.dart';

class Homepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo_yellow.png',
              fit: BoxFit.cover,
              height: 32,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.yellow,
                  Colors.yellow.withOpacity(0.5),
                  Colors.yellow.withOpacity(0.2),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: ListView(
              children: [
                const SizedBox(height: 20), // Add some space
                _buildGreetings(context),
                const SizedBox(height: 20), // Add some space
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildServiceSelection(),
                      const SizedBox(height: 20),
                      _buildBannerImage(),
                      const SizedBox(height: 10),
                      _buildPartnerStoreInfo(),
                      const SizedBox(
                          height: 20), // Add some space at the bottom
                      _buildFinancialPartnerSection(), // Add financial partner section
                      const SizedBox(
                        height: 20,
                      ), // Add some space between financial partner and news
                      _buildSeparator(), // Add separator
                      const SizedBox(
                        height: 20,
                      ), // Add some space between separator and news
                      _buildNewsSection(), // Add news section
                      const SizedBox(
                          height: 20), // Add some space between news and tips
                      _buildTipsSection(), // Add tips section
                      const SizedBox(
                          height: 20), // Add some space at the bottom
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreetings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, Abidin!",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
          ),
          const SizedBox(height: 10),
          Text(
            "Pilih layanan yang sesuai dengan kebutuhan",
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.black,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSelection() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildServiceCard(
            icon: Icons.auto_fix_high_outlined,
            label1: "Home",
            label2: "Maintenance",
          ),
          const SizedBox(width: 20),
          _buildServiceCard(
            icon: Icons.home_repair_service,
            label1: "Build And",
            label2: "Renovate",
          ),
          const SizedBox(width: 20),
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
    return Container(
      width: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              size: 80,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            label2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Color(0xFFFF6767)),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/Banner.jpg',
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
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Official Partner store',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Icon(Icons.arrow_forward_ios, size: 18), // Arrow icon
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Located in downtown',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImage('assets/Rectangle 12.jpg'),
                _buildImage('assets/Rectangle 13.jpg'),
                _buildImage('assets/Rectangle 14.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialPartnerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Financial Partner',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Icon(Icons.arrow_forward_ios, size: 18), // Arrow icon
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Solusi pembayaran untuk proyek Renovasi',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImage('assets/Rectangle 12.jpg'),
                _buildImage('assets/Rectangle 13.jpg'),
                _buildImage('assets/Rectangle 14.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Berita Terbaru",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        _buildNewsCard(
          title: 'Peresmian Gedung Baru di Jakarta',
          description:
              'Gedung baru dengan desain modern diresmikan oleh Gubernur DKI Jakarta.',
          image:
              'https://th.bing.com/th/id/OIP.sAOqb_4mv0rO8Er11ywCVQHaFj?w=188&h=180&c=7&r=0&o=5&pid=1.7',
        ),
        _buildNewsCard(
          title: 'Benerin dulu, Bayarnya',
          description: 'Benerin dulu, Bayarnya',
          image:
              'https://th.bing.com/th/id/OIP.JVK8RG21Bq03oTMwfMnQuAHaE7?w=267&h=180&c=7&r=0&o=5&pid=1.7',
        ),
        _buildNewsCard(
          title: 'Era sudah Digital...',
          description: 'Aplikasi tukang com jasa...',
          image:
              'https://th.bing.com/th/id/OIP.XGGCgibiy3UX2ampM8yCPwAAAA?w=256&h=180&c=7&r=0&o=5&pid=1.7',
        ),
      ],
    );
  }

  Widget _buildTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Tips Memilih Furniture",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200, // Set a fixed height for the container
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTipsCard(
                title: 'Sesuaikan dengan Ruangan',
                description:
                    'Pertimbangkan ukuran ruangan dan pilihlah furniture yang sesuai dengan ukuran tersebut.',
                image:
                    'https://th.bing.com/th/id/OIP.WudDyvRoOKs4ed6VAmUTyQHaEz?w=287&h=186&c=7&r=0&o=5&pid=1.7',
              ),
              _buildTipsCard(
                title: 'Pilih Material Berkualitas',
                description:
                    'Pastikan furniture terbuat dari material yang berkualitas agar tahan lama.',
                image:
                    'https://th.bing.com/th/id/OIP.-blrFeWtKdBHERzUx0qrDwHaEq?w=265&h=180&c=7&r=0&o=5&pid=1.7',
              ),
              _buildTipsCard(
                title: 'Perhatikan Desain',
                description:
                    'Pilih desain yang sesuai dengan gaya dekorasi ruangan Anda.',
                image:
                    'https://th.bing.com/th/id/OIP.RhLxx_rlei7-y93xZabK2wHaHa?w=170&h=180&c=7&r=0&o=5&pid=1.7',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTipsCard(
      {required String title,
      required String description,
      required String image}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(
      {required String title,
      required String description,
      required String image}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            image,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          // Handle onTap event
          print("Selected news: $title");
        },
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
          width: 150,
        ),
      ),
    );
  }
}
