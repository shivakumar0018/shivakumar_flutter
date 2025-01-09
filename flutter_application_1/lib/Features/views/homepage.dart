import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // To track the selected tab

  void _showMoreOptionsDialog(BuildContext context, Offset iconPosition) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "More Options",
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            Positioned(
              top: iconPosition.dy + 40, // Slightly below the AppBar icon
              left: iconPosition.dx - 200, // Align left to the icon
              child: Material(
                color: Colors.transparent,
                child: ScaleTransition(
                  scale: animation,
                  child: Container(
                    width: 230,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.toNamed("/settings");
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.play_circle_outlined),
                          title: const Text('Tutorial Videos'),
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.toNamed("/about");
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.school_outlined),
                          title: const Text('FAQ'),
                          onTap: () {
                            Get.toNamed("/faq");
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.info),
                          title: const Text('About'),
                          onTap: () {
                            Get.toNamed("/aboutpage");
                            
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.share),
                          title: const Text('Share this App'),
                          onTap: () {
                            Navigator.of(context).pop();
                            Share.share(
                              'Check out the XI-Timer app: https://play.google.com/store/apps/details?id=com.ultrajuicy.photofinish',
                              subject: 'XI-Timer App',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "XI-Timer",
          style: GoogleFonts.roboto(color: AppColors.secondaryColor),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.secondaryColor,
                ),
                onPressed: () {
                  final RenderBox renderBox =
                      context.findRenderObject() as RenderBox;
                  final Offset iconPosition =
                      renderBox.localToGlobal(Offset.zero);
                  _showMoreOptionsDialog(context, iconPosition);
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  "Welcome to\n   XI-Timer",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/createsession");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                  child: Text(
                    "CREATE SESSION",
                    style: TextStyle(color: AppColors.secondaryColor),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
  backgroundColor: AppColors.primaryColor,
  currentIndex: _currentIndex,
  selectedItemColor: AppColors.secondaryColor, // Color for selected icon and label
  unselectedItemColor: const Color(0xFF676767), // Dull color for unselected items
  selectedLabelStyle: const TextStyle(
    fontWeight: FontWeight.bold, // Bold text for selected label
    color: AppColors.secondaryColor, // Ensure selected label matches selected icon color
  ),
  unselectedLabelStyle: const TextStyle(
    fontWeight: FontWeight.normal, // Normal text for unselected labels
    color: Color(0xFF676767), // Match unselected label color with icon
  ),
  onTap: (index) {
    setState(() {
      _currentIndex = index; // Update the current selected index
    });
    switch (index) {
      case 0:
        Get.toNamed("/home"); // Navigate to Timer page
        break;
      case 1:
        Get.toNamed("/athletes"); // Navigate to Athletes page
        break;
      case 2:
        Get.toNamed("/history"); // Navigate to History page
        break;
    }
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.timer_outlined),
      label: 'Timer',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.groups),
      label: 'Athletes',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.leaderboard),
      label: 'History',
    ),
  ],
),

      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            bottom: 80,
            right: 10,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                print('FAB 1 clicked');
              },
              backgroundColor: AppColors.secondaryColor,
              icon: Icon(Icons.play_circle_outlined,
                  color: AppColors.primaryColor),
              label: Text("New: ACCURACY STUDY",
                  style: TextStyle(color: AppColors.primaryColor)),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                print('FAB 2 clicked');
              },
              backgroundColor: AppColors.primaryColor,
              icon: Icon(Icons.play_circle_outlined,
                  color: AppColors.secondaryColor),
              label: Text(
                "NEW: TUTORIAL VIDEOS",
                style: TextStyle(color: AppColors.secondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
