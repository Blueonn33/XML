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

# XML и XSLT

С XSLT можем да трансформираме XML документ в HTML.

## Показване на XML с XSLT

XSLT (eXtensible Stylesheet Language Transformations) е препоръчителният език за стилизиране на XML
XSLT е по-сложен от CSS. С него могат да се добавят/премахват елементи и атрибути към или от изходния файл. Чрез него могат да се пренареждат и сортират елементи, да се извършват тестове и да се вземат решения за това кои елементи да се скрият и кои да се покажат и много други.

XSLT използва XPath, за да намери информация в XML документ.

## Пример

```xml
<?xml version="1.0" encoding="UTF-8"?>
<breakfast_menu>

<food>
<name>Belgian Waffles</name>
<price>$5.95</price>
<description>Two of our famous Belgian Waffles with plenty of real maple syrup</description>
<calories>650</calories>
</food>

<food>
<name>Strawberry Belgian Waffles</name>
<price>$7.95</price>
<description>Light Belgian waffles covered with strawberries and whipped cream</description>
<calories>900</calories>
</food>

</breakfast_menu>
```

```xslt
<?xml version="1.0" encoding="UTF-8"?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <body style="font-family:Arial; font-size:12pt">
        <xsl:for-each select="breakfast-menu/food">
            <div style="background-color:teal">
                <span><xsl:value-of select="name" /> - </span>
                <xsl:value-of select="price" />
            </div>
            <div>
                <p>
                    <xsl:value-of select="description" />
                    <span> (<xsl:value-of select="calories" /> calories per serving)
                    </span>
                </p>
            </div>
        </xsl:for-each>
    </body>
</html>
``` 

# XML и XQuery

XQuery е за XML това, което е SQL за базите данни. XQuery е проектиран за създаване на заявки за XML данни

## Пример

```xquery
for $x in doc("books.xml")/bookstore/book
where $x/price > 30
order by $x/title
return $x/title
```

## Какво е XQuery

- XQuery е езикът за заявки към XML данни;
- За XML е като SQL за бази данни;
- XQuery е изграден върху XPath изрази;
- XQuery се поддържа от всички основни бази данни;
- Препоръчан е от W3C;

XQuery е език за намиране и извличане на елементи и атрибути от XML документи.

## XQuery и XPath

XQuery 1.0 и XPath 2.0 споделят един и същ модел на данни и поддържат едни и същи функции и оператори. 

## XQuery - примери за употреба

Езикът може да се използва за:
- Извличане на информация за използване в уеб услуга;
- Генериране на обобщени отчети;
- Трансформиране на XML данни в XHTML;
- Търсене на уеб документи за подходяща информация;

## XQuery е препоръка на W3C

Езикът е съвместим с няколко стандарта на W3C като XML, Namespaces, XSLT, XPath и XML Schema

# XML, XLink и XPointer

## XLink

- XLink се използва за създаване на хипервръзки в XML документи;
- Всеки елемент в XML документ може да се държи като връзка;
- С XLink връзките могат да бъдат дефинирани извън свързаните файлове;
- XLink е препоръка на W3C;

### Поддръжка от браузъра

Няма поддръжка на XLink в XML документи от браузъра. Браузърите поддържат XLinks в SVG.

### Синтаксис на XLink

В HTML елементът <а> дефинира хипервръзката. В XML документите можем да използваме каквито имена искаме за елементите. Следователно е невъзможно браузърите да предвидят кои елементи на връзката ще бъдат извикани.

### Пример

```xml
<?xml version="1.0" encoding="UTF-8"?>

<homepages xmlns:xlink="http://www.w3.org/1999/xlink">

    <homepage xlink:type="simple" xlink:href="https://www.w3schools.com"> Visit W3Schools</homepage>
    <homepage xlink:type="simple" xlink:href="http://www.w3.org">Visit W3C</homepage>

</homepages>
```

За да получим достъп до функциите на XLink, трябва да декларираме пространството от имена XLink. 

