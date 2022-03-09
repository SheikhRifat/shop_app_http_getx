import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/src/controller/base_controller.dart';
import 'package:shop_app/src/function/decoration.dart';
import 'package:shop_app/src/pages/home_page.dart';
import 'package:shop_app/src/pages/login_page.dart';
import 'package:shop_app/src/pakages/ktext.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with BaseController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.25,
              ),
              _top(),
              Form(
                key: _fromKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          decoration: userDecoration(
                            hintText: 'username',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: userDecoration(
                            hintText: 'password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  primary: Colors.greenAccent,
                                ),
                                onPressed: () {
                                  if (_fromKey.currentState!.validate()) {
                                    authC.register(
                                        username.text, password.text);
                                    Get.offAll(HomePage());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.white,
                                          content: KText(
                                            text: 'Successfully registered',
                                            color: Colors.black,
                                          )),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.white,
                                        content: KText(
                                          text: 'Invalid email or password',
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: KText(
                                  text: 'Create Account',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KText(text: "Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Get.to(LoginPage());
                              },
                              child: KText(
                                text: 'Login',
                                color: Colors.greenAccent,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _top() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.grey[400],
          ),
          maxRadius: 40,
        ),
        SizedBox(height: 16),
        Text(
          "Create Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "create a new account",
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
