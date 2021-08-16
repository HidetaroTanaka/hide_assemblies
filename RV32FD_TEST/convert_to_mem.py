import sys
from jinja2 import Template

template = Template('''\
  {% for i, inst in lines %}
  mem.write("h{{ format(i*4, '08x') }}".U, "h{{ inst.rstrip() }}".U){% endfor %}
''')
print(template.render(lines=enumerate(sys.stdin), format=format))