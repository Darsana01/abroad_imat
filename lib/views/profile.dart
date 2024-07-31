import 'package:flutter/material.dart';

import 'bottom_nav.dart';



class profile extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Your Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(40.0)),
              buildTextFormField('Name', (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Please enter a valid name';
                }
                return null;
              }),
              const SizedBox(height: 15),
              buildTextFormField('Qualification', (value) {
                if (value!.isEmpty) {
                  return 'Please enter your qualification';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Please enter a valid qualification';
                }
                return null;
              }),
              const SizedBox(height: 15),
              buildTextFormField('Email', (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              }),
              const SizedBox(height: 15),
              buildTextFormField('Phone number', (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                } else if (value.length < 10) {
                  return 'Invalid phone number';
                }
                return null;
              }),
              const SizedBox(height: 15),
              buildTextFormField('State', (value) {
                if (value!.isEmpty) {
                  return 'Please enter your state';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Please enter a valid state';
                }
                return null;
              }),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 43,right: 43),
                child: Container(
                  width: 400,
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottom_nav()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Done", style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String labelText, String? Function(String?)? validator,
      {TextEditingController? controller, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
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
        obscureText: isPassword,
        validator: validator,
      ),
    );
  }
}
