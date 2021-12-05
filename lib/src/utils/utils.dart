class Utils {
  static String phoneNumberHideFormat(String k) {
    if (k.contains('+')) {
      List a = k.split('+').toList();
      List l = a[1].split('').toList();
      for (int i = 0; i < k.length - 1; i++) {
        if (i > 4 && i < 10) {
          l[i] = '*';
        }
      }
      k = l.join();
      return '+' + k;
    } else if (k.length == 12) {
      List l = k.split('').toList();
      for (int i = 0; i < k.length - 1; i++) {
        if (i > 4 && i < 10) {
          l[i] = '*';
        }
      }
      k = l.join();
      return '+' + k;
    } else if (k.length == 9) {
      List l = k.split('').toList();
      for (int i = 0; i < k.length - 1; i++) {
        if (i > 1 && i < 7) {
          l[i] = '*';
        }
      }
      k = l.join();
      return '+998' + k;
    } else {
      return k;
    }
  }

  static String phoneFormat(String k) {
    if (k.contains('+')) {
      String s = "";
      for (int i = 0; i < k.length; i++) {
        s += k[i];
        if (i == 3 || i == 5 || i == 8 || i == 10) {
          s += " ";
        }
      }
      return s;
    } else if (k.length == 12) {
      String s = "+";
      for (int i = 0; i < k.length; i++) {
        s += k[i];
        if (i == 2 || i == 4 || i == 7 || i == 9) {
          s += " ";
        }
      }
      return s;
    } else if (k.length == 9) {
      String s = "";
      for (int i = 0; i < k.length; i++) {
        s += k[i];
        if (i == 1 || i == 4 || i == 6) {
          s += " ";
        }
      }
      return '+998 ' + s;
    } else {
      return k;
    }
  }

  static String placeFormat(String k) {
    List l = k.split(' ').toList();
    return l[0].toString();
  }

  static String gameTimeFormat(int k) {
    if (k <= 960) {
      return k.toString() + ".m";
    } else if (k <= 5940 && k > 60 && k % 60 != 0) {
      double a = 0;
      List l = [];
      List c = [];
      String b = '';
      String f = '';
      String e = '';
      a = k / 60;
      b = a.toString();
      l = b.split('.').toList();
      f = l[1];
      c = f.split('').toList();
      if(c.length>1) {
        e = c[0]+c[1];
      }else {
        e = c[0];
      }
      return (k ~/ 60).toString() + "h." + e + 'm.';
    } else {
      return (k ~/ 60).toString() + '.h';
    }
  }

  static String ballFormat(int k) {
    if (k >= 10000) {
      return (k ~/ 1000).toString() + "k";
    } else if (k >= 1000000) {
      return (k ~/ 1000000).toString() + "mln";
    } else {
      return k.toString();
    }
  }

  static String nameFormat(String k) {
    if (k.contains(' ')) {
      List l = k.split(' ').toList();
      return l[0].toString() + ' ' + l[1].toString();
    } else {
      return k;
    }
  }

  static String shortNameFormat(String k) {
    List l = k.split(' ').toList();
    if (l.length > 1) {
      List n = l[1].toString().split('').toList();
      return l[0].toString() + ' ' + n[0].toString() + '.';
    } else {
      return k;
    }
  }

  static String dateFormat(DateTime dateTime) {
    return numberFormat(dateTime.day) +
        "." +
        numberFormat(dateTime.month) +
        "." +
        numberFormat(dateTime.year);
  }

  static String numberFormat(int num) {
    if (num < 10) {
      return "0" + num.toString();
    } else {
      return num.toString();
    }
  }

  static String positionSingleFormat(String k) {
    List l = k.split('').toList();
    return l[0].toString();
  }

  static String priceFormat(String k) {
    List l = k.split('').toList();
    if (k.length == 5) {
      l[1] = l[1] + ' ';
      return l.join();
    } else if (k.length == 6) {
      l[2] = l[2] + ' ';
      return l.join();
    } else {
      return k;
    }
  }

  static List<int> rankFormat(int k) {
    int a = 0;
    List<int> r = [];
    for (int i = 0; i < k; i++) {
      a++;
      r.add(a);
    }
    return r;
  }

  static List<int> removeId(List<int> data, int info) {
    for (int i = 0; i < data.length; i++) {
      if (data[i] == info) {
        data.removeAt(i);
        i--;
      }
    }
    return data;
  }

  static double starFormat(double k) {
    if (k == 0) {
      return 0;
    } else if (k > 0 && k <= 0.5) {
      return 0.5;
    } else if (k > 0.5 && k <= 1.2) {
      return 1;
    } else if (k > 1.2 && k <= 1.7) {
      return 1.5;
    } else if (k > 1.7 && k <= 2.2) {
      return 2;
    } else if (k > 2.2 && k <= 2.7) {
      return 2.5;
    } else if (k > 2.7 && k <= 3.2) {
      return 3;
    } else if (k > 3.2 && k <= 3.7) {
      return 3.5;
    } else if (k > 3.7 && k <= 4.2) {
      return 4;
    } else if (k > 4.2 && k <= 4.7) {
      return 4.5;
    } else if (k > 4.7 && k <= 5) {
      return 5;
    } else {
      return k;
    }
  }
}