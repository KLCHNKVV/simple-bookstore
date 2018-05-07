RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_or_request_with_http_basic('Authenticate is required') do |username, password|
      username == 'admin' && password == 'foobar'
    end
  end

  config.included_models = [Product, User, Order]

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
