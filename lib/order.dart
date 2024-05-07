import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavPage(),
    );
  }
}

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    OrdersPage(),
    HelpPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homepage',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Homepage"),
    );
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderListItem(
            order: order,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailPage(order: order),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OrderDetailPage extends StatelessWidget {
  final Order order;

  const OrderDetailPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan ${order.contactName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: ${order.contactName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${order.status}',
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal: ${order.date}',
            ),
            SizedBox(height: 10),
            Image.network(order.pesanan),
          ],
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Bantuan"),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Akun"),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const OrderListItem({Key? key, required this.order, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(order.imageUrl),
      ),
      title: Text(order.contactName),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              order.status,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(order.date),
        ],
      ),
      trailing: order.unreadCount > 0
          ? CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12,
              child: Text(
                order.unreadCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
            )
          : SizedBox(width: 24),
      onTap: onTap,
    );
  }
}

class Order {
  final String contactName;
  final String status;
  final String date;
  final int unreadCount;
  final String imageUrl;
  final String pesanan;

  Order(
      {required this.contactName,
      required this.status,
      required this.date,
      required this.unreadCount,
      required this.imageUrl,
      required this.pesanan});
}

List<Order> orders = [
  Order(
      contactName: 'Mas Amba',
      status: 'Paket dijalan',
      date: '10:00',
      unreadCount: 2,
      imageUrl:
          'https://th.bing.com/th/id/OIP.d8d93S6N06f7soEyASujvgHaEK?w=291&h=180&c=7&r=0&o=5&pid=1.7',
      pesanan:
          'https://th.bing.com/th/id/OIP.23PDSE_6iKWch4r9O8YybAHaHa?w=196&h=197&c=7&r=0&o=5&pid=1.7'),
  Order(
      contactName: 'Mas roni',
      status: 'Pesanan sudah diproses',
      date: '09:30',
      unreadCount: 0,
      imageUrl:
          'https://th.bing.com/th/id/OIP.VQcbubSTfjvLzc3mNc557AHaGK?w=197&h=180&c=7&r=0&o=5&pid=1.7',
      pesanan:
          'https://th.bing.com/th/id/OIP.PkjYh11PN2ClteM-alVizgHaEp?w=313&h=197&c=7&r=0&o=5&pid=1.7'),
  Order(
      contactName: 'Imroni',
      status: 'Menunggu konfirmasi',
      date: 'Yesterday',
      unreadCount: 0,
      imageUrl:
          'https://th.bing.com/th/id/OIP.nLTaQHTV7lfW0u0shGrhuwAAAA?w=115&h=180&c=7&r=0&o=5&pid=1.7',
      pesanan:
          'https://th.bing.com/th/id/OIP.YKnJRVUtX4vUYqoabQzSQQHaEe?w=289&h=180&c=7&r=0&o=5&pid=1.7'),
];
