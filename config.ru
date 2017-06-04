require 'opal'
require 'roda'
require 'opal-browser'

Opal::Config.source_map_enabled = true

builder = Opal::Builder.new(:stubs=>['opal'])
builder.append_paths('assets/js')
builder.use_gem('opal-browser')

Roda.plugin :assets, :js=>%w'test.rb', :js_opts=>{:builder=>builder}

Roda.route do |r|
  r.assets

  r.root do
    <<END
<!DOCTYPE html>
<html>
<head>
<title>Roda/Opal Integration Test</title>

<script src="https://unpkg.com/react@15/dist/react.min.js"></script>
<script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

<script src="http://cdn.opalrb.org/opal/current/opal.js"></script>
<script src="http://cdn.opalrb.org/opal/current/opal-parser.js"></script>
<script type="text/javascript">Opal.load('opal-parser')</script>

<script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/hyperloop.min.js"></script>

#{assets(:js)}
</head>
<body>
 <h1>Roda/Opal Integration Test</h1>
 <ul id="example">
 </ul>
</body>
</html>
END
  end
end

run Roda.app
