import 'package:flutter/material.dart';
import 'package:simple_login_ui/components/facebook_button.dart';
import 'package:simple_login_ui/components/google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // variable to determine state of password visibility
  bool passwordVisibility = true;

  // function to show password
  void showPasswordVisibility() {
    // change the state of password visibility
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
    //return passwordVisibility;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // text
        const Text('Email'),
        // email input field
        emailInputField(),

        // text
        const Text('Password'),
        // password input field
        passwordInputField(),

        // forgot password
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),

        const SizedBox(height: 4),
        // login button
        loginButton(),

        // sign in with other option
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // divider
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade400,
                  indent: 4,
                  endIndent: 10,
                ),
              ),
              //SizedBox(width: 4),

              // text
              const Text('OR'),

              //SizedBox(width: 4),

              // divide
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade400,
                  indent: 10,
                  endIndent: 4,
                ),
              ),
            ],
          ),
        ),

        // sign in with facebook
        const Center(child: SignInWithFacebookButton()),

        // sign in with google
        const Center(child: SignInWithGoogleButton()),

        // new member
        const Center(
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: 'Don\'t Have An Account? ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            )
          ])),
        )
      ],
    );
  }

// custom widgets

  // emailField widget
  Widget emailInputField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          hintText: 'Enter Email Address',
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
          prefixIcon: const Icon(
            Icons.email_outlined,
            size: 16,
          ),
          border: const OutlineInputBorder()),
    );
  }

  // passwordField widget
  Widget passwordInputField() {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: passwordVisibility,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          hintText: 'Enter Password',
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            size: 16,
          ),
          suffixIcon: IconButton(
              onPressed: showPasswordVisibility,
              icon: passwordVisibility
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      size: 16,
                    )
                  : const Icon(
                      Icons.visibility_outlined,
                      size: 16,
                    )),
          border: const OutlineInputBorder()),
    );
  }

  // loginButton widget
  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        print('Button is pressed');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
            child: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        )),
      ),
    );
  }
}
