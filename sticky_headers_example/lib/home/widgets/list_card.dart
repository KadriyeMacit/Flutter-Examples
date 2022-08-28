import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Row(
            children: [
              Image.network("https://picsum.photos/200"),
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: Text(
                  "Every city is good for travel.",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
