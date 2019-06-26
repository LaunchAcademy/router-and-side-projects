import React from 'react';
import Weirdo from '../components/Weirdo';

class WeirdosContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      weirdos: []
    }

  }

  componentDidMount(){
    fetch("/api/v1/weirdos")
    .then((response) => {
      return response.json()
    })
    .then((parsedWeirdos) => {
      this.setState({ weirdos: parsedWeirdos })
    })
  }


  render() {
    let weirdos = this.state.weirdos.map(weirdo => {
      return(
        <Weirdo
          key={weirdo.id}
          weirdo={weirdo}
        />
      )
    })

    return(
      <div className='page'>
        <h1>Weirdos Make the Best Teachers</h1>
        <div className='weirdo-list'>
          {weirdos}
        </div>
      </div>
    )
  }
}

export default WeirdosContainer;
