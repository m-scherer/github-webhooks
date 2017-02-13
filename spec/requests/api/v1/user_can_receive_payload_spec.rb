require 'rails_helper'

RSpec.describe "/api/v1/commits" do
  context 'POST' do
    it 'gets a payload' do
      data = {
        "head_commit": {
          "id": "0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c",
          "tree_id": "f9d2a07e9488b91af2641b26b9407fe22a451433",
          "distinct": true,
          "message": "Update README.md",
          "timestamp": "2015-05-05T19:40:15-04:00",
          "url": "https://github.com/baxterthehacker/public-repo/commit/0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c",
          "author": {
            "name": "baxterthehacker",
            "email": "baxterthehacker@users.noreply.github.com",
            "username": "baxterthehacker"
          }
        }
      }

      post '/api/v1/commits', params: data

      expect(response).to be_success
      expect(Commit.count).to eq(1)
      expect(Commit.first.sha).to eq("0d1a26e67d8f")
      expect(Commit.first.message).to eq("Update README.md")
      expect(Commit.first.author).to eq("baxterthehacker")
      expect(Commit.first.commit_timestamp).to eq("2015-05-05T19:40:15-04:00")
    end
  end
end
