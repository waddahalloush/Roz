import 'package:flutter/material.dart';

class PlansTokenWidget extends StatelessWidget {
  const PlansTokenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 252, 10, 10),
              Color.fromARGB(255, 99, 62, 234),
              Color.fromARGB(255, 35, 17, 47),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Get Token",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.monetization_on,
                color: Colors.amber,
                size: 20,
              ),
              Spacer(),
              Text(
                "100 Token",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.message,
                color: Colors.amber,
                size: 20,
              ),
              Spacer(),
              Text(
                "5 Messages",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 15, 15, 16)),
                child: const Text(
                  "Buy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
          ),
          const Text(
            "1 \$",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
