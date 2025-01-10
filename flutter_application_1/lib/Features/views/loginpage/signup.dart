import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Boolean to toggle password visibility
  bool _obscureText = true;

  //Function to validate inputs
  bool _validateInputs(){
    String firstname = usernameController.text.trim();
    String lastname = usernameController.text.trim();
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    

    //Regular expression for validating email
    String firstnamepattern = r'^[a-zA-Z]';
    String lastnamepattern = r'^[a-zA-Z]';
    String usernamepattern = r'^[a-zA-Z0-9]';
    String emailPattern = r'^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    String passwordPattern = r'^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>-_=+;~`\\/\[\]_]';
    RegExp firstnameRegex = RegExp(firstnamepattern);
    RegExp lastnameRegex = RegExp(lastnamepattern);
    RegExp usernameRegex = RegExp(usernamepattern);
    RegExp emailRegex = RegExp(emailPattern);
    RegExp passwordlRegex = RegExp(passwordPattern);

    if (firstname.isEmpty || firstnameRegex.hasMatch(firstname)){
      Get.snackbar(
        "Invalid Firstname",
        "Please enter a valid Firstname",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
        return false;
    }
    if (lastname.isEmpty || lastnameRegex.hasMatch(lastname)){
      Get.snackbar(
        "Invalid Lastname",
        "Please enter a valid Lastname",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
        return false;
    }
     if (username.isEmpty || usernameRegex.hasMatch(username)){
      Get.snackbar(
        "Invalid Lastname",
        "Please enter a valid Lastname",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
        return false;
    }
    if (email.isEmpty || emailRegex.hasMatch(email)){
      Get.snackbar(
        "Invalid Gmail",
        "Please enter a valid Gmail address",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
        return false;
    }
     if (password.isEmpty || password.length < 6) {
      Get.snackbar(
        "Invalid Password",
        "Password must be at least 6 characters long.",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }
    return true;    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: AppColors.secondaryColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register Here",
              style: GoogleFonts.roboto(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.person, color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Last Name (Optional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.person, color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.person, color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Gmail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.email, color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: _obscureText, // Toggle visibility based on _obscureText
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.lock, color: AppColors.primaryColor),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Toggle the obscureText state
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                      if (_validateInputs()) {
                        // Navigate to the home page if validation is successful
                        Get.toNamed("/home");
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "SIGN UP",
                style: TextStyle(color: AppColors.secondaryColor, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
