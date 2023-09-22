String? emailValidator(value) {
  if (value.isEmpty) {
    return null;
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Enter a valid email!';
  }
  return null;
}

String? requiredEmailValidator(value) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Enter a valid email!';
  }
  return null;
}

String? nameValidator(value) {
  value ??= '';
  if (value.isEmpty) {
    return 'This field can not be empty';
  }
  return null;
}

String? mobileNoValidator(value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{0,10}$)';
  RegExp regExp = RegExp(patttern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  }
   else if (value.length < 10) {
    return 'Mobile number should be 10 digit';
  }
   else if (value.length > 10) {
    return 'Mobile number should be 10 digit';
  }
   else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
