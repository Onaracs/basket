class LinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new_link
    #Should be find or create, to not duplicate urls in the database
    #include the new info being sent in from the extension
    binding.pry
    link = Link.find_by_url(params["url"])

    if link == nil 
      link = Link.create(url: params["url"],
                        title: params["pageInfo"]["title"],
                        description: params["pageInfo"]["description"],
                        image: params["pageInfo"]["image"])
    end

    FolderLink.create(link_id: link.id,
                        folder_id: params["uniqueId"])
    redirect_to root_url
  end

end