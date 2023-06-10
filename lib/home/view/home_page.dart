

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  late CollectionReference _todoRef;
  late FirebaseStorage _storage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todoRef=_firestore.collection('task');
    _storage=FirebaseStorage.instance;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        
        backgroundColor: Colors.blue,
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          ),
          SizedBox(
            height: 30,

          ),
          Container(
            
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton
                    (onPressed: ()async
                     {
                      await _todoRef.add({
                        'title':titleController.text,
                        'description':descriptionController.text,
                        'userid':_auth.currentUser!.uid,

                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task added succesfully')));
                      titleController.clear();
                      descriptionController.clear();
                      
                    },
                    child: Text('Submit'),
                  
                    ),
                  ),
                  Expanded(
                    child:StreamBuilder<QuerySnapshot>(
                      stream: _todoRef.where('userid',isEqualTo: _auth.currentUser!.uid).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final List<DocumentSnapshot>documents = snapshot.data!.docs;
                          return ListView.builder(
                            itemCount: documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = documents[index];
                              return ListTile( title: Text(data['title'].toString()),

                              );
                            },
                            );
                          
                        }
                        return CircularProgressIndicator();
                       
                      },
                    ),
                     ),
        ],
      ),
    );
  }
}
