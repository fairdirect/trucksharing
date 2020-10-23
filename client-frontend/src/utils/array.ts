import _uniqBy from 'lodash.uniqby'

export const unionById = (array1: Array<any>, array2: Array<any>): Array<any> => {
	const unionArray = [...array1, ...array2]

	return _uniqBy(unionArray, 'id')
}
