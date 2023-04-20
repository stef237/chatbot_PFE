import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const AuthScreen({super.key, required this.onChangedStep});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                text: 'Bienvenue sur notre chatBot\n'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
                children: [
                  TextSpan(
                    text: 'Qui est une alternative à CHatGPT.'.toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                  'Cette Application est basé sur une intelligence artificielle permettant de vous aider dans plusieurs domaines de la vie.',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Entrer votre email'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) => value!.isEmpty ||
                                !emailRegex.hasMatch(value)
                            ? "Entrer une adresse e-mail valide s'il vous plait"
                            : null,
                        decoration: InputDecoration(
                            hintText: 'Ex: stephane.dev@domaine.tn ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide:
                                  const BorderSide(color: Colors.blueGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            )),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: !emailRegex.hasMatch(_email)
                              ? null
                              : () {
                                  if (_formkey.currentState!.validate()) {
                                    // ignore: avoid_print
                                    print(_email);
                                    widget.onChangedStep(1);
                                  }
                                },
                          child: Text(
                            'Continue'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      // RaisedButton(
                      //   Color: Theme.of(context).primaryColor,
                      //   Elevation: 0,
                      //   padding: EdgeInsets.symmetric(
                      //     vertical: 15.0,
                      //   ),
                      //   onPressed: () => print('send'),
                      // child: Text('continue'.toUpperCase(),
                      // style: TextStyle(color: Colors.white,),
                      // ),
                      // ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
