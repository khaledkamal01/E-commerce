import 'package:ecommerce/Forgotpassword.dart';
import 'package:ecommerce/registerAccount.dart';
import 'package:ecommerce/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final user = FirebaseAuth.instance.currentUser;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool check = false;

  Future signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print("errorssssssssss");
      print(e);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => test()),
    );
  }

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return test();
              } else if (snapshot.hasError) {
                return Text("something went wronggggggggggg");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 30.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Sign in with your email and password ",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Text(
                          "or continue with social media",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: 300,
                          height: 80,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: ("Email"),
                              hintText: ("Enter your email"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              suffixIcon: Icon(Icons.email_outlined),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              print(value);
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            validator: (value) {
                              if(value!.isEmpty){
                                return "required";}
                              return null ;
                            },
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 80,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: ("Password"),
                              hintText: ("Enter your password"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              suffixIcon: Icon(Icons.lock_outlined),
                            ),
                            keyboardType: TextInputType.phone,
                            onFieldSubmitted: (value) {
                              print(value);
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            validator: (value) {
                              if(value!.isEmpty){
                                return "required";}
                              return null ;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Checkbox(
                                  value: check,
                                  onChanged: (val) {
                                    setState(() {
                                      print("work");
                                      check = val!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword()),
                                  );
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.grey.shade600),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.deepOrange,
                          ),
                          height: 60.0,
                          width: 300,
                          child: MaterialButton(
                            onPressed: signin,
                            child: Text(
                              "SignIn",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
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
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont have an account ?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterAccount()),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.deepOrange),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
