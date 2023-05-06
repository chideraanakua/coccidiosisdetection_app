// ignore_for_file: library_private_types_in_public_api

import 'package:coccidiosisdetection_app/repository/user_repository.dart';
import 'package:coccidiosisdetection_app/screens/signup_screen.dart';
import 'package:coccidiosisdetection_app/styles.dart';
import 'package:coccidiosisdetection_app/widget/custom_button.dart';
import 'package:coccidiosisdetection_app/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widget/coccidiosis_recogniser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
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
            userProv.isLoading ?
            const Center(child: CircularProgressIndicator(color: kColorGreen,),):
            CustomButton(
                onTap: () async {
                  // print("clicked");
                  bool u = await userProv.loginUser(
                      email: emailController.text,
                      password: passwordController.text);
                  if (u) {
                    userProv.getUserDetails();
                    Get.to(() => const CoccidiosisRecogniser());
                  }
                },
                label: "Login"),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.off(const SignupScreen());
              },
              child: Center(
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Signup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
