<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Stores</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#searchInput").on("input", function() {
                let keyword = $(this).val();
                $.ajax({
                    url: "/stores/search",
                    type: "GET",
                    data: { keyword: keyword },
                    success: function(data) {
                        let tableBody = $("#storesTable tbody");
                        tableBody.empty();
                        $.each(data, function(index, store) {
                            tableBody.append(
                                "<tr>" +
                                "<td>" + store.id + "</td>" +
                                "<td>" + store.name + "</td>" +
                                "<td>" + store.phoneNumber + "</td>" +
                                "<td>" + store.localities + "</td>" +
                                "<td>" +
                                "<a href='/stores/edit/" + store.id + "'>Edit</a> " +
                                "<a href='/stores/delete/" + store.id + "'>Delete</a>" +
                                "</td>" +
                                "</tr>"
                            );
                        });
                    }
                });
            });
        });
    </script>
</head>
<body>
    <main>
        <h1>Stores</h1>
        <input type="text" id="searchInput" placeholder="Search by name" />
        <table border="1" id="storesTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Localities</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="store" items="${stores}">
                    <tr>
                        <td>${store.id}</td>
                        <td>${store.name}</td>
                        <td>${store.phoneNumber}</td>
                        <td>${store.localities}</td>
                        <td>
                            <a href="/stores/edit/${store.id}">Edit</a>
                            <a href="/stores/delete/${store.id}">Delete</a>
                            <a href="/stores/manageItems/${store.id}">Manage Items</a> <!-- New Button -->
                            <a href="/stores/shop/${store.id}">Shop Now</a> <!-- New Button -->
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>
