import 'package:flutter/material.dart';
import 'package:krishisetu/screens/farmer_home.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';
import 'package:krishisetu/services/listing_data.dart';

class ListingFinalScreen extends StatefulWidget {
  final String crop;
  final String quantity;
  final String price;

  const ListingFinalScreen({
    super.key,
    required this.crop,
    required this.quantity,
    required this.price,
  });

  @override
  State<ListingFinalScreen> createState() => _ListingFinalScreenState();
}

class _ListingFinalScreenState extends State<ListingFinalScreen> {
  String selectedGrade = "A";

  String deliveryOption = "Delivery";

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F2),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F6F2),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        title: Text(
          t("photoGrade"),

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [dot(false), dot(true), dot(false)],
            ),

            const SizedBox(height: 28),

            // Upload
            Container(
              width: double.infinity,

              height: 160,

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(22),

                border: Border.all(color: Colors.grey.shade300),
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("📷", style: TextStyle(fontSize: 42)),

                  SizedBox(height: 10),

                  Text(
                    "Upload Photo",

                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            Text(
              t("qualityGrade"),

              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: gradeCard("A", "Premium")),

                const SizedBox(width: 10),

                Expanded(child: gradeCard("B", "Standard")),

                const SizedBox(width: 10),

                Expanded(child: gradeCard("C", "Economy")),
              ],
            ),

            const SizedBox(height: 28),

            Text(
              t("deliveryOption"),

              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: deliveryCard("🚚", "Delivery")),

                const SizedBox(width: 12),

                Expanded(child: deliveryCard("📦", "Pickup only")),
              ],
            ),

            const SizedBox(height: 40),

            // Publish
            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D57),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {
                  ListingData.publishedListings.add({
                    "crop": widget.crop,
                    "quantity": widget.quantity,
                    "price": widget.price,
                    "grade": selectedGrade,
                    "delivery": deliveryOption,
                  });

                  Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(builder: (context) => const FarmerHome()),

                    (route) => false,
                  );
                },

                child: Text(
                  t("publishListing"),

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Draft
            SizedBox(
              width: double.infinity,
              height: 60,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {
                  ListingData.draftListings.add({"crop": widget.crop});

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(t("saveDraft"))));
                },

                child: Text(
                  t("saveDraft"),

                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),

      width: active ? 26 : 10,

      height: 10,

      decoration: BoxDecoration(
        color: active ? const Color(0xFF2E7D57) : Colors.grey.shade300,

        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget gradeCard(String grade, String subtitle) {
    bool selected = selectedGrade == grade;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGrade = grade;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),

        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2E7D57) : Colors.white,

          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            Text(
              grade,

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black,
              ),
            ),

            Text(
              subtitle,

              style: TextStyle(color: selected ? Colors.white70 : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget deliveryCard(String emoji, String text) {
    bool selected = deliveryOption == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          deliveryOption = text;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),

        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD8EBF8) : Colors.white,

          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),

            const SizedBox(height: 8),

            Text(text),
          ],
        ),
      ),
    );
  }
}
