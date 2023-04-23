import 'package:easygpt/constants/config.dart';
import 'package:easygpt/ui/extensions/darkmode.extension.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EasyGPTChatTextField extends StatelessWidget {
  String? hintText;
  IconData? suffixIcon;
  bool? suffixIconIsActive = false;
  VoidCallback? suffixIconOnPressed;
  IconData? prefixIcon;
  VoidCallback? prefixIconOnPressed;
  bool? obscureText;
  TextEditingController? textfieldController;
  TextInputAction? textInputAction;
  int? minLines = 1;
  int? maxLines = 1;
  bool? enabled;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  EasyGPTChatTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.suffixIconIsActive,
    this.suffixIconOnPressed,
    this.prefixIcon,
    this.prefixIconOnPressed,
    this.obscureText,
    this.textfieldController,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.enabled,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textfieldController,
      onChanged: onChanged != null ? (newValue) => onChanged!(newValue) : null,
      style: const TextStyle(fontSize: 15),
      cursorColor: !context.isDarkMode ? Colors.black : Colors.white,
      obscureText: obscureText ?? false,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      scrollPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      validator: validator,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        hintStyle: TextStyle(
          fontSize: 15,
          height: 2,
          color: !context.isDarkMode
              ? Colors.black.withOpacity(0.5)
              : Colors.white.withOpacity(0.5),
        ),
        focusColor: Colors.black,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 50),
            width: 45,
            decoration: BoxDecoration(
              border: Config.myLocale.languageCode == "en"
                  ? Border(
                      left: BorderSide(
                        width: 1,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    )
                  : Border(
                      right: BorderSide(
                        width: 1,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    ),
            ),
            child: InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: suffixIconOnPressed,
              child: Icon(
                suffixIcon,
                weight: 23,
                color: !context.isDarkMode
                    ? suffixIconIsActive != true
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.5)
                    : suffixIconIsActive != true
                        ? Colors.white.withOpacity(0.3)
                        : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: !context.isDarkMode
                ? const Color(0xffF1F1F1).withOpacity(0.5)
                : const Color(0xffF1F1F1).withOpacity(0.1),
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: !context.isDarkMode
                ? const Color(0xffF1F1F1).withOpacity(0.5)
                : const Color(0xffF1F1F1).withOpacity(0.3),
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: !context.isDarkMode
                ? const Color(0xffF1F1F1).withOpacity(0.9)
                : const Color(0xffF1F1F1).withOpacity(0.5),
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: !context.isDarkMode
                ? const Color(0xffF1F1F1).withOpacity(0.5)
                : const Color(0xffF1F1F1).withOpacity(0.1),
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
        ),
        errorMaxLines: 1,
        errorStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: !context.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      inputFormatters: [
        TextInputFormatter.withFunction(
          (oldValue, newValue) {
            return newValue.copyWith();
          },
        )
      ],
    );
  }
}
