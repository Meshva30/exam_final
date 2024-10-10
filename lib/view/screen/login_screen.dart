



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/auth_controller.dart';
import '../../controller/home_controller.dart';
import 'home_screen.dart';


class Loginaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var controller = AuthController();
    final HomeController homecontroller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                'Login Account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 40),
              Text(
                'Email or Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: homecontroller.email,
                // Using emailController
                decoration: InputDecoration(
                  labelText: 'Enter your email or phone number',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.mail_outline),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffFBFBFD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: homecontroller.password,

                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Create your password',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility_outlined),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffFBFBFD),
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signIn(
                        controller.email.text, controller.password.text);
                    Get.to(Homescreen());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(0xff005667),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Or using other method',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 15),
              // Google sign in button
              Container(
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                        height: 31,
                        child: Image.asset('assets/img/google.png')),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign Up with Google',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Facebook sign in button
              Container(
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                        height: 31,
                        child: Image.asset('assets/img/facebook.png')),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign Up with Facebook',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}