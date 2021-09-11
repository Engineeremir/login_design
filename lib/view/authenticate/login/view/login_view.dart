import 'package:flutter/material.dart';
import 'package:login_design/core/base/view/base_view.dart';
import 'package:login_design/core/constants/image/image_constants.dart';
import 'package:login_design/core/extensions/context_extension.dart';
import 'package:login_design/view/authenticate/login/view_model/login_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: context.infinity,
              width: context.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.pink, Colors.blue.shade900],
                ),
              ),
            ),
            Center(
              child: Container(
                height: context.height * .6,
                width: context.width * .75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: CircleAvatar(
                        child: Icon(Icons.person, size: 60),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    buildEmailField(context),
                    buildPasswordField(context, value),
                    buildLoginButton(context),
                    buildBottomRow(value, context),
                    buildBottomDivider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: context.paddingLow,
        hintText: "Email",
      ),
    );
  }

  Widget buildPasswordField(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
          controller: viewModel.passwordController,
          validator: (value) =>
              value!.isNotEmpty ? null : "This field required",
          obscureText: viewModel.isLockOpen ? false : true,
          decoration: InputDecoration(
            contentPadding: context.paddingLow,
            hintText: "Password",
            suffixIcon: InkWell(
              onTap: () => viewModel.isLockStateChanged(),
              child: Observer(builder: (_) {
                return Icon(
                    viewModel.isLockOpen ? Icons.lock_open : Icons.lock);
              }),
            ),
          ));
    });
  }

  Row buildBottomRow(LoginViewModel viewModel, BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return Checkbox(
            fillColor: MaterialStateProperty.all(Colors.white),
            checkColor: Colors.pink,
            activeColor: Colors.white,
            value: viewModel.isCheckBoxSelected,
            onChanged: (value) => viewModel.isCheckBoxStateChanged(),
          );
        }),
        Text("Remember me", style: TextStyle(color: Colors.white)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }

  ElevatedButton buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
            Size(context.width, context.height * .07)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)))),
        backgroundColor: MaterialStateProperty.all(Color(0XFFFE5287)),
      ),
      onPressed: () {},
      child: Text(
        "LOGIN",
        style: TextStyle(color: context.colors.primaryVariant),
      ),
    );
  }

  Divider buildBottomDivider() {
    return Divider(
      color: Colors.white,
    );
  }
}
