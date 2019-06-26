import React from 'react';
import { Link } from "react-router-dom"

const Weirdo = (props) => {
  // debugger
  return(
    <div>
      <div className="weirdo">
        <Link to={`/weirdos/${props.weirdo.id}`}>
          {props.weirdo.name}
        </Link>


      </div>
    </div>
  )
}

export default Weirdo;

// <h5>{props.weirdo.name}</h5>
