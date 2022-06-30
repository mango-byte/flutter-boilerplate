import 'dart:math' as math;

mixin CustomMath {
  static List<int> getRandomRangeUniqueList(int min, int max, int count) {
    final List<int> randomNumbers = [];

    int randomTime = count;

    for (var i = 0; i < randomTime; i++) {
      final randomIndex = getRandomRange(min, max);
      if (!randomNumbers.contains(randomIndex)) {
        randomNumbers.add(randomIndex);
      } else {
        randomTime++;
      }
    }

    return randomNumbers;
  }

  static int getRandomRange(int min, int max) {
    math.Random rnd;
    rnd = math.Random();
    return min + rnd.nextInt(max - min);
  }
}
