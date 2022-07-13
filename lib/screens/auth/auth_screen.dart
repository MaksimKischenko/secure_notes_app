
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/data/data.dart';
import 'package:secure_notes_app/data/local/preferences_helper.dart';
import 'package:secure_notes_app/generated/translations.g.dart';
import 'package:secure_notes_app/navigation.dart';
import 'package:secure_notes_app/styles.dart';
import 'package:secure_notes_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AuthScreen extends StatefulWidget {
  static const pageRoute = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _formKey = GlobalKey<FormState>();
  final _loginFocusNode = FocusNode();
  final _passwordFocusNode  = FocusNode();

  String? _login;
  String? _password;

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  @override
  void dispose() {
    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: ((context, state) {
        if(state is AuthSuccessLogin) {
          _onAuthSuccessLogin();
        } 
        if(state is AuthUnSuccessLogin) {
  
        }
      }),
      child: Material(
          child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
              border: const Border(bottom: BorderSide.none),
              leading: Container(),
              trailing: Text(TranslationProvider.of(context).locale.languageTag.toUpperCase(), style: AppStyles.headerTextStyleLess),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         AppTextField(
                          labelText: TranslationProvider.of(context).translations.screens.auth.loginField.title,
                          initialValue: 'maksim',
                          focusNode: _loginFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return TranslationProvider.of(context).translations.screens.auth.validation.message;
                            }
                            return null;                      
                          },
                          onSaved: (value) {
                            _login = value;
                          },                    
                          onFieldSubmitted: (_) {
                            _loginFocusNode.unfocus();
                            FocusScope.of(context).requestFocus(_passwordFocusNode);
                          },                    
                        ),
                        const SizedBox(height: 24),
                        AppPasswordField(
                          labelText: TranslationProvider.of(context).translations.screens.auth.passwordField.title,
                          initialValue: '123456',
                          focusNode: _passwordFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return TranslationProvider.of(context).translations.screens.auth.validation.message;
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                          onFieldSubmitted: (_) {
                            _onAuthTap();
                          },                                        
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 300,                
                          child: CupertinoButton(
                            color: AppStyles.mainColor,
                            child: Text(TranslationProvider.of(context).translations.screens.auth.authButton, style: AppStyles.buttonTextColor), 
                            onPressed: () {
                              _onAuthTap();
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        )
    ));
  }

  void _onAuthTap() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context.read<AuthBloc>().add(AuthRun(
        login: _login ?? '',
        password: _password ?? '',
      ));
    }
  }  


  Future<void> getCredentials () async{
    final credantials = await PreferencesHelper.getCredentials();
    _login = credantials.item1;
    _password = credantials.item2;
  }


  void _onAuthSuccessLogin() {
    Navigation.toCatalog();
  }
}