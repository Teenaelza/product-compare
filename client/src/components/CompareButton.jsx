import Button from "@material-ui/core/Button";
// import './Product.css';
import CompareArrowsIcon from "@material-ui/icons/CompareArrows";
export default function CompareButton(props) {
  return (
    <Button
      onClick={() => {
        props.handleClick("COMPARE");
      }}
    >
      <CompareArrowsIcon />
      Compare
    </Button>
  );
}
