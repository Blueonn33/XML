# Как XML може да бъде използван

## XML се използва за разграничаване на данните от визуализацията.
XML не пази информация за това как да бъде представен. 

## XML често е допълнение към HTML
В много HTML приложения ХМL се използва за съхранение или пренос на данни, докато HTML се използва за форматиране и показване на същите данни

## XML разделя данните от HTML
Когато показвате данни в HTML, не би трябвало да редактирате HTML файла, когато данните се променят. 
С XML данните могат да се съхраняват в отделни XML файлове.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>

    <book category="cooking">
        <title lang="en">Italian</title>
        <author>Giada De Laurentiis</author>
        <year>2005</year>
        <price>30.00</price>
    </book>

    <book category="web" cover="paperback">
        <title lang="en">Learning XML</title>
        <author>Erik T. Ray</author>
        <year>2003</year>
        <price>39.95</price>
    </book>

</bookstore>
```

Съществуват хиляди формати, за да опишат пренос на данни:
- Акции и дялове;
- Финансови транзакции;
- Медицински данни;
- Математически данни;

:::note
Използването на стандарт улеснява създаването, получаването и архивирането на всякакъв вид информация в различен софтуер, хардуер и езици за програмиране
:::

# XML дърво

XML документите образуват дървовидна структура, която започва от **корена** и се разклонява към **листата**

## XML дървовидна структура

![alt text](/Exercises/Intro/xml-tree.png)

Изображението по-горе представлява книги в този XML файл

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
  <book category="cooking">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>
  <book category="children">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book category="web">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore>
```

XML документите се формират като **дървета от елементи**. XML дървото започва от коренен елемент и се разклонява от корена към дъщерни елементи. Всички елементи могат да имат поделементи (дъщерни елементи).

```xml
<root>
    <child>
        <subchild>...</subchild>
    </child>
</root>
```

Термините родител, дете, брат/сестра се използват за описание на връзките между елементите. Родителите имат деца. Децата имат родители. Братята и сестрите са деца на едно и също ниво. Всички елементи могат да имат текстово съдържание и атрибути.

## Самоописващ се синтаксис
XML използва самоописващ се синтаксис
Прологът определя версията и кодирането на символите.

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

Следващият ред е коренният елемент на документа

```xml
<bookstore>
```

Следващият ред започва елемент <book>:

```xml
<book category="cooking">
```

Елементите book имат 4 дъщерни елемента: title, author, year, price

```xml
<title lang="en">Everyday Italian</title>
<author>Giada De Laurentiis</author>
<year>2005</year>
<price>30.00</price>
```

# XML синтактични правила

## XML документите трябва да имат коренен елемент

XML документите трябва да съдържат 1 коренен елемент, който е родител на всички останали елементи

В този пример note e коренният елемент

```xml
<?xml version="1.0" encoding="UTF-8"?>
<note>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
```

XML пролог

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

Прологът е по избор. Ако съществува, трябва да е първи в документа. Документите могат да съдържат международни символи. За да се избегнат грешки се използва UTF-8. То е кодирането на знаците по подразбиране за XML документи. Това кодиране е по подразбиране и за HTML5, CSS, JavaScript, PHP, SQL

## Всички XML елементи трябва да имат затварящ таг

:::important
XML прологът няма затварящ таг. Той не е част от документа
:::

## XML таговете са чувствителни към малки и главни букви
## XML елементите трябва да бъдат правилно вложени
## Стойностите на XML атрибутите винаги трябва да бъдат в кавички

XML елементите могат да имат атрибути в двойки име/стойност, точно както е в HTML

```xml
<note date="12/11/2007">
  <to>Tove</to>
  <from>Jani</from>
</note>
```

## Препратки към обекти

Някои символи имат специално значение в XML. Символът "<", поставен вътре в XML елемент, ще генерира грешка, защото парсерът го интерпретира като начало на нов елемент

За да се избегне, са използва препратка към обект

```xml
<message>salary &lt; 1000</message>
```

