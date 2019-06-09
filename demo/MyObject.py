class MyObject(object):
    def __init__(self, name=None):
        self.name = name

    def eat(self, what):
        return '%s eats %s' % (self.name, what)

    def __str__(self):
        return self.name

    def get_variables(self):
        return {'MY_OBJECT': MyObject('Robot'), 'MY_DICT': {1: 'one', 2: 'two', 3: 'three'}}
