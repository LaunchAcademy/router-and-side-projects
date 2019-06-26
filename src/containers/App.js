import React from "react"
import { BrowserRouter, Route, Switch, Redirect } from "react-router-dom"

import WeirdosContainer from "./WeirdosContainer"
import WeirdoShowContainer from "./WeirdoShowContainer"
import GifsContainer from "./GifsContainer"

const App = props => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={WeirdosContainer}/>
        <Route exact path="/weirdos" component={WeirdosContainer} />
        <Route exact path="/weirdos/:id" component={WeirdoShowContainer} />
        <Route exact path="/gifs" component={GifsContainer} />
      </Switch>
    </BrowserRouter>
  )
}

// import Layout from "./Layout"
//
// const App = props => {
//   return (
//     <BrowserRouter>
//       <Route to="/" component={Layout}  />
//     </BrowserRouter>
//   )
// }

export default App
