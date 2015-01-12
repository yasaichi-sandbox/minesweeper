# like Ruby
Array.prototype.count = (condition) -> @.filter(condition).length
Array.prototype.flatten = -> [].concat.apply([], @)
