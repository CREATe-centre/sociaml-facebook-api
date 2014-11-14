module List = struct
  
  open Core_kernel.Std
  
  let implode sep l = 
    let hd = match List.hd l with
      | Some hd -> hd
      | None -> ""
    in
    match List.tl l with
    | Some tl -> tl |> List.fold ~init:hd ~f:(fun acc e -> acc ^ sep ^ e)
    | None -> hd

end


module Params = struct
  
  open Core_kernel.Std
  
  let filter_optional_params =
    List.fold ~init:[] ~f:(fun acc (k, v, f) -> match v with
      | Some v' -> List.append acc [(k, f v')]
      | None -> acc)

end
