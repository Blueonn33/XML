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

# 