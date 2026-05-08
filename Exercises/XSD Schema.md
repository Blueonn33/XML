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


# Прости елементи

XML Schemes определят елементите на XML файловете. Простият елемент е XML елемент, който съдържа само текст. Той не може да съдържа други елементи или атрибути

## Какво е прост елемент

Простият елемент е XML елемент, който може да съдържа само текст. Той не може да съдържа други елементи или атрибути.

Текстът може да бъде от много различни типове. Може да бъде един от типовете, включени в дефиницията на XML Schema ( булев, низ, дата и т.н. ), или може да бъде персонализиран тип, който може да бъде дефиниран от автора.

Могат да се добавят ограничения (аспекти) към тип данни, за да се ограничи съдържанието му, или може да се изисква данните да съответсват на определен шаблон. 

### Дефиниране на прост елемент

Синтаксисът за дефиниране на прост елемент е:

<xs:element name="xxx" type="yyy" />

Където `xxx` е името на елемента, a `yyy` e типът данни на елемента. XML схемата има много вградени типове данни. Най-често срещаните типове са:

- xs:string
- xs:decimal
- xs:integer
- xs:boolean
- xs:date
- xs:time

### Пример

Ето някои XML елементи

<lastname>Refsnes</lastname>
<age>36</age>
<dateborn>1970-03-27</dateborn>

Ето и дефинициите на простите елементи

<xs:element name="lastname" type="xs:string" />
<xs:element name="age" type="xs:integer" />
<xs:element name="dateborn" type="xs:date" />

### Стойности по подразбиране и константи

Простите елементи могат да имат стойност по подразбиране ИЛИ фиксирана стойност, зададена като такава.

На елемента автоматично се присвоява стойност по подразбиране, когато не е зададена друга стойност

В следващия пример стойността по подразбиране е `red`

<xs:element name="color" type="xs:string" default="red" />

Константна стойност също се присвоява на елемента и не може да се зададе друга стойност. В следващия пример константната стойност е `red`

<xs:element name="color" type="xs:string" fixed="red" />

# Атрибути

Всички атрибути са декларирани като прости типове

## Какво е атрибут

Простите елементи не могат да имат атрибути. Ако даден елемент има атрибути, той се счита за сложен тип. Но самият атрибут винаги се декларира като прост тип.

## Как да дефинираме атрибут

Систаксисът за дефиниране на атрибут е следният

<xs:attribute name="xxx" type="yyy" />

Където `xxx` е името на атрибута, а `yyy` указва типа данни на атрибута

XML Schema има много вградени типове данни. Най-често срещаните типове са:

- xs:string
- xs:decimal
- xs:integer
- xs:boolean
- xs:date
- xs:time

### Пример

XML елемент с атрибут

<lastname lang="EN">Smith</lastname>

А ето и съответното определение на атрибута

<xs:attribute name="lang" type="xs:string" />

### Стойности по подразбиране и константи

Атрибутите могат да имат стойност по подразбиране ИЛИ константна стойност, зададена като такава. На атрибута автоматично се присвоява стойност по подразбиране, когато не е зададена друга стойност.

В следващия пример стойността по подразбиране е `EN`

<xs:attribute name="lang" type="xs:string" default="EN" />

На атрибута също автоматично се присвоява константна стойност и не може да се зададе друга. В следващия пример е използвана константа

<xs:attribute name="lang" type="xs:string" fixed="EN" />

### Незадължителни и задължителни атрибути

Атрибутите са незадължителни по подразбиране. За да се укаже, че атрибутът е задължителен, се използва атрибута `use`

<xs:attribute name="lang" type="xs:string" use="required" />

### Ограничения върху съдържанието

Когато XML елемент или атрибут има дефиниран тип данни, това поставя ограничения върху съдържанието на елемента или атрибута

Ако XML елемент е от тип `xs:date` и съдържа низ като "Hello world", елементът няма да бъде валидиран.

С XML Schema може да се добавят собствени ограничения към XML елементите и атрибутите им. Тези ограничения се наричат `фасети`. 

# Ограничения / Facets

Ограниченията се използват за дефиниране на приемливи стойности за XML елементи или атрибути. Ограниченията върху XML елементите се наричат facets

## Ограничения върху стойностите

Следният пример дефинира елемент `age` с ограничение. Стойността на age не може да бъде < 0 или > 120

```xml
<xs:element name="age">
    <xs:simpleType>
        <xs:restriction base="xs:integer">
            <xs:minInclusive value="0" />
            <xs:maxInclusive value="120" />
        </xs:restriction>
    </xs:simpleType>
</xs:element>
```

