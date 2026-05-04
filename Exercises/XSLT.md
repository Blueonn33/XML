# Въведение

XSL (eXtensible Stylesheet Language) е език за стилизиране на XML.
XSLT е съкращение от XSL Transformations

## Препоръки

XSLT 2.0, XPath 2.0 и XQuery 1.0 споделят една и съща библиотека с функции. Има над 100 вградени функции. Има функции за низови стойности, числови стойности, сравнение на дата и час, манипулиране на възли и др.

# XSL(T) езици

XSLT е език за трансформиране на XML документи
XPath е език за навигация в XML документ
XQuery е език за заявки към XML документи

## XSL

XSL (eXtensible Stylesheet Language) - Разширяем език за стилове. W3C разработи XSL, защото имаше нужда от език за стилизиране, базиран на XML

## CSS - Cascade Stylesheets 

HTML използва предварително дефинирани тагове. Значението на всеки таг и начинът му на показване са добре разбрани. 

## XSL - всичко важно

XML не използва предварително дефинирани тагове и следователно значението на всеки таг не е добре разбрано. Елементът <table> може да показва HTML таблица, мебел или други - а браузърите не знаят как да го показват

Така че, XSL описва как трябва да се показват XML елементите

XSL се състои от 4 части:
- XSLT - език за трансформиране на XML документи
- XPath - език за навигация в XML документи
- XSL-FO - език за форматиране на XML документи (прекратен)
- XQuery - език за заявки към XML документи

:::note
C CSS3 Paged Media Module, W3C предостави нов стандарт за форматиране на документи. Така, от 2013 насам, CSS3 се предлага като заместител на XSL-FO
:::

## XSLT

- XSLT означава XSL трансформации
- Той е най-важната част от XSL
- Трансформира XML документ в друг XML документ
- Използва XPath за навигация в документа
- Препоръчан е от W3C

XSLT може да трансформира XML документа в документи, които се разпознават от браузъра, като HTML, XHTML. XSLT прави това, като трансформира всеки XML елемент в (X)HTML елемент

С XSLT могат да се добавят/премахват елементи и атрибути към или от изходния файл. Могат да се пренареждат и сортират елементи, да се извършват тестове и да се вземат решения за това кои елементи да бъдат скрити и кои да бъдат показани.

Често срещан начин за описание на процеса на трансформация е да се каже, че XSLT трансформира XML дърво на източника в XML дърво на резултата

## XSLT + XPath

XSLT използва XPath за намиране на информация в документа. XPath се използва за навигация през елементи и атрибути в документа.

В процеса на трансформация, XSLT използва XPath, за да дефинира части от изходния документ, които трябва да съответстват на един или повече предварително дефинирани шаблони. Когато бъде намерено съвпадение, XSLT трансформира съответстващата част от изходния документ в резултатен документ

## Поддръжка

Всички основни браузъри поддържат XSLT и XPath. XSLT е препоръчан от W3C през 1999

# XSL - трансформация

## Правилна декларация на стилове

Коренният елемент, който декларира документа като XSL стил, е <xsl:stylesheet> или <xsl:transform> (двата са синоними)

Правилният начин за деклариране на XSL стил е:

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

или

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

За да получим достъп до XSLT елементите, атрибутите и функциите, трябва да декларираме XSLT пространство от имена в горната част на документа

Пътят *xmlns:xsl="http://www.w3.org/1999/XSL/Transform"* сочи към официалния namespace на W3C XSLT

## Пример

Искаме да трансформираме следния XML документ в XHTML

*"cdcatalog.xml"*

<?xml version="1.0" encoding="UTF-8"?>
<catalog>
  <cd>
    <title>Empire Burlesque</title>
    <artist>Bob Dylan</artist>
    <country>USA</country>
    <company>Columbia</company>
    <price>10.90</price>
    <year>1985</year>
  </cd>
.
.
</catalog>

## Създаване на XSL стил

Създаваме XSL стил („cdcatalog.xsl“) с шаблон за трансформация

<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3c.org/1999/XSL/Transform">

