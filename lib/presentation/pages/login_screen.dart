
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/bloc/login/login_bloc.dart';
import 'package:boilerplate/presentation/bloc/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc? _loginBloc;

  @override
  void initState() {
    _loginBloc = LoginBloc(LoginInitialState());
    super.initState();
  }
  @override
  void dispose() {
    _loginBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(

        ),
      ),
    );
  }
}
