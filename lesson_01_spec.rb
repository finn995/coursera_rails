require_relative 'lesson_01'

describe "lesson1" do

  context "check results" do
    result=`lesson_01.rb`.chomp!

    it "unexpected output" do
      expect(result).to eq("I guess nothing matched... But why?")
    end
  end

  context "check implementation" do
    srcCode = File.open("lesson_01.rb", "r").read

    it "remove if clause" do
      expect(srcCode).not_to include("if")
    end

    it "remove elsif clause" do
      expect(srcCode).not_to include("elsif")
    end

    it "keep else clause" do
      expect(srcCode).to include("else")
    end

    it "missing case" do
      expect(srcCode).to include("case")
    end
  end
end