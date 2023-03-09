import 'package:flutter/material.dart';

class InstaPostWidget extends StatelessWidget {
  const InstaPostWidget({
    super.key,
    required this.instagramIds,
  });

  final List<String> instagramIds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          8,
          (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //post head
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/images/img${index + 1}.jpg"),
                        ),
                      ),
                      Text(
                        instagramIds[index],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_horiz))
                    ],
                  ),
                  //post body
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/post${index + 1}.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  //Footer button
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border)),
                  ]),
                  //comments
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                              text: "Liked by ",
                              style: TextStyle(color: Colors.black54),
                              children: [
                                TextSpan(
                                  text: "affection_addictor_777",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: " and ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54),
                                ),
                                TextSpan(
                                  text: "Others",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ]),
                        ),
                        RichText(
                          text: const TextSpan(
                              text: "dancer_777 ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text:
                                      "Explore Kjersten's board 'Post Quotes' on Pinterest. See more ideas about quotes, post quotes, inspirational quotes.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54),
                                ),
                                TextSpan(
                                  text: " and ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54),
                                ),
                                TextSpan(
                                  text: "more...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
