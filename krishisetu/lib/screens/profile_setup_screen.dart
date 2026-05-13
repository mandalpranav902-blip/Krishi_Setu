import 'package:flutter/material.dart';
import 'package:krishisetu/screens/roll_screen.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';
import 'package:krishisetu/services/user_data.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String selectedCrop = "🌾 Wheat";

  String t(String key) {
    return AppText.text[AppLanguage.selectedLanguage]?[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xFFF8F6F2),

      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 30),

              Text(
                t("profileSetup"),

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                t("profileOptional"),

                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 30),

              // Image
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: Colors.grey),
                      ),

                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      t("addPhoto"),

                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Name
              TextField(
                onChanged: (value) {
                  UserData.userName = value;
                },

                decoration: InputDecoration(
                  hintText: t("fullName"),

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Village
              TextField(
                onChanged: (value) {
                  UserData.village = value;
                },

                decoration: InputDecoration(
                  hintText: t("villageCity"),

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(t("cropType")),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,

                children: [
                  cropChip("🌾 Wheat"),

                  cropChip("🍅 Tomato"),

                  cropChip("🧅 Onion"),

                  cropChip("🌽 Corn"),
                ],
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                height: 60,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const RoleSelectionScreen(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D57),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: Text(
                    t("getStarted"),

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Center(child: Text(t("skipForNow"))),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget cropChip(String crop) {
    bool selected = selectedCrop == crop;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCrop = crop;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2E7D57) : Colors.white,

          borderRadius: BorderRadius.circular(25),

          border: Border.all(color: Colors.grey.shade300),
        ),

        child: Text(
          crop,

          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
