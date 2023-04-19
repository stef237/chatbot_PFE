import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const PasswordScreen({super.key, required this.onChangedStep});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isSecret = true;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () => widget.onChangedStep(0),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                Text(
                  'password'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Entrer votre password'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              setState(() => _password = value),
                          validator: (value) => value!.length < 6
                              ? "Entrer un password valide, minimum 6 caractères."
                              : null,
                          obscureText: _isSecret,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () =>
                                    setState(() => _isSecret = !_isSecret),
                                child: Icon(!_isSecret
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: 'Ex: steph_Dev123 ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide:
                                    const BorderSide(color: Colors.blueGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
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
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: _password.length < 6
                                ? null
                                : () {
                                    if (_formkey.currentState!.validate()) {}
                                  },
                            child: Text(
                              'Continue'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
