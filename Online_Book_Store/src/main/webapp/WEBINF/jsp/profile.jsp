<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
<div class="container mx-auto px-4 py-8 flex-1">
    <!-- Page Title -->
    <h1 class="text-3xl font-bold text-gray-800 mb-8">Profile</h1>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Left panel: avatar, name, email, delete -->
        <div class="lg:col-span-1 bg-white rounded-2xl shadow p-6 flex flex-col items-center">
            <img
                    src="https://static.vecteezy.com/system/resources/previews/009/734/564/non_2x/default-avatar-profile-icon-of-social-media-user-vector.jpg"
                    alt="User Avatar"
                    class="w-32 h-32 rounded-full object-cover mb-4"
            />
            <h2 class="text-xl font-semibold text-gray-900 mb-2">${user.username}</h2>
            <div class="w-16 border-t border-gray-200 my-4"></div>
            <p class="text-sm text-gray-600 mb-6">${user.email}</p>
            <form action="/users/delete" method="post" onsubmit="return confirm('Are you sure you want to delete your profile?');">
                <button
                        type="submit"
                        class="bg-red-500 hover:bg-red-600 text-white font-medium px-6 py-2 rounded-lg transition"
                >
                    Delete Profile
                </button>
            </form>
        </div>

        <!-- Right panel: details with left-aligned labels -->
        <div class="lg:col-span-2 bg-white rounded-2xl shadow p-6 flex flex-col justify-between">
            <div class="max-w-md mx-auto w-full">
                <h2 class="text-2xl font-semibold text-gray-900 mb-6 text-center">
                    Profile of ${user.username}
                </h2>

                <div class="space-y-6">
                    <!-- Email -->
                    <div class="flex items-center">
                        <label class="w-24 text-gray-700">Email</label>
                        <input
                                type="text"
                                value="${user.email}"
                                readonly
                                class="flex-1 max-w-sm bg-gray-100 text-gray-700 rounded-lg px-4 py-2"
                        />
                    </div>
                    <!-- Age -->
                    <div class="flex items-center">
                        <label class="w-24 text-gray-700">Age</label>
                        <input
                                type="text"
                                value="${user.age}"
                                readonly
                                class="flex-1 max-w-sm bg-gray-100 text-gray-700 rounded-lg px-4 py-2"
                        />
                    </div>
                    <!-- Gender -->
                    <div class="flex items-center">
                        <label class="w-24 text-gray-700">Gender</label>
                        <input
                                type="text"
                                value="${user.gender}"
                                readonly
                                class="flex-1 max-w-sm bg-gray-100 text-gray-700 rounded-lg px-4 py-2"
                        />
                    </div>
                </div>
            </div>

            <!-- Divider -->
            <div class="border-t border-gray-200 my-6"></div>

            <!-- Update button -->
            <div class="text-center">
                <a
                        href="/users/update"
                        class="inline-block bg-indigo-500 hover:bg-indigo-600 text-white font-medium px-8 py-3 rounded-lg transition"
                >
                    Update Profile
                </a>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
