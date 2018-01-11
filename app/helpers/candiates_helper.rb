module CandiatesHelper
  def show_your_age(age)
    if age >=18
      "YES"
    else
      "NO"
    end
  end
  
  #顏色分票數
  def vote_formal(candidate)
    count=candidate.vote_logs.size
    if  count>5
      "<b style=color:blue>#{count}</b>".html_safe 
    else
     "<b style=color:red>#{count}</b>".html_safe 
    end
  end
end
