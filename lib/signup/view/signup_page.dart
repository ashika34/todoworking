import 'package:flutter/material.dart';
import 'package:todoapp/login/login.dart';
import 'package:todoapp/signup/repo/signup_repo.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

  final TextEditingController Name = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  final TextEditingController PhoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                      child: Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please fill this field";
                            }
                          },
                        controller: Name,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'FullName'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                           validator: (value) {
                            if(value!.isEmpty){
                              return "Please fill this field";
                            }
                          },
                          controller: Email,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Email'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                           validator: (value) {
                            if(value!.isEmpty){
                              return "Please fill this field";
                            }
                          },
                          controller: Password,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Password'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                           validator: (value) {
                            if(value!.isEmpty){
                              return "Please fill this field";
                            }
                          },
                          controller: PhoneNumber,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Phone Number'),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          onPressed: ()async {
                            if(_formKey.currentState!.validate())
                            await SignupRepo().createUser(
                              Name.text,
                             Email.text,
                              PhoneNumber.text,
                               Password.text, 
                               context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                          },
                          child: Text('Register'),
                          ),
                        ),
                      
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
