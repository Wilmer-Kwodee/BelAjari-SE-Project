import 'package:flutter/material.dart';
import 'package:flutter_app_testing/backend/controller/user/user_controller.dart';
import 'package:flutter_app_testing/backend/handler/user/user_handler.dart';
import 'package:flutter_app_testing/backend/model/user/parent.dart';
import 'package:flutter_app_testing/backend/model/user/tutor.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart' as user_model;
import 'package:flutter_app_testing/backend/others/auth/firebase_auth.dart';
import 'package:flutter_app_testing/screens/components/auth/otp_page.dart';
import 'package:flutter_app_testing/utils/Constant.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  String _selectedRole = 'Student';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(width: 10),
                Text(
                  'as',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedRole,
                        items: <String>['Student', 'Tutor', 'Parent']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRole = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('Name'),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text('Your Email'),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter email here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text('Password'),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: '*****',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text('Age'),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                hintText: 'Enter your age...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonThatGoAllToRight(
              theParameter: 'Register',
              formKey: _formKey,
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              ageController: _ageController,
              selectedRole: _selectedRole,
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class ButtonThatGoAllToRight extends StatelessWidget {
  final String theParameter;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController ageController;
  final String selectedRole;

  const ButtonThatGoAllToRight({
    Key? key,
    required this.theParameter,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.ageController,
    required this.selectedRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                AuthResult result =
                    await UserController.registerWithEmailAndPassword(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  age: int.parse(ageController.text),
                  role: selectedRole,
                );

                if (selectedRole == "Student") {
                  if (result.ok()) {
                    Navigator.pushNamed(context, '/login');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result.error ?? 'Unknown error')),
                    );
                  }
                } else {
                  if (result.ok()) {
                    String uid = result.user!.uid;
                
                    user_model.User? u = (await UserHandler.getUserByUid(uid));
                    print(u);
                    dynamic object;

                    if (u != null) {
                      if (selectedRole == "Tutor") {
                        object = Tutor(
                            tutorId: "-",
                            userId: u.userId,
                            description: "",
                            introductionVideoUrl: "",
                            cvUrl: "",
                            certificateUrls: [""],
                            balance: 0,
                            serviceIds: [],
                            phoneNumber: "");
                      } else {
                        object = Parent(
                            parentId: "-",
                            userId: u.userId,
                            studentNik: [],
                            phoneNumber: "");
                      }
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PhoneOTPVerification(object: object),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result.error ?? 'Unknown error')),
                    );
                  }
                }
              }
            },
            child: Text(
              theParameter,
              style: TextStyle(color: Constant.SecondaryWhite),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Constant.HeroColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

mixin userId {}
