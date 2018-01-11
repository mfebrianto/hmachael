# Hmachael

The purpose of this gem is to verify HMAC by calling BSS for token validation. This gem will be used by my-amaysim and amaysim-api as a single point for authenticating user.

## Installation

Add this line to your application's Gemfile:

```ruby
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hmac_authentication https://stash.amaysim.net/scm/aweb/amaysim-hmac-authentication.git

## Usage

Install the gem as specified above.

You can use it by using the following code example:
1. Create HmacConfig Object. This object contains information regarding savon connection.

```ruby
HmacConfig.new(endpoint: Settings.bss_wsdl,
              namespace: savon_connection.namespace,
              open_timeout: savon_connection.session_timeout,
              read_timeout: savon_connection.session_timeout,
              log: savon_connection.log,
              pretty_print_xml: savon_connection.pretty_print_xml,
              logger: Rails.logger,
              ssl_verify_mode: savon_connection.ssl_verify_mode)
```

2. Create an object of RequestAuthenticationService and call authenticate! method

```ruby
RequestAuthenticationService.new(hmac_config: hmac_config,
                                token: auth_token,
                                device_id: device_id,
                                signature_timestamp: signature_timestamp,
                                http_verb: @request.method,
                                uri: @request.path).authenticate!
```

3. Above piece of code will return a hash with following attributes:

```ruby
{
  client_id: 'xxx',
  phone_id: 'xxx',
  session_token: 'xxx',
  msn: 'xxx'
}
```

4. In case of errors it can throw following three different types of exception

If timestamp is invalid (either before or in the future or simply wrong)
```ruby
RequestAuthenticationService::InvalidSignatureTimestampException
```

If fields are missing
```ruby
RequestAuthenticationService::MissingMandatoryFieldsException
```

If authentication failed, in that case you can check the ```exception.message``` to see the exact error message from BSS.
```ruby
CheckAuthenticationService::InvalidAuthenticationException
```

