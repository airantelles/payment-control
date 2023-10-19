# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron_log.log"

every 1.day, at: '04:00pm' do
  rake 'invoice_process:run'
end

every 1.day, at: '03:00pm' do
  rake 'invoice_reprocess:run'
end
