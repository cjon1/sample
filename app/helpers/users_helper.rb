module UsersHelper

 LARD=".  <@\\\/@>  ." # Look LARD is a constant - how exciting!

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  #def gravatar_for(user) #Chapter 7 version, Chapter 7 excercise version below;
  def gravatar_for(user, options = { size: 40 }) 
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}" #Chapter 7 version, Chapter 7 excercise version on line above ^
    #gravatar_url = "https://secure.gravatar.com/avatar/614692da29e7cacc0bf3862783be7456"
    image_tag(gravatar_url, alt: LARD, class: "gravatar")
    #image_tag(gravatar_url, class: "gravatar")
  end

end
