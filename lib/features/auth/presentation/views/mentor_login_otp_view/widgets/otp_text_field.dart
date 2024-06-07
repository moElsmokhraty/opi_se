import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPTextField extends StatefulWidget {
  final OtpFieldController? controller;
  final double width;
  final double fieldWidth;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  const OTPTextField({
    super.key,
    this.width = 10,
    this.controller,
    this.fieldWidth = 30,
    this.onChanged,
    this.onCompleted,
  });

  @override
  OTPTextFieldState createState() => OTPTextFieldState();
}

class OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  late List<String> _pin;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.setOtpTextFieldState(this);
    }

    _focusNodes = List<FocusNode?>.filled(4, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(
      4,
      null,
      growable: false,
    );

    _pin = List.generate(4, (int i) {
      return '';
    });
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(4, (index) {
          return buildTextField(context, index);
        }),
      ),
    );
  }

  Widget buildTextField(BuildContext context, int index) {
    FocusNode? focusNode = _focusNodes[index];
    TextEditingController? textEditingController = _textControllers[index];
    if (focusNode == null) {
      _focusNodes[index] = FocusNode();
      focusNode = _focusNodes[index];
      focusNode?.addListener((() => handleFocusChange(index)));
    }
    if (textEditingController == null) {
      _textControllers[index] = TextEditingController();
      textEditingController = _textControllers[index];
    }

    final isLast = index == 3;

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.only(
        right: isLast ? 0 : 12.w,
      ),
      child: TextFormField(
        controller: _textControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        style: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        maxLength: 1,
        focusNode: _focusNodes[index],
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0XFF036666)),
            borderRadius: BorderRadius.circular(15.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(15.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5.w),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        onChanged: (String str) {
          if (str.length > 1) {
            _handlePaste(str);
            return;
          }
          if (str.isEmpty) {
            if (index == 0) return;
            _focusNodes[index]!.unfocus();
            _focusNodes[index - 1]!.requestFocus();
          }
          setState(() {
            _pin[index] = str;
          });
          if (str.isNotEmpty) _focusNodes[index]!.unfocus();
          if (index + 1 != 4 && str.isNotEmpty) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }

          String currentPin = _getCurrentPin();
          if (!_pin.contains(null) &&
              !_pin.contains('') &&
              currentPin.length == 4) {
            widget.onCompleted?.call(currentPin);
          }
          widget.onChanged!(currentPin);
        },
      ),
    );
  }

  void handleFocusChange(int index) {
    FocusNode? focusNode = _focusNodes[index];
    TextEditingController? controller = _textControllers[index];

    if (focusNode == null || controller == null) return;

    if (focusNode.hasFocus) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }

  String _getCurrentPin() {
    String currentPin = "";
    for (var value in _pin) {
      currentPin += value;
    }
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > 4) {
      str = str.substring(0, 4);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[3]);

    String currentPin = _getCurrentPin();
    if (!_pin.contains(null) && !_pin.contains('') && currentPin.length == 4) {
      widget.onCompleted?.call(currentPin);
    }
    widget.onChanged!(currentPin);
  }
}

class OtpFieldController {
  late OTPTextFieldState _otpTextFieldState;

  void setOtpTextFieldState(OTPTextFieldState state) {
    _otpTextFieldState = state;
  }

  void clear() {
    const textFieldLength = 4;
    _otpTextFieldState._pin = List.generate(textFieldLength, (int i) {
      return '';
    });

    final textControllers = _otpTextFieldState._textControllers;
    for (var textController in textControllers) {
      if (textController != null) {
        textController.text = '';
      }
    }

    final firstFocusNode = _otpTextFieldState._focusNodes[0];
    if (firstFocusNode != null) {
      firstFocusNode.requestFocus();
    }
  }

  void set(List<String> pin) {
    const textFieldLength = 4;
    if (pin.length < textFieldLength) {
      throw Exception(
        'Pin length must be same as field length. Expected: $textFieldLength, Found ${pin.length}',
      );
    }

    _otpTextFieldState._pin = pin;
    String newPin = '';

    final textControllers = _otpTextFieldState._textControllers;
    for (int i = 0; i < textControllers.length; i++) {
      final textController = textControllers[i];
      final pinValue = pin[i];
      newPin += pinValue;

      if (textController != null) {
        textController.text = pinValue;
      }
    }

    final widget = _otpTextFieldState.widget;

    widget.onChanged?.call(newPin);

    widget.onCompleted?.call(newPin);
  }

  void setValue(String value, int position) {
    const maxIndex = 3;
    if (position > maxIndex) {
      throw Exception(
        'Provided position is out of bounds for the OtpTextField',
      );
    }

    final textControllers = _otpTextFieldState._textControllers;
    final textController = textControllers[position];
    final currentPin = _otpTextFieldState._pin;

    if (textController != null) {
      textController.text = value;
      currentPin[position] = value;
    }

    String newPin = "";
    for (var item in currentPin) {
      newPin += item;
    }

    final widget = _otpTextFieldState.widget;
    if (widget.onChanged != null) {
      widget.onChanged!(newPin);
    }
  }

  void setFocus(int position) {
    const maxIndex = 3;
    if (position > maxIndex) {
      throw Exception(
        'Provided position is out of bounds for the OtpTextField',
      );
    }

    final focusNodes = _otpTextFieldState._focusNodes;
    final focusNode = focusNodes[position];

    if (focusNode != null) {
      focusNode.requestFocus();
    }
  }
}

class OtpFieldStyle {
  final Color backgroundColor;
  final Color borderColor;
  final Color focusBorderColor;
  final Color disabledBorderColor;
  final Color enabledBorderColor;
  final Color errorBorderColor;

  OtpFieldStyle({
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black26,
    this.focusBorderColor = Colors.blue,
    this.disabledBorderColor = Colors.grey,
    this.enabledBorderColor = Colors.black26,
    this.errorBorderColor = Colors.red,
  });
}
