import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/show_user_list/searchclients.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _sources = [
    'Facebook',
    'Instagram',
    'Organic',
    'Friend',
    'Google',
  ];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? _selectedSource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  // Add your custom BoxDecoration here
                  // Example: adding a border, background color, and rounded corners
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField<String>(
                focusColor: Colors.white,
                value: _selectedSource,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSource = newValue!;
                  });
                },
                items: _sources.map((source) {
                  return DropdownMenuItem<String>(
                    value: source,
                    child: Text(source),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Where are you coming from?',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a source';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CollectionReference collRef =
                          FirebaseFirestore.instance.collection('client');
                      collRef.add({
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "from": _selectedSource,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Showdata()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Add Client',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