Атрибутите **xlink:type** и **xlink:href** в елементите homepage идват от пространството от имена XLink

**xlink:type="simple"** създава проста връзка, подобна на HTML (цъкни тук, за да отидеш там)

Атрибутът **xlink:href** указва URL адреса, към който да се свърже.

### Пример

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore xmlns:xlink="http://www.w3.org/1999/xlink">

    <book title="Harry Potter">
    <description
    xlink:type="simple"
    xlink:href="/images/HPotter.gif"
    xlink:show="new">
    As his fifth year at Hogwarts School of Witchcraft and
    Wizardry approaches, 15-year-old Harry Potter is.......
    </description>
    </book>

    <book title="XQuery Kick Start">
    <description
    xlink:type="simple"
    xlink:href="/images/XQuery.gif"
    xlink:show="new">
    XQuery Kick Start delivers a concise introduction
    to the XQuery standard.......
    </description>
    </book>

</bookstore>
```

- Именуването XLink е декларирано в началото на документа;
- **xlink:type="simple"** създава проста връзка;
- Атрибутът **xlink:href** указва URL адреса, към който да се свърже (изображение);
- **xlink:show="new"** указва, че връзката трябва да се отвори в нов прозорец;

### Отдалечен достъп

Ако зададем стойността на атрибута **xlink:show** на embed, свързаният ресурс трябва да се обработва вградено в страницата. Това може да е друг XML документ и така бихме могли да изградим йерархия от XML документи.

Чрез **xlink:actute** указваме кога да се появи ресурсът

| Атрибут | Стойност | Описание |
|---------|----------|----------| 
| xlink:actuate | onLoad, onRequest, other, none | Дефинира кога свързаният ресурс е прочетен и представен - onLoad ( когато документът зареди, ресурсът се показва ), onRequest ( ресурсът се показва, когато линкът бъде натиснат ) |
| xlink:href | URL | определя URL-a, който се отваря |
| xlink:show | embed, new, replace, other, none | Определя къде да се отвори линкът. По подразбиране е replace |
| xlink:type | simple, extended, locator, arc, resource, title, none | Определя типа на линка |

## XPointer

- Позволява връзките да сочат към конкретни части от XML документ
- Използва XPath изрази за навигация в XML документа
- Препоръчан е от W3C

### Поддържане от браузър

Няма поддръжка за XPointer

### Пример

Използване на XPointer заедно с XLink, за да посочим към конкретна част от друг документ

Започваме с целевия XML документ ( този, към който се свързваме )

```xml
<?xml version="1.0" encoding="UTF-8"?>

<dogbreeds>

    <dog breed="Rottweiler" id="Rottweiler">
    <picture url="https://dog.com/rottweiler.gif" />
    <history>The Rottweiler's ancestors were probably Roman
    drover dogs.....</history>
    <temperament>Confident, bold, alert and imposing, the Rottweiler
    is a popular choice for its ability to protect....</temperament>
    </dog>

    <dog breed="FCRetriever" id="FCRetriever">
    <picture url="https://dog.com/fcretriever.gif" />
    <history>One of the earliest uses of retrieving dogs was to
    help fishermen retrieve fish from the water....</history>
    <temperament>The flat-coated retriever is a sweet, exuberant,
    lively dog that loves to play and retrieve....</temperament>
    </dog>

</dogbreeds>
```

Използва се атрибут id за всеки елемент. Вместо да се свързва с целия документ ( както е при XLink ), XPointer позволява свързване с конкретни части от документа. За връзка с конкретна част от страницата се добавя знак за число ( # ) и израз за XPointer след URL адреса в атрибута **xlink:href**, ето така:

```xml
xlink:href="https://dog.com/dogbreeds.xml#xpointer(id('Rottweiler'))"
```

Изразът се отнася до елемента в целевия документ, като стойността нa id е "Rottweiler"

Xpointer позволява и съкратен запис

```xml
xlink:href="https://dog.com/dogbreeds.xml#Rottweiler"
```

### Пример

```xml
<?xml version="1.0" encoding="UTF-8"?>

