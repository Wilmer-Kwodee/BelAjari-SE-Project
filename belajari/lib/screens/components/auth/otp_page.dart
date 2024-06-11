import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_testing/backend/handler/user/parent_handler.dart';
import 'package:flutter_app_testing/backend/handler/user/tutor_handler.dart';
import 'package:flutter_app_testing/backend/model/user/parent.dart';
import 'package:flutter_app_testing/backend/model/user/tutor.dart';
import 'package:flutter_app_testing/backend/others/auth/firebase_auth.dart';

class PhoneOTPVerification extends StatefulWidget {
  final dynamic object;
  const PhoneOTPVerification({Key? key, required this.object})
      : super(key: key);

  @override
  State<PhoneOTPVerification> createState() => _PhoneOTPVerificationState();
}

class _PhoneOTPVerificationState extends State<PhoneOTPVerification> {
  TextEditingController phoneNumberController = TextEditingController();
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  bool isOtpVisible = false;
  late ConfirmationResult confirmationResult;

  @override
  void dispose() {
    phoneNumberController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the object parameter
    final dynamic object = widget.object;

    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Authentication"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputTextField("Contact Number", phoneNumberController),
              if (isOtpVisible) otpInputField(),
              const SizedBox(height: 16.0),
              if (!isOtpVisible)
                sendOtpButton("Send OTP")
              else
                submitOtpButton("Submit"),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendOtpButton(String text) => ElevatedButton(
        onPressed: () async {
          setState(() {
            isOtpVisible = true;
          });
          confirmationResult =
              await FirebaseAuthService.sendOTP(phoneNumberController.text);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Text(text),
      );

  Widget submitOtpButton(String text) => ElevatedButton(
        onPressed: () async {
          String otp =
              otpControllers.map((controller) => controller.text).join();
          bool isSuccess =
              await FirebaseAuthService.authenticate(confirmationResult, otp);
          if (isSuccess) {
            if (mounted) {
              if (widget.object is Parent){
                Parent p = widget.object as Parent;
                p.phoneNumber = phoneNumberController.text;
                ParentHandler.addParentData(parent: p);
               Navigator.pushNamed(context, '/login');

              }
              else if (widget.object is Tutor){
                Tutor t = widget.object as Tutor;
                t.phoneNumber = phoneNumberController.text;
                TutorHandler.addTutorData(tutor: t);
                Navigator.pushNamed(context, '/uploadDocuments');
              }

              // Navigator.pushNamed(context, '/login');
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("OTP verification failed")),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Text(text),
      );

  Widget inputTextField(
          String labelText, TextEditingController textEditingController) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            prefixText: labelText == "Contact Number" ? '+62 ' : '',
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.orange),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 238, 214),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
          keyboardType: TextInputType.phone,
        ),
      );

  Widget otpInputField() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return SizedBox(
            width: 40,
            child: TextFormField(
              controller: otpControllers[index],
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 239, 197, 138),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                hintText: '',
                counterText: '',
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(fontSize: 18),
              onChanged: (value) {
                if (value.isNotEmpty && index < otpControllers.length - 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          );
        }),
      );
}
