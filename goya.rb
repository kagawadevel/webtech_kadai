require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {

  get = cgi['goya']

  "<html>
    <body>
      <p>ゴーヤの情報は以下の通りになります</p>
      文字列：#{get}
    </body>
  </html>"
}