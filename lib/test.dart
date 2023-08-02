import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              'Choose Category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(children: [
              CategoryButton(
                svg: 'assets/candy.svg',
                label: 'Tech',
                selected: false,
              ),
              CategoryButton(
                svg: 'assets/candy.svg',
                label: 'Finance',
                selected: false,
              ),
              CategoryButton(
                svg: 'assets/candy.svg',
                label: 'Design',
                selected: false,
              ),
              CategoryButton(
                svg: 'assets/candy.svg',
                label: 'File',
                selected: false,
              ),
              CategoryButton(
                svg: 'assets/candy.svg',
                label: 'Music',
                selected: false,
              ),
            ])
          ]),
        ),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  CategoryButton({
    Key? key,
    required this.svg,
    required this.label,
    required this.selected,
  }) : super(key: key);
  String svg;
  String label;
  bool selected;
  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
        print(widget.selected);
      },
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: widget.selected ? Colors.blue : Colors.black,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Column(
            children: [
              SvgPicture.asset(widget.svg,
                  color: widget.selected ? Colors.white : Colors.blue),
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
    );
  }
}