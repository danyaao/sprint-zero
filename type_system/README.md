# :shipit:
# Система типов

## Сильная типизация
Также может называться строгой типизацией. Суть сильной типизации заключается в том, что язык программирования не позволит разработчику в одном выражении использовать разные типы. К примеру, выражение
```
1 + '1'
```
не будет корректным.

## Слабая типизация
Также может называться нестрогой типизацией. Суть слабой типизации заключается в том, что язык программирования позволит разработчику в одном выражении использовать разные типы. К примеру, выражение
```
1 + '1'
```
в некоторых языках будет возвращать '11'.

## Статическая типизация
Суть статической типизации заключается в том, что уже на этапе компиляции переменная имеет определённый тип, который не может измениться в runtime.

## Динамическая типизация
Суть динамической типизации заключается в том, что тип переменной может измениться в любой момент.

## Система типов в Dart
Dart является языком с сильной типизацией, но с некоторым исключением. К примеру, в одном выражении можно использовать int и double, переменная с типом int преобразуется к типу double, выражение выполнится и вернётся результат с типом double. Также Dart является опционально-типизированным. По умолчанию Dart статически типизирован. То есть, тип переменной определяется перед компиляцией анализатором. Однако можно явно указать тип Object? или dynamic, что позволит использовать переменную как динамически типизированную. К примеру, код
```
dynamic a = 1;
a = 'a';
```
будет корректным.

## Примитивы в Dart и класс Object
В языке Dart нет примитивов в привычном понимании. Типы int, double, bool, string и любые другие являются наследником Object. Проверить это легко, для любого типа в Dart определён метод toString() и оператор сравнения, а также getter, с помощью которого можно получить hashCode.

## var / final / const
Ключевое слово var используются для инициализации переменной, значение которой может меняться в ходе выполнения программы. Ключевое слово final используется для runtime констант, то есть переменных, которые инициализируется единожды. Ключевое слово const используется для compile time констант, то есть переменные должны быть проинициализированы во время компиляции.

## late
Ключевое слово late может использоваться, чтобы объявить переменную, значение которой нельзя установить в данный момент. Это может быть удобно, но если использовать late неосторожно, то программа может упасть в runtime с ошибкой LateInitializationError. Хорошим случаем для применения late может быть объявление переменной перед, к примеру, if else, в котором она не будет локальной.

## Dynamic
Dart изначально был динамически типизированным языком, и хотя сейчас почти всегда используется статическая типизация, осталась возможность использовать динамическую. Для этого можно использовать типы Object? и dynamic. У них почти одинаковое поведение, хотя отличия есть, к примеру, используя Object? нужно явно приводить тип
```
int someInt = someObject as int;
```
Dynamic можно использовать, когда заранее неизвестно, с каким типом данных придётся работать, к примеру, при сериализации JSON. Object? можно использовать, когда нужно явно указать, что код готов работать с любым типом данных. К примеру, setter для какого-то хранилища, в котором обрабатываются разные типы.

## Type inference
Обычно в Dart'е не нужно явно указывать тип данных при объявлении переменной, потому что анализатор сам умеет это делать. Если у него будет достаточно информации, он присвоит нужный тип, однако в противном случае переменная получит тип dynamic.
```
var someInt = 1; // runtime type - int
var someDynamic; // runtime type - dynamic
```
Поэтому стоит аккуратно использовать эту возможность, потому что иначе можно неожиданно поймать баг.