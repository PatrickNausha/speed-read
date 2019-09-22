#!/usr/bin/env ruby
book1 = File.read('./book-1.txt')

paragraphs = book1.split("\n\n")

quiz_text = paragraphs[0]
word_count = quiz_text.split(' ').length

puts "Press Enter to start"
gets

puts quiz_text

start = Time.now

puts "Press Enter when complete"
gets

duration_seconds = Time.now - start
duration_minutes = duration_seconds / 60
speed_wpm = (word_count / duration_minutes).floor

def get_reading_badge(wpm_speed)
    return case [wpm_speed, 0].max
    when 0..199
        "🐌 Slow"
    when 200..299
        "📖 Average"
    when 300..699
        "👍 Above average"
    when 700..1000
        "💨 SPEED READER"
    when 1000..10000
        "😎 LEGEND"
    else
        "👎 Cheater"
    end
end

puts "You read the text at #{speed_wpm} wpm. Rank: #{get_reading_badge(speed_wpm)}"
