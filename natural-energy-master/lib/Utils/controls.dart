import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Utils/colors.dart';
import '../Utils/styles.dart';

/// This is appBar Control for app title
///
/// [title] this is for app title, it is compulsury
/// [leading] it is an [Widget] of leading control
/// [actions] it is an appbar actions
AppBar appBarControl(String title, BuildContext context,
    {bool showMoreOption,
    Widget leading,
    List<Widget> actions,
    bool hideProfile,TabBar tabBar}) {
  if (showMoreOption == null) {
    showMoreOption = true;
  }
  if (hideProfile == null) {
    hideProfile = false;
  }
  if (actions == null) {
    actions = List<Widget>();
  }
  
  return AppBar(
    iconTheme: IconThemeData(
      color: appBarIconColor, //change your color here
    ),
    title: Text(
      title,
      style: TextStyle(color: appTitleColor),
    ),
    
    backgroundColor: appBarColor,
    leading: leading,
    actions: actions,
    bottom: tabBar,
  );
}

///This is Underline Text control with Error Text
///
///[hintText] : placeholder of control
///[obscureText] : obscureText for password,default false
///[controller] : it is [TextEditingController] for get value control
///[withErrorText] : if you do not need error text in bottom of control, default is true
///[errorText] : error text of control for Ex. Enter name , show if [withErrorText] = true
///[onlyTextControl] : if you need only UnderLineTextControl without Container, if you do not need ErrorText also then [withErrorText] = false
///[controlMargin] : by default control margin bottom is 20
///[textBoxInputDecoration] : by default decoration is [TextFieldStyle]
///[onChanged] : Event of on Change control
Widget OutlineTextFieldControl(
    {String hintText,
    bool obscureText,
    TextEditingController controller,
    bool onlyTextControl,
    bool withErrorText,
    String errorText,
    int maxLines,
    EdgeInsets controlMargin,
    TextInputType keyboardType,
    List<TextInputFormatter> inputFormatters,
    InputDecoration textBoxInputDecoration,
    Function onChanged}) {
  if (withErrorText == null) {
    withErrorText = true;
  }
  if (errorText == null) {
    errorText = "";
  }
  if (onlyTextControl == null) {
    onlyTextControl = false;
  }
  if (controlMargin == null) {
    controlMargin = const EdgeInsets.only(bottom: 0);
  }
  if (textBoxInputDecoration == null) {
    textBoxInputDecoration = TextFieldStyle(hintText);
  }
  if(maxLines == null){
    maxLines = 0;
  }
  if (obscureText == null) {
    obscureText = false;
  }
  return maxLines <= 0 ? onlyTextControl
      ? TextField(
          controller: controller,
          decoration: textBoxInputDecoration,
          keyboardType: keyboardType,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
        )
      : Container(
          margin: controlMargin,
          child: Column(children: <Widget>[
            TextField(
              cursorColor: inputControlActiveColor,
              controller: controller,
              decoration: textBoxInputDecoration,
              keyboardType: keyboardType,
              obscureText: obscureText,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              style: TextStyle(fontSize: 14, height: 1.0, color: textColor),
            ),
            withErrorText
                ? errorText.isEmpty ? Text("") : ErrorText(errorText)
                : Text(""),
          ]),
        ):onlyTextControl
      ? TextField(
          controller: controller,
          decoration: textBoxInputDecoration,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          style: TextStyle(fontSize: 14, height: 1),
          inputFormatters: inputFormatters,
          onChanged: onChanged,
        )
      : Container(
          margin: controlMargin,
          child: Column(children: <Widget>[
            TextField(
              cursorColor: inputControlActiveColor,
              controller: controller,
              maxLines: maxLines,
              decoration: textBoxInputDecoration,
              keyboardType: keyboardType,
              obscureText: obscureText,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              style: TextStyle(fontSize: 14, height: 1.0, color: textColor),
            ),
            withErrorText
                ? errorText.isEmpty ? Text("") : ErrorText(errorText)
                : Text(""),
          ]),
        );
}

