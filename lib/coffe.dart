import 'package:flutter/material.dart';

class MyCoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E9E1),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Enjoy your\n',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'morning Coffee\u2615\ufe0f',
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.notifications_none),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search place',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.tune, color: Colors.white),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChip(label: Text('Nature'), onSelected: (_) {}),
                FilterChip(label: Text('Classic'), onSelected: (_) {}),
                FilterChip(label: Text('Deluxe'), onSelected: (_) {}),
              ],
            ),
            SizedBox(height: 20),
            Text('Nearby Place', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CafeCard(title: 'The Alleyway Café', location: 'Denpasar, Bali', rating: 4.9),
                  CafeCard(title: 'Limestone', location: 'Gianyar, Bali', rating: 4.8),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Special for you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://example.com/hardrock.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Hard Rock Café'),
              subtitle: Text('4.8 ★ / 1208 reviews'),
              trailing: Text('1.46 km'),
            )
          ],
        ),
      ),
    );
  }
}

class CafeCard extends StatelessWidget {
  final String title, location;
  final double rating;

  const CafeCard({required this.title, required this.location, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                'https://example.com/cafe.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('★ $rating / reviews', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
