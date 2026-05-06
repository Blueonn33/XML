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

# XQuery FLWOR + HTML

## Пример

В примерите по-долу ще се използва документът books.xml

### Представяне на резултата в HTML списък

Имаме следния XQuery FLWOR израз

```js
for $x in doc("books.xml")/bookstore/book/title
order by $x
return $x
```

Горният израз ще избере всички елементи title, които са деца нa book, които са деца на bookstore и ще върне заглавията по азбучен ред.

Сега искаме да изброим всички заглавия на книги в нашата книжарница в HTML списък. Добаваме тагове <ul> и <li> към израза FLWOR

```html
<ul>
{
    for $x in doc("books.xml")/bookstore/book/title
    order by $x
    return <li>{$x}</li>
}
</ul>
```

Резултатът е следният
<ul>
    <li><title lang="en">Everyday Italian</title></li>
    <li><title lang="en">Harry Potter</title></li>
    <li><title lang="en">Learning XML</title></li>
    <li><title lang="en">XQuery Kick Start</title></li>
</ul>

Сега искаме да премахнем елемента title и да покажем само данните вътре в него

```html
<ul>
{
    for $x in doc("books.xml")/bookstore/book/title
    order by $x
    return <li>{data($x)}</li>
}
</ul>
```

Резултатът е следния HTML списък

<ul>
    <li>Everyday Italian</li>
    <li>Harry Potter</li>
    <li>Learning XML</li>
    <li>XQuery Kick Start</li>
</ul>

# Терминология на XQuery

## Възли

В XQuery има 7 вида възли:
- елемент;
- атрибут;
- текст;
- пространство от имена;
- инструкция за обработка;
- коментар;
- документ (корен) възли;

XML документите се третират като дървета от възли. Коренът на дървото се нарича възел на документа (или коренен възел)

Имаме следния пример

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

Пример за възли в XML документа по-горе

<bookstore>              коренен възел
<author>                 елементен възел
lang="en"                атрибутен възел

## Атомни стойности

Атомните стойности са възли без деца или родители. Пример за атомни стойности

J K. Rowling
"en"

## Елементи

Елементите са атомни стойности или възли

## Връзка на възлите

### Родител

Всеки елемент и атрибут има 1 родител
В следния пример: елементът book е родител на (title, author, year, price)

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

### Деца

Възлите на елементите могат да имат 0, 1 или повече деца
В следния пример: елементите title, author, year и price са деца на book

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

### Братя

Възли, които имат един и същ родител
В следния пример: елементите title, author, year, price са братя

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

### Предци

Родителят на възел, родителят на родителя, ..
В примера предиците на елемента title са book и bookstore

<bookstore>

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

</bookstore>

### Потомци

Деца на възел, деца на деца, ..
В следния пример, наследниците на елемента bookstore са елементите book, title, author, year и price

<bookstore>

<book>
  <title>Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

</bookstore>

# Синтаксис

XQuery е чувствителен към малки и големи букви и XQuery елементите, атрибутите и променливите трябва да са валидни XML имена

## Основни синтактични правила

- XQuery е чувствителен към малки и големи букви;
- Елементите, атрибутите и променливите трябва да са валидни XML имена;
- Стойността на низ в XQuery може да бъде в единични или двойни кавички;
- Коментарите в XQuery са разделени от (: :)    (: Comment :)

## Пример

Ще използваме документа books.xml

## Условни изрази

Изразите "If-Then-Else" са разрешени в XQuery

```js
for $x in doc("books.xml")/bookstore/book
return if ($x/@category="children")
then <child>{data($x/title)}</child>
else <adult>{data($x/title)}</adult>
```

Скобите около израза if са задължителни. 
else е задължителен, но може да бъде просто else()

Резултатът е следният
<adult>Everyday Italian</adult>
<child>Harry Potter</child>
<adult>XQuery Kick Start</adult>
<adult>Learning XML</adult>

## Сравнения

В XQuery има 2 начина за сравняване на стойности:

1. Общи сравнения
=   !=  <   >   <=  >=

2. Сравнения на стойности
eq  ne  lt  le  gt  ge

**Разликата между двата метода за сравнение е показана по-долу**

Следният израз връща true, ако някоя от q стойностите на атрибутите има стойност > 10

$bookstore//book/@q > 10

Следният израз връща true, ако има само 1 атрибут q, върнат от израза, и неговата стойност е > 10. Ако се върнат повече от 1 q, възниква грешка

$bookstore//book/@q gt 10

# Добавяне на елементи и атрибути

## Пример

В примерите ще бъде използван books.xml

## Добавяне на елементи и атрибути към резултата

Можем да включим елементи и атрибути от входния документ (books.xml) в резултата:

```js
for $x in doc("books.xml")/bookstore/book/title
order by $x
return $x
```

Горният XQuery израз ще включва както елемента title, така и атрибута lang в резултата, ето така:

