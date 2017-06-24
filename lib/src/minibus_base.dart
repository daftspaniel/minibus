// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class MiniBus {
  final Map<String, List<Function>> subscriptions = new Map<String,
      List<Function>>();

  MiniBus() {
  }

  void subscribe(String event, Function target) {
    List <Function> subscribers;
    if (subscriptions.containsKey(event)) {
      subscribers = subscriptions[event];
    }
    else {
      subscribers = new List <Function>();
      subscriptions[event] = subscribers;
    }
    subscribers.add(target);
  }

  void post(String event) {
    if (subscriptions.containsKey(event)) {
      List <Function> subscribers = subscriptions[event];

      subscribers.forEach((Function target) {
        target();
      });
    }
  }

  String report() {
    print("Active subscriptions");
    subscriptions.keys.forEach((String key) {
      List <Function> subscribers = subscriptions[key];

      subscribers.forEach((Function target) {
        print("\t $key $target");
      });
    });
  }
}