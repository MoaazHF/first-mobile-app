import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Image.asset('assets/images/Banner.png', width: 150),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 30, 5, 5),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: const Column(
                children: [
                  Text(
                    'عدد أكثر و خصم أكبر!',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  Text(
                    'ابدأ تجربة الطلب الجماعي ووفر حتى 30% من قيمة طلبك!',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
