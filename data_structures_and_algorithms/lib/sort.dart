abstract class Sort {
  static List<num> quickSort({required List<num> list}) {
    if (list.length < 2) {
      return list;
    }

    final pivot = list[0];

    final elementsLess = list.where((element) => element < pivot);
    final elementsEqual = list.where((element) => element == pivot);
    final elementsHigher = list.where((element) => element > pivot);

    return [
      ...quickSort(list: elementsLess.toList()),
      ...elementsEqual,
      ...quickSort(list: elementsHigher.toList()),
    ];
  }
}
