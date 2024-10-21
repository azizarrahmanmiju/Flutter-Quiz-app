import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userinfo extends StatelessWidget {
  Userinfo({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 3, color: Colors.white)),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: Text(
                      softWrap: true,
                      name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const Text(
                    "beginer",
                    style: TextStyle(
                      color: Color.fromARGB(255, 217, 217, 219),
                    ),
                  )
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
            ],
          ),
        ),

        // Add some space
      ],
    );
  }
}
