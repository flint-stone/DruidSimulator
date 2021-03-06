from PlacementStrategy import *

class PlacementFactory(object):

	@staticmethod
	def createPlacementStrategy(strategy):
		if strategy == "random":
			return Random()
		elif strategy == "druidcostbased":
			return DruidCostBased()
		elif strategy == "randomballbased":
			return RandomBallBased()
		elif strategy == "bestfit":
			return BestFit()
