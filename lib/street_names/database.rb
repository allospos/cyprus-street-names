require "pstore"

module StreetNames
  class  Database

    def initialize locale=LOCALE
      @locale = locale
    end

    def load_streets data=nil
      datastore.transaction { data = datastore[:"streets_#{@locale}"] }
    end

    def save! data
      datastore.transaction { datastore[:"streets_#{@locale}"] = data[:streets] }
    end

    def path
      "./data/street_names.dat"
    end

    private
    def datastore
      @datastore ||= PStore.new(path)
    end


  end
end
