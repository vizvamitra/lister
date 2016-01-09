# TODO: remove this before production
class HomepageController < ActionController::Base

  def show
    render html: <<-HTML.html_safe
      <!DOCTYPE html>
      <html>
        <head>
          <title>Development mode</title>
          <script type="text/javascript" src="/jquery.min.js"></script>
        </head>
        <body>
          <h1>Lister api</h1>
        </body>
      </html>
    HTML
  end
end