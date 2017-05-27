module AddLinkModule
  class RemoveService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @params = params
      @id = params["id"]
    end

    def call
      begin
        link = @company.add_links.find(@id)
      rescue
        return "Questão inválida, verifique o Id"
      end

      AddLink.transaction do
        # Deleta as tags associadas que não estejam associadas a outros faqs
        link.hashtags.each do |h|
          if h.add_links.count <= 1
            h.delete
          end
        end
        link.delete
        "Deletado com sucesso"
      end
    end
  end
end
