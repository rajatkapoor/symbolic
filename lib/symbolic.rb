$LOAD_PATH<<'.'
require 'java'
require '/home/rajat/jscience.jar'
java_import Java::OrgJscienceMathematicsFunction.Variable
java_import Java::OrgJscienceMathematicsFunction.Polynomial
import 'org.jscience.mathematics.number.Real'

=begin
class Var #variable and symbol are already class in ruby
  attr_reader :var
  def initialize(sym)
    @sym = sym
    @var = Variable::Local.new(@sym)
  end

  def show_symbol
    puts @sym
  end
end
=end

class Symbolic
  VERSION = "0.0"
  attr_accessor :vars
  attr_accessor :polynomial
  def initialize()
    @vars = []
    @polynomial = nil
    true
  end
  def create_method( name, &block )
        self.class.send( :define_method, name, &block )
  end
  def create_attr( name )
        create_method( "#{name}=".to_sym ) { |val| 
            instance_variable_set( "@" + name, val)
        }

        create_method( name.to_sym ) { 
            instance_variable_get( "@" + name ) 
        }
  end
  
  def addVariable(sym)
    var = Variable::Local.new(sym)
    #sym = Polynomial.valueOf(Real::ONE,sym.var)
    eval("@"<<sym<<" = Polynomial.valueOf(Real::ONE,var)")
    create_attr(sym)
    @vars<<@sym

  end
  def polynomial(poly)
    @polynomial = poly
  end
end
s=Symbolic.new

s.addVariable("x")
puts s.x
puts s.x.class
s.polynomial s.x.pow(5).plus(s.x.pow(2).times(Real.valueOf(6)))
#puts s.polynomial

=begin
class Symbolic
  VERSION = '0.0'
  def initialize()
    @polynomial = nil
    @var = var
  end
end
class Polynomial
	def initialize(*vars)
    @polynomial =  nil
    @vars = vars
    @nvars = vars.length
    @varpoly = []

    T
	end
end
=end
