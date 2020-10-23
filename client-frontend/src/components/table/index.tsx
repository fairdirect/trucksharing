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
		paddingTop: '12px',
		paddingBottom: '12px',
		color: text.secondary,
	},
}))

interface Props {
	headers: string[]
}

export const Table: FunctionComponent<Props> = ({ headers, children }) => {
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

					<TableBody>{children}</TableBody>
				</TableContent>
			</TableContainer>
		</Box>
	)
}