<title lang="en">Everyday Italian</title>
<title lang="en">Harry Potter</title>
<title lang="en">Learning XML</title>
<title lang="en">XQuery Kick Start</title>

Горният XQuery израз връща елементите title по абсолютно същия начин, както са описани във входния документ

Сега ще добавим собствени елементи и атрибути към резултата

### Добавяне на HTML елементи и текст

Ще поставим резултата в HTML списък - заедно с малко текст

```html
<html>
    <body>
        <h1>Bookstore</h1>
        <ul>
            {
                for $x in doc("books.xml")/bookstore/book
                order by $x/title
                return <li>{data($x/title)}. Category: {data($x/@category)}</li>
            }
        </ul>
    </body>
</html>
```

Горният XQuery израз ще генерира следния резултат

```html
<html>
    <body>
    <h1>Bookstore</h1>
    <ul>
        <li>Everyday Italian. Category: COOKING</li>
        <li>Harry Potter. Category: CHILDREN</li>
        <li>Learning XML. Category: WEB</li>
        <li>XQuery Kick Start. Category: WEB</li>
    </ul>
    </body>
</html>
```

### Добавяне на атрибути към елементите

След това искаме да използваме атрибута category като атрибут на class в HTML списъка

```html
<html>
    <body>
        <h1>Bookstore</h1>
        <ul>
            {
                for $x in doc("books.xml")/bookstore/book
                order by $x/title
                return <li class="{data($x/@category)}">{data($x/title)}</li>
            }
        </ul>
    </body>
</html>
```

XQuery изразът генерира следния резултат

```html
<html>
    <body>
        <h1>Bookstore</h1>
        <ul>
            <li class="COOKING">Everyday Italian</li>
            <li class="CHILDREN">Harry Potter</li>
            <li class="WEB">Learning XML</li>
            <li class="WEB">XQuery Kick Start</li>
        </ul>
    </body>
</html>
```

# Избор и филтриране

## Пример

Ще използваме документа books.xml

## Избор и филтриране на елементи

В предишните глави за избор и филтриране на елементи беше използван XPath или израз с FLWOR

Имаме следния пример

```js
for $x in doc("books.xml")/bookstore/book
where $x/price > 30
order by $x/title
return $x/title
```

- for - свързва променлива с всеки елемент, върнат от израза *in*
- where - определя критерий
- order by - указва реда на сортиране на резултата
- return - указва какво да се върне в резултата

### Клаузата for

Клаузата свързва променлива с всеки елемент, върнат от израза *in*. Клаузата води до итерация. В един и същ FLWOR израз може да има множество клаузи for.

За да се изпълни цикъл за определен брой пъти в клауза for, може да се използва ключовата дума *to*

```js
for $x in (1 to 5)
return <test>{$x}</test>
```

<test>1</test>
<test>2</test>
<test>3</test>
<test>4</test>
<test>5</test>

Ключовата дума *at* може да се използва за преброяване на итерациите

```js
for $x at $i in doc("books.xml")/bookstore/book/title
return <book>${i}. {data($x)}</book>
```

<book>1. Everyday Italian</book>
<book>2. Harry Potter</book>
<book>3. XQuery Kick Start</book>
<book>4. Learning XML</book>

Също така е позволено с повече от 1 елемент в израза в клаузата for. Използва се запетая за разделяне на всеки елемент в израза

```js
for $x in (10,20), $y in (100,200)
return <test>x={$x} and y={$y}</test>
```

<test>x=10 and y=100</test>
<test>x=10 and y=200</test>
<test>x=20 and y=100</test>
<test>x=20 and y=200</test>

### Клаузата let

Клаузата позволява присвояване на променливи и избягва многократното повтаряне на един и същ израз. Клаузата let не води до итерация

```js
let $x := (1 to 5)
return <test>{$x}</test>
```

Резултат
<test>1 2 3 4 5</test>

### Клаузата where

Клаузата се използва за задаване на 1 или повече критерии за резултата:

```js
where $x/price > 30 and $x/price < 100
```

### Клаузата order by

Клаузата order by се използва за определяне на реда на сортиране на резултата. Искаме да подредим резултата по категория и заглавие

```js
for $x in doc("books.xml")/bookstore/book
order by $x/@category, $x/title
return $x/title
```

Резултат

<title lang="en">Harry Potter</title>
<title lang="en">Everyday Italian</title>
<title lang="en">Learning XML</title>
<title lang="en">XQuery Kick Start</title>

### Клаузата return

Клаузата уточнява какво трябва да се върне

```js
for $x in doc("books.xml")/bookstore/book
return $x/title
```

Резултат

<title lang="en">Everyday Italian</title>
<title lang="en">Harry Potter</title>
<title lang="en">XQuery Kick Start</title>
<title lang="en">Learning XML</title>