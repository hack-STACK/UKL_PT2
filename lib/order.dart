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
            Image.network(order.imageUrl),
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

  const OrderListItem({Key? key, required this.order, required this.onTap}) : super(key: key);

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

  Order({
    required this.contactName,
    required this.status,
    required this.date,
    required this.unreadCount,
    required this.imageUrl,
  });
}

List<Order> orders = [
  Order(
    contactName: 'John Doe',
    status: 'Halo, apa kabar?',
    date: '10:00',
    unreadCount: 2,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Order(
    contactName: 'Jane Doe',
    status: 'Pesanan sudah diproses',
    date: '09:30',
    unreadCount: 0,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Order(
    contactName: 'Alice Smith',
    status: 'Ok, terima kasih',
    date: 'Yesterday',
    unreadCount: 0,
    imageUrl: 'https://via.placeholder.com/150',
  ),
];
