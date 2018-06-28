require 'nokogiri'
require 'open-uri'
require 'json'
require "execjs"

def get_html(url)
  charset = nil
  html = open(url) do |f|
      charset = f.charset
      f.read
  end
  doc = Nokogiri::HTML.parse(html, nil, charset)
  return doc
end


def export_f_html_t_hash(html)
  data = html.search('#outer-inner').search('script').last.text
  File.open("data.txt", "w") do |f|
    f.puts(data)
  end
  user_data = ExecJS.exec(data+"return ATCODER.standings;")['data']
  return user_data
end

def get_data_from_txt
  # デバッグ用データ
  f = File.open("data.txt")
  data = f.read
  f.close
  user_data = ExecJS.exec(data+"return ATCODER.standings;")['data']
  return user_data
end


def main
  url = 'https://arc099.contest.atcoder.jp/standings'

  #html = get_html(url)
  #users = export_f_html_t_hash(html)
  users = get_data_from_txt
  puts users.find{|f| f['user_screen_name'] = 'name'}
end

main()

#File.open("data.txt") do |file|
#  hash = JSON.load(file)
#  p hash
#end
#hash = JSON.parse(data)
#puts hash
