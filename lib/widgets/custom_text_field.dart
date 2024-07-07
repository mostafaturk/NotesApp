import 'package:flutter/material.dart';

import 'consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, this.maxLines=1, this.onSaved, this.onChange});

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final  Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChange,
      validator:(val) {
        if(val?.isEmpty ?? true){
          return "Field is require";
        }
      },
      cursorColor: kprimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(

        hintText: hint,
         hintStyle: TextStyle(
           color: kprimaryColor,
         ),

         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
           borderSide: BorderSide(
             color: Colors.white
           )
         ),
          enabledBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
            color: Colors.white
        )
    ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: kprimaryColor,
            )
        ),
      ),
    );
  }
}
