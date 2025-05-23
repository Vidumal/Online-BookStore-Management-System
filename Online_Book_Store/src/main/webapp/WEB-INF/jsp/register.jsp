<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>User Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body class="bg-black min-h-screen">

<div class="flex flex-col md:flex-row h-full">
    <div class="w-full md:w-1/2 bg-white flex flex-col justify-center items-center px-8 py-10">

        <div class="flex items-center space-x-2 mb-6">
            <img src="https://via.placeholder.com/40?text=FG" alt="Company name" class="h-10" />
            <h1 class="text-xl font-bold text-gray-700">Company name</h1>
        </div>

        <div class="max-w-sm w-full">
            <h2 class="text-2xl font-bold mb-6 text-gray-800 text-center">Create an account</h2>

            <form action="/users/register" method="post" class="space-y-4" >

                <!-- Error Message -->
                <div id="errorMessages">
                    <% String error = (String) request.getAttribute("errorMessage");
                       if (error != null) { %>
                       <p class="text-sm text-red-600 font-medium mt-2"><%= error %></p>
                    <% } %>
                </div>

                <!-- Username -->
                <input type="text" name="username" placeholder="Name"
                       class="w-full bg-gray-100 text-sm px-4 py-3 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500"
                       required />

                <!-- Email -->
                <input type="email" name="email" placeholder="Email"
                       class="w-full bg-gray-100 text-sm px-4 py-3 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500"
                       required />

                <!-- Age -->
                <input type="number" name="age" id="age" placeholder="Age" min="0"
                       class="w-full bg-gray-100 text-sm px-4 py-3 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500"
                       required />

                <!-- Gender -->
                <div class="flex items-center space-x-4 text-gray-700 text-sm">
                    <label class="flex items-center">
                        <input type="radio" name="gender" value="male" required class="text-orange-500 mr-2" /> Male
                    </label>
                    <label class="flex items-center">
                        <input type="radio" name="gender" value="female" class="text-orange-500 mr-2" /> Female
                    </label>
                </div>

                <!-- Role -->
               <input type="hidden" name="role" value="user" />

                <!-- Password -->
                <input type="password" name="password" placeholder="Password"
                       class="w-full bg-gray-100 text-sm px-4 py-3 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500"
                       required />

                <!-- Confirm Password -->
                <input type="password" name="confirmPassword" placeholder="Confirm Password"
                       class="w-full bg-gray-100 text-sm px-4 py-3 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500"
                       required />

                <!-- Terms -->
                <div class="flex items-center space-x-2 text-sm">
                    <input type="checkbox" id="terms" name="terms"
                           class="h-4 w-4 text-indigo-500 rounded focus:ring-orange-500" required />
                    <label for="terms" class="text-gray-700">
                        I agree with
                        <a href="#" class="text-indigo-600 hover:underline">Terms, Conditions & Privacy Policy</a>
                    </label>
                </div>

                <!-- Submit -->
                <button type="submit"
                        class="w-full bg-indigo-600 text-white font-medium py-3 rounded-md hover:bg-indigo-700 transition">
                    Sign Up
                </button>
            </form>

            <p class="text-center mt-6 text-sm text-gray-600">
                Already have an account?
                <a href="/users/login" class="text-blue-600 font-medium hover:underline">Sign in</a>
            </p>
        </div>
    </div>

    <!-- Right Side -->
    <div class="w-full md:w-1/2 h-64 md:h-auto">
        <img src="https://cdn.pixabay.com/photo/2016/11/29/12/50/bookcases-1869616_1280.jpg"
             alt="Greenhouse" class="w-full h-full object-cover" />
    </div>
</div>
    <%@ include file="footer.jsp" %>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");

        form.addEventListener("submit", function (event) {
            let errorMessage = "";

            const password = form.querySelector('input[name="password"]').value;
            const confirmPassword = form.querySelector('input[name="confirmPassword"]').value;

            const passwordPattern = /^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$/;

            if (!passwordPattern.test(password)) {
                errorMessage = "Password too weak";
            } else if (password !== confirmPassword) {
                errorMessage = "Passwords do not match";
            }

            if (errorMessage !== "") {
                event.preventDefault();
                document.getElementById("errorMessages").innerHTML =
                    <p class="text-sm text-red-600 font-medium mt-2">${errorMessage}</p>;


            } else {
                document.getElementById("errorMessages").innerHTML = "";
            }
        });
    });
</script>

</body>
</html>