require 'rails_helper'

RSpec.describe "Friends", type: :request do
  it "creates a Friend and redirects to the Friend's page" do
    get new_friend_path
    expect(response).to render_template(:new)

    post friends_path, params: { friend: { name: "My Friend" } }

    expect(response).to redirect_to(assigns(:friend))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Friend was successfully created.")
    expect(response).to have_http_status(200)
  end

  it "does not render a different template" do
    get new_friend_path
    expect(response).to_not render_template(:show)
  end

  # it "creates a Friend" do
  #   headers = { "ACCEPT" => "application/json" }
  #   post friends_path, params: { friend: {name: "My Friend Jason"} }, headers: headers

  #   expect(response.content_type).to eq("application/json; charset=utf-8")
  #   expect(response).to have_http_status(:created)
  # end
end

Rspec.describe "Friends with authentication", type: :request do
  #TODO
end
