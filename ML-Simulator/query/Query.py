class Query(object):
	def __init__(self):
		self.segmentList = list()
		
	def info(self):
		print ', '.join(str(x) for x in self.segmentList)

	def add(self, segment):
		self.segmentList.append(segment)
