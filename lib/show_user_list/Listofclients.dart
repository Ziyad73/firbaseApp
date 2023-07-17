import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text('Client List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('client').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final clients = snapshot.data?.docs.reversed.toList();
            return ListView.builder(
              itemCount: clients?.length,
              itemBuilder: (context, index) {
                var client = clients?[index];
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      client?['name'] ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      client?['email'] ?? '',
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Text(client?['from'] ?? ''),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            ); // Show a loading indicator if data is not available yet
          }
        },
      ),
    );
  }
}
