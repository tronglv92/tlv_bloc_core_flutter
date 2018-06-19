import 'package:tlv_bloc_core_flutter_master/screens/login/login_bloc.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/error_response.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/login.dart';
import 'package:flutter/material.dart';
import 'package:tlv_bloc_core_flutter_master/app_provider.dart';
import 'package:tlv_bloc_core_flutter_master/models/request/login_request.dart';
class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> implements LoginScreenContract{
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final emailController = new TextEditingController();
  final passwordController=new TextEditingController();
  LoginBloc loginBloc;

  _login(){
    if(loginBloc!=null)
      {
        var email=emailController.text;
        var password=passwordController.text;
        LoginRequest loginRequest = new LoginRequest(email: email,
            password: password,
            device_token: "a437dd18254449779569cc1322a87791a426ad0c3e33aaf92379fac65d89758e",
            device_platform: "ios"
        );
        loginBloc.login.add(loginRequest);
      }

  }

//  LoginScreenState()
//  {
//    loginBloc=AppProvider.of(context).loginBloc;
//  }
  _initBloc(BuildContext context)
  {
    loginBloc= AppProvider.of(context).loginBloc;
    if(loginBloc.view==null)
      loginBloc.view=this;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _initBloc(context);


    return new Scaffold(
      key: scaffoldKey,
      body: new Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("Email"),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new TextField(
                style: new TextStyle(fontSize: 14.0, color: Colors.black),

                decoration: new InputDecoration(
                    hintText: "Email",
                    hintStyle: new TextStyle(
                        fontSize: 14.0, color: Colors.black),
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(4.0),
                        borderSide: new BorderSide(
                            width: 1.0, color: Colors.black)
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 10.0)

                ),

                controller: emailController,
              ),
            ),
            new Text("Password"),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new TextField(
                style: new TextStyle(fontSize: 14.0, color: Colors.black,),
                decoration: new InputDecoration(
                  hintText: "Password",
                  hintStyle: new TextStyle(fontSize: 14.0, color: Colors.black),
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      borderSide: new BorderSide(
                          width: 1.0, color: Colors.black)
                  ),
                  contentPadding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                ),


                controller: passwordController,

              ),
            ),
            new Center(

              child: new RaisedButton(onPressed: _login,
                child: new Text("Login",style: new TextStyle(color: Colors.white),),
                color: Colors.blue,),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onLoginError(ErrorResponse error) {
    // TODO: implement onLoginError
    print("Error");
    print(error);
  }

  @override
  void onLoginSuccess(Login login) {
    // TODO: implement onLoginSuccess
    print("Login");
    print(login);
    Navigator.of(context).pushNamed('/home');
  }

}