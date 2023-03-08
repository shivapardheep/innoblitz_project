import 'package:flutter/material.dart';

class storyWidget extends StatelessWidget {
  const storyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              8,
              (index) => index == 0
                  ? AnimatedContainer(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/shiva.jpg"),
                              fit: BoxFit.cover)),
                      duration: const Duration(seconds: 2),
                      child: Stack(
                        children: const [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.blue,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFfeda75),
                            Color(0xFFfa7e1e),
                            Color(0xFFd62976), //
                            Color(0xFF962fbf), //
                            Color(0xFF4f5bd5), //
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        child: CircleAvatar(
                          radius: 37,
                          backgroundImage:
                              AssetImage("assets/images/img$index.jpg"),
                        ),
                      ),
                    )),
        ),
      ),
    );
  }
}
