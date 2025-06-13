import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_auth/animation_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerfail;
  late RiveAnimationController controllerLookDownRight;
  late RiveAnimationController controllerLookDownLeft;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testEmail = 'ahmed@gmail.com';
  String testPassword = '123456';
  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerfail);
    riveArtboard?.artboard.removeController(controllerLookDownRight);
    riveArtboard?.artboard.removeController(controllerLookDownLeft);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addSpecifcAnimationAction(
      RiveAnimationController<dynamic> neededAnimationAction) {
    removeAllControllers();
    riveArtboard?.artboard.addController(neededAnimationAction);
  }

  @override
  void dispose() {
    passwordFocusNode.removeListener;
    super.dispose();
  }

  void addControllerIdle() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint('Controller Idle added');
  }

  void addControllerHandsUp() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint('Controller HandsUp added');
  }

  void addControllerHandsDown() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint('Controller HandsDown added');
  }

  void addControllerSuccess() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
    debugPrint('Controller Success added');
  }

  void addControllerfail() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerfail);
    debugPrint('Controller Fail added');
  }

  void addControllerLookDownRight() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookDownRight);
    debugPrint('Controller LookDownRight added');
  }

  void addControllerLookDownLeft() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookDownLeft);
    debugPrint('Controller LookDownLeft added');
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addSpecifcAnimationAction(controllerHandsUp);
      } else if (!passwordFocusNode.hasFocus) {
        addSpecifcAnimationAction(controllerHandsDown);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerfail = SimpleAnimation(AnimationEnum.fail.name);
    controllerLookDownRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookDownLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);

    rootBundle.load('assets/login.riv').then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(controllerIdle);
        setState(() => riveArtboard = artboard);
      },
    );
    checkForPasswordFocusNodeToChangeAnimationState();
  }

  void validateEmailAndPassword() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (formKey.currentState!.validate()) {
          addControllerSuccess();
        } else {
          addControllerfail();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Rive',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: riveArtboard == null
                    ? const SizedBox.shrink()
                    : Rive(artboard: riveArtboard!),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          value != testEmail ? 'Wrong email' : null,
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            value.length < 16 &&
                            !isLookingLeft) {
                          addSpecifcAnimationAction(controllerLookDownLeft);
                        } else if (value.isNotEmpty &&
                            value.length > 16 &&
                            !isLookingRight) {
                          addSpecifcAnimationAction(controllerLookDownRight);
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),
                    TextFormField(
                      obscureText: true,
                      validator: (value) =>
                          value != testPassword ? 'Wrong password' : null,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      focusNode: passwordFocusNode,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 18),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 8,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        onPressed: () {
                          passwordFocusNode.unfocus();
                          validateEmailAndPassword();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
