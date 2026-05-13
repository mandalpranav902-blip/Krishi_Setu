import 'package:flutter/material.dart';
import 'package:krishisetu/screens/login_screen.dart';
import 'package:krishisetu/services/app_language.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> languages = [
    {"native": "हिंदी", "english": "Hindi"},
    {"native": "English", "english": "English"},
    {"native": "मराठी", "english": "Marathi"},
    {"native": "ਪੰਜਾਬੀ", "english": "Punjabi"},
    {"native": "தமிழ்", "english": "Tamil"},
    {"native": "తెలుగు", "english": "Telugu"},
    {"native": "বাংলা", "english": "Bangla"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Language icon
              Icon(Icons.language, color: Colors.blue[300], size: 60),

              const SizedBox(height: 30),

              // Title
              const Text(
                'भाषा चुने',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Subtitle
              const Text(
                'Select your language',
                style: TextStyle(color: Colors.grey, fontSize: 24),
              ),

              const SizedBox(height: 20),

              // Language List
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },

                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),

                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF2E7D57)
                              : const Color(0xFFE9E6E2),

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Row(
                          children: [
                            // Native
                            Expanded(
                              flex: 2,
                              child: Text(
                                languages[index]["native"]!,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),

                            // English
                            Expanded(
                              flex: 2,
                              child: Text(
                                languages[index]["english"]!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white70
                                      : Colors.grey,
                                ),
                              ),
                            ),

                            // Check icon
                            if (isSelected)
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 28,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: selectedIndex == -1
                      ? null
                      : () {
                          // Save selected language
                          AppLanguage.selectedLanguage =
                              languages[selectedIndex]["english"]!;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MobileAuthScreen(),
                            ),
                          );
                        },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D57),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
