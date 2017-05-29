module LinkModule
  class CreateService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @link= params["link-original"]
      @hashtags = params["hashtags-original"]
    end

    def call
      if @hashtags == nil || @hashtags == ''
        return "Hashtag Obrigatória"
      end
      begin
        Link.transaction do
          add_link = Link.create(link: @link, company: @company)
          @hashtags.split(/[\s,]+/).each do |hashtag|
            add_link.hashtags << Hashtag.create(name: hashtag)
          end
        end
        "Criado com sucesso"
      rescue => e
	       puts e.message
	       puts e.backtrace.inspect
      end
    end
  end
end
