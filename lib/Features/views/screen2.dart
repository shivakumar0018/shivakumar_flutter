import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class athletespage extends StatefulWidget {
  const athletespage({super.key});

  @override
  State<athletespage> createState() => _athletespageState();
}

class _athletespageState extends State<athletespage> {
  int _currentIndex = 0; // To track the selected tab

  void _showMoreOptionsDialog() {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "More Options",
    transitionDuration: const Duration(milliseconds: 300), // Smooth transition duration
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: Stack(
          children: [
            Positioned(
              top: 5, // Position below the AppBar
              right: 5, // Position close to the right edge
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 230, // Adjust the width as needed
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.toNamed("/settings");
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.play_circle_outlined),
                        title: Text('Tutorial Videos'),
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.toNamed("/about");
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.school_outlined),
                        title: Text('FAQ'),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share this App'),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
          IconButton(
              onPressed: _showMoreOptionsDialog,
              icon: Icon(
                Icons.more_vert,
                color: AppColors.secondaryColor,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            AppColors.primaryColor, // Background color for the navigation bar
        currentIndex: _currentIndex, // Highlight the selected tab
        selectedItemColor:
            AppColors.secondaryColor, // Color for the selected icon
        unselectedItemColor:
            const Color(0xFF676767), // Color for unselected icons
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                icon: Icon(Icons.timer_outlined)),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.toNamed("/athletes");
                },
                icon: const Icon(Icons.groups)),
            label: 'Athletes',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.toNamed("/history");
                },
                icon: const Icon(Icons.leaderboard)),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
