$(function() {
  Digits.init({ consumerKey: 'F6W9oHNeu1oPLPwtmAZWErWkY' });
  console.log('doc loaded')
  $('#loginButton').click(function(event) {
    event.preventDefault();
    console.log('login button')
    Digits.logIn()
      .done(function(response) {
        // Send headers to your server and validate user by calling Digits’ API
        var oAuthHeaders = response.oauth_echo_headers;
        var verifyData = {
          authHeader: oAuthHeaders['X-Verify-Credentials-Authorization'],
          apiUrl: oAuthHeaders['X-Auth-Service-Provider'],
          //name, email, enough to create user
        };

        $.ajax({
            url: '/sessions',
            type: 'POST',
            data: verifyData,
            success: function(data) {
              if(data.email === null) {
                // this is a new user
                window.location = '/';
              } else {
                // we know about this user
                window.location = '/';
              }
              console.log('success');
              console.log('session.js');
            },
            error: function(xhr, textStatus, errorThrown) {
              console.log('error', xhr, textStatus);
            }
        });
      })
    .fail(function(error) {
      console.log('an error occured:', error);
    });
  });
});
