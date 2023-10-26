# :shipit:
# Null safety

## Зачем?
Null safety помогает избежать ошибок, связанных с неосторожным использованием nullable переменных.

## Причины, почему Dart получил null safety
Наверное, самой главной причиной появления null safety можно назвать переход от runtime ошибок к ошибкам компиляции. Язык не позволит разработчику случайно передать nullable переменную в функцию, которая с такими переменными не работает, что предупреждает множество проблем.

## Null
Null является типом, который наследуется от Object?. Его единственным экземпляром может быть только null. Раньше Object являлся top типом, а Null являлся bottom типом, но после появления null safety top типом стал уже Object?, а bottom типом стал Never.

## Null / null / Never / void
Null это просто класс, а null его единственный экземпляр. Стоит использовать, когда функция или метод может вернуть как конкретное значение, так и ничего. Never же используется для функций и методов, которые всегда выкинут исключение. А void стоит использовать для функций, которые ничего не вернут, к примеру, setter'ы.

## Null и generic'и
Если в generic'е явно не задать тип, с котором можно работать, то по умолчанию будет Object?, поэтому следует писать
```
someGenericClass<T extends Object> {}
```
если важно, чтобы тип T не был nullable.

## Null и Map'ы
Если попытаться достать значение по неизвестному ключу, то вернётся null. Также, если тип ключа nullable, то можно доставать значения по ключу null.