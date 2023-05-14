import 'package:flutter/material.dart';

class TimetableModel
{
  String? subject;
  String? from;
  String? to;
  String? teacher;
  String? imageUrl;
  Color? color;
  TimetableModel({this.teacher,this.subject,this.color,this.from,this.to,this.imageUrl});

}
List<TimetableModel> periods=[
  TimetableModel(
    from: '8:00 am',
    to: '9:00 am',
    subject: 'Math',
    teacher: 'Anas "the GOAT" Allahham',
    color: Colors.lightGreen.withOpacity(0.8),
    imageUrl: 'assets/icons/subjects/math.png'
  ),
  TimetableModel(
      from: '9:00 am',
      to: '10:00 am',
      subject: 'Science',
      teacher: 'Ahmad Mohsen',
      color: Colors.amberAccent.withOpacity(0.8),
      imageUrl: 'assets/icons/subjects/science.png'
  ),
  TimetableModel(
      from: '10:00 am',
      to: '11:00 am',
      subject: 'Music',
      teacher: 'Beethoven',
      color: Colors.pinkAccent.withOpacity(0.8),
      imageUrl: 'assets/icons/subjects/music.png'
  ),
  TimetableModel(
      from: '11:00 am',
      to: '12:00 pm',
      subject: 'Geography',
      teacher: 'Christopher Colombus',
      color: Colors.blueAccent.withOpacity(0.8),
      imageUrl: 'assets/icons/subjects/geo.png'
  ),
  TimetableModel(
      from: '12:00 pm',
      to: '1:00 pm',
      subject: 'Arabic',
      teacher: 'Nizar Kabbani',
      color: Colors.grey.withOpacity(0.8),
      imageUrl: 'assets/icons/subjects/arabic.png'
  ),
  TimetableModel(
      from: '1:00 pm',
      to: '2:00 pm',
      subject: 'Sports',
      teacher: 'NEYMAR Jr',
      color: Colors.purpleAccent.withOpacity(0.8),
      imageUrl: 'assets/icons/subjects/sports.png'
  ),
];