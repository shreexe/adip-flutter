
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adip/Screens/Login/home.dart';
import 'package:adip/components/background.dart';
// ignore_for_file: prefer_const_constructors
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

String _userEmail = '';
String _password = '';

final _formKey = GlobalKey<FormState>();

class LoginForm extends StatelessWidget {

  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Email Address",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email id';
              }
               
               if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                 return 'Please enter a valid email id';
               }
               
              return null;
            },
            onChanged: (value) => _userEmail = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                // Check if the entered email has the right format
                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                //   return 'Please enter a valid register id';
                // }
                // Return null if the entered email is valid
                return null;
              },
              onChanged: (value) => _password = value,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                _trySubmitForm(context);

              },
              child: Text(
                "Login as Beneficiary".toUpperCase(),
              ),
            ),
          ),
          
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],

      ),
  
    );
    
  }
  void _trySubmitForm(context) {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      aunthenticateUser();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
      /*
      Continute proccessing the provided information with your own logic
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
    else{
      debugPrint('Everything looks bad!');
    }
  }

   aunthenticateUser() async {
     _initializeFirebase();
     print("jasviram init");

      //  Future<User?> signInUsingEmailPassword({
      //   required String email,
      //   required String password,
      //   required BuildContext context,
      // }) async {
                FirebaseAuth auth = FirebaseAuth.instance;
                User? user;
                try {
                  print("jasviram try");
                  UserCredential userCredential = await auth.signInWithEmailAndPassword(
                    email: _userEmail,
                    password: _password,
                  );
                  user = userCredential.user;
                  print('Jasviram ${userCredential}');
                  if(userCredential.additionalUserInfo?.isNewUser == false){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }

                } on FirebaseAuthException catch (e) {
                  showAlertDialog(context);
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided.');
                  }
                }
                // return user;
    // }
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(context);}
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Invalid login"),
      content: Text("Try again"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
