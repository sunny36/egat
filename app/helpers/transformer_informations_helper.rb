module TransformerInformationsHelper
  def score_color(score)
    case score
    when 1
      return "<span style=\"padding:0px 40px 0px 40px; background:rgb(146,208,80);\"></span>"
    when 2
      return "<span style=\"padding:0px 40px 0px 40px; background:rgb(0,102,255);\"></span>"
    when 3
      return "<span style=\"padding:0px 40px 0px 40px; background:rgb(255,255,0);\"></span>"
    when 4
      return "<span style=\"padding:0px 40px 0px 40px; background:rgb(252,152,0);\"></span>"
    when 5
      return "<span style=\"padding:0px 40px 0px 40px; background:rgb(255,0,0);\"></span>"
    when 6
      return "<span style=\"padding:0px 40px 0px 40px; background:rgb(255,0,0);\"></span>"
    else 
      return "<span>-</span>"
    end
  end
  
  def importance(importance)
    case importance
    when "Low"
      "<span style=\"background:rgb(146,208,80)\">#{importance}</span>"
    when "Medium"
      "<span style=\"background:rgb(255,255,0)\">#{importance}</span>"
    when "High"
      "<span style=\"background:rgb(255,0,0)\">#{importance}</span>"
    else
      "<span>-</span>"
    end
  end
end
