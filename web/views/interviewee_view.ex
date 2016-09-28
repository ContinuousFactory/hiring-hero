defmodule Hiringhero.IntervieweeView do
  use Hiringhero.Web, :view

  def current_org_name do
    if @current_organisation do
      @current_organisation.name
    else
      ""
    end
  end
end