В XML има 5 предварително дефинирани препратки към обекти

| **Препратка** | **Знак** | **Значение** |
|---------------|----------|--------------|
| &lt; | < | less than |
| &gt; | > | greater than |
| &lt;= | < | less than or equal |
| &gt;= | > | greater than or equal |
| &amp; | & | ampersand |
| &apos; | ' | apostrophe |
| &quot; | " | quotation mark |

## Коментари

<!-- Comment -->

## Бяло пространство

XML не отрязва множество бели пространства (HTML го прави)

## Добре оформен XML

XML документите, които отговарят на гореспоменатите синтактични правила, се наричат **добре оформени** XML документи

# XML елементи

XML документът съдържа XML елементи

## Какво е XML елемент

Елементът е всичко от (включително) началния таг на елемента до (включително) крайния таг на елемента

```xml
<price>20.99</price>
```

Един елемент може да съдържа следното:
- Текст;
- Атрибути;
- Други елементи;
- Или комбинация от горните;

```xml
<bookstore>
  <book category="children">
    <title>Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book category="web">
    <title>Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore>
```

В примерът по-горе title, author, year и price имат текстово съдържание, защото съдържат текст. 

bookstore, book за съдържание имат елементи

book има атрибут (category="children")

## Празни XML елементи

Елемент без съдържание се нарича празен. Празен елемент се посочва така

```xml
<element></element>
```

или

```xml
<element />
```

:::note
Празните елементи могат да имат атрибути
:::

## Правила за именуване

XML елементите трябва да следват тези правила за именуване:
- Имената на елементите са чуствителни към малки/главни букви;
- Имената на елементите трябва да започват с буква или долна черта;
- Имената на елементите НЕ могат да започват с буквите xml (XML, Xml,..);
- Имената на елементите могат да съдържат букви, цифри, тирета, долни черти и точки;
- Имената на елементите не могат да съдържат интервали;

### Добри практики

Използване на описателни имена: <first_name>, <city>

Кратки и прости имена

Избягване на "-", може да бъде разчетено като изваждане

Избягване на ".", някои програми може да сметнат, че се използва обект, който достъпва свойство

Избягване на ":", то е запазено за пространства от имена

### Конвенции за именуване

Малки букви - <firstname> - всичко с малки
Главни - <FIRST_NAME> 
Snake - <first_name>
Pascal - <FirstName>
Camel - <firstName>

XML документите често имат съответстваща база данни. Обичайна практика е да се използват правила за именуване на базата данни за XML елементите

## XML елементите са разширяеми

Разширяването позволява използване на повече информация. Добавяме повече тагове, като това не чупи програмата

# XML атрибути

XML елементите могат да имат атрибути като HTML елементите. Атрибутите са предназначени да съдържат данни, свързани с конкретен елемент.

Стойностите на атрибутите трябва да бъдат в кавички. Могат да се използват двойни или единични. Ако самата стойност съдържа кавички, то могат да се използват различни са затваряне

```xml
<gangster name='George "Shotgun" Ziegler'>
```

или символни обекти

```xml
<gangster name="George &quot;Shotgun&quot; Ziegler">
```

## XML елементи срещу атрибути

```xml
<person gender="female">
  <firstname>Anna</firstname>
  <lastname>Smith</lastname>
</person>
```

```xml
<person>
  <gender>female</gender>
  <firstname>Anna</firstname>
  <lastname>Smith</lastname>
</person>
```

В първия пример полът е атрибут. Във втория пример е елемент. И двата примера предоставят една и съща информация

## Различни стилове

Атрибут за дата

```xml
<note date="2008-01-10">
  <to>Tove</to>
  <from>Jani</from>
</note>
```

Елемент за дата

```xml
<note>
  <date>2008-01-10</date>
  <to>Tove</to>
  <from>Jani</from>
</note>
```

Елемент за дата (разширен) и предпочитан

```xml
<note>
  <date>
    <year>2008</year>
    <month>01</month>
    <day>10</day>
  </date>
  <to>Tove</to>
  <from>Jani</from>
</note>
```

