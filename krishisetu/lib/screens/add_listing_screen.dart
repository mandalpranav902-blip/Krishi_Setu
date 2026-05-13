import 'package:flutter/material.dart';
import 'package:krishisetu/screens/listing_final_screen.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  String selectedCrop = "🍅 Tomato";

  final quantityController = TextEditingController();

  final priceController = TextEditingController();

  final List<String> crops = [
    "🍅 Tomato",
    "🧅 Onion",
    "🌾 Wheat",
    "🥔 Potato",
    "+ Other",
  ];

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

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
          t("addListing"),

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
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

              children: [dot(true), dot(false), dot(false)],
            ),

            const SizedBox(height: 22),

            const Text(
              "🎙 Voice listing",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 14),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(vertical: 28),

              decoration: BoxDecoration(
                color: const Color(0xFFDDEBD9),

                borderRadius: BorderRadius.circular(22),

                border: Border.all(color: Colors.green),
              ),

              child: const Column(
                children: [
                  Text("🎤", style: TextStyle(fontSize: 45)),

                  SizedBox(height: 10),

                  Text(
                    "Voice listing",

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              t("cropName"),

              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: crops.map((crop) {
                bool selected = selectedCrop == crop;

                return ChoiceChip(
                  label: Text(crop),

                  selected: selected,

                  selectedColor: const Color(0xFF2E7D57),

                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),

                  onSelected: (_) {
                    setState(() {
                      selectedCrop = crop;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 25),

            Text(
              "${t("quantity")} (kg)",

              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: quantityController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: "200 kg",

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(t("pricePerKg"), style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),

            TextField(
              controller: priceController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                prefixText: "₹ ",

                hintText: "26",

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 40),

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
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => ListingFinalScreen(
                        crop: selectedCrop,
                        quantity: quantityController.text,
                        price: priceController.text,
                      ),
                    ),
                  );
                },

                child: Text(
                  t("continue"),

                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
}
