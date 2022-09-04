// Copyright (c) 2022 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended or marketed for pedagogical
// or instructional purposes related to programming, coding, application
// development, or information technology.  Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing, creation of
// derivative works or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'package:flutter/cupertino.dart';

class Book {
  final String id;
  final String name;
  final String author;
  final String description;
  final String subcription_type;
  final String image;
  final String version;

  Book(
      {required this.id,
      required this.name,
      required this.author,
      required this.description,
      required this.subcription_type,
      required this.image,
      required this.version});
}

final allbooks = [
  Book(
    id: '1',
    name: 'Data Structures & Algorithms In Dart',
    author: 'Vincent Ngo, Jonathan Sande, Kelvin Lau',
    description:
        '''Take your programming skills to the next level. Learn to build stacks, 
        queues, trees, graphs, and efficient sorting and searching algorithms 
        from scratch.''',
    subcription_type: 'PRO',
    image: 'images/dart_dsa.png',
    version: '1.0',
  ),
  Book(
    id: '2',
    name: 'Flutter Apprentice',
    author: 'Vincent Guzzi, Kevin D Moore, Vincent Ngo, Michael Katz',
    description:
        '''Build for both iOS and Android with Flutter! Flutter is a new 
        and exciting software development toolkit that lets you target 
        multiple platforms at once, so you can build apps for iOS, Android 
        and even web and desktop, all from a single codebase.''',
    subcription_type: 'Free',
    image: 'images/flutter_app_2.png',
    version: '2.0',
  ),
  Book(
    id: '3',
    name: 'Git Apprentice',
    author: 'Chris Belanger, Bhagwat Singh',
    description:
        '''Learn the basics of Git, how to set up your own repos, as well 
        as how to deal with remote syncing.''',
    subcription_type: 'Free',
    image: 'images/git_app_2.png',
    version: '2.0',
  ),
  Book(
    id: '4',
    name: 'Dart Apprentice',
    author: 'Jonathan Sande, Matt Galloway',
    description: '''Dart Apprentice will teach you all the basic concepts you 
        need to master this language. Follow along the easily and thoroughly 
        explained concepts and you will be building Dart applications 
        in a breeze.''',
    subcription_type: 'Free',
    image: 'images/dart_app.png',
    version: '2.0',
  ),
  Book(
    id: '5',
    name: 'App Design Apprentice',
    author: 'Prateek Prasad',
    description: '''The best book to guide you through designing modern 
        mobile-app UI and UX using fundamental design principles''',
    subcription_type: 'Free',
    image: 'images/app_design_app.png',
    version: '2.0',
  ),
];


class BookManager extends ChangeNotifier {
  final _bookItems = allbooks;
  int _selectedIndex = -1;

  List<Book> get bookItems => List.unmodifiable(_bookItems);

  int get selectedIndex => _selectedIndex;
  Book? get selectedBookItem =>
      _selectedIndex != -1 ? _bookItems[_selectedIndex] : null;

  void bookTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedBookItem(String id) {
    final index = bookItems.indexWhere((element) => element.id == id);
    _selectedIndex = index;
    notifyListeners();
  }
}
