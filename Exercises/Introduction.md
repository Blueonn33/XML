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