<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Offer</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body
  class="min-h-screen bg-cover bg-center"
  style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');"
>
  <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
      <h1 class="text-3xl font-semibold text-center mb-6">Update Offer</h1>

      <form:form modelAttribute="offer"
                 method="post"
                 action="${pageContext.request.contextPath}/offer/update"
                 enctype="multipart/form-data"
                 class="space-y-5">

        <c:if test="${not empty error}">
          <div class="text-red-600 text-sm">
            ${error}
          </div>
        </c:if>

        <!-- Hidden ID -->
        <form:hidden path="id" />

        <!-- Description -->
        <div>
          <label for="description" class="block text-gray-700 font-medium mb-1">Description</label>
          <form:input path="description" id="description" required="true"
            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
        </div>

        <!-- Save Value -->
        <div>
          <label for="save" class="block text-gray-700 font-medium mb-1">Save Value</label>
          <form:input path="save" id="save" type="number" step="0.01" required="true"
            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
        </div>

        <!-- Category -->
        <div>
          <label for="category" class="block text-gray-700 font-medium mb-1">Category</label>
          <form:select path="category" id="category" required="true"
            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          >
            <form:option value="" label="-- Select Category --" />
            <form:option value="books" label="Books" />
            <form:option value="stationary" label="Stationary" />
            <form:option value="books plus stationary" label="Books Plus Stationary" />
          </form:select>
        </div>

        <!-- Image Upload -->
        <div>
          <label for="image" class="block text-gray-700 font-medium mb-1">Upload Image</label>
          <input type="file" name="image" id="image"
                 class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
        </div>

        <!-- Submit Button -->
        <div>
          <button type="submit"
                  class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg transition">
            Update Offer
          </button>
        </div>

      </form:form>
    </div>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
