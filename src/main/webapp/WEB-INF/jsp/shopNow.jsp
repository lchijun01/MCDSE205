<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shop Now</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            let totalPrice = 0;

            $(".quantityInput").on("input", function() {
                let quantity = $(this).val();
                let price = $(this).data("price");
                let itemTotal = quantity * price;
                totalPrice += itemTotal;

                $("#totalPrice").text(totalPrice.toFixed(2));
            });

            $("#payNowButton").on("click", function() {
                window.location.href = "${pageContext.request.contextPath}/paymentSuccess";
            });
        });
    </script>
</head>
<body>
    <main>
        <h1>Shop at Store: ${store.name}</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity Available</th>
                    <th>Price per Unit</th>
                    <th>Select Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.quantity}</td>
                        <td>${item.price}</td>
                        <td>
                            <input type="number" class="quantityInput" data-price="${item.price}" min="0" max="${item.quantity}">
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="text-align: right; margin-top: 20px;">
            <span>Total Price: $</span><span id="totalPrice">0.00</span>
            <button id="payNowButton">Pay Now</button>
        </div>
    </main>
</body>
</html>
