# Въведение

Какво е XQuery?
XQuery е за XML това, което е SQL за базите данни. XQuery е предназначен за заявки към XML данни

## Пример

```xquery
for $x in doc("books.xml")/bookstore/book
where $x/price > 30
order by $x/title
return $x/title
```

## Какво е XQuery

- Това е езикът за заявки към XML данни
- XQuery за XML е като SQL за базите данни
- XQuery е изграден върху XPath изрази
- Езикът се поддържа от всички основни бази данни
- Препоръчан е от W3C

### XQuery е за заявки към XML

XQuery е език за намиране и извличане на елементи и атрибути от XML документи. Ето пример за това какво може да реши XQuery:

--- Избери всички CD записи с цена под $10 от колекцията CD, съхранена в cd_catalog.xml ---

## XQuery и XPath

XQuery 1.0 и XPath 2.0 споделят един и същ модел на данни и поддържат едни и същи функции и оператори. 

## XQuery - примери за употреба

XQuery може да се използва за:
- Извличане на информация за използване в уеб услуга;
- Генериране на обобщени отчети;
- Трансформиране на XML данни в XHTML;
- Търсене на уеб документи за подходяща информация;

## XQuery е препоръчан от W3C

XQuery е съвместим с няколко стандарта на W3C като XML, Namespaces, XSLT, XPath и XML Schema. XQuery 1.0 стана препоръка на W3C през 2007

# Пример за XQuery

Ще използваме следния документ

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>

    <book category="COOKING">
        <title lang="en">Everyday Italian</title>
        <author>Giada De Laurentiis</author>
        <year>2005</year>
        <price>30.00</price>
    </book>

    <book category="CHILDREN">
        <title lang="en">Harry Potter</title>
        <author>J K. Rowling</author>
        <year>2005</year>
        <price>29.99</price>
    </book>

    <book category="WEB">
        <title lang="en">XQuery Kick Start</title>
        <author>James McGovern</author>
        <author>Per Bothner</author>
        <author>Kurt Cagle</author>
        <author>James Linn</author>
        <author>Vaidyanathan Nagarajan</author>
        <year>2003</year>
        <price>49.99</price>
    </book>

    <book category="WEB">
        <title lang="en">Learning XML</title>
        <author>Erik T. Ray</author>
        <year>2003</year>
        <price>39.95</price>
    </book>

</bookstore>
```

## Как да изберем възли от books.xml

### Функции

XQuery използва функции за извличане на данни от XML документи. Функцията doc() се използва за отваряне на файла books.xml

```xml
doc("books.xml")
```

### Изрази за път

XQuery използва изрази за пътища, за да навигира през елементи в XML документ. Следният израз за път се използва за избор на всички елементи на заглавието във файла books.xml

doc("books.xml")/bookstore/book/title

/bookstore избира елемента bookstore
/book избира всички елементи book под елемента bookstore
/title избира всички елементи title под всеки елемент book

XQuery изразът ще извлече следното

<title lang="en">Everyday Italian</title>
<title lang="en">Harry Potter</title>
<title lang="en">XQuery Kick Start</title>
<title lang="en">Learning XML</title>

### Предикати

XQuery използва предикати, за да ограничи извлечените данни от XML документи. Следният предикат се използва за избиране на всички елементи book под елемента bookstore, които имат елемент price < 30

doc("books.xml")/bookstore/book[price<30]

XQuery по-горе ще извлече следното
<book category="CHILDREN">
  <title lang="en">Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

# XQuery FLWOR изрази

FLWOR ( произнася се "flower" ) е акроним за "For, Let, Where, Order By, Return"

- For (За) - избира поредица от възли;
- Let (Нека) - свързва последователностт с променлива;
- Where (Kъдето) - филтрира възлите;
- Order By (Подреди по) - сортира възлите;
- Return (Върни) - какво да се върне (изчислява се веднъж за всеки възел);

## Пример

Ще използваме документа books.xml от предишната глава.

### Как да изберем възли с FLWOR

Имаме следния израз за път

doc("books.xml")/bookstore/book[price>30]/title

Горният израз ще избере всички елементи title под елементите book, които са под елемента bookstore, чиято стойност е по-висока от 30.

Следният FLWOR израз ще избере точно същото като израз за път по-горе

```js
for $x in doc("books.xml")/bookstore/book
where $x/price>30
return $x/title
```

Резултатът ще бъде
<title lang="en">XQuery Kick Start</title>
<title lang="en">Learning XML</title>

С FLWOR можем да сортираме резултата

```js
for $x in doc("books.xml")/bookstore/book
where $x/price>30
order by $x/title
return $x/title
```

Клаузата *for* избира всички елементи book, които са деца на bookstore в променлива, наречена $x

Клаузата *where* избира само елементи от типа book с елемент price със стойност по-голяма от 30

Клаузата *order by* определя реда на сортиране. Ще се сортира по елемента title.

Клаузата за връщане *return* указва какво трябва да се върне. Тук тя ще връща елементите заглавие (title)

Резултатът от горния XQuery израз ще бъде:

<title lang="en">Learning XML</title>
<title lang="en">XQuery Kick Start</title>

#