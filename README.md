
1. git clone https://github.com/webmil-internship/tokenizr.git

2. bundle install

3. unzip config.yml.zip

4. unzip db/sbs.db.zip (existing DB) OR rake db:migrate (empty DB)

5. ruby app_con.rb (console version) OR rerun app_web.rb (web version)

6. For web version edit config.yml and set valid ip_address and ip_port (e.g. ip_address: '192.168.1.63', ip_port: '4567')
