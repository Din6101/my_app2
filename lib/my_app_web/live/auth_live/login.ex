defmodule MyAppWeb.AuthLive.LoginLive do
  use MyAppWeb, :live_view
  alias MyApp.Accounts

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       username: "",
       password: "",
       username_error: nil,
       password_error: nil
     )}
  end

  def handle_event(
        "validate",
        %{"login" => %{"username" => username, "password" => password}},
        socket
      ) do
    socket =
      socket
      |> assign(:username, username)
      |> assign(:password, password)
      |> assign(:username_error, if(username == "", do: "Please enter username.", else: nil))
      |> assign(:password_error, if(password == "", do: "Please enter your password.", else: nil))

    {:noreply, socket}
  end

  def handle_event(
        "login",
        %{"login" => %{"username" => username, "password" => password}},
        socket
      ) do
    case Accounts.authenticate_user(username, password) do
      {:ok, user} ->
        {:noreply,
         socket
         |> assign(:current_user, user)
         |> push_navigate(to: "/welcome")}

      {:error, :invalid_credentials} ->
        {:noreply, assign(socket, password_error: "Invalid username or password.")}
    end
  end
end
