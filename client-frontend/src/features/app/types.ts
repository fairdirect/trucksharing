import { StateType } from 'typesafe-actions'
import { Action } from '@reduxjs/toolkit'
import { ThunkAction } from 'redux-thunk'
import { store } from '../../store'
import rootReducer from '../../store/root-reducer'

export type RootState = StateType<ReturnType<typeof rootReducer>>
export type AppDispatch = typeof store.dispatch
export type AppThunk = ThunkAction<void, RootState, null, Action<string>>
