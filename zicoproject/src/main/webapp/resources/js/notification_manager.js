  const messaging = firebase.messaging();



  messaging.onTokenRefresh(function() {

    messaging.getToken()

    .then(function(refreshedToken) {

      console.log('Token refreshed.');

      setTokenSentToServer(false);

      sendTokenToServer(refreshedToken);

      resetUI();

    })

    .catch(function(err) {

      console.log('Unable to retrieve refreshed token ', err);

      showToken('Unable to retrieve refreshed token ', err);

    });

  });



  messaging.onMessage(function(payload) {

    console.log("Message received. ", payload);

    receivedMessage(payload);

  });



  function receivedMessage(payload) {

    alert(payload);

    // TODO : notification이 왔을 때 처리를 도맡아 한다.

  }





  function resetUI() {

    messaging.getToken().then(function(currentToken) {

      if (currentToken) {

        sendTokenToServer(currentToken);

        updateUIForPushEnabled(currentToken);

      } else {

        console.log('No Instance ID token available. Request permission to generate one.');

        updateUIForPushPermissionRequired();

        setTokenSentToServer(false);

      }

    })

    .catch(function(err) {

      console.log('An error occurred while retrieving token. ', err);

      showToken('Error retrieving Instance ID token. ', err);

      setTokenSentToServer(false);

    });

  }



  function sendTokenToServer(currentToken) {

    if (!isTokenSentToServer()) {

      console.log('Sending token to server...' + "\n" + currentToken);

     // TODO : send token to server (실제 서버로 토큰을 전송하자)

      setTokenSentToServer(true);

    } else {

      console.log('Token already sent to server so won\'t send it again ' + 'unless it changes' + "\n" + currentToken);

    }



  }



  function isTokenSentToServer() {

    return window.localStorage.getItem('sentToServer') == 1;

  }



  function setTokenSentToServer(sent) {

    window.localStorage.setItem('sentToServer', sent ? 1 : 0);

  }



  function requestPermission() {

    console.log('Requesting permission...');

    messaging.requestPermission().then(function() {

      console.log('Notification permission granted.');

      resetUI();

    })

    .catch(function(err) {

      console.log('Unable to get permission to notify.', err);

    });

  }



  function deleteToken() {

    messaging.getToken().then(function(currentToken) {

      messaging.deleteToken(currentToken)

      .then(function() {

        console.log('Token deleted.');

        setTokenSentToServer(false);

        resetUI();

      })

      .catch(function(err) {

        console.log('Unable to delete token. ', err);

      });

    })

    .catch(function(err) {

      console.log('Error retrieving Instance ID token. ', err);

      showToken('Error retrieving Instance ID token. ', err);

    });



  }



  function updateUIForPushEnabled(currentToken) {



  }



  function updateUIForPushPermissionRequired() {

  Notification.requestPermission();

  }



  resetUI();