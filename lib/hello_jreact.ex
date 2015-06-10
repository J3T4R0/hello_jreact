defmodule HelloJreact do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(HelloJreact.Worker, [arg1, arg2, arg3])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloJreact.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule HelloJreact.Myswt.Callbacks do
  require Myswt
  Myswt.callback_module do
    def handle_myswt(%Myswt.Proto{subject: "foo", content: some}) do 
      case Maybe.to_number(some) do
        num when is_number(num) -> %Myswt.Proto{subject: "foo", content: "sin(#{num}) = #{:math.sin(num)}"} |> Myswt.encode
        _ -> %Myswt.Proto{content: "wrong data #{inspect some}"} |> Myswt.encode
      end
    end
    def handle_myswt(%Myswt.Proto{subject: "bar", content: bin}) when is_binary(bin) do
      IO.puts "#{__MODULE__} : message bar from myswt , content \"#{bin}\"."
      %Myswt.Proto{subject: "notice", content: "OK, bro. Look message in server's console."} |> Myswt.encode
    end
  end
end