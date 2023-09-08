class MembersFacade
  def self.members_by_nation(nation)
    members = MembersService.members_by_nation(nation)
    members.map do |member|
      Member.new(member)
    end
  end
end
