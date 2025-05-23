<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp" %>

<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="min-h-screen bg-black">



<!-- Login Form UI -->
<div class="flex flex-col md:flex-row h-full">
    <!-- Left Panel -->
    <div class="w-full md:w-1/2 bg-white flex flex-col justify-center items-center px-8 py-12">
        <div class="mb-8">
            <img src="https://img.icons8.com/ios/100/user--v1.png" alt="Logo" class="h-13" />
        </div>

        <div class="max-w-sm w-full">
            <h2 class="text-2xl font-bold mb-6 text-center">Sign in</h2>

            <form action="/users/login" method="post" class="space-y-4">
                <div>
                    <label for="email" class="block mb-1 text-gray-700 text-sm font-medium">Email</label>
                    <input type="email" id="email" name="email" required
                           class="w-full border border-gray-300 p-2 rounded focus:outline-none focus:ring-2 focus:ring-orange-500"/>
                </div>

                <div>
                    <label for="password" class="block mb-1 text-gray-700 text-sm font-medium">Password</label>
                    <input type="password" id="password" name="password" required
                           class="w-full border border-gray-300 p-2 rounded focus:outline-none focus:ring-2 focus:ring-orange-500"/>
                </div>

                <div class="text-red-500 text-sm">${errorMessage}</div>

                <button type="submit"
                        class="bg-indigo-600 text-white font-medium w-full py-2 rounded hover:bg-indigo-700 transition">
                    Sign in
                </button>
            </form>

            <p class="mt-4 text-sm text-center text-gray-600">
                Don't have an account?
                <a href="/users/register" class="text-blue-600 font-medium hover:underline">Sign up</a>
            </p>
        </div>
    </div>

    <!-- Right Panel -->
    <div class="w-full md:w-1/2 h-64 md:h-auto">
        <img src="https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_1280.jpg" alt="Scooter" class="w-full h-full object-cover"/>
    </div>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
