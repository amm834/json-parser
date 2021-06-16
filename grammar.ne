input -> _ value _ {% data => data[1] %}

value -> string     {% id %}
        | number    {% id %}
        | boolean   {% id %}
        | myNull    {% id %}
        | array     {% id %}

array_items -> _ value _ {% data => [data[1]]%}
              | value _ "," _ array_items {%
            data => [data[0],...data[4]]
        %}

array -> "[" _ array_items _ "]" {%
data => data[2]
%}
        | "[" _ "]" {% () => [] %}

myNull -> "null" {% () => null  %}

string -> "\"" characters "\"" {% 
data => data[1]
%}

characters -> [^\"]:+ {% 
data => data[0].join('')
%}

boolean -> "true"       {% () => true %}
            | "false"   {% () => false %}

number -> decimal {% id %}
         |  digit {% id %}

decimal -> digit "."  digit {%
data => Number(data[0] + "." + data[2])
%}

digit -> [0-9]:+ {%
data => Number(data[0].join(''))
%}


_ -> [\s\t]:*