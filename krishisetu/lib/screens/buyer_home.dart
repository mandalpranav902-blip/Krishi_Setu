import 'package:flutter/material.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';
import 'package:krishisetu/services/user_data.dart';

class BuyerHome extends StatefulWidget {
  const BuyerHome({super.key});

  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  int selectedIndex = 0;

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F2),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Top
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Good morning 👋",

                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.pink,
                            ),

                            Text(
                              UserData.village.isEmpty
                                  ? "Location"
                                  : UserData.village,

                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey.shade200,

                    child: const Text("🛒", style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Search
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(color: Colors.grey.shade300),
                ),

                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.blue),

                    const SizedBox(width: 10),

                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Search crops, farmer",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const Text("🎤"),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Categories",

                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Categories
              SizedBox(
                height: 110,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    categoryCard("🥦", "Veggies", const Color(0xFFDDEBD9)),

                    categoryCard("🍎", "Fruits", const Color(0xFFF5E7BF)),

                    categoryCard("🌾", "Grains", const Color(0xFFD8EBF8)),

                    categoryCard("🌶", "Spices", const Color(0xFFF0D9D9)),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "⭐ Trusted Sellers Nearby",

                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              sellerCard(
                "👨‍🌾",
                "Ramesh Patil",
                "🍅 Tomato · 3.2 km",
                "Top Seller",
              ),

              const SizedBox(height: 14),

              sellerCard(
                "👩‍🌾",
                "Sunita Devi",
                "🧅 Onion · 5.1 km",
                "Verified",
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: const Color(0xFF2E7D57),

        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget categoryCard(String emoji, String title, Color color) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),

          const SizedBox(height: 8),

          Text(title),
        ],
      ),
    );
  }

  Widget sellerCard(String emoji, String name, String details, String badge) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [
          CircleAvatar(radius: 24, child: Text(emoji)),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(details, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

            decoration: BoxDecoration(
              color: Colors.green.shade100,

              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(badge),
          ),
        ],
      ),
    );
  }
}