### Ограничения върху набор от стойности

За да ограничим съдържанието на XML елемент до набор от приемливи стойности, бихме използвали ограничението за изброяване.

Примерът по-долу дефинира елемент `car`, с ограничение. Единствените приемливи стойности са: Suzuki, Hyundai, Toyota

<xs:element name="car">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:enumeration value="Audi"/>
      <xs:enumeration value="Golf"/>
      <xs:enumeration value="BMW"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

Горният пример би могъл да бъде написан и така

<xs:element name="car" type="carType"/>

<xs:simpleType name="carType">
  <xs:restriction base="xs:string">
    <xs:enumeration value="Audi"/>
    <xs:enumeration value="Golf"/>
    <xs:enumeration value="BMW"/>
  </xs:restriction>
</xs:simpleType>

В този случай типът `carType` може да се използва от други елементи, защото не е част от елемента `car`

### Ограничения върху поредица от стойности

За да ограничим съдържанието на XML елемент, за да дефинираме поредица от числа или букви, които могат да се използват, бихме използвали ограничението на шаблона

Примерът дефинира елемент `letter`, с ограничение. Единствената приемлива стойност е 1 от малките букви a-z

<xs:element name="letter">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="[a-z]"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

Следващият пример дефинира елемент, наречен `initials`. 

<xs:element name="initials">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z][A-Z][A-Z]"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

Също и този

<xs:element name="initials">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="[a-zA-Z][a-zA-Z][a-zA-Z]"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

Следващият пример е `choise`. Избира се 1 от 3-те букви

<xs:element name="choice">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="[xyz]"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

### Други ограничения

Допустимата стойност е 0 или повече срещания на малки букви от a-z

<xs:element name="letter">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="([a-z])*"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

В следващия пример трябва да се използва поне 1 от тези двойки букви

<xs:element name="letter">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="([a-z][A-Z])+"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

В следващия пример се избира пол - една от двете стойности

<xs:element name="gender">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="male|female"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

Следващият пример включва стойност, която трябва да съдържа точно 8 знака, като знаците са от тези: a-z A-Z 0-9

<xs:element name="password">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="[a-zA-Z0-9]{8}"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

### Ограничения за символи за интервали

За да определим как трябва да се обработват символите за интервали, ще използваме ограничението `whiteSpace`

Ограничението whiteSpace е зададено на `preserve`, което означава, че XML процесорът НЯМА да премахне никакви символи за интервал

<xs:element name="address">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:whiteSpace value="preserve"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

В другия пример `replace` означава, че XML процесорът ЩЕ ЗАМЕНИ всички символи за интервали (нов ред, табулация, .. ) с интервали

<xs:element name="address">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:whiteSpace value="replace"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

`collapse` ПРЕМАХВА всички символи за интервали (нов ред и табулация се заменят с интервали, началните и крайните интервали се премахват, а множеството интервали се свежда до 1)

<xs:element name="address">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:whiteSpace value="collapse"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

### Ограничения за дължина

За да ограничим дължината на стойност в даден елемент, бихме използвали ограниченията length, maxLength и minLength

В примера стойността трябва да бъде точно 8 знака

<xs:element name="password">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:length value="8"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

В другия пример стойността трябва да е минимум 5 символа и максимум 8 символа.

<xs:element name="password">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:minLength value="5"/>
      <xs:maxLength value="8"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

## Ограничения за типове данни

`enumeration`       дефинира списък от приемливи стойности
`fractionDigits`    определя максимален брой от десетични знаци; Да бъде >= 0
`length`            определя точен брой от символи или списък от елементи. Да бъде >= 0
`maxExclusive`      определя горна граница за числени стойности (стойността трябва да е по-малка от тази)
`maxInclusive`      определя горна граница за числени стойности (стойността трябва да е по-малка или равна от тази)
`maxLength`         определя максимален брой от символи или списък от стойности. Да е >= 0         
`minExclusive`      определя долна граница за числени стойности (стойността да е по-голяма от тази)
`minInclusive`      определя долна граница за числени стойности (стойността да е по-голяма или равна от тази)    
`minLength`         задава минимален брой от символи или списък от стойности. Да е >= 0
`pattern`           определя точна последователност от символи, които са позволени
`totalDigits`       определя точен набор от цифри, които са позволени
`whiteSpace`        определя как празните пространства (табулация, интервал, нов ред) се обработват

# Сложни елементи

Сложният елемент е XML елемент, който съдържа други елементи и/или атрибути.
Има четири вида сложни елементи:

