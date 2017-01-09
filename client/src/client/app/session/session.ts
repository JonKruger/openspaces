export interface ISession {
	session_id: number;
	title: number;
	owner: string;
	twitter_handle: string;
	twitter_url: string;
	time_slot_id: number;
	meeting_space_id: number;
	readonly: boolean;
}

export class Session implements ISession {
	session_id: number;
	title: number;
	owner: string;
	twitter_handle: string;
	twitter_url: string;
	time_slot_id: number;
	meeting_space_id: number;
	readonly: boolean;
}