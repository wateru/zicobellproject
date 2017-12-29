importScripts('https://www.gstatic.com/firebasejs/4.2.0/firebase-app.js');

importScripts('https://www.gstatic.com/firebasejs/4.2.0/firebase-messaging.js');

importScripts('/js/firebase_init.js');



const messaging = firebase.messaging();



messaging.setBackgroundMessageHandler(function(payload) {

  console.log('[firebase-messaging-sw.js] Received background message ', payload);

});