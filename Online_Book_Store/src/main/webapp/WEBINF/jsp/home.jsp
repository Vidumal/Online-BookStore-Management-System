<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const container = document.getElementById('heroContainer');
      const slidesEl  = document.getElementById('heroSlides');
      const dots      = document.querySelectorAll('[data-index]');
      let   current   = 0;
      const total     = slidesEl.children.length;

      function updateSlide(index) {
        current = (index + total) % total;
        const slideWidth = container.clientWidth;
        slidesEl.style.transform = `translateX(-${current * slideWidth}px)`;
        dots.forEach(dot => {
          dot.classList.toggle('bg-white', +dot.dataset.index === current);
          dot.classList.toggle('bg-gray-400', +dot.dataset.index !== current);
        });
      }

      // Dot click handlers
      dots.forEach(dot =>
        dot.addEventListener('click', () => updateSlide(+dot.dataset.index))
      );

      // Auto‑advance every 3 seconds
      setInterval(() => updateSlide(current + 1), 3000);

      // Initialize at slide 0
      updateSlide(0);
    });

    function getCookie(name) {
      const match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
      return match ? match[2] : null;
    }
    function handleGetStarted(path) {
      const loggedIn = getCookie("login") === "true";
      window.location.href = loggedIn ? path : "/login.jsp";
    }
    function handleGetStartedStationary() {
      handleGetStarted('/stationary/stationaryList');
    }
    function scrollCarousel(id, dir) {
      const el = document.getElementById(id);
      el.scrollBy({ left: dir * (el.clientWidth - 32), behavior: 'smooth' });
    }
  </script>
