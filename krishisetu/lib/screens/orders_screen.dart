import 'package:flutter/material.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';
import 'package:krishisetu/services/listing_data.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  String getEmoji(String crop) {
    if (crop.contains("Tomato")) {
      return "🍅";
    }

    if (crop.contains("Onion")) {
      return "🧅";
    }

    if (crop.contains("Wheat")) {
      return "🌾";
    }

    if (crop.contains("Potato")) {
      return "🥔";
    }

    return "📦";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F2),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: const Color(0xFFF8F6F2),

        title: Text(
          t("orders"),

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListingData.publishedListings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("📦", style: TextStyle(fontSize: 60)),

                  const SizedBox(height: 10),

                  Text(
                    t("noOrders"),

                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Your published listings will appear here",

                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(18),

              itemCount: ListingData.publishedListings.length,

              itemBuilder: (context, index) {
                final item = ListingData.publishedListings[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),

                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),

                        blurRadius: 8,

                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Text(
                            getEmoji(item["crop"]),

                            style: const TextStyle(fontSize: 40),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  item["crop"],

                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "${item["quantity"]} kg",

                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.green.shade100,

                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: const Text(
                              "Active",

                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      detailRow("💰 Price", "₹${item["price"]}/kg"),

                      detailRow("⭐ Grade", item["grade"]),

                      detailRow("🚚 Delivery", item["delivery"]),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),

      child: Row(
        children: [
          Text(title, style: TextStyle(color: Colors.grey.shade700)),

          const Spacer(),

          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
