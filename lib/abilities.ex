defimpl Canada.Can, for: Hiringhero.User do
  def can?(%Hiringhero.User{id: user_id}, action, %Hiringhero.User{id: user_id}) when action in [:show, :edit, :update], do: true
  def can?(_, _, _), do: false
end