<mydogs xmlns:xlink="http://www.w3.org/1999/xlink">

    <mydog>
        <description>
        Anton is my favorite dog. He has won a lot of.....
        </description>
        <fact xlink:type="simple" xlink:href="https://dog.com/dogbreeds.xml#Rottweiler">
        Fact about Rottweiler
        </fact>
    </mydog>

    <mydog>
        <description>
        Pluto is the sweetest dog on earth......
        </description>
        <fact xlink:type="simple" xlink:href="https://dog.com/dogbreeds.xml#FCRetriever">
        Fact about flat-coated Retriever
        </fact>
    </mydog>

</mydogs>
```

# XML валидатор

XML валидаторите проверяват синтаксиса на XML.

## Добре оформени XML документи

XML документ с правилен синтаксис се нарича добре оформен.

Синтактичните правила са следните:
- XML документите трябва да имат коренен елемент;
- XML елементите трябва да имат затварящ таг;
- XML таговете са чувствителни към малки и главни букви;
- XML елементите трябва да бъдат правилно вложени;
- Стойностите на XML атрибутите трябва да бъдат оградени в ""

## Грешки в кода

Грешките в XML документите спират приложенията. XML спецификацията на W3C гласи, че програмата трябва да се спре обработката на XML документ, ако открие грешка. Причината е, че XML софтуерът трябва да бъде малък, бърз и съвместим

HTML браузърите могат да показват HTML документи с грешки (като липсващи крайни тагове)

С XML грешките не са позволени

## Валидни XML документи

Добре оформен XML документ не е същото като валиден XML документ. Валиден XML документ трябва да бъде правилно оформен. Освен това, той трябва да съответства на дефиницията на типа документ.

Има 2 различни дефиниции за тип документи, които могат да се използват с XML:
- DTD - оригиналната дефиниция на типа документ;
- XML схема - XML-базирана алтернатива на DTD;

Дефиницията на типа документ определя правилата и правните елементи и атрибути за XML документ.

# XML DTD

XML документ с правилен синтаксис се нарича добре оформен. 
XML документ, валидиран спрямо DTD, е едновременно добре оформен и валиден.

## Какво е DTD (Document Type Definition)

DTD е Дефиниция на типа документ. Той определя структурата и правните елементи и атрибути на XML документ

### Валидни XML документи

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE note SYSTEM "Note.dtd">
<note>
    <to>Tove</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>Don't forget me this weekend!</body>
</note>
```

Декларацията DOCTYPE по-горе съдържа препратка към DTD файл. Съдържанието на DTD файла е показано и обяснено по-долу.

### XML DTD

Целта на DTD е да дефинира структурата и правните елементи, и атрибути на XML документ

```dtd
<!DOCTYPE note
[
  <!ELEMENT note (to, from, heading, body)>
  <!ELEMENT to (#PCDATA)> 
  <!ELEMENT from (#PCDATA)>   
  <!ELEMENT heading (#PCDATA)>
  <!ELEMENT body (#PCDATA)>    
]>
```

Примерът се интерпретира по следния начин

!DOCTYPE note - Определя, че коренният елемент на документа е note
!ELEMENT note - Определя, че елементът note трябва да съдържа елементите: to, from, heading, body
!ELEMENT to - Определя елемента to да бъде от тип "#PCDATA" (това се отнася и за from, heading и body)

:::note
#PCDATA означава данни за символи, които могат да се анализират
:::

### Използване на DTD за декларация на обекти

Декларацията DOCTYPE може да се използва и за дефиниране на специални символи или низове, използвани в документа

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE note [
    <!ENTITY nbsp "&#xA0;">
    <!ENTITY writer "Writer: Donald Duck.">
    <!ENTITY copyright "Copyright: W3Schools.">
]>

