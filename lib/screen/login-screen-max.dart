import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';
import 'package:provider/provider.dart';
// import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
import 'package:flutter_authentication_with_laravel_sanctum/animation/delayed_animation.dart';

class LoginScreenMX extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginStateMX();
  }
}

class LoginStateMX extends State<LoginScreenMX>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void submit() {
    Provider.of<Auth>(context, listen: false)
        .login(credentials: {'email': _email, 'password': _password});
    Navigator.pop(context);
  }

  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return Scaffold(
        appBar: AppBar(
          title: Text("Iniciar sesion"),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            padding: EdgeInsets.all(16.0),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: Column(
                  children: <Widget>[
                    DelayedAnimation(
                        child: ClipOval(
                      child: Image.network(
                        'https://images-cdn.9gag.com/photo/aBgwXGA_700b.jpg',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    )),
                    DelayedAnimation(
                      child: Text(
                        "Hi There",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35.0),
                      ),
                      delay: delayedAmount + 1000,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "I'm Reflectly",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35.0),
                      ),
                      delay: delayedAmount + 2000,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "Your New Personal",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      delay: delayedAmount + 3000,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "Journaling  companion",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      delay: delayedAmount + 3000,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    DelayedAnimation(
                      child: GestureDetector(
                        onTapDown: _onTapDown,
                        onTapUp: _onTapUp,
                        child: Transform.scale(
                          scale: _scale,
                          child: _animatedButtonUI,
                        ),
                      ),
                      delay: delayedAmount + 4000,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "I Already have An Account".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      delay: delayedAmount + 5000,
                    ),
                  ],
                ),
              )
                  //  Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
                  //     SizedBox(
                  //       height: 20.0,
                  //     ),
                  //      Center(

                  //   ),
                  //   ],

                  // ),
                  ),
            )));
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            'Hi Reflectly',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

//  body: Form(
//             key: _formKey,
//             child: Scrollbar(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.all(16),
//                 child: Column(children: [
//                   TextFormField(
//                       initialValue: 'al221910@gmail.com',
//                       decoration: InputDecoration(
//                           labelText: "Email", hintText: "you@domewhere.com"),
//                       onSaved: (value) {
//                         _email = value;
//                       }),
//                   TextFormField(
//                       initialValue: '123456789',
//                       decoration: InputDecoration(labelText: "Password"),
//                       onSaved: (value) {
//                         _password = value;
//                       }),
//                   SizedBox(
//                     width: double.infinity,
//                     child: FlatButton(
//                       child: Text("login"),
//                       onPressed: () {
//                         _formKey.currentState.save();

//                         this.submit();
//                       },
//                     ),
//                   )
//                 ]),
//               ),
//             ))
