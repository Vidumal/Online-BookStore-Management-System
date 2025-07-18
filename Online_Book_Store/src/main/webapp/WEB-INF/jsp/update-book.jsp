<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Book</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body
        class="min-h-screen bg-cover bg-center"
        style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');"
>
<div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
        <h1 class="text-3xl font-semibold text-center mb-6">Update Book</h1>

        <!-- Form to Update Book Details -->
        <form:form modelAttribute="book"
                   method="post"
                   action="${pageContext.request.contextPath}/books/update"
                   enctype="multipart/form-data"
                   class="space-y-5">

            <c:if test="${not empty error}">
                <div style="color: red;">
                        ${error}
                </div>
            </c:if>
            <!-- ID read-only -->
            <div>
                <label for="id" class="block text-gray-700 font-medium mb-1">ID</label>
                <form:input path="id" id="id" readonly="true"
                            cssClass="w-full bg-gray-200 text-gray-600 rounded-lg px-4 py-2 cursor-not-allowed"
                />
            </div>

            <!-- Name -->
            <div>
                <label for="name" class="block text-gray-700 font-medium mb-1">Name</label>
                <form:input path="name" id="name"
                            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
            </div>

            <!-- Author -->
            <div>
                <label for="author" class="block text-gray-700 font-medium mb-1">Author</label>
                <form:input path="author" id="author"
                            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
            </div>

            <!-- Quantity -->
            <div>
                <label for="quantity" class="block text-gray-700 font-medium mb-1">Quantity</label>
                <form:input path="quantity" id="quantity" type="number" min="0"
                            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
            </div>

            <!-- Category -->
            <div>
                <label for="category" class="block text-gray-700 font-medium mb-1">Category</label>
                <form:select path="category" id="category"
                             cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500">
                    <form:option value="" label="-- Select Category --" />
                    <form:option value="Child books" label="Child books" />
                    <form:option value="Novels" label="Novels" />
                    <form:option value="Translations" label="Translations" />
                    <form:option value="Subject related" label="Subject related" />
                </form:select>
            </div>

            <!-- Price -->
            <div>
                <label for="price" class="block text-gray-700 font-medium mb-1">Price</label>
                <form:input path="price" id="price" type="number" step="0.01"
                            cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
            </div>


            <!-- Book Image Upload -->
            <div>
                <label for="image" class="block text-gray-700 font-medium mb-1">Upload Image</label>
                <input type="file" name="image" id="image"
                       class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
            </div>

            <!-- Submit -->
            <div>
                <button type="submit"
                        class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg transition">
                    Update Book
                </button>
            </div>
        </form:form>
    </div>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