- празни елементи;
- елементи, които съдържат само други елементи;
- елементи, които съдържат само текст;
- елементи, които съдържат както други елементи, така и текст

:::note
Всеки от тези елементи може да съдържа и атрибути
:::

## Примери

Сложен XML елемент product, който е празен

<product pid="13445" />

Сложен елемент, който съдържа само други елементи

<employee>
    <firstname>Martin</firstname>
    <lastname>Marinov</lastname>
</employee>

Сложен елемент, който съдържа само текст

<food type="dessert">Ice cream</food>

Сложен елемент, съдържащ както елементи, така и текст

<description>
It happened on <date lang="norwegian">03.03.99</date>...
</description>

### Как да дефинираме сложен елемент

Имаме този пример

<employee>
  <firstname>John</firstname>
  <lastname>Smith</lastname>
</employee>

Можем да дефинираме сложен елемент в XML Schema по 2 различни начина:

1. Елементът employee може да бъде деклариран директно чрез именуване на елемента

```xml
<xs:element name="employee">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="firstname" type="xs:string" />
            <xs:element name="lastname" type="xs:string" />
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

Чрез описания по-горе метод, само елементът `employee` може да използва посочения сложен тип. Дъщерните елементи `firstname` и `lastname` са заобиколени от индикатора `<sequence>`. Това означава, че дъщерните елементи трябва да се появяват в същия ред, в който са декларирани. 

2. Елементът employee може да има атрибут type, който препраща към името на сложния тип, който да се използва

```xml
<xs:element name="employee" type="personinfo"/>

<xs:complexType name="personinfo">
    <xs:sequence>
        <xs:element name="firstname" type="xs:string" />
        <xs:element name="lastname" type="xs:string" />
    </xs:sequence>
</xs:complexType>
```

С описания по-горе метод, няколко елемента могат да се отнасят до един и същ сложен тип, ето така:

```xml
<xs:element name="employee" type="personinfo"/>
<xs:element name="student" type="personinfo"/>
<xs:element name="member" type="personinfo"/>

<xs:complexType name="personinfo">
    <xs:sequence>
        <xs:element name="firstname" type="xs:string"/>
        <xs:element name="lastname" type="xs:string"/>
    </xs:sequence>
</xs:complexType>
```

Може също така да се базира сложен тип на съществуващ сложен тип и да се добавят елементи. Използва се `extension` да вмъкване на сложен тип в друг.

```xml
<xs:element name="employee" type="fullpersoninfo"/>

<xs:complexType name="personinfo">
    <xs:sequence>
        <xs:element name="firstname" type="xs:string"/>
        <xs:element name="lastname" type="xs:string"/>
    </xs:sequence>
</xs:complexType>

<xs:complexType name="fullpersoninfo">
    <xs:complexContent>
        <xs:extension base="personinfo">
            <xs:sequence>
                <xs:element name="address" type="xs:string"/>
                <xs:element name="city" type="xs:string"/>
                <xs:element name="country" type="xs:string"/>
            </xs:sequence>
        </xs:extension>
    </xs:complexContent>
</xs:complexType>
```

# Празни елементи

Празният сложен елемент не може да има съдържание, само атрибути

## Сложни празни елементи

Празен елемент

<product prodid="1345" />

Елементът product няма съдържание. Да се определи тип без съдържание трябва да определим тип, който позволява елементи в съдържанието си, но всъщност не декларираме никакви елементи като този

```xml
<xs:element name="product">
  <xs:complexType>
    <xs:complexContent>
      <xs:restriction base="xs:integer">
        <xs:attribute name="prodid" type="xs:positiveInteger"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
</xs:element>
```

В горния пример е дефиниран сложен тип със сложно съдържание. Елементът complexContent сигнализира, че възнамеряваме да ограничим или разширим модела на съдържание на сложен тип, а ограничението integer декларира един атрибут, но не въвежда никакво съдържание на елемента.

Можем да декларираме product и така

<xs:element name="product">
  <xs:complexType>
    <xs:attribute name="prodid" type="xs:positiveInteger"/>
  </xs:complexType>
</xs:element>

Или можем да дадем име на елемента complexType и да позволим на елемента product да има атрибут type, който препраща към името на complextType (по този начин няколко елемента могат да препращат към един и същ сложен тип)

<xs:element name="product" type="prodtype"/>

<xs:complexType name="prodtype">
  <xs:attribute name="prodid" type="xs:positiveInteger"/>
</xs:complexType>

# 