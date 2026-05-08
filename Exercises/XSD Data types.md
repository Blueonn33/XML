# XSD String Data type

Типовете данни string се използват за стойности, които съдържат низове от символи. Типът данни може да съдържа знаци, символи за подаване на нов ред, символи за връщане на каретка и символи за табулация

Пример за декларация на низ в схема

<xs:element name="customer" type="xs:string" />

Елемент в документа може да изглежда така

<customer>John Smith</customer>

или така

<customer>      John Smith      </customer>

**Забележка** - XML процесорът няма да промени стойността, ако се използва типа данни string

## Тип данни - normalizedString

normalizedString e производен на типа string

Нормализираният съдържа символи, но XML процесорът ще премахне символите за нов ред и табулация 

<xs:element name="customer" type="xs:normalizedString" />

Елемент в документа може да изглежда така

<customer>John Smith</customer>

или така

<customer>      John Smith      </customer>

**Забележка** - XML процесорът ще замени табулациите с интервали

## Тип данни - token

Производен е на string

token също съдържа символи, нo XML процесорът ще премахне преместванията на нов ред, връщането на каретката, табулациите, началните и крайните интервали, както и множеството интервали

<xs:element name="customer" type="xs:token" />

Елемент в документа може да изглежда така

<customer>John Smith</customer>

или така

<customer>      John Smith      </customer>

**Забележка** - XML процесорът ще премахне табулациите.

## Типове низови данни

Всички типове данни по-долу произлизат от типа данни String 

**ИМЕ**                 **ОПИСАНИЕ**
ENTITIES
ENTITY
ID                      низ, който представя ID атрибута в XML (използва се само със Schema attributes)

IDREF                   низ, който представя IDREF атрибута в XML (използва се само със Schema attributes)

language                низ, съдържащ валидно id за езика

Name                    съдържа валидно XML име

NCNAME

NMTOKEN                 представя NMTOKEN атрибута в XML (използва се само със Schema attributes)

NMTOKENS

normalizedString        не съдържа премествания на нов ред, връщане на каретка или табулации

QName

string                  низ

token                   не съдържа връщане на нов ред, връщане на каретка, табулации, начални или крайни интервали или множество интервали

## Ограничения за типовете низови данни

Ограничения, които могат да се използват с типове данни string:

- enumeration (изброяване);
- length;
- maxLength;
- minLength;
- pattern (NMTOKENS, IDREFS и ENTITIES не могат да използват това ограничение);
- whiteSpace;

# 