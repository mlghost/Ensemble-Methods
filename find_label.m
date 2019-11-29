function L = find_label(tree, sample,k)

% Traverses the tree util it reaches to leaf, in the leaf it call majority
% voting in order to determine the label of the sample

node = tree ;

% When the algorithm reaches to a node which has no corresponding child for
% the sample at hand we make the prediction of label based on the data at
% the current node and we stop traversing the tree.
% update variable is controller for this situation
update = 1 ;

% if the node has at least one child it means the node is an internal node
% and we can continue to travers the tree.

while update && (length(node.childs) > 0)
  
  value = sample(node.BF);
  T = node.Ts;
  
  if value < T(1)
    if length(node.childs{1}) > 0
      node = node.childs{1};
    else
      break;
    end
    
  elseif value > T(k)
    if length(node.childs{k+1}) > 0
      node = node.childs{k+1};
    else
      break;
    end
  else
    for j= 1:k-1
      if (value >= T(j)) && (value <= T(j+1))
        
        if length(node.childs{j+1}) > 0
          node = node.childs{j+1};
          break;
        else
          update = 0;
          break;
        end
      end
    end
  end
end
  L = vote(node.label);
end