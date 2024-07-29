import 'package:abroad_imat/Database/Authentication/auth.dart';
import 'package:abroad_imat/modal/Auth_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';



class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final username = TextEditingController();
    final qualification = TextEditingController();
  final email = TextEditingController();
    final phonenumber = TextEditingController();
  final state =TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  const Text("Register here..", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Name must contain only alphabetic characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //  Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 50),
                  //   child: TextFormField(
                  //     controller: username,
                  //     decoration: InputDecoration(
                        
                  //       labelText: 'Qualification',
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
                      
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 50),
                  //   child: TextFormField(
                  //     controller: username,
                  //     decoration: InputDecoration(
                        
                  //       labelText: 'Email',
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
                      
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 50),
                  //   child: TextFormField(
                      
                  //     decoration: InputDecoration(
                  //       labelText: 'Phone number',
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
                  //         return 'Please enter your phone number';
                  //       }
                  //       if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  //         return 'Phone number must be exactly 10 digits';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 50),
                  //   child: TextFormField(
                  //     controller: username,
                  //     decoration: InputDecoration(
                        
                  //       labelText: 'State',
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
                      
                  //   ),
                  // ),
                 // const SizedBox(height: 15,),
                  Padding(
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
                      ),
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
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
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      controller: confirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 40,),
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
                       if (formKey.currentState!.validate()) {

                            final db = DatabaseHelper();
                            db
                                .signup(AuthModal(
                                    username: username.text,
                                    password: password.text))
                                .whenComplete(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPage()));
                            });
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Register", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
