import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CommonCheckBoxRow extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;
  final String labelType; // "1" => Terms & Conditions | else => Keep me signed in
  final String? errorText;

  const CommonCheckBoxRow({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.labelType,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  side: const BorderSide(
                    color: Color.fromRGBO(20, 73, 255, 1),
                    width: 1.5,
                  ),
                ),
              ),
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                value: isChecked,
                onChanged: onChanged,
                activeColor: const Color.fromRGBO(20, 73, 255, 1),
                checkColor: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: labelType == "1"
                  ? RichText(
                text: TextSpan(
                  text: "I agree to ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    height: 1.2,
                    color: const Color.fromRGBO(38, 39, 42, 1),
                  ),
                  children: [
                    TextSpan(
                      text: "Terms & Conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: const Color.fromRGBO(233, 29, 39, 1),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        /*  final url = AuthRepository().termBase;
                          const title = "Terms & Conditions";

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WebViewScreen(
                                url: url,
                                title: title,
                                type: 'terms',
                              ),
                            ),
                          );*/
                        },
                    ),
                  ],
                ),
              )
                  : Text(
                "Keep me signed-in",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        // Inline error text
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4),
            child: Text(
              errorText!,
              style: TextStyle(
                color: const Color.fromRGBO(233, 29, 39, 1),
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 1,
                letterSpacing: 0.004,
              ),
            ),
          ),
      ],
    );
  }
}
