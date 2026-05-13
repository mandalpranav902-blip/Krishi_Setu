import 'package:flutter/material.dart';
import 'package:krishisetu/screens/add_listing_screen.dart';
import 'package:krishisetu/screens/orders_screen.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';
import 'package:krishisetu/services/listing_data.dart';
import 'package:krishisetu/services/user_data.dart';

class FarmerHome extends StatefulWidget {
  const FarmerHome({super.key});

  @override
  State<FarmerHome> createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  int selectedIndex = 0;

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  void onNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OrdersScreen()),
      );
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddListingScreen()),
      );
    }
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
                          "${t("farmer")}, ${UserData.userName} 👋",

                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.pink,
                              size: 16,
                            ),

                            Text(
                              UserData.village.isEmpty
                                  ? "Village"
                                  : UserData.village,

                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  CircleAvatar(
                    radius: 28,

                    backgroundColor: Colors.green.shade100,

                    child: const Text("👨‍🌾", style: TextStyle(fontSize: 26)),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Verified
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFDDEBD9),

                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [
                    const Text("🏅", style: TextStyle(fontSize: 24)),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            t("verifiedSeller"),

                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const Text(
                            "★★★★★",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),

                    const Text("4.2 / 5"),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Mandi
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFF2E7D57),

                  borderRadius: BorderRadius.circular(22),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      t("todayMandi"),

                      style: const TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "🍅 ₹28/kg",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "🧅 ₹22/kg",

                      style: TextStyle(color: Colors.white70, fontSize: 24),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Cards
              Row(
                children: [
                  actionCard("📦", t("sell"), const Color(0xFFDDEBD9)),

                  const SizedBox(width: 12),

                  actionCard("📦", t("orders"), const Color(0xFFF5E7BF)),

                  const SizedBox(width: 12),

                  actionCard("💰", "Earnings", const Color(0xFFD8EBF8)),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                t("activeListings"),

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              ListingData.publishedListings.isEmpty
                  ? Container(
                      width: double.infinity,

                      padding: const EdgeInsets.all(30),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Center(child: Text(t("noListing"))),
                    )
                  : ListView.builder(
                      shrinkWrap: true,

                      physics: const NeverScrollableScrollPhysics(),

                      itemCount: ListingData.publishedListings.length,

                      itemBuilder: (context, index) {
                        final item = ListingData.publishedListings[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 14),

                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            children: [
                              const Text("🍅", style: TextStyle(fontSize: 40)),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(item["crop"]),

                                    Text(
                                      "${item["quantity"]} kg · ₹${item["price"]}/kg",
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,

                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: const Text("Active"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: onNavTap,

        selectedItemColor: const Color(0xFF2E7D57),

        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: t("home"),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.inventory),
            label: t("orders"),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle),
            label: t("sell"),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: t("alerts"),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: t("profile"),
          ),
        ],
      ),
    );
  }

  Widget actionCard(String emoji, String title, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),

        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),

            const SizedBox(height: 8),

            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
