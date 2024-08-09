<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Store</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>
<body>
    <main>
        <h1>Edit Store</h1>
        <form action="${pageContext.request.contextPath}/stores/edit/${store.id}" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${store.name}" required><br><br>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${store.phoneNumber}" required><br><br>
            <label for="localities">Localities:</label>
            <input type="text" id="localities" name="localities" value="${store.localities}" required><br><br>
            <input type="submit" value="Update Store">
        </form>
    </main>
</body>
</html>
