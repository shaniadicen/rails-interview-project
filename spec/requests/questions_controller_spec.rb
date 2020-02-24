require "rails_helper"

describe Question, type: :request do
  it "returns a list of public questions" do
    tenant = create(:tenant)
    public_question = create(:question, private: false)
    create(:answer, question: public_question)

    get api_v1_questions_url, params: {
      api_key: tenant.api_key
    }

    expect(response).to have_http_status(:success)
    expect(json.size).to eq(1)
    expect(json.first.keys).to contain_exactly(:answers, :id, :private, :title, :user)
  end

  it "does not return private questions" do
    tenant = create(:tenant)
    create(:question, private: true)

    get api_v1_questions_url, params: {
      api_key: tenant.api_key
    }

    expect(response).to have_http_status(:success)
    expect(json.size).to eq(0)
  end

  it "returns a public question" do
    tenant = create(:tenant)
    public_question = create(:question, private: false)
    create(:answer, question: public_question)

    get api_v1_question_url(public_question), params: {
      api_key: tenant.api_key
    }

    expect(response).to have_http_status(:success)
    expect(json.keys).to contain_exactly(:answers, :id, :private, :title, :user)
  end

  it "does not authorize users with invalid or nil api key" do
    get api_v1_questions_url, params: {
      api_key: nil
    }

    expect(response).to have_http_status(:unauthorized)
    expect(json[:errors].present?).to eq(true)
  end
end
