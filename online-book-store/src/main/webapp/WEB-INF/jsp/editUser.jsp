<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Edit User</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body
  class="min-h-screen bg-cover bg-center"
  style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');"
>
  <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
      <h1 class="text-3xl font-semibold text-center mb-6">Edit User</h1>

      <form action="/users/${user.userId}" method="post" class="space-y-5">
        <!-- For PUT method override -->
        <input type="hidden" name="_method" value="put" />

        <!-- Username -->
        <div>
          <label for="username" class="block text-gray-700 font-medium mb-1">Username</label>
          <input
            type="text" id="username" name="username"
            value="${user.username}"
            required
            class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
        </div>

        <!-- Email -->
        <div>
          <label for="email" class="block text-gray-700 font-medium mb-1">Email</label>
          <input
            type="email" id="email" name="email"
            value="${user.email}"
            required
            class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
        </div>

        <!-- Age -->
        <div>
          <label for="age" class="block text-gray-700 font-medium mb-1">Age</label>
          <input
            type="number" id="age" name="age"
            value="${user.age}" min="0"
            required
            class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
        </div>

        <!-- Role (read-only) -->
        <div>
          <label for="role" class="block text-gray-700 font-medium mb-1">Role</label>
          <input
            type="text" id="role" name="role"
            value="${user.role}" readonly
            class="w-full bg-gray-200 text-gray-600 rounded-lg px-4 py-2 cursor-not-allowed"
          />
        </div>

        <!-- Gender -->
        <div>
          <span class="block text-gray-700 font-medium mb-1">Gender</span>
          <div class="flex items-center space-x-6">
            <label class="inline-flex items-center">
              <input
                type="radio" name="gender" value="male"
                ${user.gender == 'male' ? 'checked' : ''}
                class="form-radio text-orange-600"
              />
              <span class="ml-2 text-gray-800">Male</span>
            </label>
            <label class="inline-flex items-center">
              <input
                type="radio" name="gender" value="female"
                ${user.gender == 'female' ? 'checked' : ''}
                class="form-radio text-orange-600"
              />
              <span class="ml-2 text-gray-800">Female</span>
            </label>
          </div>
        </div>

        <!-- Password -->
        <div>
          <label for="password" class="block text-gray-700 font-medium mb-1">Password</label>
          <input
            type="password" id="password" name="password"
            value="${user.password}"
            class="w-full bg-gray-100 text-gray-900 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
        </div>

        <!-- Submit -->
        <div>
          <button
            type="submit"
            class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg transition"
          >
            Update User
          </button>
        </div>
      </form>

      <!-- Back Link -->
      <div class="text-center mt-4">
        <a href="/users" class="text-indigo-600 hover:underline text-sm">
          &larr; Back to User List
        </a>
      </div>
    </div>
  </div>
      <%@ include file="footer.jsp" %>

</body>
</html>
