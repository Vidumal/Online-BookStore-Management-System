<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<html>
<head>
    <title>All Users</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <div class="container mx-auto p-4">
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">All Users</h2>

        <table class="min-w-full table-auto mt-4 border-separate border-spacing-2">
            <thead>
                <tr class="bg-gray-200">
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Username</th>
                    <th class="px-4 py-2">Email</th>
                    <th class="px-4 py-2">Age</th> <!-- Added Age -->
                    <th class="px-4 py-2">Gender</th> <!-- Added Gender -->
                    <th class="px-4 py-2">Role</th>
                    <th class="px-4 py-2">Actions</th> <!-- Action Column -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr class="border-b border-gray-200">
                        <td class="px-4 py-2">${user.userId}</td>
                        <td class="px-4 py-2">${user.username}</td>
                        <td class="px-4 py-2">${user.email}</td>
                        <td class="px-4 py-2">${user.age}</td> <!-- Display Age -->
                        <td class="px-4 py-2">${user.gender}</td> <!-- Display Gender -->
                        <td class="px-4 py-2">${user.role}</td> <!-- Display Role -->
                        <td class="px-4 py-2 flex justify-center items-center space-x-2"> <!-- Centered Actions -->
                            <form action="/users/edit/${user.userId}" method="get" style="display:inline;">
                                <input type="submit" value="Edit" class="bg-yellow-500 text-white px-3 py-1 rounded-md" />
                            </form>

                            <form action="/users/${user.userId}" method="post" style="display:inline;">
                                <input type="hidden" name="_method" value="delete" />
                                <input type="submit" value="Delete" onclick="return confirm('Are you sure?');" class="bg-red-500 text-white px-3 py-1 rounded-md" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>    <%@ include file="footer.jsp" %>

</body>
</html>
