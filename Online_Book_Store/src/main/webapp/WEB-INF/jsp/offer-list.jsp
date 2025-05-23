<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Offer List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
  <div class="container mx-auto p-6">
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-2xl font-semibold text-gray-800">Offer List</h2>
      <a href="${pageContext.request.contextPath}/offer/add" class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium px-4 py-2 rounded-md transition">+ Add New Offer</a>
    </div>

    <c:if test="${empty offers}">
      <div class="bg-white shadow-md rounded-lg p-6 text-center">
        <p class="text-gray-600">No offers available.</p>
      </div>
    </c:if>

    <c:if test="${not empty offers}">
      <div class="overflow-x-auto bg-white shadow-md rounded-lg">
        <table class="min-w-full table-auto border-separate border-spacing-y-2">
          <thead>
            <tr class="bg-gray-200 text-left">
              <th class="px-4 py-2">ID</th>
              <th class="px-4 py-2">Description</th>
              <th class="px-4 py-2">Save</th>
              <th class="px-4 py-2">Category</th>
              <th class="px-4 py-2">Image</th>
              <th class="px-4 py-2 text-center">Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="offer" items="${offers}">
              <tr class="border-b border-gray-200 hover:bg-gray-50" data-category="${offer.category}">
                <td class="px-4 py-2 align-middle">${offer.id}</td>
                <td class="px-4 py-2 align-middle">${offer.description}</td>
                <td class="px-4 py-2 align-middle">${offer.save}</td>
                <td class="px-4 py-2 align-middle">${offer.category}</td>
                <td class="px-4 py-2 align-middle w-24">
                  <div class="w-16 h-20 overflow-hidden rounded-md bg-gray-100 flex items-center justify-center">
                    <c:choose>
                      <c:when test="${not empty offer.imagePath}">
                        <img src="${pageContext.request.contextPath}${offer.imagePath}" alt="Offer ${offer.id}" class="object-cover w-full h-full" />
                      </c:when>
                      <c:otherwise>
                        <span class="text-gray-400 text-sm">No Image</span>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </td>
                <td class="px-4 py-2 text-center align-middle">
                  <div class="flex justify-center items-center space-x-2">
                    <form action="${pageContext.request.contextPath}/offer/update/${offer.id}" method="get">
                      <button type="submit" class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md">Edit</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/offer/delete/${offer.id}" method="post">
                      <button type="submit" onclick="return confirm('Are you sure you want to delete this offer?');" class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md">Delete</button>
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
