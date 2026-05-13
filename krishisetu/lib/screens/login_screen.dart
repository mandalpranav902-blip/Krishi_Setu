import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:krishisetu/screens/profile_setup_screen.dart';
import 'package:krishisetu/services/app_language.dart';
import 'package:krishisetu/services/app_text.dart';

class MobileAuthScreen extends StatefulWidget {
  const MobileAuthScreen({super.key});

  @override
  State<MobileAuthScreen> createState() => _MobileAuthScreenState();
}

class _MobileAuthScreenState extends State<MobileAuthScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    flutterLocalNotificationsPlugin.initialize(settings);
  }

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  bool showSendOtp = false;
  bool otpSent = false;
  bool showContinue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF8F6F2),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            children: [
              const SizedBox(height: 50),

              // Icon
              Container(
                width: 90,
                height: 90,

                decoration: BoxDecoration(
                  color: const Color(0xFFE9E5FF),
                  borderRadius: BorderRadius.circular(24),
                ),

                child: const Icon(
                  Icons.phone_android,
                  size: 45,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 25),

              // Title
              Text(
                AppText.text[AppLanguage.selectedLanguage]?["number"] ?? "",

                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              Text(
                AppText.text[AppLanguage.selectedLanguage]?["title"] ?? "",

                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 35),

              // Phone Field
              Container(
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(color: const Color(0xFFD7D2CC)),
                ),

                child: Row(
                  children: [
                    const Text(
                      "+91",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: TextField(
                        controller: phoneController,

                        keyboardType: TextInputType.number,

                        maxLength: 10,

                        style: const TextStyle(fontSize: 24),

                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                          hintText: "9876543210",
                        ),

                        onChanged: (value) {
                          setState(() {
                            showSendOtp = value.length == 10;

                            if (value.length < 10) {
                              otpSent = false;
                              showContinue = false;
                              otpController.clear();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Send OTP
              if (showSendOtp && !otpSent)
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        otpSent = true;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppText.text[AppLanguage
                                    .selectedLanguage]?["otpSent"] ??
                                "",
                          ),
                        ),
                      );

                      await flutterLocalNotificationsPlugin.show(
                        0,

                        AppText.text[AppLanguage
                                .selectedLanguage]?["otpVerification"] ??
                            "",

                        AppText.text[AppLanguage
                                .selectedLanguage]?["yourOtp"] ??
                            "",

                        const NotificationDetails(
                          android: AndroidNotificationDetails(
                            'otp_channel',
                            'OTP Notifications',
                            importance: Importance.max,
                            priority: Priority.high,
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D57),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    child: Text(
                      AppText.text[AppLanguage.selectedLanguage]?["sendOtp"] ??
                          "",

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // OTP
              if (otpSent) ...[
                Text(
                  AppText.text[AppLanguage.selectedLanguage]?["enterOtp"] ?? "",

                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),

                const SizedBox(height: 15),

                Container(
                  height: 75,
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(22),

                    border: Border.all(
                      color: const Color(0xFF2E7D57),
                      width: 2,
                    ),
                  ),

                  child: TextField(
                    controller: otpController,

                    keyboardType: TextInputType.number,

                    maxLength: 6,

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),

                    decoration: InputDecoration(
                      border: InputBorder.none,

                      counterText: "",

                      hintText:
                          AppText.text[AppLanguage
                              .selectedLanguage]?["enterOtp"] ??
                          "",
                    ),

                    onChanged: (value) {
                      setState(() {
                        showContinue = value.length == 6;
                      });
                    },
                  ),
                ),
              ],

              const SizedBox(height: 30),

              // Continue
              if (showContinue)
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileSetupScreen(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D57),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    child: Text(
                      AppText.text[AppLanguage.selectedLanguage]?["continue"] ??
                          "",

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
