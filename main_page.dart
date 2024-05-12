import 'package:flutter/material.dart';

//Define the Livestock class here
class Livestock {
  final String name;
  final String imagePath;
  final double price;

  Livestock({required this.name, required this.imagePath, required this.price});
}

class MainPage extends StatelessWidget {
  final List<Livestock> featuredLivestocks = [
    Livestock(name: 'Featured Livestock 1', imagePath: 'lib/assets/chicken.png', price: 110.0),
    Livestock(name: 'Featured Livestock 2', imagePath: 'lib/assets/hog.png', price: 150.0),
    // Add more livestock items
  ];

  final List<Livestock> forYouLivestocks = [
    Livestock(name: 'For You Livestock 1', imagePath: 'lib/assets/pig.png', price: 120.0),
    Livestock(name: 'For You Livestock 2', imagePath: 'lib/assets/chicken.png', price: 140.0),
    // Add more livestock items
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: ListView(
        children: [
          _buildSection('Featured Livestocks', featuredLivestocks),
          _buildSection('For You', forYouLivestocks),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/home.png')), 
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/market.png')),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/profile.png')), 
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/money.png')), 
            label: 'Transactions',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/main_page');
              break;
            case 1:
              Navigator.pushNamed(context, '/market');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushNamed(context, '/transactions');
              break;
            default:
              Navigator.pushNamed(context, '/');
          }
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildSection(String title, List<Livestock> livestockList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: livestockList.length,
            itemBuilder: (context, index) {
              return _buildLivestockCard(livestockList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLivestockCard(Livestock livestock) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              livestock.imagePath,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                livestock.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${livestock.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}