<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Store</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>
<body>
    <main>
        <h1>Add Store</h1>
        <form action="${pageContext.request.contextPath}/stores" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>
            <label for="localities">Localities:</label>
            <input type="text" id="localities" name="localities" required><br><br>
            <input type="submit" value="Add Store">
        </form>
    </main>
</body>
</html>
