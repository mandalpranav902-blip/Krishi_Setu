import 'package:flutter/material.dart';
import 'package:krishisetu/screens/buyer_home.dart';
import 'package:krishisetu/screens/farmer_home.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  int selectedIndex = -1;

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    final roles = [
      {"title": t("farmer"), "description": t("farmerDesc"), "emoji": "🧑‍🌾"},

      {"title": t("buyer"), "description": t("buyerDesc"), "emoji": "🛒"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            children: [
              const SizedBox(height: 40),

              // Title
              Text(
                t("whoAreYou"),

                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              Text(
                t("roleSubtitle"),

                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 35),

              // Role Cards
              Expanded(
                child: ListView.builder(
                  itemCount: roles.length,

                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },

                      child: Container(
                        margin: const EdgeInsets.only(bottom: 22),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 28,
                        ),

                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFDDEBD9)
                              : const Color(0xFFF1EFEC),

                          borderRadius: BorderRadius.circular(32),

                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF2E7D57)
                                : const Color(0xFFD8D3CD),

                            width: 3,
                          ),
                        ),

                        child: Column(
                          children: [
                            Text(
                              roles[index]["emoji"]!,
                              style: const TextStyle(fontSize: 55),
                            ),

                            const SizedBox(height: 18),

                            Text(
                              roles[index]["title"]!,

                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              roles[index]["description"]!,

                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),

                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Continue
              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: selectedIndex == -1
                      ? null
                      : () {
                          if (selectedIndex == 0) {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) => const FarmerHome(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) => const BuyerHome(),
                              ),
                            );
                          }
                        },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D57),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  child: Text(
                    t("continue"),

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
