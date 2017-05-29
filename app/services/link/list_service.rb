module LinkModule
  class ListService
    def initialize(params, action)
      # TODO: identify origin and set company
      @company = Company.last
      @action = action
      @query = params["query"]
    end

    def call
      if @action == "search_by_link"
        links = Link.search(@query).where(company: @company)
      elsif @action == "search_by_link_hashtag"
        links = []
        @company.links.each do |link|
          link.hashtags.each do |hashtag|
            links << link if hashtag.name == @query
          end
        end
      else
        links = @company.links
      end
        response = "*Links:* \n\n"
        links.each do |f|
          response += "*#{f.id}* - "
          response += "*#{f.url}*\n"
          f.hashtags.each do |h|
            response += "_##{h.name}_ "
          end
          response += "\n\n"
        end
        (links.count > 0)? response : "Nada encontrado"
    end
  end
end
