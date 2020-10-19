import React, { FunctionComponent } from 'react'
import { makeStyles } from '@material-ui/core/styles'
import {
	Box,
	TableContainer,
	TableHead,
	TableCell,
	TableBody,
	TableRow,
	Typography,
	Table as TableContent,
} from '@material-ui/core'

const useStyles = makeStyles(({ palette: { text } }) => ({
	tableBox: {
		borderRadius: '16px',
	},
	tableHead: {
		fontWeight: 700,
		paddingTop: '12px',
		paddingBottom: '12px',
		color: text.secondary,
	},
}))

interface Props {
	headers: string[]
	componentBody: Function
}

export const Table: FunctionComponent<Props> = ({ headers, componentBody }) => {
	const { tableBox, tableHead } = useStyles()

	return (
		<Box boxShadow={3} className={tableBox}>
			<TableContainer>
				<TableContent>
					<TableHead>
						<TableRow>
							{headers.map((header, index) => (
								<TableCell key={index} className={tableHead} component="th">
									<Typography variant="h6">
										<strong>{header}</strong>
									</Typography>
								</TableCell>
							))}
						</TableRow>
					</TableHead>

					<TableBody>{componentBody()}</TableBody>
				</TableContent>
			</TableContainer>
		</Box>
	)
}
