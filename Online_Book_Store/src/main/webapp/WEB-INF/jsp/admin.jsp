<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<!-- Navbar (included via navbar.jsp) -->

<!-- Page Content -->
<main class="flex-grow p-6">
    <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Welcome to Dashboard</h1>

    <!-- Responsive Grid: 1 col on mobile, 2 on md, 3 on lg -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Card 1: User Management -->
        <a href="/users" class="group relative block h-48 overflow-hidden rounded-2xl shadow-lg">
            <img src="https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_1280.jpg"
                 alt="User Management"
                 class="absolute inset-0 w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"/>
            <div class="absolute inset-0 bg-black bg-opacity-40"></div>
            <div class="absolute inset-0 flex items-center justify-center">
                <span class="text-white text-xl font-semibold">User Management</span>
            </div>
        </a>

        <!-- Card 2: Books Management -->
        <a href="/books/admin" class="group relative block h-48 overflow-hidden rounded-2xl shadow-lg">
            <img src="https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_1280.jpg"
                 alt="Books Management"
                 class="absolute inset-0 w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"/>
            <div class="absolute inset-0 bg-black bg-opacity-40"></div>
            <div class="absolute inset-0 flex items-center justify-center">
                <span class="text-white text-xl font-semibold">Books Management</span>
            </div>
        </a>

        <!-- Card 3: Stationary Management -->
        <a href="/stationary/admin" class="group relative block h-48 overflow-hidden rounded-2xl shadow-lg">
            <img src="https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_1280.jpg"
                 alt="Stationary Management"
                 class="absolute inset-0 w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"/>
            <div class="absolute inset-0 bg-black bg-opacity-40"></div>
            <div class="absolute inset-0 flex items-center justify-center">
                <span class="text-white text-xl font-semibold">Stationary Management</span>
            </div>
        </a>

        <!-- Card 4: Tickets Management -->
        <a href="/ticket/admin" class="group relative block h-48 overflow-hidden rounded-2xl shadow-lg">
            <img src="https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_1280.jpg"
                 alt="Tickets Management"
                 class="absolute inset-0 w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"/>
            <div class="absolute inset-0 bg-black bg-opacity-40"></div>
            <div class="absolute inset-0 flex items-center justify-center">
                <span class="text-white text-xl font-semibold">Tickets Management</span>
            </div>
        </a>

        <!-- Card 5: Offers Management -->
        <a href="/offer/list" class="group relative block h-48 overflow-hidden rounded-2xl shadow-lg">
            <img src="https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_1280.jpg"
                 alt="Offers Management"
                 class="absolute inset-0 w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"/>
            <div class="absolute inset-0 bg-black bg-opacity-40"></div>
            <div class="absolute inset-0 flex items-center justify-center">
                <span class="text-white text-xl font-semibold">Offers Management</span>
            </div>
        </a>
    </div>
</main>
<%@ include file="footer.jsp" %>

</body>
</html>