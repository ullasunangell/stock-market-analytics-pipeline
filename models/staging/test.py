class Base:
    def greet(self):
        return self.name_method()
    def name_method(self):
        return "Base"

class Child(Base):
    def name_method(self):
        return "Child"

c = Child()
print(c.greet())
