import 'package:flutter/material.dart';
import 'package:flutter_api_integration/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Login Screen Build');
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: Stack(
          children: [

            Positioned(
              top: 70,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 40,
                      spreadRadius: 8,
                      offset: const Offset(0, -10),
                    ),
                  ],
                ),

                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      right: -25,
                      child:Image.asset('assets/images/girl.jpeg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                      ),
                       ),
                      
              
                   Padding(
                     padding: const EdgeInsets.only(top: 40),
                     child: SingleChildScrollView(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                                         
                        children: [
                                         
                          SizedBox(
                            width: 200,
                            child: const Text(
                              "Welcome Back!",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                letterSpacing: .5,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                                         
                          const SizedBox(height: 10),
                                         
                          SizedBox(
                            width: 170,
                            child: Text(
                              "Sign in to continue your reading journey and\ndiscover thousands of books.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                height: 1.3,
                              ),
                            ),
                          ),
                                         
                          const SizedBox(height: 30),
                                         
                          
                        TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          labelText: "Email",
                          hintText: "Enter your email",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.deepPurple,
                            size: 20,
                          ),
                                         
                          filled: true,
                          fillColor: const Color(0xffFAFAFA),
                                         
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                                         
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                                         
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                          ),
                        ),
                                         ),
                                         
                                         const SizedBox(height: 14),
                                         
                                         
                                         TextFormField(
                        controller: passwordController,
                        obscureText: isHidden,
                                         
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                                         
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.deepPurple,
                            size: 20,
                          ),
                                         
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                                  size: 20,
                              color: Colors.grey,
                              
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 12,
                                  ),
                                  filled: true,
                          fillColor: const Color(0xffFAFAFA),
                                         
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                                         
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                                         
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                          ),
                        ),
                                         ),
                                         
                                         const SizedBox(height: 18),
                                         
                                         
                                         SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                       context, 
                                       MaterialPageRoute(
                                         builder:(context) =>  HomeScreen(),
                                          ),
                                     );
                          },
                                         
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                                         
                            elevation: 6,
                                         
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                                         
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                                         ),
                                         
                                         const SizedBox(height: 16),
                                         
                                         
                                         Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.grey,
                              fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                         ),
                                         
                       const SizedBox(height: 16),
                                          SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                                         
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                                         
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                                         
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                            size: 18,
                          ),
                                         
                          label: const Text(
                            "Continue with Google",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                                         ),
                                         
                                         const SizedBox(height: 10),
                                         
                                         
                                         SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Color(0xff1877F2),
                            size: 16,
                          ),
                                         
                          label: const Text(
                            "Continue with Facebook",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                       ),
                       const SizedBox(height: 30,),
                       
                       Center(
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                        
                          children: [
                            
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                          )
                          ),
                       ),
                       
                        ],
                                         ),
                     ),
                   ),
                  ],
                ),
              ),
            ),
          ],

            
     
        ),
      ),
      
    );
  }
}