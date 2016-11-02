doubleMe x = 2 * x

doubleUs x y = (2 * x) + (2 * y)

doubleUs' x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                      then x
                      else 2 * x
