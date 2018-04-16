require 'date'
require 'yaml'

SSN_PATTERN = /^(?<gender>[12])\s(?<year>\d{2})\s(?<month>0[1-9]|1[0-2])\s(?<dept>\d{2}|2[AB])\s\d{3}\s\d{3}\s(?<key>\d{2})$/
def french_ssn_info(ssn)
  match_data = ssn.match(SSN_PATTERN)
  if match_data && valid_key?(match_data.to_s, match_data[:key])
    gender = find_gender(match_data[:gender])
    month = find_month(match_data[:month])
    year = find_year(match_data[:year])
    department = find_dept(match_data[:dept])
    return "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    return "the number is invalid"
  end
end

def find_gender(digit)
  return digit.to_i == 1 ? 'man' : 'woman'
end

def find_month(number)
  months = Date::MONTHNAMES
  return months[number.to_i]
end

def find_year(number)
  return "19#{number}"
end

def find_dept(zip)
  return YAML.load_file('data/french_departments.yml')[zip]
end

def valid_key?(ssn, key)
   return key.to_i == (97 - ssn.delete(' ')[0..-3].to_i) % 97
end

puts french_ssn_info('1 84 12 76 451 089 46')


















