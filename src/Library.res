type t = Rescript | Tailwind | Vite

let toString = lib => {
  switch lib {
  | Rescript => "Rescript"
  | Tailwind => "Tailwind"
  | Vite => "Vite"
  }
}

let toColorLink = lib =>
  switch lib {
  | Rescript => "#E84F4F"
  | Tailwind => "#06B6D4"
  | Vite => "#BD34FE"
  }
