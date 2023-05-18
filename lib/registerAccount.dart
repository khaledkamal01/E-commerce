import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Welcomeback.dart';
import 'complete.dart';
import 'main.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var email, password, confirm;

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      FirebaseFirestore.instance.collection('users').add({
        'email': emailController.text,
        'password':passwordController.text,
      });
    } on FirebaseAuthException catch (e) {
      print("errorssssssssss U");
      print(e);
    }
    // navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formstate,
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Register Account",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Complete your details or continue ",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  "with social media",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: 300,
                  height: 100,
                  child: TextFormField(
                    onSaved: (val) {
                      email = val;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: ("Email"),
                      hintText: ("Enter your email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter email";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  child: TextFormField(
                    onSaved: (val) {
                      password = val;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: ("Password"),
                      hintText: ("Enter your password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: Icon(Icons.lock_outlined),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter password";
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    onSaved: (val) {
                      confirm = val;
                    },
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: ("Confirm password"),
                      hintText: ("Re-enter your password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: Icon(Icons.lock_outlined),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter re-password";
                      }
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return "password don't match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.deepOrange,
                  ),
                  height: 60.0,
                  width: 300,
                  child: MaterialButton(
                    onPressed: () async {
                      signUp();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Complete()),
                      );
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account? "),
                    TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Welcome()),
                        );
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade200,
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/google-icon.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade200,
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/facebook-2.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade200,
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/twitter.svg",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(
                    "By continuing your confirm that you agree",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
