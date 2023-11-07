def aesthetic_split(in_str: str) -> str:
    """Function to split a string (ex. "FirstLast") in two (ex. "First Last")."""
    index_to_split = None
    for i in range(1, len(in_str)):
        if in_str[i - 1].islower() and in_str[i].isupper():
            index_to_split = i
            break

    # Split the string at the found index
    if index_to_split is not None:
        first_part = in_str[:index_to_split]
        second_part = in_str[index_to_split:]
        result_str = "{} {}".format(first_part, second_part)
    else:
        result_str = in_str

    return result_str
