require "set"
require 'byebug'
class WordChainer
    attr_reader :dictionary
    def initialize(name)
        file = File.open(name)
        @dictionary = file.readlines.map(&:chomp).to_set
        file.close

    end
    
    def just_one_letter_different?(a, b)
        count = 0
        a.each_char.with_index do |ele, ind|
            if a[ind] != b[ind]
                count += 1
            end
        end
        if count == 1
            return true
        else
            return false
        end
    end

    def adjacent_words(source)
        all_adjacent_words = @dictionary.select {|ele| ele.length == source.length && just_one_letter_different?(ele, source)}
        return all_adjacent_words
    end

    # def explore_current_words()
    #     new_current_words = []
    #     for i in (0..@current_words.length-1)
    #         adjacent = adjacent_words(@current_words[i])
    #         for i in (0..adjacent.length - 1)
    #             next if @all_seen_words.include?(adjacent[i])
    #             new_current_words << adjacent[i]
    #             @all_seen_words[adjacent[i]] = @current_words[i]
    #         end
    #     end
    #     # new_current_words.each do |ele|
    #     #     puts "#{ele} came from #{@all_seen_words[ele]}"
    #     # end
    #     @current_words = new_current_words
    # end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = {source => nil}
        while @current_words.length != 0
            new_current_words = []
            for i in (0..@current_words.length-1)
                adjacent = adjacent_words(@current_words[i])
                for j in (0..adjacent.length - 1)
                    next if @all_seen_words.include?(adjacent[j])
                    new_current_words << adjacent[j]
                    @all_seen_words[adjacent[j]] = @current_words[i]
                end
            end
            # new_current_words.each do |ele|
            #     puts "#{ele} came from #{@all_seen_words[ele]}"
            # end
            
            @current_words = new_current_words
        end
        # p @all_seen_words
        a = build_path(target).reverse!
        a.each do |ele|
            print ele
            print "\n"
        end
    end

    def build_path(target)
        path = []
        status = 'started'
        path << target
        while status != nil
            temp = @all_seen_words[target]
            target = temp
            path << temp
            status = temp
        end
        return path
    end
end

a = WordChainer.new("dictionary.txt")
a.run('mash', 'rash')
