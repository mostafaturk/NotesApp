import 'package:flutter/material.dart';

import 'consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,  this.isLoading=false}) : super(key: key);

   final Function ()? onTap;

   final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child:  Center(
          child:isLoading?
         SizedBox(
           height: 25,
           width: 25,
           child: const CircularProgressIndicator(
             color: Colors.black,
           ),
         ) : const Text("Add",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
        ),
      ),
    );
  }
}
