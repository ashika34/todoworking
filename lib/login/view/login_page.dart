
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/home/home.dart';
import 'package:todoapp/signup/signup.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
   TextEditingController password= TextEditingController();
   final _formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Welcome Back',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        backgroundColor: Colors.blue,
    ),
                
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: TextFormField(
                        validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill this field";
                          
                        }
                        },
                        controller:email ,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1,color: Colors.grey)
                          ),
                          labelText: 'Email'
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill this field";
                          
                        }
                        },
                        controller:password ,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1,color: Colors.grey)
                          ),
                          labelText: 'Password'
                        ),
                      ),
                    ),
                     Row(
                              children: [
                                Text('Forgot password'),
                                
                              ],
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          
                      
                      SizedBox(
                      height: 30,
                    ),
                    
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(onPressed: () async{
                        try {
                          final _auth= FirebaseAuth.instance;
                          final userRef=await _auth.signInWithEmailAndPassword(
                            email: email.text,
                          password: password.text,
                           );
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                          
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid User name or passord')));

                        }
                         
                      },
                      
                      child: Text('Login'),
                    

                      ),
                      
                      ),
                  
                    SizedBox(
                      height: 20,
                    ),
                    Center(child: Text('Or')),
                    SizedBox(
                      height: 10,

                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      },
                      child: Text('Sign Up'),
                    )

                    )
                   ],
                ),),
              )
            ],
          ),
        ),
      ),


    );
    
  }
}































































































