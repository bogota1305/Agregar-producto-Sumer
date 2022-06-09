import React, {useState} from "react";
import T from 'prop-types';

const CustomButton = ({
                          align,
                          label,
                          children = label,
                          className,
                          icon,
                          iconSize,
                          onClick,
                          onMouseEnter,
                          onMouseLeave,
                          idleStyle,
                          activeStyle
                      }) => {
    const [focused, setFocus] = useState(false);
    const [hovered, setOver] = useState(false);

    const handleClick = () => {
        if (onClick != null && typeof onClick === 'function') onClick();
    };
    const handleMouseEnter = () => {
        setOver(true);
        if (onMouseEnter != null && typeof onMouseEnter === 'function') onMouseEnter();

    };
    const handleMouseLeave = () => {
        setOver(false);
        if (onMouseLeave != null && typeof onMouseLeave === 'function') onMouseLeave();
    };
    const handleFocus = () => setFocus(true);
    const handleBlur = () => setFocus(false);

    const renderIcon = () => {
        if (icon == null) {
            return null;
        } else {
            return (
                <div style={{display: 'flex', justifyContent: 'center', maxWidth: iconSize, maxHeight: iconSize}}>
                    {icon}
                    {children ? <div style={{width: '10px'}}/> : null}
                </div>
            );
        }
    };
    return (
        <button
            style={{
                ...defaultButtonStyles.idleStyle,
                ...idleStyle,
                ...((hovered || focused) && activeStyle),
                width: children ? 'calc(100% - 10px)' : 'auto'
            }}
            onClick={handleClick}
            onMouseEnter={handleMouseEnter}
            onMouseLeave={handleMouseLeave}
            onFocus={handleFocus}
            onBlur={handleBlur}
            {...{className}}
        >
            <div style={{alignItems: 'center', display: 'flex', height: 'calc(100% - 20px)'}}>
                {renderIcon()}
                {children ? <div style={{textAlign: align, width: '100%'}}>{children}</div> : null}
            </div>
        </button>
    );
};

CustomButton.propTypes = {
    label: T.string,
    children: T.node,
    align: T.oneOf(['left', 'center', 'right']),
    className: T.string,
    icon: T.node,
    iconSize: T.string,
    onClick: T.func,
    onMouseEnter: T.func,
    onMouseLeave: T.func,
    idleStyle: T.object,
    activeStyle: T.object
};

CustomButton.defaultProps = {
    align: 'center',
    iconSize: '26px',
    text: ''
};

const defaultButtonStyles = {
    idleStyle: {
        display: 'block',
        border: '0px',
        borderRadius: '3px',
        boxShadow: 'rgba(0, 0, 0, 0.5) 0 1px 2px',
        color: '#ffffff',
        backgroundColor: '#4eb151',
        cursor: 'pointer',
        fontSize: '19px',
        margin: '5px',
        overflow: 'hidden',
        userSelect: 'none',
        padding: '10px 10px 10px'
    }
};
export default CustomButton;