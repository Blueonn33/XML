# Въведение

## Какво е XPath

Това е основен елемент от стандарта XSLT. Той може да се използва за навигация през елементи и атрибути в XML документ.

- XPath е съкращение от XML Path Language
- Използва синтаксис, подобен на път, за да идентифицира и навигира възли в XML документ
- Съдържа над 200 вградени функции
- Той е основен елемент в стандарта XSLT
- Препоръчан е от W3C

## Изрази за път

XPath използва изрази за пътища, за да избира възли или набори от възли в XML документ. Тези изрази за пътища много приличат на изразите за пътища, които се използват в традиционните компютърни файлови системи

## Стандартни функции

Включва над 200 функции
Има функции за низови стойности, числови стойности, булеви стойности, сравнение на дата и час, манипулиране на възли, манипулиране на последователности и много други

XPath изразите могат да се използват в JavaScript, Java, XML Schema, PHP, Python, ..

## XPath се използва в XSLT

XPath е основен елемент в стандарта XSLT

# XPath възли

## Терминология

### Възли

В XPath има 7 вида възли:
- елемент;
- атрибут;
- текст;
- пространство от имена;
- инструкция за обработка;
- коментар;
- коренни възли;

XML документите се третират като дървета от възли. Най-горният елемент на дървото се нарича *коренен елемент*

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>
  <book>
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
</bookstore>
```

<bookstore> - коренен възел
<author>J K. Rowling</author> - елементен възел
<title lang="en"> - lang е атрибутен възел

### Атомни стойности

Това са възли без деца или родители - J K. Rowling, "en"

### Елементи

Те са атомни стойности или възли

### Връзка на възлите

#### Родител

Всеки елемент и атрибут има един родител. В следния пример елементът *book* е родител на *title, author, year, price*

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

#### Деца

Възлите на елементите могат да имат 0, 1 или повече деца. В следния пример елементите *title, author, year, price* са всички деца на елемента book

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

#### Братя и сестри

Възли, които имат един и същ родител. В примера *title, author, year, price* са братя и сестри

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

#### Предци

Родителят на възел, родителят на родителя и т.н. В примера предците на елемента *title* са елементът *book* и *bookstore*

<bookstore>

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

</bookstore>

#### Потомци

Деца на възел, деца на деца и т.н. В примера наследниците на елемента *bookstore* са елементите *book, title, author, year, price*

<bookstore>

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

</bookstore>

#