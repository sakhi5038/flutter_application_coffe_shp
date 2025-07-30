import 'package:flutter/material.dart';

class CoffeeHomePage extends StatelessWidget {
  final Color backgroundColor = const Color(0xFFF5EFE7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top bar
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Icon(Icons.shopping_bag_outlined, color: Colors.brown),
                ],
              ),

              SizedBox(height: 20),

              /// Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search here",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 20),

              /// Category chips
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildChip("Recommended", true),
                    _buildChip("Arabika", false),
                    _buildChip("Beans", false),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Coffee cards list
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCoffeeCard(
                      image: Image.asset('assets/images/coffee_cappu.jpg'),
                      name: "Cappuccino",
                      price: "\$3.45",
                      description:
                          "A cappuccino is prepared with equal parts double espresso...",
                      isFavorite: true,
                    ),
                    _buildCoffeeCard(
                      image: Image.asset('assets/images/coffee_espresso.jpg'),
                      name: "Flat White",
                      price: "\$6.50",
                      description:
                          "Espresso-based drink accompanied by steamed milk...",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              /// Popular coffees
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Coffees 🔥",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("View All", style: TextStyle(color: Colors.orange)),
                ],
              ),

              SizedBox(height: 12),

              /// Frappuccino card
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey[300], // placeholder for image
                    ),
                    SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Frappuccino",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            "It’s a line of iced, blended coffee drink.",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text("4.5 (1,256)",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper method for category chips
  Widget _buildChip(String label, bool isActive) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        labelStyle: TextStyle(
            color: isActive ? Colors.white : Colors.black, fontSize: 13),
        backgroundColor: isActive ? Colors.orange : Colors.grey.shade200,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  /// Helper method for coffee card
  Widget _buildCoffeeCard({
    required Image image,
    required String name,
    required String price,
    required String description,
    bool isFavorite = false,
  }) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Placeholder for image
          Center(
            child: Container(
              height: 60,
              width: 60,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 12),

          /// Title & favorite icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 16,
                color: Colors.red,
              ),
            ],
          ),

          SizedBox(height: 6),

          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 10),

          /// Price & add icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.orange)),
              Container(
                decoration:
                    BoxDecoration(color: Colors.brown, shape: BoxShape.circle),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
