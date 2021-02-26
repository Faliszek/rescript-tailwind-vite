@react.component
let make = (~children, ~onClick) => {
  <button
    className="w-16 h-16 rounded-xl bg-blue-300 text-2xl text-white border-2 border-blue-200 transition-colors hover:bg-blue-200 focus:outline-none"
    onClick={_ => onClick(.)}>
    children
  </button>
}
