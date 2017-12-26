var fetch = require("node-fetch");
var key="AAAALPU97BY:APA91bH_7GDP62fw8aoN9l9shyc8dfywoWLFyviKVhihx07arUhROm0cq4CtuHB0kGYhzN8WY48C538Jr8g_v9yc2VXW5Z_y3qdi1tViFTscvhRy8ytUa1ZfkluDBPvAnIK4SaRQAS0e";

var notification={'title':'지코반점',
                    'body': 'ss'  ,
                    'icon':'firebase-logo.png',
                    'click_action':'http://localhost:8081'};

//var registrationToken="fOtCYfJsTLo:APA91bEuZnOnOhIHwpQMVH3qH7T2pzBixpB1pGsKJU6k96DThUcBgP2wEPxRZBN3x_1b5yU3ZyQQvOHAYsMpENc3pqtaSL04fkri2bjQ_vOpuwYjGhUbGq3JOnEOLDI8uBZ86PJq21EU";

var registrationToken="d3sPmGGk-uQ:APA91bEWF-4q_lEJB1rn1fRQFZjULPU-X5mOdkOVlI9lFeYH2k8-9YT-4BlELCw7imdfb7_Bv282-z_sSKDIolYizce29yDExsY811PTFljMWdma8MsDjoZtC5ckbm0k3JvwtyL3UnDs";

fetch('https://fcm.googleapis.com/fcm/send', {
    'method': 'POST',
    'headers': {
        'Authorization': 'key=' + key,
        'Content-Type': 'application/json'
    },
    'body': JSON.stringify({
        'notification': notification,
        'to': registrationToken
    })

}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.error(error);
})