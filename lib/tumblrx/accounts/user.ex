defmodule Tumblrx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    # Virtual fields:
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> set_password_hash
  end

  defp set_password_hash(user_model) do
    case user_model.valid? do
      true ->
        %{password: entered_password} = user_model.changes 
        put_change(user_model, :password_hash, hash_password(entered_password))
      false -> user_model
    end
  end

  defp hash_password(password) do
    :crypto.hash(:md5, password) |> Base.encode16(case: :lower)
  end
end
