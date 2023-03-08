import 'package:flutter/material.dart';

Padding screenButtonWidget(
    BuildContext context, IconData icon, String name, screen) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Material(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: Colors.green,
                  size: 40,
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Icon(
                  Icons.navigate_next,
                  color: Colors.deepPurple,
                  size: 30,
                ),
              ],
            ),
          )),
        ),
      ),
    ),
  );
}
