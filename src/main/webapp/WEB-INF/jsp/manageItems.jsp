<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Items</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>
<body>
    <main>
        <h1>Manage Items for Store: ${store.name}</h1>
        <form action="${pageContext.request.contextPath}/stores/manageItems/${store.id}" method="post">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required><br><br>
            <label for="quantity">Quantity:</label>
            <input type="text" id="quantity" name="quantity" required><br><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required><br><br>
            <input type="submit" value="Add Item">
        </form>

        <h2>Items</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.productName}</td>
                        <td>${item.quantity}</td>
                        <td>${item.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>
