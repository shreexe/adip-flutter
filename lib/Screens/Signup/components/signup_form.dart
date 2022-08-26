import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adip/Screens/Login/components/login_form.dart';
import 'package:adip/Screens/home.dart';
// ignore_for_file: prefer_const_constructors
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
String _userEmail = '';
String _password = '';

final _formKey = GlobalKey<FormState>();

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage1();
  }
}
class HomePage1 extends StatefulWidget{
  const HomePage1 ({Key? key}) : super(key:key);
  @override
  _HomePageState createState() => _HomePageState();
  
}


class _HomePageState extends State<HomePage1>{
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context){
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
              hintText: "Username/Registration ID",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value){
              if (value == null || value.trim().isEmpty){
                return 'Please enter your register ID';
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
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) => _password = value,

            ),
          ),
          const SizedBox(height: defaultPadding / 2),
           Hero(
            tag: "login_btn",
           child: ElevatedButton(
            onPressed: () {
            _trySubmitForm(context);
            },
            child: Text("Login as an Agent".toUpperCase()),
           ),
            
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
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
    print(_formKey.currentState?.validate());
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
     // Navigator.push(
      //  context,
      //  MaterialPageRoute(builder: (context) => const HomeScreen()),
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
}
