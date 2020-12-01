#!/usr/bin/env ruby
require 'dotenv/load'
require 'gmail'
require 'yaml'

EMAIL_USERNAME = ENV.fetch('EMAIL_USERNAME')
EMAIL_PASSWORD = ENV.fetch('EMAIL_PASSWORD')

PARTICIPANTS = YAML.load_file('participants.yml')

santas = PARTICIPANTS.map { |participant| participant['name'] }

raise "At least two participants are needed for Secret Santa 🤦‍♂️Add more entries in participants.yml" if santas.size <= 1

receivers = loop do
  receivers = santas.shuffle
  break receivers if santas.zip(receivers).none? { |santa, receiver| santa == receiver }
end

registry = santas.zip(receivers).map do |santa, receiver|
  {
    santa: { name: santa, email: PARTICIPANTS.find { |participant| participant['name'] == santa  }['email'] },
    receiver: { name: receiver, email: PARTICIPANTS.find { |participant| participant['name'] == receiver  }['email'] }
  }
end

puts registry

Gmail.connect(EMAIL_USERNAME, EMAIL_PASSWORD) do |gmail|
  registry.each do |entry|
    email_content = <<~HEREDOC
      <p>Hello #{entry[:santa][:name]},</p>
      <p>You are the secret santa for #{entry[:receiver][:name]} (<a href="mailto:#{entry[:receiver][:email]}">#{entry[:receiver][:email]}</a>).</p>
      <p>Merry Christmas 🎁</p>
      <p>Nimble</p>
    HEREDOC

    gmail.deliver do
      to entry[:santa][:email]
      subject "Nimble Secret Santa 🎄#{Time.now.year}"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body email_content
      end
    end
  end
end
