# Въведение

## Какво е DTD

DTD (Document Type Definition) - Дефиниция на типа на документа.
DTD определя структурата, както и правилните елементи и атрибути на XML документ

## Защо да използваме DTD

С DTD, независими групи от хора могат да се споразумеят за стандартен DTD за обмен на данни. Приложението може да използва DTD, за да провери дали XML данните са валидни.

## Вътрешна DTD декларация

Ако DTD е деклариран в XML файла, той трябва да бъде обвит в дефиницията <!DOCTYPE>

```js
<?xml version="1.0"?>
<!DOCTYPE note [
<!ELEMENT note (to,from,heading,body)>
<!ELEMENT to (#PCDATA)>
<!ELEMENT from (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>
]>
<note>
    <to>Tove</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>Don't forget me this weekend</body>
</note>
```

DTD кодът определя дадените правила:
- **!DOCTYPE note** - коренният елемент на този документ е note;
- **!ELEMENT note** - елементът note трябва да съдържа 4 елемента:
  - to
  - from
  - heading
  - body
- **!ELEMENT** - елементът to да бъде от тип #PCDATA;
- **!ELEMENT from** - елементът from да бъде от тип #PCDATA;
- **!ELEMENT heading** - елементът heading да е от тип #PCDATA;
- **!ELEMENT body** - елементът body да е от тип #PCDATA;

## Външна DTD декларация

Ако DTD е декларирано във външен файл, дефиницията <!DOCTYPE> трябва да съдържа препратка към DTD файла

XML документ с препратка към външна DTD

```xml
<?xml version="1.0"?>
<!DOCTYPE note SYSTEM "note.dtd">
<note>
    <to>Mila</to>
    <from>Martin</from>
    <heading>Reminder</heading>
    <body>Meeting</body>
</note>
```

Ето и файла "note.dtd", който съдържа DTD

```js
<!ELEMENT note (to,from,heading,body)>
<!ELEMENT to (#PCDATA)>
<!ELEMENT from (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>
```

# XML градивни елементи

Основните градивни елементи както на XML, така и на HTML документите са елементите.

## Градивните елементи на XML документите

От гледна точка на DTD, всички XML документи са изградени от следните градивни елементи

- Елементи;
- Атрибути;
- Обекти;
- PCDATA;
- CDATA;

### Елементи

Елементите са основните градивни елементи както на XML, така и на HTML документите. 

Примери за HTML елементи са body, table.
Примери за XML елементи могат да бъдат note, message
Елементите могат да съдържат текст, други елементи или да бъдат празни. Примери за празни HTML елементи са *hr*, *br* и *img*

<body>some text</body>
<message>some text</message>

### Атрибути

Атрибутите предоставят допълнителна информация за елементите. 
Атрибутите винаги се поставят в отварящия таг на елемент.
Атрибутите винаги се преглагат в двойки име/стойност. 

Следният елемент "img" съдържа допълнителна информация за изходния файл
<img src="computer.gif" />

Името на елемента е img. Името на атрибута е src, а стойността му е gif файл. Самият елемент е празен.

### Обекти

Някои символи имат специално значение в XML, като например знака < , който определя началото на XML таг

Обектите се разширяват, когато документът се анализира от XML парсер
Следните обекти са предварително дефинирани в XML

&lt;    <
&gt;    >
&amp;   &
&quot;  "
&apos;  '

### PCDATA

PCDATA означава анализирани символни данни. Символните данни са текста, намиращ се между началния и крайния етикет на XML елемент. 

PCDATA е текст, който ще бъде анализиран от парсер. Текстът ще бъде проверен от парсера за обекти и маркиране.

Таговете в текста ще се третират като маркиране и обектите ще бъдат разширени. 
Анализираните символни данни не трябва да съдържат символи &, < или >. Те трябва да бъдат представени съответно от обектите &, < и >

### CDATA

CDATA означава символни данни. 
CDATA е текст, който няма да бъде анализиран от парсер. Таговете в текста няма да бъдат третирани като маркиране и обектите няма да бъдат разгъвани.

# DTD - Елементи

В DTD елементите се декларират чрез ELEMENT

## Деклариране

В DTD, XML елементите се декларират със следния синтаксис

```js
<!ELEMENT element-name category>

или

<!ELEMENT element-name (element-content)>
```

### Празни елементи

Празните елементи се декларират с ключовата дума за категория EMPTY

```js
<!ELEMENT element-name EMPTY>

Example:

<!ELEMENT br EMPTY>

XML Example:

<br />
```

### Елементи с анализирани символни данни

