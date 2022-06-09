# Custom React Components
This package is useful to display buttons and inputTexts easily using React.

### Components

| Type                                  |
| -------------------------------------:|
| [CustomButton](#CustomButton)         |
| [CustomInputText](#CustomInputText)   |

![Custom React Components](https://tinyurl.com/sgdlc8k)

### Install
npm
```
npm install --save monk-react-components
```
yarn
```
yarn add monk-react-components
```

---------
# CustomButton

### Import

```js
import {CustomButton} from 'monk-react-components'
```

### Getting Started
A CustomButton is created using the `CustomButton` element.
```jsx
<CustomButton /> 
```

### Label
Text of the button is defined using the `label` property.
```jsx
<CustomButton label="My Button" /> 
```

### Icon
Icon on a button is specified with `icon` property. To display only an icon, leave label as undefined and let the CustomButton without any children.
 ```jsx
 <CustomButton icon={<MdHeart color="red" beat={true}/>} />
```

### IconSize
Icon size is configured using `iconSize` property. Default icon size is "26px" (width and height).
 ```jsx
 <CustomButton icon={<MdHeart color="red" beat={true}/>} iconSize="50px"/>
```

### Events
Events are defined with the standard notation.
#### onClick
 ```jsx
 <CustomButton label="My Button" onClick={handleClick}/>
```
#### onMouseEnter
 ```jsx
 <CustomButton label="My Button" onMouseEnter={handleMouseEnter}/>
```
#### onMouseLeave
 ```jsx
 <CustomButton label="My Button" onMouseLeave={handleMouseLeave}/>
```

### Align
Align label is configured using `align` property. The possible values are "left", "center" or "right". Default alignment is "left".

 ```jsx
 <CustomButton label="My Button" align="center"/>
```

### Idle Style
Idle style is configured using `idleStyle` property. You can override preset style using this property.
 ```jsx
 <CustomButton label="My Button" idleStyle={{backgroundColor: '#86d3ea'}}/>
```

### Active Style
Active style is configured using `activeStyle` property. The active style will be applied when mouse hovers above the button.
 ```jsx
 <CustomButton label="My Button" activeStyle={{backgroundColor: '#008acb'}}/>
```

### ClassName
ClassName is configured using `className` property. You can set you className as usually you can do.
 ```jsx
 <CustomButton label="My Button" className="success"/>
```

### Children
You can pass any children to this button whether you want, it has higher priority than label property, both can't work together.
 ```jsx
 <CustomButton>
    <label>My Button</label>
</CustomButton>
```

# CustomInputText

### Import

```javascript
import {CustomInputText} from 'monk-react-components'
```

### Getting Started
A CustomInputText is created using the `CustomInputText` element.
```jsx
<CustomInputText /> 
```

### Label
Text of the input description is defined using the `label` property.
```jsx
<CustomInputText label="First Name:"  /> 
```

### Place Holder
Place holder text is defined using the `placeHolder` property. It's shown when input value is empty.
```jsx
<CustomInputText label="First Name:" placeHolder="Enter your first name..." /> 
```

### value & onChangeInput event
These two goes together, you could use `useState`, such as the next example to keep you inputText state:
 ```js
const App = () => {
    const [firstName, setFirstName] = useState('');
    return (<CustomInputText label="First Name:" value={firstName} onChangeInput={setFirstName} />);
```

### Style
Style is configured using `style` property. You can override preset style of the inputText container using this property.
 ```jsx
 <CustomInputText label="First Name:" style={{display: 'flex'}} />
```

### Input Idle Style
Input Idle style is configured using `inputIdleStyle` property. You can override preset style using this property.
 ```jsx
 <CustomInputText label="First Name:" inputIdleStyle={{backgroundColor: '#86d3ea'}} />
```

### Input Active Style
Input Active style is configured using `inputActiveStyle` property. The active style will be applied when the inputText is focused.
 ```jsx
 <CustomInputText label="First Name:" inputActiveStyle={{backgroundColor: '#6ea0ea'}} />
```

### Label Idle Style
Label Idle style is configured using `labelIdleStyle` property. You can override preset style using this property.
 ```jsx
 <CustomInputText label="First Name:" labelIdleStyle={{textAlign: 'right', color: 'yellow'}} />
```

### Label Active Style
Label Active style is configured using `labelActiveStyle` property. The active style will be applied when the inputText is focused.
 ```jsx
 <CustomInputText label="First Name:" labelActiveStyle={{color: '#6ea0ea'}} />
```

### ClassName
ClassName is configured using className property. You can set you className as usually you can do.
 ```jsx
 <CustomInputText label="First Name:" className="success"/>
```
