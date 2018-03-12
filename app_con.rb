# Console version
require './boot'

class SearchKeys
  STARTING_SEARCH = 'Starting search...'.freeze
  INPUT_DATA_ERROR = 'Error. Please check your input data. '.freeze
  SEARCH_COMPLETED = 'Completed. Go to results list for detail info. '.freeze
  RETURN_TO_MAIN_MENU = 'Press Enter to return to the main menu.'.freeze
  BEGIN_LIST = '---< BEGIN THE LIST OF VALID PHRASES >---'.freeze
  END_LIST = '---< END THE LIST OF VALID PHRASES >---'.freeze
  ENTER_ID_NUMBER = 'Enter ID number to list valid phrases '\
                    'or other key to return:'.freeze
  TABLE_HEAD = ' IDs |       When           |  Provider  |  '\
               'Target         |  Searching string'.freeze

  def initialize
    @provider = PROVIDER[0]
    @target = TARGET[0]
    @search_string = ''
  end

  def run
    show_main_menu
    case gets.downcase.strip
    when '1'
      @provider = choose(PROVIDER)
    when '2'
      @target = choose(TARGET)
    when '3'
      @search_string = enter_search_string
    when 's'
      start_search
    when 'l'
      show_results
    when 'q'
      return
    end
    run
  end

  private

  def show_main_menu
    Gem::Platform.local.os.include?('linux') ? system('clear') : system('cls')
    puts 'Main menu:'
    puts "1 - Select provider (#{@provider})"
    puts "2 - Select target (#{@target})"
    puts '3 - Enter search string'\
         "(#{@search_string.empty? ? 'None' : @search_string})"
    puts 's - Start search'
    puts 'l - Show last 10 results'
    puts 'q - quit'
  end

  def choose(service)
    puts 'Select service:'
    service.each_with_index { |value, index| puts "#{index} - #{value}" }
    choice = gets
    service[choice.to_i]
  end

  def enter_search_string
    puts 'Enter search string:'
    gets.chomp
  end

  def start_search
    if incorrect_input_data?
      puts INPUT_DATA_ERROR, RETURN_TO_MAIN_MENU
    else
      puts STARTING_SEARCH
      CracksMan.new(@provider, @target, @search_string).handling
      puts SEARCH_COMPLETED, RETURN_TO_MAIN_MENU
    end
    gets
  end

  def show_results
    ids = []
    puts TABLE_HEAD, '-' * 80
    Passkey.reverse_order(:id).first(10).each do |row|
      puts show_result_line(row)
      ids << row[:id]
    end
    puts '-' * 80, ENTER_ID_NUMBER
    choice = gets.to_i
    show_valid_phrases(choice) if ids.include? choice
  end

  def show_valid_phrases(result_id)
    puts BEGIN_LIST
    Passkey.find(id: result_id).phrases.each do |row|
      puts "Key: #{row[:phrase_key]}, Value: #{row[:phrase_val]}"
    end
    puts END_LIST
    puts RETURN_TO_MAIN_MENU
    gets
  end

  def incorrect_input_data?
    @provider.include?('None') ||
      @target.include?('None') ||
      @search_string.empty?
  end

  def show_result_line(row)
    "#{row[:id].to_s.ljust(4)} | "\
    "#{row[:when].strftime('%d %b %Y %H:%M:%S')} | "\
    "#{row[:provider].ljust(10)} | "\
    "#{row[:target].ljust(15)} | #{row[:key_phrase]}"
  end
end

SearchKeys.new.run
