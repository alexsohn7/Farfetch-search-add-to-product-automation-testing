class ListingPrices:
  def __init__(self, prices):
    self.prices = prices

  def is_sorted_low_to_high(self):
    if(self.prices == sorted(self.prices)):
        return True
    return False

  def is_sorted_high_to_low(self):
      for i in range(len(self.prices) - 1):
        if (self.prices[i]) - (self.prices[i+1]) < 0:
          return False
        return True
