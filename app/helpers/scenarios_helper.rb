require 'stringio'

module ScenariosHelper
  
  def list_tree_component_results( roots )
    if roots.size > 0
      sio = StringIO.new
      sio.puts "<ul>"
      roots.each do |root|
        sio.puts "<li>#{link_to(root.folder,root)}"
        if root.children.size > 0
          sio.puts list_tree_component_results( root.children )
        end
        sio.puts "</li>"
      end
      sio.puts "</ul>"
    end
    sio.string
  end
end