Елементи, съдържащи само анализирани символни данни, се декларират с #PCDATA в скоби

```js
<!ELEMENT element-name (#PCDATA)>

Example:

<!ELEMENT from (#PCDATA)>
```

### Елементи с произволно съдържание

Елементите, декларирани с ключовата дума category ANY, могат да съдържат произволна комбинация от данни, които могат да се анализират

```js
<!ELEMENT element-name ANY>

Example

<!ELEMENT note ANY>
```

### Елементи с деца (последователности)

Елементите с едно или повече деца се декларират с името на децата в скоби

```js
<!ELEMENT element-name (child1)>

или

<!ELEMENT element-name (child1, child2, ...)>

Example

<!ELEMENT note (to, from, heading, body)>
```

Когато децата са декларирани в последователност, разделена със запетаи, те трябва да се появят в същата последователност в документа. При пълна декларация децата също трябва да бъдат декларирани и децата също могат да имат деца. Пълната декларация на елемента note е

```js
<!ELEMENT note (to, from, heading, body)>
<!ELEMENT to (#PCDATA)>
<!ELEMENT from (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>
```

### Деклариране само на едно срещане на елемент

```js
<!ELEMENT element-name (child-name)>

Example

<!ELEMENT note (message)>
```

Горният пример декларира, че дъщерният елемент message трябва да се появи веднъж и само веднъж в елемента note

### Деклариране на минимум едно срещане на елемент

```js
<!ELEMENT element-name (child-name+)>

Example

<!ELEMENT note (message)>
```

Знакът + декларира, че дъщерният елемент message трябва да се появи един или повече пъти в елемента note

### Деклариране на 0 или повече срещания на даден елементю

```js
<!ELEMENT element-name (child-name*)>

Example:

<!ELEMENT note (message*)>
```

Знакът * декларира, че дъщерният елемент message може да се среща 0 или повече пъти в елемента note

### Деклариране на 0 или 1 срещане на елемент

```js
<!ELEMENT element-name (child-name?)>

Example:

<!ELEMENT note (message?)>
```

### Деклариране на съдържание "или/или"

```js
<!ELEMENT note (to, from, header, (message | body))>
```

Елементът note трябва да съдържа елемент to, from, header и елемент message или body

### Деклариране на смесено съдържание

```js
<!ELEMENT note (#PCDATA | to | from | header | message)*>
```

Елементът note може да съдържа 0 или повече съвпадения на анализирани символни данни, елементи to, from, header или message

# DTD - Атрибути

В DTD атрибутите се декларират с декларация ATTLIST

## Декларация на атрибути

Има следния синтаксис

```js
<!ATTLIST element-name attribute-name attribute-type attribute-value>

DTD example

<!ATTLIST payment type CDATA "check">

XML example

<payment type="check" />
```

**Типът на атрибута може да бъде един от следните**

CDATA               символни данни
(en1 | en2 | .. )   трябва да е 1 от изброен списък
ID                  уникално ID
IDREF               ID на друг елемент
IDREFS              списък от ID-та
NMTOKEN             валидно XML име
NMTOKENS            списък от валидни XML имена
ENTITY              обект
ENTITIES            списък от обекти
NOTATION            име на нотация
xml:                предефинирана xml стойност

**Стойността на атрибута може да бъде една от следните**

value               стойност подразбиране на атрибута
#REQUIRED           атрибутът е задължителен
#IMPLIED            атрибутът не е задължителен
#FIXED value        стойността на атрибута е константа

### Стойност на атрибута по подразбиране

```js
DTD
<!ELEMENT square EMPTY>
<!ATTLIST square width CDATA "0">

Valid XML
<square width="100">
```

Елементът square е дефиниран като празен елемент с атрибут width от тип CDATA. Ако не е зададена ширина, стойността по подразбиране е 0

### #REQUIRED

Синтаксис

```js
<!ATTLIST element-name attribute-name attribute-type #REQUIRED>
```

Пример

```js
DTD
<!ATTLIST person number CDATA #REQUIRED>

Valid XML
<person number="5677" />

Invalid XML
<person />
```

Ключовата дума #REQUIRED се използва, ако няма опция за стойност по подразбиране, но все пак се изисква атрибутът да бъде наличен

### #IMPLIED

Синтаксис

```js
<!ATTLIST element-name attribute-name attribute-type #IMPLIED>
```

Пример

```js
DTD
<!ATTLIST contact fax CDATA #IMPLIED>

Valid XML
<contact fax="555-667788" />

Valid XML
<contact />
```

Ключовата дума не принуждава включване на атрибут и няма опция за стойност по подразбиране

