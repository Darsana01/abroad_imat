import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'home.dart';

void main() {
  runApp(const MaterialApp(
    home: Abroad_form(),
    debugShowCheckedModeBanner: false,
  ));
}

class Abroad_form extends StatefulWidget {
  const Abroad_form({super.key});

  @override
  State<Abroad_form> createState() => _AbroadFormState();
}
class _AbroadFormState extends State<Abroad_form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _stphnoController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.black, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child:const Text(
                      "Referral Partner Registration",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                 const SizedBox(height: 10),
                _buildTextField(_fnameController, "First Name", "Please enter the name", "Name must contain only alphabets"),
                _buildTextField(_lnameController, "Last Name", "Please enter the name", "Name must contain only alphabets"),
                _buildTextField(_stphnoController, "Student Phone Number", "Please enter your phone number", "Phone number must be 10 digits", r'^\d{10}$'),
                _buildTextField(_phnoController, "Parent Phone Number", "Please enter your phone number", "Phone number must be 10 digits", r'^\d{10}$'),
                _buildTextField(_emailController, "Email", "Please enter your email", "Please enter a valid email", r'.+@.+\..+'),
                _buildTextField(_locationController, "Location", "Please enter your location"),
                _buildTextField(_qualificationController, "Last Qualification", "Please enter your qualification", "Please enter a valid qualification"),
                _buildTextField(_courseController, "Preferred Course", "Please enter your preferred course", "Please enter a valid course"),
                _buildTextField(_levelController, "Level", "Please enter your level", "Please enter a valid level"),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeabroad()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child:Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String emptyMessage, [String? invalidMessage, String? regex]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.red, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          label: Text(label),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return emptyMessage;
          } else if (regex != null && !RegExp(regex).hasMatch(value)) {
            return invalidMessage;
          }
          return null;
        },
      ),
    );
  }
}
