<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>Product Discount Calculator</h2>
  <form action="/discount" method="post">
    <h3>Product Description</h3>
    <input type="text" name="product" size="30" />
    <h3>List Price</h3>
    <input type="number" name="listprice" size="30" />
    <h3>Discount Percent</h3>
    <input type="number" name="discount" size="30" placeholder="% is max 100%">
    <button type="submit" name="result">Calculator Result</button>
  </form>
  </body>
</html>
