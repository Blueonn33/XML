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
