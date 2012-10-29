shared_context 'start_solr' do
  before(:all) do
    begin
      Sunspot.remove_all!
    rescue Errno::ECONNREFUSED
      system("rake", "sunspot:solr:start")
      sleep 1
    end
  end
end
