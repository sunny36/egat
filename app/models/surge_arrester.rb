class SurgeArrester < ActiveRecord::Base
  belongs_to :visual_inspection_id

  def hi_factor
    BushingConditionFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      return i.hi_factor if percent_bushing_condition_factor.round.between?(i.start, i.end)
    end
  end
  
   def percent_surge_arrester_factor(*args)
    if args.length == 1
      side = args.first
      return (numerator(side)/denominator(side)) * 100
    end
    hv = (numerator(:hv)/denominator(:hv)) * 100
    lv = (numerator(:lv)/denominator(:lv)) * 100
    tv = (numerator(:tv)/denominator(:tv)) * 100
    return [hv, lv, tv].max
   end

  def numerator(side)
    fields = get_fields_for(side)
    sum = 0
    fields.each do |f|
      sum += (VisualInspectionCondition.find(self.send(f)).score.to_i * 
              VisualInspectionCondition.weight(f, :surge_arresters)).to_f
    end 
    return sum
  end

  def denominator(side)
    fields = get_fields_for(side)
    sum = 0
    fields.each do |f|
      sum += (VisualInspectionCondition.max_score(f, :surge_arresters) *
              VisualInspectionCondition.weight(f, :surge_arresters)).to_f
    end
    return sum
  end

  def get_fields_for(side)
    fields = ['porcelain_status', 'porcelain_clean', 'ground_connector', 
              'surge_counter']
    if side == :hv
      fields.map {|item| item + '_hv'}
    elsif side == :lv
      fields.map {|item| item + '_lv'}      
    elsif side == :tv
      fields.map {|item| item + '_tv'}      
    end          
  end

end
