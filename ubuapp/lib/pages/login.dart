import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Form(
        child: Column(
            children: <Widget>[
            TextFormField(
              controller: emailController,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Input email please';
                }
                return null;
              },
              // decoration: InputDecoration(
              //   border: OutlineInputBorder(),
              //   labelText: 'Email',
              // ),
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Input password please';
                }
                return null;
              },
              // decoration: InputDecoration(
              //   border: OutlineInputBorder(),
              //   labelText: 'Password',
              // ),
            ),
            TextButton(
              onPressed: () async {
                print("I'm clicked...");
                print("email: ${emailController.text}");
                print("password: ${passwordController.text}");
                var email = emailController.text; //'dssi@ubu.ac.th';
                var password = passwordController.text; //'1234567890';
                var pb = PocketBase('http://127.0.0.1:8090');
                var result = await pb.admins.authWithPassword(email, password);
                print(pb.authStore.isValid);
                print(pb.authStore.token);
                if (pb.authStore.isValid) {
                  // goto list of courses?
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/home');
                  //Navigator.of(context).push(
                  //    MaterialPageRoute(builder: (cxt) => AnimateLogoPage()));
                }
              },child: Text('Login')
            ),
          ],
        ),
      ),
    );
  }
}
