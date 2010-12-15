# Copyright (c) 2010 [Bagwan Pankaj]
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'json'
require 'open-uri'

module Avataree
  
  module Profile
    
    PROFILE_PATH = "http://www.gravatar.com/" unless const_defined?("PROFILE_PATH")
    
    def gravatar_profile(email, options = {})
      email = make_digest(email)
      email << ".json"
      params = options.to_param unless options.empty?
      resulted_path = PROFILE_PATH.dup << email
      path = [resulted_path, params].compact.join("?")
      begin
        JSON.parse(open(path).read)
      rescue => e
        puts "I am unable to parse this bad stuff. because\n#{e}"
      end
    end
    
  end
  
end