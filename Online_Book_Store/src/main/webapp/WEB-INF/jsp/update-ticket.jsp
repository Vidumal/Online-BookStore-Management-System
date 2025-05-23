<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Support Ticket</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body
        class="min-h-screen bg-cover bg-center"
        style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');"
>
<div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
        <h1 class="text-3xl font-semibold text-center mb-6">Update Support Ticket</h1>

        <form:form modelAttribute="ticket"
                   method="post"
                   action="${pageContext.request.contextPath}/ticket/update/${ticket.id}"
                   class="space-y-5">

            <!-- Hidden fields -->
            <form:hidden path="id" />
            <form:hidden path="userEmail" />
            <form:hidden path="subject" />
            <form:hidden path="message" />
            <input type="hidden" name="_method" value="PUT" />

            <!-- ID (static) -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">ID</label>
                <p class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2">${ticket.id}</p>
            </div>

            <!-- User Email (static) -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">User Email</label>
                <p class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2">${ticket.userEmail}</p>
            </div>

            <!-- Subject (static) -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Subject</label>
                <p class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2">${ticket.subject}</p>
            </div>

            <!-- Message (static) -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Message</label>
                <textarea readonly class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 h-24 resize-none">${ticket.message}</textarea>
            </div>

            <!-- Status (select) -->
            <div>
                <label for="status" class="block text-gray-700 font-medium mb-1">Status</label>
                <form:select path="status" id="status"
                             cssClass="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500">
                    <form:option value="pending" label="Pending" />
                    <form:option value="resolved" label="Resolved" />
                </form:select>
            </div>

            <!-- Submit -->
            <div>
                <button type="submit"
                        class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg transition">
                    Update Status
                </button>
            </div>
        </form:form>
    </div>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
