module Milk
  # noinspection RubySuperCallWithoutSuperclassInspection
  def cost
    super + 1
  end
end

module Sugar
  # noinspection RubySuperCallWithoutSuperclassInspection
 def cost
   super + 0.4
 end
end

class Coffee
  def cost
    4
  end
end