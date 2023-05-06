// ignore_for_file: library_private_types_in_public_api

import 'package:coccidiosisdetection_app/screens/signup_complete_screen.dart';
import 'package:coccidiosisdetection_app/widget/custom_button.dart';
import 'package:coccidiosisdetection_app/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../repository/user_repository.dart';
import '../styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: 
      
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: ListView(
          
          children: [
            const Text(
              "Create an account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              labelText: "Full Name",
              hintText: "John Doe",
              controller: fullNameController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Phone number",
              hintText: "090******",
              controller: phoneNumberController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Email",
              hintText: "johnDoe@gmail.com",
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Password",
              hintText: "********",
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            userProv.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kColorGreen,
                    ),
                  )
                : CustomButton(
                    onTap: () async {
                      // print("clicked");
                      bool u = await userProv.signUpUser(
                          email: emailController.text,
                          password: passwordController.text,
                          phoneNumber: phoneNumberController.text,
                          name: fullNameController.text);
                      if (u) {
                        Get.to(SignUpComplete(
                          fullName: fullNameController.text,
                        ));
                      }
                    },
                    label: "Signup"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
