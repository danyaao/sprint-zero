class Node<T> {
  Node({
    required this.value,
    this.next,
  });

  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) {
      return '$value';
    } else {
      return '$value -> ${next.toString()}';
    }
  }
}

class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  LinkedList();

  LinkedList.withInitialValue({
    required T initialValue,
  }) {
    add(value: initialValue);
  }

  bool get isEmpty => head == null;

  void add({
    required T value,
  }) {
    if (isEmpty) {
      head = Node(value: value);
      tail ??= head;
      return;
    }

    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  void remove() {
    if (isEmpty) {
      return;
    }

    Node<T> temp = head!;
    while (temp.next != tail) {
      temp = temp.next!;
    }
    temp.next = null;
    tail = temp;
  }

  @override
  String toString() {
    if (isEmpty) {
      return 'List is empty';
    }

    return head.toString();
  }
}
