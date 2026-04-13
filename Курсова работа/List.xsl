<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml">
    <xsl:template match="/">
        <html>
            <body>
                <table>
                    <h2>Магазин</h2>
                    <tr>
                        <th>Name</th>
                        <th>Manager</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Website</th>
                        <th>Annotation</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="carstore/dealership/@data-name"/></td>
                        <td><xsl:value-of select="carstore/dealership/@data-manager"/></td>
                        <td><xsl:value-of select="carstore/dealership/contacts/phone"/></td>
                        <td><xsl:value-of select="carstore/dealership/contacts/email"/></td>
                        <td><xsl:value-of select="carstore/dealership/contacts/address"/></td>
                        <td><xsl:value-of select="carstore/dealership/website/html:a/@href"/></td>
                        <td><xsl:value-of select="carstore/dealership/annotation"/></td>
                    </tr>
                </table>
                <table>
                    <h2>Автомобили</h2>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Color</th>
                        <th>km</th>
                        <th>power</th>
                        <th>Fuel Type</th>
                        <th>Transmission</th>
                        <th>Condition</th>
                        <th>Annotation</th>
                    </tr>
                    <xsl:for-each select="carstore/dealership/category/car/car-id">
                        <tr>
                            <td><xsl:value-of select="brand" /></td>
                            <td><xsl:value-of select="model" /></td>
                            <td><xsl:value-of select="year" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td><xsl:value-of select="color" /></td>
                            <td><xsl:value-of select="km" /></td>
                            <td><xsl:value-of select="power" /></td>
                            <td><xsl:value-of select="fuel-type" /></td>
                            <td><xsl:value-of select="transmission" /></td>
                            <td><xsl:value-of select="condition" /></td>
                            <td><xsl:value-of select="annotation" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <h2>Мотори</h2>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>km</th>
                        <th>power</th>
                        <th>Condition</th>
                        <th>Annotation</th>
                    </tr>
                    <xsl:for-each select="carstore/dealership/category/moto/moto-id">
                        <tr>
                            <td><xsl:value-of select="brand" /></td>
                            <td><xsl:value-of select="model" /></td>
                            <td><xsl:value-of select="year" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td><xsl:value-of select="km" /></td>
                            <td><xsl:value-of select="power" /></td>
                            <td><xsl:value-of select="condition" /></td>
                            <td><xsl:value-of select="annotation" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <h2>Автомобили - филтър за година и цена</h2>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>km</th>
                        <th>power</th>
                        <th>FuelType</th>
                    </tr>
                    <xsl:for-each select="carstore/dealership/category/car/car-id[year &gt; 2024 and price &lt;= 1000000]">
                        <tr>
                            <td><xsl:value-of select="brand" /></td>
                            <td><xsl:value-of select="model" /></td>
                            <td><xsl:value-of select="year" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td><xsl:value-of select="km" /></td>
                            <td><xsl:value-of select="power" /></td>
                            <td><xsl:value-of select="fuel-type" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <h2>Камиони - цена</h2>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>km</th>
                        <th>power</th>
                        <th>Condition</th>
                        <th>Annotation</th>
                    </tr>
                    <xsl:for-each select="carstore/dealership/category/truck/truck-id">
                        <xsl:sort select="price" data-type="number" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="brand" /></td>
                            <td><xsl:value-of select="model" /></td>
                            <td><xsl:value-of select="year" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td><xsl:value-of select="km" /></td>
                            <td><xsl:value-of select="power" /></td>
                            <td><xsl:value-of select="condition" /></td>
                            <td><xsl:value-of select="annotation" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <!-- за най-новите автомобили, камиони и мотори: Brand, Model, Year, Price, km, power,Annotation, image; -->
                    <h2>Нови автомобили, камиони, мотори</h2>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>km</th>
                        <th>power</th>
                        <th>Annotation</th>
                        <th>Image</th>
                    </tr>
                    <xsl:for-each select="carstore/dealership/category/truck/truck-id">
                        <tr>
                            <td><xsl:value-of select="brand" /></td>
                            <td><xsl:value-of select="model" /></td>
                            <td><xsl:value-of select="year" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td><xsl:value-of select="km" /></td>
                            <td><xsl:value-of select="power" /></td>
                            <td><xsl:value-of select="annotation" /></td>
                            <td>
                                <img src="{image/html:img/@src}" alt="truck image" width="80" height="auto"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
