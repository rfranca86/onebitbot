class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "create_link"
      AddLinkModule::CreateService.new(params).call()
    when "list_link", "search_by_link", "search_by_link_hashtag"
      AddLinkModule::ListService.new(params, action).call()
    when "remove_link"
      AddLinkModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    else
      "Não compreendi o seu desejo"
    end
  end
end
