import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  State<Complete> createState() => _Complete();
}

class _Complete extends State<Complete> {
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  void _submitForm() async {


      formstate.currentState?.save();

      await FirebaseFirestore.instance.collection('users').add({
        'firstName': fNameController.text,
        'lastName': lNameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
      });

      // navigate to the verification page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Verification()),
      );

  }


  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  var email, password, confirm;

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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formstate,
            child: Column(
              children: [
                Text(
                  "Complete profile",
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
                  height: 90,
                  child: TextFormField(
                    controller: fNameController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: ("First Name"),
                      hintText: ("Enter your First Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter your first name";
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 90,
                  child: TextFormField(
                      onSaved: (val) {
                        email = val;
                      },
                      controller: lNameController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: ("Last Name"),
                        hintText: ("Enter your Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "please enter your last name";
                        }

                        return null;
                      }),
                ),
                Container(
                  width: 300,
                  height: 90,
                  child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: ("phone"),
                        hintText: ("Enter your phone number"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: Icon(Icons.phone_android),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "please enter your phone number";
                        }

                        return null;
                      }),
                ),
                Container(
                  width: 300,
                  height: 80,
                  child: TextFormField(
                      onSaved: (val) {
                        password = val;
                      },
                      controller: addressController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: ("Address"),
                        hintText: ("Enter your Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: Icon(Icons.location_on_outlined),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "please enter your Address`";
                        }

                        return null;
                      }),
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
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Text(
                  "By continuing your confirm that you agree",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "with our term and condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