## Избягване на атрибути

Важни неща, свързани с използването на атрибути

- Атрибутите не могат да съдържат множество стойности (елементите могат);
- Атрибутите не могат да съдържат дървовидни структури (елементите могат);
- Атрибутите не са лесно разширими за бъдещи промени

Пример за много лоша практика

```xml
<note day="10" month="01" year="2008"
to="Tove" from="Jani" heading="Reminder"
body="Don't forget me this weekend!">
</note>
```

## XML атрибути за метаданни

Понякога на елементите се присвояват ID препратки. Тези ID могат да се използват за идентифициране на XML елементи по почти същия начин, както атрибутът id в HTML

Атрибутите за идентифициране не са част от самата бележка. Метаданните (данни за данните) трябва да се съхраняват като атрибути, а самите данни трябва да се съхраняват като елементи.

```xml
<messages>
  <note id="501">
    <to>Tove</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>Don't forget me this weekend!</body>
  </note>
  <note id="502">
    <to>Jani</to>
    <from>Tove</from>
    <heading>Re: Reminder</heading>
    <body>I will not</body>
  </note>
</messages>
```

# XML Namespaces (пространства от имена)

Пространствата от имена предоставят метод за избягване на конфликти в имената на елементите

## Конфликти на имена

Имената на елементите се дефинират от програмиста. Това често води до конфликт при опит за смесване на XML документи от различни XML приложения.

Този XML съдържа информация от HTML таблица

```xml
<table>
  <tr>
    <td>Apples</td>
    <td>Bananas</td>
  </tr>
</table>
```

Този файл съдържа информация за маса

```xml
<table>
  <name>African Coffee Table</name>
  <width>80</width>
  <length>120</length>
</table>
```

Ако XML фрагментите бъдат събрани, ще има конфликт на имената. И двата съдържат елемент table, но елементите имат различно съдържание и значение

## Решаване на конфликт на имена чрез префикс

Конфликтите се избягват с помощта на префикс. Този XML съдържа информация за HTML таблица и маса

```xml
<h:table>
    <h:tr>
        <h:td>Apples</h:td>
        <h:td>Bananas</h:td>
    </h:tr> 
</h:table> 

<f:table>
    <f:name>African Coffee Table</f:name>
    <f:width>80</f:width>
    <f:length>120</f:length>
</f:table>
```

## XML пространства от имена - атрибутът xmlns

Когато се използват префикси в XML, трябва да се дефинира пространство от имена за префикса. Пространството може да бъде дефинирано чрез атрибута **xmlns** в началния таг на елемент. 

Декларацията на пространство от имена има следния синтаксис 

xmlns: prefix = "URI"

```xml
<root>

<h:table xmlns:h="http://www.w3.org/TR/html4/">
  <h:tr>
    <h:td>Apples</h:td>
    <h:td>Bananas</h:td>
  </h:tr>
</h:table>

<f:table xmlns:f="https://www.w3schools.com/furniture">
  <f:name>African Coffee Table</f:name>
  <f:width>80</f:width>
  <f:length>120</f:length>
</f:table>

</root>
```

Когато за даден елемент е дефинирано пространство от имена, всички дъщерни елементи със същия префикс се асоциират със същото пространство от имена. Пространствата от имена могат да бъдат декларирани и в коренния елемент на XML

```xml
<root xmlns:h="http://www.w3.org/TR/html4/"
xmlns:f="https://www.w3schools.com/furniture">

<h:table>
  <h:tr>
    <h:td>Apples</h:td>
    <h:td>Bananas</h:td>
  </h:tr>
</h:table>

<f:table>
  <f:name>African Coffee Table</f:name>
  <f:width>80</f:width>
  <f:length>120</f:length>
</f:table>

</root>
```

:::note
URI адресът на пространството от имена не се използва от парсера за търсене на информация. Целта на използването на URI е да се даде уникално име на пространството от имена. 
:::

## URI - унифициран идентификатор на ресурс

