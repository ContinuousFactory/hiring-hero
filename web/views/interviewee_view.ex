defmodule Hiringhero.IntervieweeView do
  use Hiringhero.Web, :view

  def is_owner(member, org) when is_nil(org), do: false
  def is_owner(member, org) do
    if org.owner_id == member.id do
      true
    end
  end
end
