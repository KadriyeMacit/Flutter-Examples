import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> colors = ["pink", "blue", "orange", "yellow"];
  final List<String> books = [
    "Son Sınıf",
    "Aşk ve Gurur",
    "Dikenler ve Güller Sarayı",
    "Çırpınan Kanatlar Evi"
  ];

  int selectedIndex = -1;
  List selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: colors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedIndex == index) {
                            selectedIndex = -1;
                          } else {
                            selectedIndex = index;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedIndex == index
                                ? Colors.cyan
                                : Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            colors[index],
                            style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedList.contains(books[index])) {
                            selectedList.remove(books[index]);
                          } else {
                            selectedList.add(books[index]);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedList.contains(books[index])
                                ? Colors.deepPurple
                                : Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            books[index],
                            style: TextStyle(
                                color: selectedList.contains(books[index])
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
