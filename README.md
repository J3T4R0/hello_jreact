HelloJreact
===========

WARNING - external deps
```
git
npm
bower
brunch
```

Configuration
```
config :myswt, 
	app: :hello_jreact, 
	server_port: 8081, 
	callback_module: HelloJreact.Myswt.Callbacks,
	basic_auth: %{login: "hello", password: "world"}
config :bullet,
	basic_auth: %{login: "hello", password: "world"}
```

Very simple example of usage "myswt megaweb" template
```
mix deps.get
mix myswt.init
mix myswt.build # sudo
iex -S mix
```

Now look awesome web app in http://127.0.0.1:8081 with basic auth!
