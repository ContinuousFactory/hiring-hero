defmodule Hiringhero.IntervieweeView do
  use Hiringhero.Web, :view

  def is_owner(member, org) when is_nil(org), do: ""
  def is_owner(member, org) do
    if org.owner_id == member.id do
      "owner"
    end
  end
end
