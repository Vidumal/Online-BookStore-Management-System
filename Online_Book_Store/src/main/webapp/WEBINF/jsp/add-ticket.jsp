<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Submit Support Ticket</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body
        class="min-h-screen bg-cover bg-center"
        style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');"
>
<div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
        <h1 class="text-3xl font-semibold text-center mb-6">Submit Support Ticket</h1>

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

        <form:form modelAttribute="ticket" method="post" class="space-y-5">
            <!-- Hidden Fields -->
            <form:hidden path="id"/>
            <form:hidden path="status"/>

            <!-- User Email -->
            <div>
                <label for="userEmail" class="block text-gray-700 font-medium mb-1">User Email</label>
                <form:input
                        path="userEmail"
                        id="userEmail"
                        type="email"
                        required="true"
                        cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
            </div>

            <!-- Subject -->
            <div>
                <label for="subject" class="block text-gray-700 font-medium mb-1">Subject</label>
                <form:select
                        path="subject"
                        id="subject"
                        cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                >
                    <form:option value="" label="-- Select Subject --"/>
                    <form:option value="books_related" label="Books Related"/>
                    <form:option value="stationary_related" label="Stationary Related"/>
                    <form:option value="others" label="Others"/>
                </form:select>
            </div>

            <!-- Message -->
            <div>
                <label for="message" class="block text-gray-700 font-medium mb-1">Message</label>
                <form:textarea
                        path="message"
                        id="message"
                        rows="4"
                        cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
            </div>

            <!-- Submit -->
            <div>
                <button
                        type="submit"
                        class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg transition"
                >
                    Submit Ticket
                </button>
            </div>
        </form:form>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
