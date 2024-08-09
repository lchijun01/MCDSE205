<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Store</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>
<body>
    <main>
        <h1>Delete Store</h1>
        <form action="/stores/delete/${store.id}" method="post">
            <input type="hidden" name="_method" value="delete">
            <p>Are you sure you want to delete this store?</p>
            <input type="submit" value="Delete Store">
        </form>
        <a href="/stores">View Stores</a>
    </main>
</body>
</html>
