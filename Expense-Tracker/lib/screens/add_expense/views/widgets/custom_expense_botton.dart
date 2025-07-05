import 'package:flutter/material.dart';

class CustomExpenseBotton extends StatelessWidget {
  const CustomExpenseBotton({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: Colors.grey.shade400,
            offset: const Offset(0, 15),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          
        },
        child: const Text(
          'SAVE',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
