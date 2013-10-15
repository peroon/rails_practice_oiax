desc 'list all members'
task member_list: :environment do
  Member.all.each do |member|
    puts member.name
  end
end

