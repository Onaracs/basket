class SharedLinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def sent_link
    friend_id = params["friendId"].to_i
    shared_basket = SharedBasket.find(friend_id)

    #include the new info being sent in from the extension
    shared_basket.shared_links.create(sender_id: current_user.id,
                                      url: params["url"],
                                      title:,
                                      description:,
                                      image: )
    redirect_to root_url
  end

end