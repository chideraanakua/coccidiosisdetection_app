import 'package:coccidiosisdetection_app/widget/coccidiosis_recogniser.dart';
import 'package:coccidiosisdetection_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpComplete extends StatelessWidget {
  final String fullName;
  const SignUpComplete({Key? key, required this.fullName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "Hello $fullName 👋\nyou are good to go",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),

              CustomButton(onTap: (){
                Get.offAll(const CoccidiosisRecogniser());
              }, label: "Go home")
            ],
          ),
        ),
      ),
    );
  }
}
