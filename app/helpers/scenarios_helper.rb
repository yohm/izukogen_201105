require 'stringio'

module ScenariosHelper
  
  def list_tree_component_results(roots, updated = [])
    sio = StringIO.new
    if roots.size > 0
      sio.puts "<ul>"
      roots.each do |root|
        next if updated.include?(root.id)
        updated << root.id
        sio.puts "<li>#{link_to(root.folder,root)}"
        if root.children.size > 0
          sio.puts list_tree_component_results(root.children, updated)
        end
        sio.puts "</li>"
      end
      sio.puts "</ul>"
    end
    sio.string
  end
end
