import React, {useState} from "react";
import T from 'prop-types';

const CustomInputText = ({
                                    value,
                                    label,
                                    placeHolder,
                                    onChangeInput,
                                    className,
                                    style: customStyle,
                                    inputIdleStyle,
                                    inputActiveStyle,
                                    labelIdleStyle,
                                    labelActiveStyle
                                }) => {

    const [focused, setFocus] = useState(false);

    const handleFocus = () => setFocus(true);
    const handleBlur = () => setFocus(false);
    const handleChange = event => onChangeInput(event.target.value);

    return (
        <div style={{...defaultInputTextStyles.container, ...customStyle}} className={className}>
            <label style={{
                ...defaultInputTextStyles.labelIdle,
                ...labelIdleStyle,
                ...(focused && defaultInputTextStyles.labelActive),
                ...(focused && labelActiveStyle)
            }}
            >
                {label}
            </label>
            <input id="input"
                   type="text"
                   style={{
                       ...defaultInputTextStyles.inputIdle,
                       ...inputIdleStyle,
                       ...(focused && defaultInputTextStyles.inputActive),
                       ...(focused && inputActiveStyle)
                   }}
                   placeholder={placeHolder}
                   value={value}
                   onFocus={handleFocus}
                   onBlur={handleBlur}
                   onChange={handleChange}
            />

        </div>
    );
};

CustomInputText.propTypes = {
    value: T.string,
    label: T.string,
    placeHolder: T.string,
    onChangeInput: T.func,
    className: T.string,
    style: T.object,
    inputIdleStyle: T.object,
    inputActiveStyle: T.object,
    labelIdleStyle: T.object,
    labelActiveStyle: T.object
};

CustomInputText.defaultProps = {
    label: 'label',
    placeHolder: 'enter text...',
    style: {},
    inputIdleStyle: {},
    inputActiveStyle: {},
    labelIdleStyle: {},
    labelActiveStyle: {}
};

const defaultInputTextStyles = {
    container: {},

    inputIdle: {
        width: '100%',
        height: '56px',
        borderRadius: '6px',
        position: 'relative',
        backgroundColor: 'rgba(255, 255, 255, 0.8)',
        transition: '0.3s background-color ease-in-out, 0.3s box-shadow ease-in-out',
        padding: '0px 16px'
    },

    inputActive: {
        width: '100%',
        height: '56px',
        position: 'relative',
        border: 'none',
        borderRadius: '6px',
        fontSize: '16px',
        fontWeight: '400',
        lineHeight: 'normal',
        backgroundColor: '#FFFFFF',
        color: '#282828',
        outline: 'none',
        boxShadow: '0px 4px 20px 0px rgba(0, 0, 0, 0.08)',
        webkitAppearance: 'none',
        padding: '10px 16px 8px 16px'

    },

    labelIdle: {
        display: 'block',
        position: 'relative',
        fontSize: '14px',
        fontWeight: '600',
        lineHeight: '24px',
        color: '#fff',
        pointerEvents: 'none',
        transition: '0.1s all ease-in-out',
        padding: '0px 0px 0px',
        margin: '0px 0px 0px',
        opacity: '0.7'
    },

    labelActive: {
        opacity: '1'
    }
};
export default CustomInputText;