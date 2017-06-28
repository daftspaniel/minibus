// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:minibus/minibus.dart';

const String EVENT = "Greeting";
const String ANOTHER_EVENT = "Goodbye";

void hello() {
  print("\tHello!");
}

void hi() {
  print("\tHi!");
}

void bye() {
  print("\tBye!");
}

main() {
  print('\n * Event with single listener.\n');
  MiniBus bus1 = new MiniBus();
  bus1.subscribe(EVENT, hi);
  bus1.post(EVENT);

  print('\n * Event with multiple listeners.\n');
  MiniBus bus2 = new MiniBus();
  bus2.subscribe(EVENT, hi);
  bus2.subscribe(EVENT, hello);
  bus2.subscribe(ANOTHER_EVENT, bye);
  bus2.post(EVENT);

  print('\n * See what is connected:\n');
  bus1.report();
  bus2.report();

  print('\n * Get some data with and event:\n');
  MiniBus bus3 = new MiniBus();
  int eventValue;
  int provider() {
    return 1234;
  }

  void handler(Function dataProvider) {
    eventValue = dataProvider();
  }

  bus3.subscribe("Test", handler);
  bus3.post("Test", provider);
  print('   event returned ${eventValue}');
  bus3.report();
}
