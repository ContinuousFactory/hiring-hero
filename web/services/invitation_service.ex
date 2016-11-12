defmodule InvitationService do
  @error_message "Invalid email address."

  def run(%{ "email" => email }) do
  end

  defp valid_email?(email) when is_nil(email) or email == "", do: false
  defp valid_email?(_), do: true
end
