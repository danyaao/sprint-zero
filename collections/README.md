# :shipit:
# Collections

# List / Set / Map
List и Set наследуются от абстрактного класса Iterable и являются generic'ами. List стоит использовать, когда важен порядок элементов. Set же стоит использовать, когда важно, какие элементы в нём вообще есть. Map используется, когда нужно хранить значения по определённым ключам.

# Как создать?
### List
```
var someList = [el1, el2];
var List<T> someList;
var someList = List.empty();
var someList = List.filled(int length, E fill);
var someList = List.from(Iterable elements);
var someList = List.generate(int length, E generator(int index));
var someList = List.of(Iterable<E> elements);
var someList = List.unmodifiable(Iterable elements);
```
Для всех конструкторов, кроме unmodifiable можно указать опциональный параметр growable, если он будет false, то нельзя будет увеличить длину списка.
### Set
```
var Set<T> someSet;
var someSet = Set();
var someSet = Set.from(Iterable elements);
var someSet = Set.identity();
var someSet = Set.of(Iterable<E> elements);
var someSet = Set.unmodifiable(Iterable<E> elements);
```
### Map
```
var someMap = {key1: val1, key2: val2};
var Map<K, V> someMap;
var someMap = Map.from(Map other);
var someMap = Map.fromEntries(Iterable<MapEntry<K, V>> entries);
var someMap = Map.fromIterable(Iterable iterable, {K key?, V value?});
var someMap = Map.fromIterables(Iterable<K> keys, Iterable<V> values);
var someMap = Map.identity();
var someMap = Map.of(Map<K, V> other);
var someMap = Map.unmodifiable(Map other);
```

# Неизменяемая коллекция
Неизменяемую коллекцию можно создать или используя const перед самой коллекцией, или используя конструктор unmodifiable.

# Отличия const и final
Если коллекция final, то нельзя поменять ссылку на коллекцию, но её содержимое можно изменять и инициализировать в runtime, однако, если коллекция const, то и все её содержимое будет инициализировано во время компиляции, а также его нельзя будет менять.

# Операции с коллекциями
При создании коллекций можно использовать операторы ... и ...?, которые распаковывают передаваемую коллекцию. Также можно использовать конструкции if else и for. Для изменения элементов коллекции можно использовать метод map, для фильтрации where, а для проверка нахождения элемента в коллекции contains.