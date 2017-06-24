// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:minibus/minibus.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    MiniBus bus;

    setUp(() {
      bus = new MiniBus();
    });

    group('On initialisation', () {
      test('Event count is 0.', () {
        expect(bus.eventCount, 0);
      });
      test('Event subscriptionCount is 0.', () {
        expect(bus.subscriptionCount, 0);
      });
    });
  });
}
