import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class animation extends StatefulWidget {
  const animation({Key? key}) : super(key: key);

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {

  bool isDarkMode = false;
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: themeData,
      child: Scaffold(
        
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToggleSwitch(
                  minWidth: 130.0,
                  initialLabelIndex: 1,
                  cornerRadius: 10.0,
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey.shade300,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['Morning login', 'Night login'],
                  activeBgColors: [
                    [Colors.white],
                    [Colors.white]
                  ],
                  onToggle: (index) {
                    if (index == 1) {
                      toggleDarkMode();
                    }
                    print('switched to: $index');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Good Morning',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Email"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Password"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
