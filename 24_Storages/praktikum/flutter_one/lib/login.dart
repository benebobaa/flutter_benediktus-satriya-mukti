import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'home_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false);
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  label: const Text('Name'),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    label: const Text('Phone Number'),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value != null && value.length < 5) {
                    return 'Enter min 5 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    final isValidForm = _formKey.currentState!.validate();

                    Data user = Data(
                        username: namaController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        pw: passwordController.text);

                    if (isValidForm) {
                      logindata.setBool('login', false);
                      userProvider.login(user: user);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