```xsl
    <xsl:template match="/">
        <html>
            <body>
                <h2>CD Collection</h2>
                <table border="1">
                    <tr bgcolor="red">
                        <th>Title</th>
                        <th>Artist</th>
                    </tr>
                    <xsl:for-each select="catalog/cd">
                        <tr>
                            <td><xsl:value-of select="title" /></td>
                            <td><xsl:value-of select="artist" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
```

## Свързване на стиловете с XML

В XML документа се добавя препратка към XSL стила

<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="cdcatalog.xsl"?>
<catalog>
  <cd>
    <title>Empire Burlesque</title>
    <artist>Bob Dylan</artist>
    <country>USA</country>
    <company>Columbia</company>
    <price>10.90</price>
    <year>1985</year>
  </cd>
.
.
</catalog>

По този начин XML документът ще се превърне в XHTML документ

# Template

XSL стилът се състои от 1 или повече набора от правила, които се наричат шаблони. Шаблонът съдържа правила, които се прилагат, когато се намери съвпадение с определен възел.

## Елементът <xsl:template>

<xsl:template> използва се за изграждане на шаблони. Атрибутът match се използва за свързване на шаблон с XML елемент. Атрибутът match може да се използва и за дефиниране на шаблон за целия XML документ. Стойността на атрибута match е XPath израз (т.е. match="/" дефинира целия документ)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                <h2>My CD Collection</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>Artist</th>
                    </tr>
                    <tr>
                        <td>.</td>
                        <td>.</td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
```

Тъй като XSL стила е XML документ, той винаги започва с XML декларацията
<?xml version="1.0" encoding="UTF-8"?>

Следващият елемент - <xsl:stylesheet> - определя, че този документ е XSLT стил, заедно с номера на версията и атрибутите на XSLT пространството от имена

Елементът <xsl:template> дефинира шаблон. Атрибутът match="/" свързва шаблона с корена на изходния XML документ

Съдържанието вътре в елемента <xsl:template> определя HTML код, който да се запише в изхода. Последните 2 реда определят края на шаблона и края на стила

# Value-of

Елементът <xsl:value-of> се използва за извличане на стойността на избран възел. Елементът може да се използва за извличане на стойността на XML елемент и добавянето й към изходния поток на трансформацията

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Title</th>
      <th>Artist</th>
    </tr>
    <tr>
      <td><xsl:value-of select="catalog/cd/title"/></td>
      <td><xsl:value-of select="catalog/cd/artist"/></td>
    </tr>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
```

Атрибутът *select* съдържа XPath израз. Изразът работи като навигация във файлова система; наклонената черта / избира поддиректории

В горния пример се копира само един ред данни от XML документа в изхода. За да може да се премине през всеки елемент и да се покажат всичките записи, се използва <xsl:for-each>

# For-each

Елементът <xsl:for-each> позволява извършване на цикли в XSLT. Той се използва за избиране на всеки XML елемент от определен набор от възли.

<xsl:for-each select="catalog/cd">
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="artist"/></td>
    </tr>
</xsl:for-each>

Стойността на атрибута *select* е XPath израз. Изразът работи като навигация във файлова система

## Филтриране на изхода

Можем да филтрираме изхода от XML файла, като добавим критерий към атрибута select в елемента <xsl:for-each>

<xsl:for-each select="catalog/cd[artist='NewJeans']">

Оператори на филтри са:
- =
- !=
- <
- >

# Sort

Елементът <xsl:sort> се използва за сортиране на изхода. За да сортираме резултата, добавяме елемент <xsl:sort> в елемента <xsl:for-each> в XSL файла

<xsl:for-each select="catalog/cd">
    <xsl:sort select="artist"/>
    <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="artist"/></td>
    </tr>
</xsl:for-each>

Атрибутът *select* показва по кой XML елемент да се сортира

# If

Елементът <xsl:if> се използва за извършване на условен тест спрямо съдържанието на XML файла. За да поставим условен if тест спрямо съдържанието на XML файла, добавяме елемент <xsl:if> към XSL документа

<xsl:if test="expression">
    ... some output if the expression is true ...
</xsl:if>

## Къде да го поставим

За да добавим условен тест, добавяме елемента <xsl:if> вътре в елемента <xsl:for-each> в XSL файла

