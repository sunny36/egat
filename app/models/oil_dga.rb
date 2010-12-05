class OilDga < ActiveRecord::Base
  before_save :set_co2_score, :set_co_score, :set_h2_score, :set_ch4_score, 
              :set_c2h2_score, :set_c2h4_score, :set_c2h6_score
  
  def percent_dgaf
    numerator = (self.co2_score * Gas.weight("CO2")) + 
                (self.co_score * Gas.weight("CO")) + 
                (self.h2_score * Gas.weight("H2")) + 
                (self.ch4_score * Gas.weight("CH4")) + 
                (self.c2h2_score * Gas.weight("C2H2")) + 
                (self.c2h4_score * Gas.weight("C2H4")) + 
                (self.c2h6_score * Gas.weight("C2H6"))
    denominator = (6 * Gas.weight("CO2")) + (6 * Gas.weight("CO")) + 
                  (6 * Gas.weight("H2")) + (6 * Gas.weight("CH4")) + 
                  (6 * Gas.weight("C2H2")) + (6 * Gas.weight("C2H4")) + 
                  (6 * Gas.weight("C2H6"))
    return (numerator.to_f / denominator.to_f) * 100.0  
  end
  
  def hif_factor
    HifOfOilDga.all.each do |i|
      if percent_dgaf.between?(i.percent_dgaf_start, percent_dgaf_end)
        return i
      end
    end
  end
  
  def set_co2_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "CO2")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.co2.between?(dga_gas_score.start, dga_gas_score.end)
        self.co2_score = dga_gas_score.score
      end
    end
  end
  
  def set_co_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "CO")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.co.between?(dga_gas_score.start, dga_gas_score.end)
        self.co_score = dga_gas_score.score
      end
    end
  end

  def set_h2_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "H2")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.h2.between?(dga_gas_score.start, dga_gas_score.end)
        self.h2_score = dga_gas_score.score
      end
    end
  end

  def set_ch4_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "CH4")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.ch4.between?(dga_gas_score.start, dga_gas_score.end)
        self.ch4_score = dga_gas_score.score
      end
    end
  end

  def set_c2h2_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "C2H2")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.c2h2.between?(dga_gas_score.start, dga_gas_score.end)
        self.c2h2_score = dga_gas_score.score
      end
    end
  end

  def set_c2h4_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "C2H4")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.c2h4.between?(dga_gas_score.start, dga_gas_score.end)
        self.c2h4_score = dga_gas_score.score
      end
    end
  end

  def set_c2h6_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "C2H6")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.c2h6.between?(dga_gas_score.start, dga_gas_score.end)
        self.c2h6_score = dga_gas_score.score
      end
    end
  end
  

  
  
end
