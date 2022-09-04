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

import 'book_data.dart';
import 'package:flutter/material.dart';

Color backgroundColor = Colors.grey.shade900;

const kAppBarTextStyle = TextStyle(color: Colors.white, fontSize: 20);
const kSubtitleTextStyle = TextStyle(color: Colors.white, fontSize: 14);

List<Book>cartItems = [];

var readBook = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur 
ullamcorper volutpat leo ac pulvinar. Class aptent taciti sociosqu ad 
litora torquent per conubia nostra, per inceptos himenaeos. Quisque 
vehicula quis metus non tincidunt. Duis ac nisi a mi maximus accumsan 
quis ac velit. Aliquam non ipsum fringilla, cursus augue vel, porta nisl. 
Sed vel nibh vitae neque scelerisque convallis. Integer congue facilisis 
tincidunt. Nulla facilisi. Nam id pretium massa. Cras interdum ac diam
sit amet finibus. Cras nulla sem, viverra ac maximus posuere, lobortis 
non orci. Morbi non erat et purus posuere imperdiet eget vitae nunc. 
Nunc venenatis ante in enim sagittis, a maximus tortor rutrum. Duis dictum 
iaculis commodo. Sed ullamcorper vel mi eu rutrum.

Phasellus pharetra varius dolor ac vulputate. Proin rhoncus lorem ut nunc 
egestas, et faucibus magna elementum. Vestibulum rutrum in turpis quis dapibus. 
Quisque nec nisl porttitor, mollis purus eu, faucibus velit. Aenean eu luctus 
massa. Vestibulum tempor sit amet velit nec dignissim. Nulla vitae mauris 
porttitor, iaculis purus quis, faucibus velit. Fusce eget pharetra velit.

Donec cursus bibendum tristique. Praesent odio ligula, placerat in convallis at, 
tempus nec nibh. Ut sodales mattis sem vel rutrum. Donec venenatis felis 
pellentesque urna malesuada tincidunt. Phasellus eget lectus tortor. Mauris 
accumsan lacus eu efficitur vulputate. Morbi eget faucibus odio. Lorem ipsum 
dolor sit amet, consectetur adipiscing elit. Cras venenatis nulla at faucibus 
molestie.

Suspendisse in justo a mi iaculis laoreet. Ut auctor ultricies ligula, eu 
blandit velit rutrum id. Aliquam vitae felis tortor. Sed tempor felis mauris. 
Aenean velit tellus, blandit id leo quis, ullamcorper ornare ante. Morbi a 
hendrerit ipsum, vitae ullamcorper sem. Nullam molestie lacus sed finibus 
molestie. Etiam condimentum leo vitae mauris molestie, a ullamcorper magna 
mattis. In quis varius velit. Duis mollis elit ut nunc pulvinar imperdiet. 
Nam tristique porttitor interdum. Vivamus non neque nec libero semper 
fringilla a vel enim. Duis ut ex nec felis interdum lobortis. Suspendisse 
lacus nulla, pharetra eget neque vitae, varius condimentum neque. Integer 
hendrerit nunc sit amet est imperdiet volutpat.

Fusce sodales nibh nec magna commodo scelerisque. Nullam urna orci, tristique 
a eros a, pulvinar luctus ante. Suspendisse sem magna, tincidunt a tempor non, 
sodales at arcu. Cras mattis turpis ut nunc bibendum laoreet. Pellentesque 
sit amet cursus justo. Suspendisse sollicitudin finibus molestie. Vivamus 
lobortis mi lacus, finibus ultricies nulla auctor in. Quisque volutpat diam 
id eros euismod fringilla. Curabitur scelerisque diam non ornare congue. 
Aliquam eleifend urna sit amet tellus lacinia commodo. 
''';
