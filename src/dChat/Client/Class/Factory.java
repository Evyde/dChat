package com.xxx.dChat;
default class Factory {
	private Factory() {;}
	com.xxx.dChat.SQLClass getSQLClass() {
		return new com.xxx.dChat.SQLClass(); //It is an example.
	}
}
