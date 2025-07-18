<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add New Stationary</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-cover bg-center" style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');">
  <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
      <h1 class="text-3xl font-semibold text-center mb-6">Add New Stationary</h1>

      <!-- Success/Error Messages -->
      <c:if test="${not empty successMessage}">
        <div class="mb-4 text-green-700 bg-green-100 border border-green-200 rounded-lg px-4 py-2">
          ${successMessage}
        </div>
      </c:if>
      <c:if test="${not empty errorMessage}">
        <div class="mb-4 text-red-700 bg-red-100 border border-red-200 rounded-lg px-4 py-2">
          ${errorMessage}
        </div>
      </c:if>

<%--@elvariable id="stationary" type="org"--%>
<form:form modelAttribute="stationary" method="post" action="${pageContext.request.contextPath}/stationary/add"
           enctype="multipart/form-data" class="space-y-5">
        <!-- ID (read-only) -->
        <div>
          <label for="id" class="block text-gray-700 font-medium mb-1">ID</label>
          <form:input path="id" id="id" readonly="true"
                      cssClass="w-full bg-gray-200 text-gray-600 rounded-lg px-4 py-2 cursor-not-allowed"/>
        </div>

        <!-- Item Name -->
        <div>
          <label for="itemName" class="block text-gray-700 font-medium mb-1">Item Name</label>
          <form:input path="itemName" id="itemName" required="true"
                      cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"/>
        </div>

        <!-- Quantity -->
        <div>
          <label for="quantity" class="block text-gray-700 font-medium mb-1">Quantity</label>
          <form:input path="quantity" id="quantity" type="number" min="1" required="true"
                      cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"/>
        </div>

        <!-- Price -->
        <div>
          <label for="price" class="block text-gray-700 font-medium mb-1">Price</label>
          <form:input path="price" id="price" type="number" step="0.01" required="true"
                      cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"/>
        </div>

        <!-- Image -->
<!-- Image Upload -->
<div>
  <label for="image" class="block text-gray-700 font-medium mb-1">Upload Image</label>
  <input type="file" name="image" id="image" accept="image/*"
         class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"/>
</div>


        <!-- Submit -->
        <div>
          <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg transition">
            Add Item
          </button>
        </div>
      </form:form>
    </div>
  </div>
      <%@ include file="footer.jsp" %>

</body>
</html>
