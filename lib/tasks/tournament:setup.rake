namespace :tournament do
  desc 'set up needed database'
  task setup: :environment do
    system 'rake db:create'
    system 'rake db:migrate'
    system 'rake db:seed'
    system 'mkdir public/csv_uploads'
  end
end

