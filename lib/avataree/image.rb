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

module Avataree
  
  module Image
    
    include Helper
    
    #image path for gravatar if not defined?
    IMAGES_PATH = "http://www.gravatar.com/avatar/" unless const_defined?("IMAGES_PATH")
    
    #this method returns resulted path to be requested to gravatar. takes all argument as a hash
    #options:
    #<tt>s</tt> or <tt>size</tt> takes size in px (upto 512 px) :default => 80px x 80px
    #<tt>d</tt> or <tt>default</tt> takes default image. Also takes a url other options are:
    #   404: do not load any image if none is associated with the email hash, instead return an HTTP 404 (File Not Found) response
    #   mm: (mystery-man) a simple, cartoon-style silhouetted outline of a person (does not vary by email hash)
    #   identicon: a geometric pattern based on an email hash
    #   monsterid: a generated 'monster' with different colors, faces, etc
    #   wavatar: generated faces with differing features and backgrounds
    #   retro: awesome generated, 8-bit arcade-style pixelated faces
    #<tt>f</tt> or <tt>forcedefault</tt> takes y and n as argument :default => n
    #<tt>r</tt> or <tt>rating</tt> takes below mentioned options as argument
    #   g: suitable for display on all websites with any audience type.
    #   pg: may contain rude gestures, provocatively dressed individuals, the lesser swear words, or mild violence.
    #   r: may contain such things as harsh profanity, intense violence, nudity, or hard drug use.
    #   x: may contain hardcore sexual imagery or extremely disturbing violence.
    #in addition to these it also takes extension as options that lets you define the image type you want.
    # <tt>extension</tt> default => jpg
    
    def gravatar_image_path(email, options = {})
      email = make_digest(email)
      email<<".#{options[:extension]}" and options.delete(:extension) if options[:extension]
      params = options.to_param unless options.empty?
      resulted_path = IMAGES_PATH.dup << email
      [resulted_path, params].compact.join("?")
    end
    alias_method :gravatar, :gravatar_image_path
    
  end
  
end