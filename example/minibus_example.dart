// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:minibus/minibus.dart';

const String EVENT = "Greeting";

void hello() {
  print("Hello!");
}

void hi() {
  print("Hi!");
}

main() {
  print('\n * Event with single listener.');
  MiniBus bus1 = new MiniBus();
  bus1.subscribe(EVENT, hi);
  bus1.post(EVENT);

  print('\n * Event with multiple listeners.');
  MiniBus bus2 = new MiniBus();
  bus2.subscribe(EVENT, hi);
  bus2.subscribe(EVENT, hello);
  bus2.post(EVENT);

  print('\n * See what is connected:');
  bus1.report();
  bus2.report();
}
