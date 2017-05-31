class Rude
  def initialize
    @rules = {}
    @path = []
  end
  
  def add_rule(condition, yes, no)
    @rules[condition.name.to_s] = { "condition" => condition, "yes" => yes, "no" => no }
  end
  
  def check(condition)
      @path = []
      
      while true
        break if condition == nil
        
        rule_name = condition.name.to_s
        rule = @rules[rule_name]
        result = rule["condition"].call
        
        @path.push([rule_name, result])
        
        condition = 
          case result
            when true then rule["yes"]
            when false then rule["no"]
            else nil
          end
      end
  end
  
  def doit
      @rules["meth1"]["cond"].call
  end
  
  def get_path
    res = ""
    @path.each do |p|
        res += "!" if p[1] === false
        res += p[0]
        res += " > " if p[1] != nil
    end
    return res
  end
end