<xsl:for-each select="catalog/cd">
    <xsl:if test="price &gt; 10">
        <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="artist"/></td>
            <td><xsl:value-of select="price"/></td>
        </tr>
    </xsl:if>
</xsl:for-each>

Стойността на задължителния атрибут test съдържа израза, който трябва да бъде оценен. Горният код ще изведе само елементите за заглавие и изпълнител, чиято цена е > 10

# Choose

Елементът <xsl:choose> се използва заедно с <xsl:when> и <xsl:otherwise> за изразяване на множество условни тестове. 

## Синтаксис

```xml
<xsl:choose>
    <xsl:when test="expression">
        ... some output ...
    </xsl:when>
    <xsl:otherwise>
        ... some output ...
    </xsl:otherwise>
</xsl:choose>
```

## Поставяне на условието за избор

За да се вмъкне тест с множество условия в XML файла, се добавят елементите <xsl:choose>, <xsl:when> и <xsl:otherwise> към XSL файла

```xml
...
<xsl:for-each select="catalog/cd">
    <tr>
        <td><xsl:value-of select="title" /></td>
        <xsl:choose>
            <xsl:when test="price &gt; 10">
                <td bgcolor="#431264"><xsl:value-of select="artist" /></td>
            </xsl:when>
            <xsl:otherwise>
                <td><xsl:value-of select="artist" /></td>
            </xsl:otherwise>
        </xsl:choose>
    </tr>
</xsl:for-each>
...
```

Кодът добавя лилав фон към колоната Artist, когато цената на диска е > 10

Друг пример

```xsl
...
<xsl:choose>
    <xsl:when test="price &gt; 10">
        <td bgcolor="#593c59">
        <xsl:value-of select="artist"/></td>
    </xsl:when>
    <xsl:when test="price &gt; 9">
        <td bgcolor="#cccccc">
        <xsl:value-of select="artist"/></td>
    </xsl:when>
    <xsl:otherwise>
        <td><xsl:value-of select="artist"/></td>
    </xsl:otherwise>
</xsl:choose>
...
```

# Apply

Елементът <xsl:apply-templates> прилага шаблонно правило към текущия елемент или към дъщерните възли на текущия елемент. 

Ако добавим атрибут *select* към елемента <xsl:apply-templates>, той ще обработи само дъщерните елементи, които съответстват на стойността на атрибута. Можем да използваме атрибута *select*, за да укажем в какъв ред да се обработват дъщерните възли

<xsl:template match="cd">
  <p>
    <xsl:apply-templates select="title"/>
    <xsl:apply-templates select="artist"/>
  </p>
</xsl:template>

# XSLT - при клиента

XSLT може да се използва за трансформиране на документа в XHTML в браузъра.

## JavaScript

В предишните секции беше обяснено как XSLT може да се използва за трансформиране на документ от XML в XHTML. Това бе направено, като се добави XSL стил към XML файла и браузърът сам извърши трансформацията

Дори да работи добре, не винаги е желателно да се включва препратка към стил в XML файл (няма да работи в браузър, който не поддържа XSLT)

По-гъвкаво решение е използването на JavaScript за извършване на трансформацията

С помощта на JavaScript може да:
- Правим тестове, специфични за браузъра;
- Използваме различни стилове според нуждите на браузъра и потребителя;

Една от целите на дизайна на XSLT беше да направи възможно трансформирането на данни от един формат в друг, поддържайки различни браузъри и различни потребителски нужди

## XML файл и XSL файл

XML документ

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalog>
  <cd>
    <title>Empire Burlesque</title>
    <artist>Bob Dylan</artist>
    <country>USA</country>
    <company>Columbia</company>
    <price>10.90</price>
    <year>1985</year>
  </cd>
.
.
</catalog>
```

И придружаващият XSL стил

```xsl
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
    </tr>
    <xsl:for-each select="catalog/cd">
    <tr>
      <td><xsl:value-of select="title" /></td>
      <td><xsl:value-of select="artist" /></td>
    </tr>
    </xsl:for-each>
  </table>
</xsl:template>

</xsl:stylesheet>
```

:::important
XML файлът няма препратка към XSL файл.

Горното изречение показва, че XML файл може да бъде трансформиран с помощта на много различни XSL стилове
:::

# 