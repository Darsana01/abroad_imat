
import 'package:flutter/material.dart';

import '../Database/Authentication/auth.dart';
import '../modal/Auth_modal.dart';
import 'login.dart';



class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsForm(),
    );
  }
}
class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  DatabaseHelper _dbHelper = DatabaseHelper();
  AuthModal? _currentUser;
    ValueNotifier<bool> isObscure = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    int currentUserId = 1; 
    AuthModal? user = await _dbHelper.getUser(currentUserId);
    if (user != null) {
      setState(() {
        _currentUser = user;
        _usernameController.text = user.username;
        _passwordController.text = user.password;
      });
    }
  }

  Future<void> _updateUser() async {
    if (_formKey.currentState!.validate() && _currentUser != null) {
      _currentUser!.username = _usernameController.text;
      _currentUser!.password = _passwordController.text;

      await _dbHelper.updateUser(_currentUser!);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User information updated successfully!')),
      );

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            "Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(padding: EdgeInsets.all(40.0)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Change Username',
                labelStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                suffix: Icon(Icons.verified_user_rounded)
              ),
              style: const TextStyle(color: Colors.black),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (context, value, child) {
              return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: TextFormField(
                controller: _passwordController,
                
                decoration: InputDecoration(
                  labelText: 'Change Password',
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
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
            );
            },
            
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
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
                onPressed: _updateUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
