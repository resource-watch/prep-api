import React from 'react';
import { Link } from 'react-router';

class Switch extends React.Component {
  constructor() {
    super();
    this.state = {
      checked: false
    };
  }

  toggleStatus() {
    const checked = !this.state.checked;
    this.setState({
      checked
    });
    // this.props.onChange(checked);
  }

  render() {
    const classNames = ['c-switch'];
    if (this.state.checked) classNames.push('-checked');
    return (
      <div className={classNames.join(' ')} onClick={() => this.toggleStatus()} >
      </div>
    );
  }
}

Switch.propTypes = {
  className: React.PropTypes.string,
  prefixCls: React.PropTypes.string,
  disabled: React.PropTypes.bool,
  checkedChildren: React.PropTypes.any,
  unCheckedChildren: React.PropTypes.any,
  onChange: React.PropTypes.func,
  onMouseUp: React.PropTypes.func,
};

export default Switch;