<note>
    <to>Tove</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>Don't forget me this weekend!</body>
    <footer>&writer;&nbsp;&copyright;</footer>
</note>
```

:::note
Един обект се състои от 3 части: започва с &, след това идва името на обекта и завършва с ;
:::

## Кога да използваме DTD

С DTD, независими групи от хора могат да се споразумеят да използват стандартен DTD за обмен на данни. С DTD можем да проверим дали данните, които получаваме от външния свят, са валидни. 

Можем да използваме DTD за проверка на собствените си данни

## Кога да НЕ използваме DTD

XML не изисква DTD

При експериментиране с XML или работа с малки XML файлове, създаването на DTD може да е загуба на време.

Ако разработваме приложение изчакваме, докато спецификацията се стабилизира, преди да добавим DTD. В противен случай софтуерът може да спре да работи поради грешки при валидирането.

# XML Schema

XML Schema описва структурата на XML документ, точно както DTD
XML документ с правилен синтаксис се нарича „добре оформен“.
XML документ, валидиран спрямо XML схема, е едновременно „Добре oформeн“ и „Валиден“.

## Какво е XML Schema

Това е XML-базирана алтернатива на DTD

```xml
<xs:element name="note">

    <xs:complexType>
        <xs:sequence>
            <xs:element name="to" type="xs:string" />
            <xs:element name="from" type="xs:string" />
            <xs:element name="heading" type="xs:string" />
            <xs:element name="body" type="xs:string" />
        <xs:sequence>
    </xs:complexType>

</xs:element>
```

Схемата по-горе се интерпретира по следния начин:
- <xs:element name="note"> - определя елемента, наречен note
- <xs:complexType> - елементът note е от сложен тип
- <xs:sequence> - сложният тип е поредица от елементи
- <xs:element name="to" type="xs:string" /> - елементът to е от тип string (това се отнася и за from, heading и body)

### XML Schema е по-мощен от DTD

- XML схемите са написани на XML;
- Разширяеми са за добавяне на допълнителни елементи;
- Поддържат типове данни;
- Поддържат пространства от имена;

## Защо да използваме XML Schema

- С XML Schema, нашите XML файлове могат да съдържат описание на собствен формат;
- Независими групи от хора могат да се споразумеят за стандарт за обмен на данни;
- Можем да проверяваме данни;

### Поддържащи типове данни

Едно от най-големите предимства на схемата е поддръжката на типове данни:
- По-лесно е описанието на съдържанието на документа;
- По-лесно се дефинират ограниченият върху данните;
- По-лесно се проверява коректността на данните;
- По-лесно се конвертират данни между различни типове данни;

### XML схемите използват XML синтаксис

- Не е нужно да се учи нов език;
- XML редакторът може да бъде използван за редактиране на Schema файлове;
- XML Parser може да анализира Schema файловете;
- Можем да използваме XML DOM за манипулация на данните;
- Можем да трансформираме схемите с XSLT

# XML на сървър

XML файловете са обикновени текстови файлове, като HTML файловете. XML може лесно да се съхранява и генерира от стандартен уеб сървър.

## Съхраняване

XML файловете могат да се съхраняват на интернет сървър

## Трансформиране на XML с XSLT на сървъра

ASP трансформира XML файловете в XHTML на сървъра

```asp
<%
'Load XML'
set xml = Server.CreateObject("Microsoft.XMLDOM")
xml.async = false
xml.load(Server.MapPath("simple.xml"))

'Load XSL'
set xsl = Server.CreateObject("Microsoft.XMLDOM")
xsl.async = false
xsl.load(Server.MapPath("simple.xsl"))

'Transform file'
Response.Write(xml.transformNode(xsl))
%>
```

Първият блок създава екземпляр на Microsoft XML Parser (XMLDOM) и зарежда XML файла в паметта

Вторият блок код създава друг екземпляр на Parser-a и зарежда XSL файла в паметта

Последният ред код трансформира XML документа, използвайки XSL документа, и изпраща резултата като XHTML към браузъра

