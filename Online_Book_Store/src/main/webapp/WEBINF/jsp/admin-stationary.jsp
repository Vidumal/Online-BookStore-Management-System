<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>All Stationary</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
<div class="container mx-auto p-6">
    <h2 class="text-2xl font-semibold text-gray-800 mb-4">All Stationary</h2>

    <!-- Add Button -->
    <div class="flex justify-end mb-6">
        <a href="${pageContext.request.contextPath}/stationary/add" class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium px-4 py-2 rounded-md transition">
            + Add Item
        </a>
    </div>

    <c:if test="${empty stationary}">
        <div class="bg-white shadow-md rounded-lg p-6 text-center">
            <p class="text-gray-600">No items available.</p>
        </div>
    </c:if>

    <c:if test="${not empty stationary}">
        <div class="overflow-x-auto bg-white shadow-md rounded-lg">
            <table class="min-w-full table-auto border-separate border-spacing-y-2">
                <thead>
                <tr class="bg-gray-200 text-left">
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Item Name</th>
                    <th class="px-4 py-2">Quantity</th>
                    <th class="px-4 py-2">Price</th>
                    <th class="px-4 py-2">Image</th>
                    <th class="px-4 py-2 text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="s" items="${stationary}">
                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                        <td class="px-4 py-2 align-middle">${s.id}</td>
                        <td class="px-4 py-2 align-middle">${s.itemName}</td>
                        <td class="px-4 py-2 align-middle">${s.quantity}</td>
                        <td class="px-4 py-2 align-middle">${s.price}</td>
                        <td class="px-4 py-2 align-middle w-24">
                            <div class="w-16 h-20 overflow-hidden rounded-md bg-gray-100 flex items-center justify-center">
                                <c:choose>
                                    <c:when test="${not empty s.imagePath}">
                                        <img src="${pageContext.request.contextPath}${s.imagePath}" alt="${s.itemName}" class="object-cover w-full h-full" />
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-400 text-sm">No Image</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td class="px-4 py-2 text-center align-middle">
                            <div class="flex justify-center items-center space-x-2">
                                <form action="${pageContext.request.contextPath}/stationary/update/${s.id}" method="get">
                                    <button type="submit" class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md">Update</button>
                                </form>
                                <form action="${pageContext.request.contextPath}/stationary/delete/${s.id}" method="post">
                                    <button type="submit" onclick="return confirm('Are you sure you want to delete this item?');" class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
