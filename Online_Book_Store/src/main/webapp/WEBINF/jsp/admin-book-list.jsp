<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        window.onload = function() {
            document.getElementById("categoryFilter").addEventListener("change", function () {
                const selectedCategory = this.value;
                const rows = document.querySelectorAll("tbody tr[data-category]");
                rows.forEach(row => {
                    const rowCategory = row.getAttribute("data-category");
                    row.style.display = (!selectedCategory || rowCategory === selectedCategory) ? "" : "none";
                });
            });
        };
    </script>
</head>
<body class="bg-gray-50">
<div class="container mx-auto p-6">
    <h2 class="text-2xl font-semibold text-gray-800 mb-4">All Books</h2>
    <div class="flex justify-between items-center mb-6">
        <a href="${pageContext.request.contextPath}/books/add" class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium px-4 py-2 rounded-md transition">+ Add Book</a>
        <select id="categoryFilter" class="bg-white border border-gray-300 rounded px-4 py-2 shadow-sm focus:outline-none">
            <option value="">All Categories</option>
            <option value="Child books">Child books</option>
            <option value="Novels">Novels</option>
            <option value="Translations">Translations</option>
            <option value="Subject related">Subject related</option>
        </select>
    </div>

    <c:if test="${empty books}">
        <div class="bg-white shadow-md rounded-lg p-6 text-center">
            <p class="text-gray-600">No books available.</p>
        </div>
    </c:if>

    <c:if test="${not empty books}">
        <div class="overflow-x-auto bg-white shadow-md rounded-lg">
            <table class="min-w-full table-auto border-separate border-spacing-y-2">
                <thead>
                <tr class="bg-gray-200 text-left">
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Image</th>
                    <th class="px-4 py-2">Name</th>
                    <th class="px-4 py-2">Author</th>
                    <th class="px-4 py-2">Category</th>
                    <th class="px-4 py-2">Quantity</th>
                    <th class="px-4 py-2">Price</th>
                    <th class="px-4 py-2 text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${books}">
                    <tr data-category="${book.category}" class="border-b border-gray-200 hover:bg-gray-50">
                        <td class="px-4 py-2 align-middle">${book.id}</td>
                        <td class="px-4 py-2 align-middle w-24">
                            <div class="w-16 h-20 overflow-hidden rounded-md bg-gray-100 flex items-center justify-center">
                                <c:choose>
                                    <c:when test="${not empty book.imagePath}">
                                        <img src="${pageContext.request.contextPath}${book.imagePath}" alt="Cover of ${book.name}" class="object-cover w-full h-full" />
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-400 text-sm">No Image</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td class="px-4 py-2 align-middle">${book.name}</td>
                        <td class="px-4 py-2 align-middle">${book.author}</td>
                        <td class="px-4 py-2 align-middle">${book.category}</td>
                        <td class="px-4 py-2 align-middle">${book.quantity}</td>
                        <td class="px-4 py-2 align-middle">${book.price}</td>
                        <td class="px-4 py-2 text-center align-middle">
                            <div class="flex justify-center items-center space-x-2">
                                <form action="${pageContext.request.contextPath}/books/update/${book.id}" method="get">
                                    <button type="submit" class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md">Update</button>
                                </form>
                                <form action="${pageContext.request.contextPath}/books/delete/${book.id}" method="post">
                                    <button type="submit" onclick="return confirm('Are you sure you want to delete this book?');" class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md">Delete</button>
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
