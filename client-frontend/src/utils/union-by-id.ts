import _uniqBy from 'lodash.uniqby'

type UnionArray = Array<any>

const unionById = (array1: UnionArray, array2: UnionArray): UnionArray => {
	const unionArray = [...array1, ...array2]

	return _uniqBy(unionArray, 'id')
}

export default unionById
