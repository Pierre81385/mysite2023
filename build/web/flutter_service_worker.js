'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "b7f41289caf0de47c261c241299decc1",
"index.html": "330066a3df64a7e83858e1ed7118c4dd",
"/": "330066a3df64a7e83858e1ed7118c4dd",
"main.dart.js": "38c0ad2e867725806caa8c896859955b",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "cfe645a9baa10b14a0e3dbfafda29254",
"assets/AssetManifest.json": "38ed89e5c209cda810eb9b31b3f8af2b",
"assets/NOTICES": "c60232c6267b4e6bd7497649971fcee6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/lib/assets/me.png": "5ae2fa3ccc02a65accf17bee4b52e75b",
"assets/lib/assets/me_splash.png": "cc5c8b6572643b0e0174204cccbcffcd",
"assets/lib/assets/git.png": "dada02e10622982e16d1370778a4e489",
"assets/lib/assets/pos.gif": "2afa5cdcc51c88ec01f0cd2e93f1a847",
"assets/lib/assets/nightclub.gif": "2c658e55e342d7b7c46ec5c49cc9c8ac",
"assets/lib/assets/insta.gif": "201315447db746de9ca23bbf7b318836",
"assets/lib/assets/train1.gif": "121c3221bef806ac0c722892e942716f",
"assets/lib/assets/match.gif": "d45b17086851168a927fbcbcf369698d",
"assets/lib/assets/foraged.jpg": "c20d6a56c086a4515bf9e4ffc615c5ca",
"assets/lib/assets/dataconnect.jpg": "d391f35f81f5f6c7e65b13b3c0095468",
"assets/lib/assets/center-icon.png": "678a6428e55519da16dc1e8f60730c29",
"assets/lib/assets/perenso.png": "babdc5db9d2ba40f9b094ef1d8ea16ab",
"assets/lib/assets/face.png": "cb5cf2aa9af7e9102262d6f7d38a8444",
"assets/lib/assets/ecom.gif": "b8087b00dd3b661be5c8eed0edc44302",
"assets/lib/assets/lilme.png": "3a164d2c3d4cbf0a151280c09ffcadd8",
"assets/lib/assets/oliver4.png": "4245d9cb21659568338fcca2e9565357",
"assets/lib/assets/callme.jpg": "3a61f1807a53ccb531cc12c567d843cb",
"assets/lib/assets/oliver5.png": "a489a275c0ae42c1900daad18c3e4f52",
"assets/lib/assets/DU.png": "47f20e9ef22a28cf5279f47484009dd6",
"assets/lib/assets/du.jpg": "7627cc22a75a40d20daea06cac23e9e2",
"assets/lib/assets/oliver1.jpg": "706e891cc31a353e02f1fcf5167b9d18",
"assets/lib/assets/insta.png": "cb9e6f0b8465a9691554373b76f43f90",
"assets/lib/assets/oliver0.jpg": "08cde4db2221276e6a01619f3a248f67",
"assets/lib/assets/oliver2.jpg": "e7bd8a57fca403b515326c1f10fcfee9",
"assets/lib/assets/oliver3.jpg": "ddd9e6aabf029350e88d5909d09777a9",
"assets/lib/assets/sushi.png": "459e2c5c17b38681713d142351a222ec",
"assets/lib/assets/linkd.png": "106a11e3df66db0e9abd11aab2c1b90f",
"assets/lib/assets/git.xcf": "1b40934f10a5bc61c826523ed81142ff",
"assets/lib/assets/beer.gif": "38cba90b4e42e17f07b38320cf9996a4",
"assets/lib/assets/back.jpg": "715b0b39423aef3d6f68d3d9cfa9b263",
"assets/lib/assets/clickup.png": "2ff17cde3b614a52a15d190e8514e42c",
"assets/lib/assets/mhs.png": "4f99d0dfbc1e6f4cb8a68271ac0b65d4",
"assets/lib/assets/baruch.png": "132857d5496573bf0bc220334b9ab0f2",
"assets/AssetManifest.bin": "520f1776fa15271612c4bc4421ffa3c7",
"assets/fonts/MaterialIcons-Regular.otf": "52fc34a70b225832e47b13c384bc9b3e",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
