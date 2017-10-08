namespace :data_helper do
  desc "create fake data"
  task :populate => :environment do
    User.create(email: "test@test.com", password: "testtest")
  end
end
