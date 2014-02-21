module List = struct
  let implode ?sep:(sep="") l = 
    List.tl l |> List.fold_left (fun acc e -> acc ^ sep ^ e) (List.hd l)
end