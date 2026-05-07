# Въведение

## Какво е XML Schema (схема)

XML схемата описва структурата на документа. Езикът XML Schema се нарича още **XML Schema Definition (XSD)**.

### Пример

<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="note">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="to" type="xs:string"/>
      <xs:element name="from" type="xs:string"/>
      <xs:element name="heading" type="xs:string"/>
      <xs:element name="body" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

</xs:schema>

Целта на XML схемата е да дефинира законните градивни елементи на XML документ:
- елементите и атрибутите, които могат да се появят в документа;
- броят и редът на дъщерните елементи;
- типовете данни за елементи и атрибути;
- стойности по подразбиране и фиксирани стойности за елементи и атрибути;

### Защо се изучава XML Schema

В света на XML стотици стандартизирани XML формати се използват ежедневно. Много от тези XML стандарти са дефинирани от XML схеми. XML схемата е базирана на XML и е по-мощна алтернатива на DTD

### XML Schema поддържа типове данни'

Едно от най-големите предимства на XML Schema е поддръжката на типове данни. Те помагат за по-лесно извършване на следните неща:

- Описване на допустимото съдържание на документа;
- Проверка коректността на данните;
- Дефиниране на аспекти на данните (ограничения върху данните);
- Дефиниране на модели на данни (формати на данни);
- Конвертиране на данни между различни типове данни;

### XML Schema използва XML синтаксис

Друго голямо предимство на XML Schema e, че е написана на XML.
- Не е нужно да се учи нов език;
- Може да се използва XML редактора, за да се редактират Schema файловете;
- Схемата може да бъде манипулирана с XML DOM;
- Схемата може да бъде трансформирана с XSLT;

XML Schema е разширяем, защото е написан на XML. С разширяема дефиниция може:
- повторно използване на схемата в други схеми;
- създаване на собствени типове данни, производни на стандартните типове;
- препращане към множество схеми в един и същ документ;

### XML Schema за сигурна комуникация на данни

Когато се изпращат данни (подател - получател), е от съществено значение и двете страни да имат едни и същи очаквания относно съдържанието

С XML Schema, подателят може да опише данните по начин, който получателя ще разбере.

Дата като "03-11-2004" ще бъде интерпретирана в някои страни като 3 ноември, а в други страни като 11 март

Въпреки това, XML елемент с тип данни като този:

```xml
<date type="date">2004-03-11</date>
```

Осигурява взаимно разбиране на съдържанието, тъй като XML типът данни "дата" изисква формат "YYYY-MM-DD"

### Добре оформеното не е достатъчно

Добре оформен XML документ е документ, който отговаря на правилата на XML синтаксиса, като например:

- Трябва да започва с XML декларацията;
- Трябва да има 1 уникален коренов елемент;
- Началните тагове трябва да имат съответстващи крайни тагове;
- Елементите са чувствителни към малки и големи букви;
- Всички елементи трябва да бъдат затворени;
- Всички елементи трябва да бъдат правилно вложени;
- Всички стойности на атрибутите трябва да бъдат цитирани;
- Обектите трябва да се използват за специални символи;

Дори ако документите са добре оформени, те все пак могат да съдържат грешки и тези грешки могат да имат сериозни последици.

# XSD - начин на използване

XML документите могат да имат препратка към DTD или към XML Schema

## Прост XML документ

Имаме следния документ "note.xml"

<?xml version="1.0"?>
<note>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

## DTD файл

Следният пример е DTD файл, наречен "note.dtd", който дефинира елементите на XML документа по-горе "note.xml"

```js
<!ELEMENT note (to, from, heading, body)>
<!ELEMENT to (#PCDATA)>
<!ELEMENT from (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>
```

Първият ред определя елемента note да има 4 дъщерни елемента: 
- to    from    heading     body

Ред 2-5 определя елементите като тип #PCDATA

## XML Schema

Следният пример е XML Schema файл, наречен "note.xsd", който дефинира елементите на XML документа по-горе

```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
targetNamespace="https://www.w3schools.com"
xmlns="https://www.w3schools.com"
elementFormDefault="qualified">

<xs:element name="note">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="to" type="xs:string" />
            <xs:element name="from" type="xs:string" />
            <xs:element name="heading" type="xs:string" />
            <xs:element name="body" type="xs:string" />
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

Елементът note e сложен тип, защото съдържа други елементи. Останалите елементи (to, from, heading, body) са прости типове, защото не съдържат други елементи. 

### Препратка към DTD

Този XML документ има препратка към DTD

```xml
<?xml version="1.0"?>

<!DOCTYPE note SYSTEM "https://www.w3schools.com/xml/note.dtd">

<note>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
```

### Препратка към XML Schema

Документът съдържа препратка към XML Schema

```xml
<?xml version="1.0"?>

<note xmlns="https://www.w3schools.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://www.w3schools.com/xml note.xsd">
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
```

# XSD <schema>

Елементът <schema> е коренният елемент на всяка XML Schema

<?xml version="1.0"?>

<xs:schema>
...
</xs:schema>

Елементът schema може да съдържа някои атрибути. Декларацията на схема често изглежда по следния начин

<?xml version="1.0"?>

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" targetNamespace="https://www.w3schools.com" xmlns="https://www.w3schools.com" elementFormDefault="qualified">
...
</xs:schema>

Следният фрагмент
`xmlns:xs="http://www.w3.org/2001/XMLSchema"`

Показва, че елементите и типовете данн, използвани в схемата, идват от пространството от имена http://www.. . Също така уточнява, че елементите и типовете данни, които идват от това пространство от имена, трябва да имат префикс `xs:`

Този фрагмент
`targetNamespace="https://www.w3schools.com"`

Показва, че елементите, дефинирани от тази схема (note, to, from, title, body), идват от пространството от имена https://www ..

Този фрагмент
`xmlns="https://www.w3schools.com"`

Показва, че пространството от имена по подразбиране е https://www.w3schools.com

Последният фрагмент
`elementFormDefault="qualified"`

Показва, че всички елементи, използвани от XML екземпляра на документа, които са декларирани в тази схема, трябва да бъдат квалифицирани като пространство от имена

## Препращане към схема в XML документ

Този XML документ съдържа препратка към XML схема

<?xml version="1.0"?>

<note xmlns="https://www.w3schools.com"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="https://www.w3schools.com note.xsd">

<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Don't forget me this weekend!</body>
</note>

`xmlns="https://www.w3schools.com"`

Указва декларацията на пространството от имена по подразбиране. Тази декларация указва на валидатора на схемата, че всички елементи, използвани в този XML документ, са декларирани в пространството от имена „https://www.w3schools.com“.

След като имаме налично пространство от имена на XML схема : `xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`

Можем да използваме атрибута `schemaLocation`. Този атрибут има 2 стойности, разделени с интервал. Първата стойност е пространството от имена, което да се използва. Втората стойност е местоположението на XML схемата, която да се използва за това пространство от имена

`xsi:schemaLocation="https://www.w3schools.com note.xsd"`


# 