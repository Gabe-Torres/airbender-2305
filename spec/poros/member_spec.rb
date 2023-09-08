require "rails_helper"

RSpec.describe Member do
  it 'has attributes' do
    member = Member.new({
                          name: "suhhh",
                          photoUrl: "https://fake.com",
                          allies: "me",
                          enemies: "you",
                          affiliation: "fire nation"
                        })

    expect(member).to be_a Member
    expect(member.name).to eq("suhhh")
    expect(member.photo).to eq("https://fake.com")
    expect(member.allies).to eq("me")
    expect(member.enemies).to eq("you")
    expect(member.affiliation).to eq("fire nation")
  end
end
