import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Showdata extends StatefulWidget {
  const Showdata({Key? key}) : super(key: key);

  @override
  State<Showdata> createState() => _ShowdataState();
}

class _ShowdataState extends State<Showdata> {
  List allresults = [];
  List results = [];
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    search.addListener(searchfun);
    super.initState();
  }

  searchfun() {
    searchResultList();
  }

  searchResultList() {
    var showResult = [];
    if (search.text != '') {
      for (var clientshots in allresults) {
        var name = clientshots['name'].toString().toLowerCase();
        var type = clientshots['from'].toString().toLowerCase();
        if (name.contains(search.text.toLowerCase())) {
          showResult.add(clientshots);
        } else if (type.contains(search.text.toLowerCase())) {
          showResult.add(clientshots);
        }
      }
    } else {
      showResult = List.from(allresults);
    }
    setState(() {
      results = showResult;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('client')
        .orderBy('name')
        .get();
    setState(() {
      allresults = data.docs;
    });
  }

  @override
  void dispose() {
    search.removeListener(searchfun);
    search.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CupertinoSearchTextField(controller: search)),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index]['name']),
            subtitle: Text(results[index]['email']),
            trailing: Text(results[index]['from']),
          );
        },
      ),
    );
  }
}