Това е низ от знаци, който идентифицира интернет ресурс. Най-разпространеният URI и URL (унифициран локатор на ресурс), който идентифицира адрес на интернет домейн. Друг URI е URN (унифицирано име на ресурс)

## Пространства от имена по подразбиране

Дефинирането на пространство от имена по подразбиране за даден елемент ни спестява използването на префикси във всички дъщерни елементи

xmlns="namespaceURI"

```xml
<table xmlns="http://www.w3.org/TR/html4/">
  <tr>
    <td>Apples</td>
    <td>Bananas</td>
  </tr>
</table>

<table xmlns="https://www.w3schools.com/furniture">
  <name>African Coffee Table</name>
  <width>80</width>
  <length>120</length>
</table>
```

## Реална употреба на пространства от имена

XSLT е език, който може да се използва за преобразуване на XML документи в други формати. XML документът по-долу е документ, използван за преобразуване на XML в HTML. Именуването „http://www.w3.org/1999/XSL/Transform“ идентифицира XSLT елементи в HTML документ

```xml
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr>
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
    </tr>
    <xsl:for-each select="catalog/cd">
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="artist"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
```

# Показване на XML

Суровите XML файлове могат да се преглеждат във всички основни браузъри. XML файловете не се показват като HTML страници

## Преглед на XML файлове

Повечето браузъри ще покажат XML документ с цветно кодирани елементи. Често знакът (+) или (-) отляво на елементите може да бъде щракнат, за да се разгърне или свие структурата на елементите.

## Преглед на невалиден XML файл

Ако се отвори грешен XML файл, някои браузъри ще съобщят за грешката, а други ще я покажат неправилно

<From>Indigo<from>

## Защо XML се показва по този начин

XML документите не съдържат информация за това как да се показват данните. Тъй като XML таговете са измислени от автора на XML документа, браузърите не знаят дали таг като table описва HTML таблица или маса за хранене

Без никаква информация за това как да се показват данните, браузърите могат просто да покажат XML документа такъв, какъвто е

:::note
За стилизиране на XML документ се използва XSLT
:::

# XML HttpRequest

Всички съвременни браузъри имат вграден обект XMLHttpRequest за заявка на данни от сървър

## Обектът XMLHttpRequest

Използва се за заявка на данни от уеб сървър. Обектът може да:
- Актуализира уеб страница без нужда от презареждане;
- Заявка за данни от сървър - след зареждане на страницата;
- Получаване на данни от сървър - след като страницата се зареди;
- Изпращане на данни към сървър - във фонов режим;

## Пример

Въвеждане на символ в поле за търсене. Към сървъра се изпраща XMLHttpRequest и се връщат предложения за имена (от сървъра)

## Синтаксис

```js
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       // Typical action to be performed when the document is ready:
       document.getElementById("demo").innerHTML = xhttp.responseText;
    }
};
xhttp.open("GET", "filename", true);
xhttp.send();
```

Първият ред създава обект XMLHttpRequest

```js
var xhttp = new XMLHttpRequest();
```

Свойството **onreadystatechange** определя функция, която да се изпълнява всеки път, когато състоянието на обекта се промени

```js
xhttp.onreadystatechange = function()
```

Когато свойството readyState е 4, а status e 200, отговорът е готов

```js
if (this.readyState == 4 && this.status == 200)
```

Свойството **responseText** връща отговора на сървъра като текстов низ. Текстовият низ може да се използва за актуализиране на уеб страница

```js
document.getElementById("demo").innerHTML = xhttp.responseText;
```

# XML Parser

Всички основни браузъри имат вграден XML парсер за достъп и манипулиране на XML

XML DOM (Document Object Model) определя свойствата и методите за достъп и редактиране на XML. Въпреки това, преди да бъде осъществен достъп до XML документ, той трябва да бъде зареден в XML DOM обект

Браузърите имат парсер, който конвертира текст в XML DOM обект.

## Разбор на текстов низ

Примерът анализира текстов низ в XML DOM обект и извлича информацията от него с JavaScript

