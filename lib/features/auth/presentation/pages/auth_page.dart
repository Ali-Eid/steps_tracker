import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_tracker/home/page/home_page.dart';

import '../bloc/Auth/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  TextEditingController? nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessAuthState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const HomePage()));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            body: Container(
              // alignment: AlignmentDirectional.bottomCenter,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/landing.jpg'),
                // fit: BoxFit.fill,
              )),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        controller: nameController),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          BlocProvider.of<AuthBloc>(context)
                              .add(NameAuthEvent(nameController!.text));
                        },
                        child: const Text('Next'))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
