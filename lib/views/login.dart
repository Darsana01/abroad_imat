

import 'package:abroadimat/views/registration.dart';
import 'package:flutter/material.dart';

import '../Database/Authentication/auth.dart';
import '../modal/Auth_modal.dart';
import 'bottom_nav.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   final username = TextEditingController();
      final password = TextEditingController();
        ValueNotifier<bool> isObscure = ValueNotifier(true);
    bool isLoginTrue=false;
final db=DatabaseHelper();
 

void login() async {
    bool response = await db.login(AuthModal(username: username.text, password: password.text));
    if (response) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottom_nav()));
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
     final formKey = GlobalKey<FormState>();


    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 60,),
                const Text("Login here..", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.all(40.0)),
                 Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        
                        labelText: 'Name',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: Icon(Icons.supervised_user_circle)
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        // if(username!= value){
                        //   return "enter correct username";
                        // }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Name must contain only alphabetic characters';
                        }
                        return null;
                      },
                    ),
                  ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 50),
                //   child: TextFormField(
                //     controller: username,
                //     decoration: InputDecoration(
                //       labelText: 'Email Id',
                //       labelStyle: const TextStyle(color: Colors.black),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(color: Colors.red),
                //       ),
                //       focusedBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.red),
                //       ),
                //     ),
                //     style: const TextStyle(color: Colors.black),
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please enter your email';
                //       } else if (!value.contains('@')) {
                //         return 'Please enter a valid email';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                const SizedBox(height: 15,),
                ValueListenableBuilder(valueListenable: isObscure,
                 builder: (context,value,child){
                  return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    controller: password,
                    
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            isObscure.value = !isObscure.value;
                          },
                          icon: value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    obscureText: value,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 7) {
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                  ),
                );
                 }
                 ),
                
                const SizedBox(height: 15,),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 50),
                //   child: TextFormField(
                //     controller: _confirmPasswordController,
                //     decoration: InputDecoration(
                //       labelText: 'Confirm Password',
                //       labelStyle: const TextStyle(color: Colors.black),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(color: Colors.red),
                //       ),
                //       focusedBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.red),
                //       ),
                //     ),
                //     style: const TextStyle(color: Colors.black),
                //     obscureText: true,
                //     obscuringCharacter: '*',
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please confirm your password';
                //       } else if (value != _passwordController.text) {
                //         return 'Passwords do not match';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                const SizedBox(height: 40),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                     if(formKey.currentState!.validate()){
                      login();
                     }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                SizedBox(height: 15,),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not Yet Registered? ",
                  
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrationPage()));
                  },
                  child: Text(
                    "Register Now",
                    
                  ),
                )
              ],
            )
              ],
            ),
          ),
        ));
  }
}
