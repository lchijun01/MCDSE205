<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shop at Store: ${store.name}</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("input[name^='quantities']").on("input", function() {
                let total = 0;
                $("input[name^='quantities']").each(function() {
                    const quantity = $(this).val();
                    const price = $(this).closest("tr").find(".price").text();
                    total += quantity * price;
                });
                $("#totalPrice").text(total.toFixed(2));
            });
        });
    </script>
    <style>
        #totalPriceContainer {
            font-size: 18px;
            font-weight: bold;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <main>
        <h1>Shop at Store: ${store.name}</h1>
        <form action="${pageContext.request.contextPath}/stores/shop/${store.id}/checkout" method="post">
            <table border="1">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity Available</th>
                        <th>Quantity to Buy</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td>${item.productName}</td>
                            <td class="price">${item.price}</td>
                            <td>${item.quantity}</td>
                            <td><input type="number" name="quantities[${item.id}]" min="0" max="${item.quantity}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <div style="display: flex; align-items: center;">
                <div id="totalPriceContainer">
                    <label>Total Price: $</label><span id="totalPrice">0.00</span>
                </div>
                <input type="submit" value="Pay Now" style="margin-left: 20px;">
            </div>
        </form>
    </main>
</body>
</html>
