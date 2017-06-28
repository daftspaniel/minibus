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

    group('Once an event is added', () {
      setUp(() {
        bus.subscribe("Test", () {});
      });

      test('Event count is 1.', () {
        expect(bus.eventCount, 1);
      });
      test('Event subscriptionCount is 1.', () {
        expect(bus.subscriptionCount, 1);
      });
    });

    group('Once multiple events are added', () {
      setUp(() {
        bus.subscribe("Test", () {});
        bus.subscribe("Test", () {});
        bus.subscribe("TestX", () {});
      });

      test('Event count is 2.', () {
        expect(bus.eventCount, 2);
      });
      test('Event subscriptionCount is 3.', () {
        expect(bus.subscriptionCount, 3);
      });
    });

    group('Once event is posted', () {
      int t1 = 0;
      int t1a = 0;
      int t2 = 0;

      setUp(() {
        t1 = 0;
        t1a = 0;
        t2 = 0;
        bus.subscribe("Test", () {
          t1++;
        });
        bus.subscribe("Test", () {
          t1++;
          t1a++;
        });
        bus.subscribe("TestX", () {
          t2++;
        });

        bus.post("Test");
        bus.post("TestX");
      });

      test('Tally 1 is 2.', () {
        expect(t1, 2);
      });

      test('Tally 1a is 1.', () {
        expect(t1a, 1);
      });

      test('Tally 2 is 1.', () {
        expect(t2, 1);
      });
    });
  });

  group('Events with data', () {
    MiniBus bus;
    int eventValue = 0;
    int provider() {
      return 1234;
    }

    void handler(Function dataProvider) {
      eventValue = dataProvider();
    }

    setUp(() {
      bus = new MiniBus();
    });

    group('When an event sends data', () {
      setUp(() {
        bus.subscribe("Test", handler);
      });

      test('the subscriber can get the data.', () {
        bus.post("Test", provider);
        expect(eventValue, 1234);
      });
    });
  });
}
