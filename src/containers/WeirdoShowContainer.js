import React from 'react';
// import Question from '../components/Question';

class WeirdoShowContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      name: "",
      meme: ""
    }
  }

  componentDidMount(){
    // debugger
    let weirdoId = this.props.match.params.id
    fetch(`/api/v1/weirdos/${weirdoId}`)
    .then(response => response.json())
    .then((weirdoBody) => {
      this.setState({ name: weirdoBody.name, meme: weirdoBody.meme })
    })
  }


  render() {

    return(
      <div className='page'>
        <h1>Featuring: {this.state.name}</h1>
        <div className='weirdo-list'>
          This weirdo is known for: {this.state.meme}
        </div>
      </div>
    )
  }
}

export default WeirdoShowContainer;
