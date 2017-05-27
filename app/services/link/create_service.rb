module AddLinkModule
  class CreateService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @add_link= params["add_link-original"]
      @hashtags = params["hashtags-original"]
    end

    def call
      if @hashtags == nil || @hashtags == ''
        return "Hashtag Obrigatória"
      end
      begin
        AddLink.transaction do
          link = AddLink.create(link: @add_link, company: @company)
          @hashtags.split(/[\s,]+/).each do |hashtag|
            link.hashtags << Hashtag.create(name: hashtag)
          end
        end
        "Criado com sucesso"
      rescue
        "Problemas na criação"
      end
    end
  end
end
