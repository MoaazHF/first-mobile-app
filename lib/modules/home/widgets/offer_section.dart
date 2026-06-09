import 'package:flutter/material.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      padding: const EdgeInsets.all(1),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios),
            Expanded(
              child: Image.asset(
                'assets/images/offerSection.png',
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'عروض سررريعة',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 55, 21, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
