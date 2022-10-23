import 'dart:convert';

import 'package:doctorapp/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  void login(String email, String password) async{
    //demo email eve.holt@reqres.in
    //demo pass cityslicka
    try{
      Response response= await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email':email,
            'password':password
          }
      );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data['token']);
        print('login successfull');
      }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_hospital_sharp,
                  color: Color.fromRGBO(255, 190, 109, 1),
                  size: 100,),
                SizedBox(height: 40,),
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 60,
                  ),),
                SizedBox(height: 20,),
                Text(
                  'Welcome back , It\'s nice to see you :)',
                  style:  GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  )),
                SizedBox(height: 65,),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),

                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:  'Enter your email'
                        ),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //passw txtfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),

                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:  'Enter your password',

                        ),),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: GestureDetector(
                    onTap: (){
                      login(_emailController.text.toString().trim(),
                          _passwordController.text.toString().trim());
                     // Navigator.pushNamed(context,HomePage.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },

                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 190, 109, 1),
                          borderRadius: BorderRadius.circular(20)

                      ),
                      child: Center(child: Text('Sign in',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),)),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //not a member register now?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),),
                    GestureDetector(
                      onTap: (){
                        //Navigator.pushNamed(context,LoginPage.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Text('  Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 190, 109, 1),
                          fontSize: 14,
                        ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
