<!-- Navbar -->
<nav class="bg-gray-900 text-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">
            <!-- Logo -->
            <div class="flex-shrink-0">
                <a href="/" class="text-2xl font-bold text-white hover:text-gray-300">Panhinda.lk</a>
            </div>

            <!-- Desktop Menu -->
            <div id="desktop-nav" class="hidden md:flex md:items-center space-x-8">
                <a href="/books/booksList" class="hover:text-gray-300">Books</a>
                <a href="/stationary/stationaryList" class="hover:text-gray-300">Stationary</a>
                <a href="/ticket/add" class="hover:text-gray-300">Submit Tickets</a>
                <a href="/offer" class="hover:text-gray-300">Offers</a>


                <!-- Profile icon -->
                <div id="profileIcon" class="flex items-center space-x-2">
                    <a href="/users/profile" class="flex items-center justify-center w-10 h-10 rounded-full bg-gray-500 hover:bg-gray-400">
                        <!-- Font Awesome user icon, can be replaced with your own image -->
                        <img src="https://th.bing.com/th/id/OIP.e3qvNUpZQb8-Hc0vyTIIogAAAA?w=425&h=425&rs=1&pid=ImgDetMain" alt="Profile" class="w-full h-full object-cover rounded-full">
                    </a>
                </div>
            </div>

            <!-- Mobile Menu Button -->
            <div class="flex md:hidden">
                <button id="navbar-toggler" class="text-gray-300 hover:text-white focus:outline-none">
                    <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile Menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-gray-800 px-2 pt-2 pb-3 space-y-1">
        <a href="/books/booksList" class="hover:text-gray-300">Books</a>
        <a href="/stationary/stationaryList" class="hover:text-gray-300">Stationary</a>
        <a href="/ticket/add" class="hover:text-gray-300">Submit Tickets</a>
        <a href="/offer" class="hover:text-gray-300">Offers</a>


        <!-- Profile icon for mobile menu -->
        <div id="profileIconMobile" class="flex items-center space-x-2 mt-3">
            <a href="/users/profile" class="flex items-center justify-center w-10 h-10 rounded-full bg-gray-500 hover:bg-gray-400">
                <img src="https://th.bing.com/th/id/OIP.e3qvNUpZQb8-Hc0vyTIIogAAAA?w=425&h=425&rs=1&pid=ImgDetMain" alt="Profile" class="w-full h-full object-cover rounded-full">
            </a>
        </div>
    </div>
</nav>

<script>
    // Toggle mobile menu
    const navbarToggler = document.getElementById('navbar-toggler');
    const mobileMenu = document.getElementById('mobile-menu');

    navbarToggler.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
    });

    function getCookie(name) {
        let cookieArr = document.cookie.split(';');
        for (let i = 0; i < cookieArr.length; i++) {
            let cookie = cookieArr[i].trim();
            if (cookie.startsWith(name + '=')) {
                return cookie.substring(name.length + 1);
            }
        }
        return null;
    }

    const isLoggedIn = getCookie('login') === 'true';
    const userRole = getCookie('role');

    const desktopNav = document.getElementById('desktop-nav');
    const mobileMenuLinks = document.getElementById('mobile-menu');

    const rideSharingLink = document.getElementById('rideSharingLink');
    const rideSharingLinkMobile = document.getElementById('rideSharingLinkMobile');
    const profileIcon = document.getElementById('profileIcon');
    const profileIconMobile = document.getElementById('profileIconMobile');

    const logoutButton = `
    <button id="logoutBtn" class="bg-red-500 hover:bg-red-600 px-4 py-2 rounded-md text-white">Logout</button>
  `;

    const loginButtons = `
    <a href="/login" class="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded-md text-white">Login</a>
    <a href="/register" class="bg-green-500 hover:bg-green-600 px-4 py-2 rounded-md text-white">Register</a>
  `;

    const dashboardLink = `
    <a href="/admin" class="bg-yellow-500 hover:bg-yellow-600 px-4 py-2 rounded-md text-white">Dashboard</a>
  `;

    if (isLoggedIn) {
        if (userRole === 'admin') {
            desktopNav.insertAdjacentHTML('beforeend', dashboardLink);
        }
        desktopNav.insertAdjacentHTML('beforeend', logoutButton);

        if (userRole === 'admin') {
            mobileMenuLinks.insertAdjacentHTML('beforeend', dashboardLink);
        }
        mobileMenuLinks.insertAdjacentHTML('beforeend', `
      <button id="logoutBtnMobile" class="block w-full bg-red-500 hover:bg-red-600 text-white py-2 rounded-md mt-2">Logout</button>
    `);

        // Hide "Ride Sharing" link if user role is "rider"
        if (userRole === 'rider') {
            rideSharingLink.style.display = 'none';
            rideSharingLinkMobile.style.display = 'none';
        }

        // Show profile icon when logged in
        profileIcon.style.display = 'block';
        profileIconMobile.style.display = 'block';
    } else {
        desktopNav.insertAdjacentHTML('beforeend', loginButtons);
        mobileMenuLinks.insertAdjacentHTML('beforeend', loginButtons);

        // Hide profile icon when not logged in
        profileIcon.style.display = 'none';
        profileIconMobile.style.display = 'none';
    }

    // Logout handler
    document.addEventListener('click', function (e) {
        if (e.target.id === 'logoutBtn' || e.target.id === 'logoutBtnMobile') {
            document.cookie = "login=false; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            document.cookie = "role=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";

            fetch('/users/logout', {
                method: 'GET',
                credentials: 'include'
            }).then(() => {
                window.location.href = '/login?logout=true';
            }).catch(err => {
                console.error('Logout error:', err);
                window.location.href = '/login?logout=true';
            });
        }
    });
</script>