</head>
<body class="bg-gray-100">

  <!-- Hero Slider -->
  <div id="heroContainer" class="relative overflow-hidden">
    <div id="heroSlides" class="flex transition-transform duration-500">
      <!-- Slide 1 -->
      <div class="flex-none w-full h-64 sm:h-80 md:h-96 bg-cover bg-center relative"
           style="background-image:url('https://images.unsplash.com/photo-1509021436665-8f07dbf5bf1d?auto=format&fit=crop&w=1200&q=80');">
        <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center">
          <div class="text-center text-white px-4">
            <h2 class="text-2xl sm:text-3xl md:text-4xl font-semibold mb-4">
              The phenomenal fifth book in the Hunger Games series!
            </h2>
            <button onclick="handleGetStarted('/books/booksList')"
                    class="px-6 py-2 bg-purple-800 hover:bg-purple-900 rounded">
              Shop Now
            </button>
          </div>
        </div>
      </div>
      <!-- Slide 2 -->
      <div class="flex-none w-full h-64 sm:h-80 md:h-96 bg-cover bg-center relative"
           style="background-image:url('https://cdn.pixabay.com/photo/2017/08/07/03/22/books-2599241_1280.jpg');">
        <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center">
          <div class="text-center text-white px-4">
            <h2 class="text-2xl sm:text-3xl md:text-4xl font-semibold mb-4">
              Explore our vast library of titles across every genre.
            </h2>
            <button onclick="handleGetStarted('/books/booksList')"
                    class="px-6 py-2 bg-purple-800 hover:bg-purple-900 rounded">
              Shop Now
            </button>
          </div>
        </div>
      </div>
      <!-- Slide 3 -->
      <div class="flex-none w-full h-64 sm:h-80 md:h-96 bg-cover bg-center relative"
           style="background-image:url('https://cdn.pixabay.com/photo/2024/03/19/19/08/book-8643904_1280.jpg');">
        <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center">
          <div class="text-center text-white px-4">
            <h2 class="text-2xl sm:text-3xl md:text-4xl font-semibold mb-4">
              Uncover hidden gems and bestsellers alike!
            </h2>
            <button onclick="handleGetStarted('/books/booksList')"
                    class="px-6 py-2 bg-purple-800 hover:bg-purple-900 rounded">
              Shop Now
            </button>
          </div>
        </div>
      </div>
      <!-- Slide 4 -->
      <div class="flex-none w-full h-64 sm:h-80 md:h-96 bg-cover bg-center relative"
           style="background-image:url('https://cdn.pixabay.com/photo/2021/08/02/11/03/hallelujah-6516410_1280.jpg');">
        <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center">
          <div class="text-center text-white px-4">
            <h2 class="text-2xl sm:text-3xl md:text-4xl font-semibold mb-4">
              Find your next great read today!
            </h2>
            <button onclick="handleGetStarted('/books/booksList')"
                    class="px-6 py-2 bg-purple-800 hover:bg-purple-900 rounded">
              Shop Now
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- Navigation Dots -->
    <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
      <button data-index="0" class="w-3 h-3 bg-white rounded-full"></button>
      <button data-index="1" class="w-3 h-3 bg-gray-400 rounded-full"></button>
      <button data-index="2" class="w-3 h-3 bg-gray-400 rounded-full"></button>
      <button data-index="3" class="w-3 h-3 bg-gray-400 rounded-full"></button>
    </div>
  </div>


    <!-- Features Cards -->
    <div class="max-w-7xl mx-auto px-4 py-12 grid gap-8 md:grid-cols-2">
      <div class="bg-white rounded-lg shadow">
        <img src="https://cdn.pixabay.com/photo/2020/12/29/10/38/bookshop-5870155_1280.jpg"
             alt="Books" class="rounded-t-lg h-48 w-full object-cover" />
        <div class="p-6">
          <h3 class="text-xl font-bold mb-2">Books</h3>
          <p class="text-gray-600 mb-4">Explore our vast library of titles across every genre.</p>
          <a href="/books/booksList">
          <button onclick="handleGetStarted()"
                  class="px-4 py-2 border border-indigo-600 text-indigo-600 rounded hover:bg-orange-50">
            Get Started
          </button>
          </a>
        </div>
      </div>
      <div class="bg-white rounded-lg shadow">
        <img src="https://cdn.pixabay.com/photo/2016/07/05/17/28/schultute-1499049_1280.jpg"
             alt="Stationary" class="rounded-t-lg h-48 w-full object-cover" />
        <div class="p-6">
          <h3 class="text-xl font-bold mb-2">Stationary</h3>
          <p class="text-gray-600 mb-4">Find all your study and office supplies in one place.</p>
          <a href="/stationary/stationaryList">
          <button onclick="handleGetStartedStationary()"
                  class="px-4 py-2 border border-indigo-600 text-indigo-600 rounded hover:bg-orange-50">
            Get Started
          </button>
          </a>
        </div>
      </div>
    </div>


  <!-- All-time Bestsellers Carousel -->
  <section id="offers" class="max-w-7xl mx-auto px-4 py-12">
    <h2 class="text-2xl font-bold mb-6">All-time Bestsellers</h2>
    <div class="relative">
      <button onclick="scrollCarousel('carousel1-grid', -1)"
              class="absolute -left-6 top-1/2 transform -translate-y-1/2 bg-white p-2 rounded-full shadow hover:bg-gray-100">
        &#10094;
      </button>
      <div id="carousel1-grid" class="grid grid-cols-5 gap-6 overflow-x-auto scroll-smooth pb-4">
        <!-- Entry 1 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1514686549i/32926179.jpg"
               alt="The Great Adventure" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">The Great Adventure</p>
            <p class="text-gray-600 mb-2">Rs. 1,250</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Entry 2 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://images-na.ssl-images-amazon.com/images/I/91ZVf3kNrcL._AC_UL375_SR375,375_.jpg"
               alt="Mystery of the Night" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">The Let Them Theory</p>
            <p class="text-gray-600 mb-2">Rs. 1,800</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Entry 3 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://cdn.prod.website-files.com/5a8855ffd9716c0001a4227d/5b7835585f23e81cb64a65a0_lotr.jpg"
               alt="Romance in Paris" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">Lord of the Ring</p>
            <p class="text-gray-600 mb-2">Rs. 1,500</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Entry 4 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://storage.googleapis.com/du-prd/books/images/9781501110375.jpg"
               alt="Science for Everyone" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">It Ends with Us</p>
            <p class="text-gray-600 mb-2">Rs. 2,100</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Entry 5 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://miro.medium.com/v2/resize:fit:1224/1*iOhP9k2M6pY4nUv0QUYmVQ.png"
               alt="History Unveiled" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">Psychology of Money</p>
            <p class="text-gray-600 mb-2">Rs. 1,950</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
      </div>
      <button onclick="scrollCarousel('carousel1-grid', 1)"
              class="absolute -right-6 top-1/2 transform -translate-y-1/2 bg-white p-2 rounded-full shadow hover:bg-gray-100">
        &#10095;
      </button>
    </div>
  </section>


  <!-- Award‑Winning Books Carousel -->
  <section class="max-w-7xl mx-auto px-4 py-12">
    <h2 class="text-2xl font-bold mb-6">Award‑Winning Books</h2>
    <div class="relative">
      <button onclick="scrollCarousel('carousel2-grid', -1)"
              class="absolute -left-6 top-1/2 transform -translate-y-1/2 bg-white p-2 rounded-full shadow hover:bg-gray-100">
        &#10094;
      </button>
      <div id="carousel2-grid" class="grid grid-cols-5 gap-6 overflow-x-auto scroll-smooth pb-4">
        <!-- Award 1 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1451445646i/18143977._UX160_.jpg"
               alt="Pulitzer Prize Winner" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">Light We Can Not See</p>
            <p class="text-gray-600 mb-2">Rs. 2,300</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Award 2 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1670010752l/63910917.jpg"
               alt="Man Booker Shortlisted" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">This is How We End Things</p>
            <p class="text-gray-600 mb-2">Rs. 2,100</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Award 3 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://www.weareteachers.com/wp-content/uploads/the-last-cuentista-694x1024.jpg"
               alt="National Book Award" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">The Last Cuentista</p>
            <p class="text-gray-600 mb-2">Rs. 2,400</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Award 4 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://m.media-amazon.com/images/I/51zRLUThH6L._SL500_.jpg"
               alt="Costa Book of the Year" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">The Wild Trees</p>
            <p class="text-gray-600 mb-2">Rs. 2,200</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
        <!-- Award 5 -->
        <div class="bg-white rounded-lg shadow flex-shrink-0 w-60">
          <img src="https://m.media-amazon.com/images/I/51yiDXr0zJL._SL500_.jpg"
               alt="Newbery Medal Winner" class="rounded-t-lg h-60 w-full object-cover" />
          <div class="p-4">
            <p class="font-semibold">The Over Story</p>
            <p class="text-gray-600 mb-2">Rs. 2,000</p>
            <a href="/books/booksList">
            <button onclick="handleGetStarted()"
                    class="px-4 py-2 border border-indigo-500 text-indigo-500 rounded hover:bg-orange-50">
              Buy Now
            </button>
            </a>
          </div>
        </div>
      </div>
      <button onclick="scrollCarousel('carousel2-grid', 1)"
              class="absolute -right-6 top-1/2 transform -translate-y-1/2 bg-white p-2 rounded-full shadow hover:bg-gray-100">
        &#10095;
      </button>
    </div>
  </section>


 <!-- CTA Banner -->
     <a href="/offer"
        class="group block relative h-64 bg-cover bg-center transition-transform duration-300 hover:scale-105"
        style="background-image:url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=1200&q=80')">
         <div class="absolute inset-0 bg-black bg-opacity-40 transition-bg duration-300 group-hover:bg-opacity-50 flex items-center justify-center">
             <h2 class="text-3xl md:text-4xl text-white font-semibold">Find Out Amazing Offers</h2>
         </div>
     </a>

  <%@ include file="footer.jsp" %>

</body>
</html>
