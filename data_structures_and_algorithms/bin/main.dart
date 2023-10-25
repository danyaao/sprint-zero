import 'package:data_structures_and_algorithms/knapsack_problem.dart';
import 'package:data_structures_and_algorithms/linked_list.dart';
import 'package:data_structures_and_algorithms/sort.dart';

void main() {
  print('Quick sort\n');

  final listToSort = [5, 4, 3, 2, 1];
  print('List before sort - $listToSort');

  final sortedList = Sort.quickSort(list: listToSort);
  print('List after sort - $sortedList\n\n\n');

  print('Knapsack problem\n');

  final n = 3;
  final w = 4;
  final weights = <int>[3, 4, 1];
  final prices = <int>[20, 30, 15];

  final answer = KnapsackProblem.getSolution(
    n: n,
    w: w,
    weights: weights,
    prices: prices,
  );

  print('Solution\'s indexes - $answer\n\n\n');

  print('Linked list\n');

  final list = LinkedList<int>.withInitialValue(initialValue: 1);

  print(list.toString());

  list.add(value: 2);
  list.add(value: 3);

  print(list.toString());

  list.remove();

  print(list.toString());

  final anotherList = LinkedList();

  print(anotherList.toString());
}