///This is [RaisedButtonControl] with default property and style
///
///[buttonText] : this is text of button
///[alignment] : alignment of control, default is centerLeft
///[width] : width of control, default [double.Infinity]
///[onPressed] : function for on press event
///[child] : this [Widget] for [RaisedButton] child,
///[shape] : this if for change shape for button design, default is  [RoundedRectangleBorder] with [BorderRadius] 5
Widget RaisedButtonControl(String buttonText,
    {AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,
    double width,
    Function onPressed,
    Widget child,
    ShapeBorder shape}) {
  if (child == null) {
    child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(buttonText, style: TextStyle(color: buttonTextColor)));
  }
  if (shape == null) {
    // shape = BeveledRectangleBorder(
    //   side: BorderSide.none,
    //   borderRadius: BorderRadius.circular(10),
    // );
    shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));
  }
  if (padding == null) {
    padding = const EdgeInsets.all(5);
  }
  return Container(
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: width,
    child: RaisedButton(
      shape: shape,
      color: buttonColor,
      onPressed: onPressed,
      child: child,
    ),
  );
}

///This is OutlineButtonControl for default property and styles
///
///[buttonText] : this is text of button
///[alignment] : alignment of control, default is centerLeft
///[width] : width of control, default [double.Infinity]
///[onPressed] : function for on press event
///[child] : this [Widget] for [RaisedButton] child,
///[shape] : this if for change shape for button design, default is  [RoundedRectangleBorder] with [BorderRadius] 5
Widget OutlineButtonControl(String buttonText,
    {AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,
    double width,
    Function onPressed,
    Widget child,
    ShapeBorder shape,
    BorderSide borderSide}) {
  if (alignment == null) {
    alignment = Alignment.centerLeft;
  }
  if (child == null) {
    child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Text(buttonText, style: TextStyle(color: buttonOutlineTextColor)));
  }
  if (shape == null) {
    // shape = BeveledRectangleBorder(
    //   side: BorderSide.none,
    //   borderRadius: BorderRadius.circular(8),
    // );
    shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));
  }
  if (borderSide == null) {
    borderSide = BorderSide(color: buttonColor, width: 2);
  }
  if (padding == null) {
    padding = const EdgeInsets.all(5);
  }
  return Container(
    width: width,
    alignment: alignment,
    margin: margin,
    padding: padding,
    child: OutlineButton(
      shape: shape,
      borderSide: borderSide,
      color: buttonColor,
      onPressed: onPressed,
      child: child,
    ),
  );
}

Widget ErrorText(String errorText) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(top: 5),
    child: Text(
      errorText,
      style: ErrorTextStyle(),
    ),
  );
}

Widget errorTextWidget({String errorText, bool withRetry, Function onPressed}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        child: Image.asset(
          "assets/images/error.png",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          errorText == null
              ? "Something went wrong. please try again!!"
              : errorText,
          //"There are no tips available at this time.",
          style: TextStyle(color: textColor),
        ),
      ),
      withRetry
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButtonControl("Retry", onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  }
                }),
              ],
            )
          : Text("")
    ],
  );
}

Widget loaderControl() {
  return Center(
    child: CupertinoActivityIndicator(radius: 25),
  );
}

Widget YearDropdown(
    {String lable,
    Function onChanged,
    bool featureYearOnly,
    bool pastYearOnly,
    int fromYear,
    int tillYear,
    int maxRange}) {
  List<int> _years = [];
  int _currentYear = DateTime.now().year;
  if (lable == null) {
    lable = "Select Year";
  }
  if (maxRange == null) {
    maxRange = 50;
  }
  if (fromYear == null) {
    fromYear = _currentYear - maxRange;
  }
  if (tillYear == null) {
    tillYear = _currentYear + maxRange;
  }
  if (featureYearOnly != null && featureYearOnly) {
    fromYear = _currentYear;
  }
  if (pastYearOnly != null && pastYearOnly) {
    tillYear = _currentYear;
  }
  for (int i = fromYear; i <= tillYear; i++) {
    _years.add(i);
  }
  return DropdownButtonFormField<int>(
    decoration: TextFieldStyle(lable),
    value: _currentYear,
    onChanged: (int year) {
      onChanged(year);
    },
    items: _years.map((int year) {
      return DropdownMenuItem<int>(
        value: year,
        child: Text(year.toString()),
      );
    }).toList(),
  );
}

Future<void> LoadingDialog(BuildContext context, GlobalKey key,
    {String text}) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        //Default dialog hide is 5 min
         Future.delayed(Duration(minutes: 5), () {
                          Navigator.of(key.currentContext, rootNavigator: true).pop();
                        });
        return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(key: key, children: <Widget>[
              Center(
                child: Column(children: [
                  CupertinoActivityIndicator(radius: 20),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    text == null ? "Please Wait...." : text,
                    style: TextStyle(color: loaderTextColor),
                  )
                ]),
              )
            ]));
      });
}

/// Hide popup loader
void HideLoadingDialog(GlobalKey<State> _keyLoader){
  Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
}
