defimpl Canada.Can, for: Hiringhero.User do
  def can?(%Hiringhero.User{id: user_id}, action, %Hiringhero.User{id: user_id}) when action in [:edit, :update], do: true
  def can?(%Hiringhero.User{id: owner_id}, action, %Hiringhero.User{id: member_id}) do
    owner = Hiringhero.Repo.get_by(Hiringhero.User, id: owner_id)
    owner = Hiringhero.Repo.preload(owner, :my_organisation)
    member = Hiringhero.Repo.get_by(Hiringhero.User, id: member_id)

    if owner.my_organisation.id == member.organisation_id && action == :delete do
      true
    else
      false
    end
  end
  def can?(_, _, _), do: false
end