### #FIXED

Синтаксис

```js
<!ATTLIST element-name attribute-name attribute-type #FIXED "value">
```

Пример

```js
DTD
<!ATTLIST sender company CDATA #FIXED "Microsoft">

Valid XML
<sender company="Microsoft" />

Invalid XML
<sender company="W3Schools" />
```

Ключовата дума задава конкретна стойност на даден атрибут, без да позволява промяна. Ако бъде използвана друга стойност, XML анализаторът ще върне грешка

### Изброени стойности на атрибути

Синтаксис

```js
<!ATTLIST element-name attribute-name (en1 | en2 | ..) default-value>
```

Пример

```js
DTD
<!ATTLIST payment type (check | cash) "cash">

XML example
<payment type="check" />

или 

<payment type="cash" />
```

Използваме изброени стойности, когато искаме стойността на атрибута да бъде една от фиксиран набор от допустими стойности

# XML елементи срещу атрибути

В XML няма правила за това кога да се използват атрибути и кога да се използват дъщерни елементи

## Използване на елементи спрямо атрибути

Данните могат да се съхраняват в дъщерни елементи или атрибути

<person sex="female">
  <firstname>Anna</firstname>
  <lastname>Smith</lastname>
</person>

<person>
  <sex>female</sex>
  <firstname>Anna</firstname>
  <lastname>Smith</lastname>
</person>

В първия пример sex e атрибут. В последния sex е дъщерен елемент. И двата примера предоставят една и съща информация

Няма правила за това кога да се използват атрибути и кога да се използват дъщерни елементи. Атрибутите са удобни в HTML, но в XML е препоръчително да се избягват. Използват се дъщерни елементи, ако информацията изглежда като данни.

### Пример

Следните 3 XML документа съдържат абсолютно една и съща информация

<note date="12/11/2002">
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

Във втория пример се използва елемент за датата вместо атрибут

<note>
  <date>12/11/2002</date>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

В третия се използва разширен елемент за дата (препоръчително)

<note>
  <date>
    <day>12</day>
    <month>11</month>
    <year>2002</year>
  </date>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

### Избягване използването на атрибути

Някои от проблемите с атрибути са:
- атрибутите не могат да съдържат множество стойности (дъщерните елементи могат)
- атрибутите не са лесно разширяеми (за бъдещи промени)
- атрибутите не могат да описват структури (дъщерните елементи могат)
- атрибутите са по-трудни за манипулиране от програмния код
- стойностите на атрибутите не са лесни за тестване спрямо DTD

Ако се използват атрибути като контейнери за данни, ще се получат документи, които са трудни за четене и поддръжка. По-добре е да се използват елементи за описание на данните. 

Атрибутите се използват само за предоставяне на информация, която не е от значение за данните

XML НЕ трябва да се използва така

<note day="12" month="11" year="2002"
to="Tove" from="Jani" heading="Reminder"
body="Don't forget me this weekend!">
</note>

### Изключение

Правилата винаги имат изключения

Понякога се присвояват ID препратки към елементи. Тези ID препратки могат да се използват за достъп до XML елементи по почти същия начин, както атрибутите NAME или ID в HTML. Примерът демонстрира това

<messages>
<note id="p501">
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

<note id="p502">
  <to>Jani</to>
  <from>Tove</from>
  <heading>Re: Reminder</heading>
  <body>I will not!</body>
</note>
</messages>

Идентификаторът в тези примери е просто брояч или уникален идентификатор за идентифициране на различните бележки в XML файла, а не част от данните за бележката.

Метаданните (данни за данни) трябва да се съхраняват като атрибути, а самите данни трябва да се съхраняват като елементи.

# DTD обекти

Обектите се използват за дефиниране на стойности до специални символи. Обектите могат да бъдат декларирани като вътрешни или външни

## Вътрешна декларация на обект

Синтаксис

```js
<!ENTITY entity-name "entity-value">
```

Пример

```js
DTD Example

<!ENTITY writer "Donald Duck."
<!ENTITY copywright "Copyright W3Schools.">

XML Example

<author>&writer;&copywright;</author>
```

Обектът се състои от 3 части:
&   име на обекта  ;

## Декларация за външен обект

Синтаксис

```js
<!ENTITY entity-name SYSTEM "URI/URL">
```

Пример

```js
DTD Example

<!ENTITY writer SYSTEM "https://www.w3schools.com/entities.dtd">
<!ENTITY copywright SYSTEM "https://www.w3schools.com/entities.dtd">\

XML Example

<author>&writer;&copyright;</author>
```