```xml
<html>
<body>

<p id="demo"></p>

<script>
var text, parser, xmlDoc;

text = "<bookstore><book>" +
"<title>Everyday Italian</title>" +
"<author>Giada De Laurentiis</author>" +
"<year>2005</year>" +
"</book></bookstore>";

parser = new DOMParser();
xmlDoc = parser.parseFromString(text,"text/xml");

document.getElementById("demo").innerHTML =
xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
</script>

</body>
</html>
```

**Everyday Italian**

Дефиниран е текстов низ - text
Създава се XML DOM parser - parser = new DOMParser();
Парсерът създава нов XML DOM обект, използвайки текстовия низ:

```js
xmlDoc = parser.parseFromString(text,"text/xml");
```

## XMLHttpRequest обект

Той има вграден XML парсер. Свойството **responseText** връща отговора като низ. Свойството **responseXML** връща отговора като XML DOM обект.

# XML DOM

## Какво е DOM

Document Object Model определя стандарт за достъп и манипулиране на документи:

> DOM на W3C е платформено и езиково неутрален интерфейс, който позволява на програми и скриптове динамично да осъществяват достъп и да актуализират съдържанието, структурата и стила на документ

HTML DOM дефинира стандартен начин за достъп и манипулиране на HTML документи. Той представя HTML документа като дървовидна структура

XML DOM определя стандартен начин за достъп и манипулиране на XML документи. Той представя XML документа като дървовидна структура.

## HTML DOM

Всички HTML елементи са достъпни чрез DOM

```html
<h1 id="demo">This is a Heading</h1>

<button type="button"
onclick="document.getElementById('demo').innerHTML = 'Hello World!'">Click Me!
</button>
```

## XML DOM

Всички XML елементи могат да бъдат достъпвани чрез DOM

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>

  <book category="cooking">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>

  <book category="children">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>

</bookstore>
```

```js
var txt = xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
```

# XML и XPath

## Какво е XPath

Това е основен елемент в стандарта XSLT. Той може да се използва за навигация през елементи и атрибути в XML документ.

- XPath е синтаксис за дефиниране на части от XML документа;
- Той използва пътни изрази за навигация в XML документа;
- Съдържа библиотека от стандартни функции;
- Основен елемент е в XSLT и XQuery;
- Препоръчан е от W3C;

## XPath пътни изрази

XPath използва изрази за пътища, за да избира възли или набори от възли в документа. Тези изрази за пътища много приличат на изразите, които виждаме, когато работим с традиционна компютърна файлова система.

XPath изразите могат да се използват в JavaScript, Java, XML Schema, PHP, Python, C, C++ и много други.

## XPath се използва в XSLT

Той е основен елемент в стандарта XSLT

## Пример

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>

    <book category="cooking">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
    </book>

    <book category="children">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
    </book>

    <book category="web">
    <title lang="en">XQuery Kick Start</title>
    <author>James McGovern</author>
    <author>Per Bothner</author>
    <author>Kurt Cagle</author>
    <author>James Linn</author>
    <author>Vaidyanathan Nagarajan</author>
    <year>2003</year>
    <price>49.99</price>
    </book>

    <book category="web">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
    </book>

</bookstore>
```

В таблицата са изброени XPath изрази и резултата от тях:

| **XPath Израз** | **Резултат** |
|-----------------|--------------|
| /bookstore/book[1] | Избира първия елемент book, който е дете на елемента bookstore |
| /bookstore/book[last()] | Избира последния елемент book |
| /bookstore/book[last()-1] | Избира предпоследния елемент book |
| /bookstore/book[position()<3] | Избира първите 2 елемента book |
| //title[@lang] | Избира всички елементи title, които имат атрибут lang |
| //title[@lang='en'] | Избира всички елементи title, които имат атрибут lang, чиято стойност е 'en' |
| /bookstore/book[price>35.00] | Избира всеки елемент book с цена > 35 |
| /bookstore/book[price &gt; 35.00]/title | Взема заглавието на елементите book, чиято цена е > 35 | 