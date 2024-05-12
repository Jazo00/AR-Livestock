import 'package:flutter/material.dart';
import 'livestock_model.dart'; 

class MarketPage extends StatefulWidget {
  
  @override
  _MarketPageState createState() => _MarketPageState();
}

//use sqlite/MySQL 
class _MarketPageState extends State<MarketPage> {
  List<Livestock> livestockList = [ //add to database
    Livestock(category: 'Pigs', age: 2, sex: 'Female', breed: 'White Pig', price: 20000, imagePath: 'lib/assets/pig.png'),
    Livestock(category: 'Pigs', age: 4, sex: 'Male', breed: 'White Pig', price: 10000, imagePath: 'lib/assets/pig.png'),
    Livestock(category: 'Pigs', age: 8, sex: 'Male', breed: 'White Pig', price: 30000, imagePath:'lib/assets/pig.png'),
    Livestock(category: 'Hogs', age: 2, sex: 'Female', breed: 'Hog rider', price: 40000, imagePath:'lib/assets/hog.png'),
    Livestock(category: 'Hogs', age: 4, sex: 'Male', breed: 'Hog rider', price: 10000, imagePath:'lib/assets/hog.png'),
    Livestock(category: 'Hogs', age: 8, sex: 'Male', breed: 'Hog rider', price: 30000, imagePath:'lib/assets/hog.png'),
    Livestock(category: 'Chicken', age: 4, sex: 'Female', breed: 'Orpington', price: 2000, imagePath:'lib/assets/chicken.png'),
    Livestock(category: 'Chicken', age: 8, sex: 'Male', breed: 'Orpington', price: 10000, imagePath:'lib/assets/chicken.png'),
    Livestock(category: 'Chicken', age: 2, sex: 'Male', breed: 'Orpington', price: 1000, imagePath:'lib/assets/chicken.png' ),
    //Add lang livestocks dito
  ];

  List<Seller> sellerList = [ //add to database
    Seller(name: 'John', location: 'Taguig', dateListed: '2024-05-06'),
    Seller(name: 'Justin', location: 'Taguig', dateListed: '2024-05-06'),
    Seller(name: 'Samuel', location: 'Taguig', dateListed: '2024-05-06'),
    Seller(name: 'Kristian', location: 'Manila', dateListed: '2024-05-06'),
    Seller(name: 'Rhodley', location: 'Manila', dateListed: '2024-05-06'),
    Seller(name: 'Camposano', location: 'Manila', dateListed: '2024-05-06'),
    Seller(name: 'James', location: 'Cavite', dateListed: '2024-05-06'),
    Seller(name: 'Seth', location: 'Cavite', dateListed: '2024-05-06'),
    Seller(name: 'Doe', location: 'Cavite', dateListed: '2024-05-06'),
    //Add lang sellers dito
  ];
  //Filter section para sa category (age, sex, breed)
  String selectedCategory = 'All';
  String selectedAge = 'All';
  String selectedSex = 'All';
  String selectedBreed = 'All';

  //Define lists of options for categories, age, sex, and breed
  List<String> categories = ['All','Pigs', 'Hogs', 'Chicken'];
  List<String> ages = ['All', '0-1', '1-3', '4-8']; // Example age ranges
  List<String> sexes = ['All','Male', 'Female'];
  List<String> breeds = ['All', 'White Pig', 'Hog rider', 'Orpington']; // Example breeds

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Page'),
        actions: [
          // Dropdown for category
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Dropdown for age
          DropdownButton<String>(
            value: selectedAge,
            onChanged: (String? newValue) {
              setState(() {
                selectedAge = newValue!;
              });
            },
            items: ages.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Dropdown for sex
          DropdownButton<String>(
            value: selectedSex,
            onChanged: (String? newValue) {
              setState(() {
                selectedSex = newValue!;
              });
            },
            items: sexes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Dropdown for breed
          DropdownButton<String>(
            value: selectedBreed,
            onChanged: (String? newValue) {
              setState(() {
                selectedBreed = newValue!;
              });
            },
            items: breeds.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
          ),
          itemCount: livestockList.length,
          itemBuilder: (BuildContext context, int index) {
            // Return livestock card based on filters
            return livestockList[index].category == selectedCategory ||
                  selectedCategory == 'All' ? LivestockCard(livestock: livestockList[index]) : Container();
              },
            ),
          ),
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
        currentIndex: 1,
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
}

class LivestockCard extends StatelessWidget {
  final Livestock livestock;

  LivestockCard({required this.livestock});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LivestockDetailsPage(livestock: livestock, seller: null),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              './${livestock.imagePath}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text('Age: ${livestock.age}'),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text('Sex: ${livestock.sex}'),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text('Price: ₱${livestock.price.toStringAsFixed(2)}'),
            ),
          ],
        ),
      ),
    );
  }
}

class LivestockDetailsPage extends StatelessWidget {
  final Livestock livestock;
  final Seller? seller;

  LivestockDetailsPage({required this.livestock, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestock Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Age: ${livestock.age}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Sex: ${livestock.sex}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Price: ₱${livestock.price.toStringAsFixed(2)}'),
          ),
          const Divider(),
          //Seller details
          if(seller != null) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Seller Name: ${seller!.name}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Location: ${seller!.location}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Date Listed: ${seller!.dateListed}'),
            ),
          ],
        ],
      ),
    );
  }
}
