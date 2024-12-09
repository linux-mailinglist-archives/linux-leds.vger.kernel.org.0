Return-Path: <linux-leds+bounces-3549-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 287FC9E9912
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 15:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13BB71887D3C
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 14:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBED1B0403;
	Mon,  9 Dec 2024 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="ugnSnjaa"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D11ACEB8;
	Mon,  9 Dec 2024 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754960; cv=fail; b=hAu9RIXXjLVuoaTDG9ivawwpNO1GoV+BYHRxbBQAbeqzGNoDBhsaJStFr0ZLkxvjBKiZts0POE8LvtPZDwa/A8/NxgFsPzZk5sfc5hK+9Ha80rbHoR0pQXV07gVzVBZ/Y/QB1rRttD9yz/0ItJDCYMh/d/5qUUGzQF9fgEvdHS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754960; c=relaxed/simple;
	bh=vAYmXKB1H2cObTULDwsOD6B5C6TFrps5mjCW2JFu2bE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cFkKMgBoBQ4EumZKI+sKLhUxO/p7D+khFHfyMf4cjU7XLdbVsFvP8csdYgTCq2eOM6vlaC7VxtLZJP5EP9gCtaLzlPayTsqAul1MtNM+Exh5TgwFgiJgC2CEgMYWgSFgfiBANrrmVle0NCwgPesqN/WsN8hCEbcDST2fNfXjSbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=ugnSnjaa; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfediyIMfJkEtr8wK3pYMDqMC8L1YqyzXhSFLcSFVg/pE9J7ROtvdGX6WSQ4J2pkHkbV3XCEF3PvVu0wYrmQevK1Bka/t/GEg35o13V7BXIb94NtlKk1V3LqA4ALzVAcoRBm6k3d8+sbdzSujrbVcTBE7E8VYUkMeyOQ11lxSe/Ik93H8rqxKRmIc1mVJhRmkk1d/lN135GPntciXKzGaXbYeSrdbM5XOtz9lJYpehMQQNif3ngi+y0n0M+dM5g6B7IazXAyZmNJl45owMH4pgvT+yGgrTPeDqhDoTWSSpNKijrxSUyiev/BpdydUQneaGJBDDg1ytRoFpETV/7C4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAYmXKB1H2cObTULDwsOD6B5C6TFrps5mjCW2JFu2bE=;
 b=aR4TKCun0OTmU64vyizAfLscX+ld1P6jpncscYDAEXmSVuv5cUuDP4EukpZC0iPjmS4++o5DrhsVMnQaCOuIDETopCK2jW54ELBhrcCgV7sSk5gnI+M3yRBdHI2HdBO5dE+vEAVFiWY3IFfeCaJnzE1bZH2wLbp4n47b+r1pxn+JzRuI1AlnOmwjDSV+6xIAKW7wjK0ekQarKsKK/LmpGhAf42QmTaWKTI5VtExP+kJDpIm8gj7WczmZcLmtsMNSzdIYNxmDvTx2nvYdsU6YhYhcilFaqMD3FvCtSRQfjFS3yUdBbJCioUiPXOKGxm0OOexQ6BOOx0+gfjG1PgTx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAYmXKB1H2cObTULDwsOD6B5C6TFrps5mjCW2JFu2bE=;
 b=ugnSnjaaslz7tUdTOZstmrRU2fs3Hj2XdNM66iWnXl5eghhaUOrjpSEpY21LQ3h/JCAwvIhYpZOWSKatjBLQaYDg86e3IV88EavZMNtrAatuUv6kcuAvH6rWDOBS0ZE+TGeo714GXTHikbjiOWhQIpuo3xwkNckAEC7O5hOANyKG3qRqBz4t0riElUqbhjTOzkr085bN4RVorIO2Zq1sFzKy/3t4E0iaT1a4Qp426Oibio76DKwUsjYIOj7wZ818+qMI0PdYl14us3SNrtcsYq1ZKHAsGwTYAZBHUS0VWj/d/2A7kWsZ2p5fq5fqTzKDhE0u7rj8IMwXBPDU3/BM8w==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA2PR10MB8990.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.12; Mon, 9 Dec
 2024 14:35:56 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8251.008; Mon, 9 Dec 2024
 14:35:55 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "conor+dt@kernel.org" <conor+dt@kernel.org>, "afd@ti.com" <afd@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
Thread-Topic: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
Thread-Index: AQHbSB350fispC8PgkisY35Mqsl9dLLd/SQAgAAB7QA=
Date: Mon, 9 Dec 2024 14:35:55 +0000
Message-ID: <8e1122977b316ca16e9eec0850ed470c31ae9f24.camel@siemens.com>
References: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
	 <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>
In-Reply-To: <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA2PR10MB8990:EE_
x-ms-office365-filtering-correlation-id: 21ff2bf2-c867-41a7-177a-08dd185eca6c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aldBeFJHZU02M1hQaW9Ba281dzk3VE9RRFg0d3FuOGdzRzM0UDdQY1dWeU9O?=
 =?utf-8?B?L2JvNE90bXRuajdnb3g1USsrVC9QVW5uWXRrVjNiaXZ5WHJTUmRFNkc2NXlv?=
 =?utf-8?B?LzdnZi90SDlVdkpqNFFKOGV2SDNnd3dNVENaMmJsRHZvbFZtWElENHZKcEo3?=
 =?utf-8?B?Y0lORWZ0aXV5MEpDZzdxNDdJaEdnUVgvUkJPdmVHZ0RCR28xQWdZcjc2aTRv?=
 =?utf-8?B?T29Qc2xNWlNaZGVvcEY3aHI4bElGYkpuVkZkV29QNjR5bHdvSVcrdVZQc3dH?=
 =?utf-8?B?L1VlV1FpaFhIL0Fpdk9TVWwxWGRLeVNrWDhCdkFVR09sQ2RIWm0wSTlxMDlC?=
 =?utf-8?B?QmFhQlJxbStHWXd2d1YzYW1mL3BpcWszSlJxbFJtTGJFR3V2OW80eUZmZDRx?=
 =?utf-8?B?MUtjbXQxMHBHT3kxYnVJME9VaFd3ODBpOE1YUVdCRVJUME9wVHo5REZwVUlH?=
 =?utf-8?B?VFgvVTRMTjBrSncwUjRsVHlqdm1PTkJ1cytqZmlSdUsraXk4bmpGcWEwSTdM?=
 =?utf-8?B?eTFON3VWTW1xLzJJRjhYSVFHZ3VhYllydDRMUFk0SnU2d1o0T0o3SVdLbkJ4?=
 =?utf-8?B?OUpEMDh0b29zNVlKMURGNUlXbTVEYjZ3dWl3RGE2WWFoamJuZm9zVmx5RmxB?=
 =?utf-8?B?T1NhTnIrR1lwV2VOSVJHRVZlaWFzRHZwc1ZjbWg1YTBvUi9JU05OQkxkTzI0?=
 =?utf-8?B?Z2FlRTFLS1pIb01nYUZReVYwZ2xLUkFVendOSlVCWjl1eFVxbmZRZ3htZ2NW?=
 =?utf-8?B?bm9hWEFDZUdhQW0yUGJqdzVSK09GR1hGbTdqbERoVUtrb2I1MHhtM3ROZ1hN?=
 =?utf-8?B?MGZhSEpmT1lYTDFKREl2U2RiOTVZSWRrNE5jSTdJMkEvRDBJRkptR29XRU1O?=
 =?utf-8?B?OC8yMEhnUHhBcW5xRVpxUnZJYWZqdE5CenBvQ3ZlY2FpQ2F1dExkSmxXejFN?=
 =?utf-8?B?aThhelhEZnBGN1ViVEVVSTY5MmJJcnhWenB3djQ0TElqWXJ5WFRJYzFUZUV3?=
 =?utf-8?B?Q2tVKy96SGJ0TXlKdWRKT1pCbG1nUU5LTWIzdEhseU5mOEtyU2hsTUJUdjZ2?=
 =?utf-8?B?bjJxZFArb1NWMHN3VDA0dHVrS3llZjZyNDFHQUJYYWRhMjhqbEc1YUZQT0t1?=
 =?utf-8?B?M0g0VzRVN29oaWZUSkpsVm45QnUrMlJJMCtXVW1Wd2ovSDhnblVDWFpWUWFx?=
 =?utf-8?B?T25qR3k3M1ZreExXTk1NRTExckJib2RVMlNpNEk0LzduemVGb0RsbUF3UW9x?=
 =?utf-8?B?VmdIdFVrNzZMNlY3dkVOVjF3OWx6OWtDN0VpeGlaczkyYnl5dGlaZHlkZlE1?=
 =?utf-8?B?WWRsWXpqVHNWaFN0OWhmUUxUWkx3dW5oM0IxWFc1WUVBYzZTZUdnbFZPTUlI?=
 =?utf-8?B?d1ZWZjRwYkJaZWw1U2tNa3paWEJhNEVqRzRMaGJwQmZ6Y2tKOXhYMEMzUDJl?=
 =?utf-8?B?TUttWC9BMGM4RUxoeGlUdXJFNWxyS0dVdkQvQVlBUzhRR3lMTVA5dHp1ZFJl?=
 =?utf-8?B?RXJ5VkFkMkREOGk4VFh1S3ZWZ3VrNEtsVGhzU0hrRlFnQVd3aWZZdGczQUsw?=
 =?utf-8?B?aXlqQU93VHpCMDJIV05pTGJLMEs4b2lwTGRsQlJKdEkxVFFWMGVIa1k3MndR?=
 =?utf-8?B?aTRYSUJlV29sYTN3K0tXbWJXU1RMeHlxUXlZQk9BVzhhMFZkVHdoY2hNZ05C?=
 =?utf-8?B?TklERlJYdWJ0N2ZHdTcyRDVrUFZGd1U3WDZWQ2N2QWpVV0FJbVlkbzRDaDIy?=
 =?utf-8?B?QXBQMEt1TlR6N056dzVlVnpkY2lYakd6RXlMQXJaWDBKcFlReW9FMkRBdWo5?=
 =?utf-8?Q?pY8y4LPdu0CbbMs7FyUkWEcFUa9YOYQqacfOE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnJKbTJCK1l0YTNoMTZnNkxzOXhRb0I2NlNkZ0ozaEg3M2VKKzM3Y2h4UnFX?=
 =?utf-8?B?aEhYdnB5TlRWUFk3MHZnWEVoV3VpejVsZkhRSllqMk9OYTVxazM2VnRhM2Y3?=
 =?utf-8?B?R1kvay92aXBpS0JCVVhQRUpIZHBwY01xMEZNZWxPTlM1Yko1YnlSOTdZbFMw?=
 =?utf-8?B?TFUrNTVlaGhjOWllK1J2SG1USS9qVWxOREQyZUxjcWlWU1pMZXJVR0Nyb09k?=
 =?utf-8?B?TzVmWVZZaUxYejFVOUp0NXk0UGpZekJGZEpiSGNwNUthbTYzYktNSEJERHBS?=
 =?utf-8?B?dU1rOXBGMGFuU1Npa3YybWhPdUhVSktzQzVzWGNHQSs5THZwVC9xNWlwcnFm?=
 =?utf-8?B?TEJOeGxFRkxrYi9aWFlUcHhvY2V6QndvTjRXZHlNTzdMUENyWEZuQVdnWjNE?=
 =?utf-8?B?aEtVVUVva0RnL1NMVXJjMFc0eWpFMXMyWGFra1NrNXBLVW5qdjZOcU12emtm?=
 =?utf-8?B?Z0Y5MWxvYTJtNUYrVXIyRUJlNDRpWXZKQUF4ZWNwV0o1SnhoajVvVUlRdDJC?=
 =?utf-8?B?YjBuMmE1OW1iSElEQnBkS3FEc3VZS3VYSVhNMFFrM0UwazE5eHY1M3Q3bExX?=
 =?utf-8?B?Y015VXZGSmNJY3FGUCtmQ3NTVjYzR1IrTzhhZHdyejhyVXFiSTYreGpNeUhV?=
 =?utf-8?B?TDFTRHh3NVV6VnV1Mzh3RXlYMnZ5Rmg5R1Mxak9IZGhQc3UyRDltVTZrOGlh?=
 =?utf-8?B?aWxFaEdpOXFCd1RpS1cxWGFicStTNEpHVW05Q21wSmZMY1dyV3V0b3J5RHEv?=
 =?utf-8?B?SVlNRmU0aStNRWNUQ2hkc3c3SkpiVW40YzB1aVAwQlBPRllKNWlTMWJGbnUv?=
 =?utf-8?B?WXJXNkNxN3l6aW54QnR6aXdPRzN4Z0FZdjZDdE9hTC9jNWc2alZ6Sm1Ub3By?=
 =?utf-8?B?THc5RytkNFhJR2QwcHVkZmRRV3lpZko3SWJlWWF6NzF1Z2tVdzBjdDNRRUMw?=
 =?utf-8?B?SHRNOXM2cTduZWpyV2hnQkVzc1BScnNIZTFKRjJTM2dmRmVGVHk0M1JWQmx3?=
 =?utf-8?B?cHcxZGxzV2hGUit1SGR1S0NyYnRLYUpPc2lYekZBUlhnajgvcy9tUEl5YjFK?=
 =?utf-8?B?TFEwY0RpcHdodFk2UDdEekZ0ckdBRmUvcmdtTVhZUlhPeEJxTWpOSE1zT2Ja?=
 =?utf-8?B?QS9UanJmTXh6ZzJqS0Q3TXFsM1EwVldNdUpZM0VQS2txYVZnazJoaWhSWkVM?=
 =?utf-8?B?TzJqVVVka2Z1amNuQkdoZUZ4MEZWdEE5aEwxSXlKZ1JkNnBHckM5MmswUG1H?=
 =?utf-8?B?MXhybVB1WHRraXgrd0tmYkxvbThzcDRyMFJTRVc4RU9wZXdZYnNYdTJjMUc4?=
 =?utf-8?B?ek1VWHZCVTVEdU9QTS9oT2N5bC84Qm0rOFE2Y0JpVVFPSWlkdjhldlN4ZHN3?=
 =?utf-8?B?RS9NQklUUU9uRmdobzFpM01FaWNWSU5HcU1yV3Vsb1B3ODZaczlDWUJvSGF6?=
 =?utf-8?B?YjliWm13MnlvTW91b21wc3FzazdsUW93aHIvTTcrbVZHbm1wV0RCOHU3L3NV?=
 =?utf-8?B?a2dLQ0pPRE9aYmJuUGIxa1ltY2RacmZ2SDJhWnZUYzV5YUVicHFJQ0x3V3pX?=
 =?utf-8?B?SE5LNlBZVG5YSzVpNm1Udk0yd2JxWlo0UTZEVDBoSVJLTUdrSlBCQURmT0M4?=
 =?utf-8?B?UHVzaWU4dmlDUkZsUXA5QW92MGwvbnVzcXA4U21lbWhqVWxpOTJCTGMxVmNS?=
 =?utf-8?B?QjdRR1hmSk1ZSU9aMDVxVFF1dFo1Mk9rSEVzWG9sMVIwOXFHOXpQM0JsS3hB?=
 =?utf-8?B?U0h3VndkQkd3ZHJpUGNnRnJWVlJNcGVzNFZlMmh4eFN1bXEwVDNyR0QvZ0dp?=
 =?utf-8?B?N0RmdjRPR3VZV2VZcFdDUER4czd1Um9ydmpObjBJbzEwbzRDUFJZV2hrNE52?=
 =?utf-8?B?dWxmdHUzRllxMDQ2bVhRQUJNYlFMWHBJeDJmLzNlZWhtNVcramo1MG1vUnlw?=
 =?utf-8?B?YzczQUZsb2VGZkFGM25BUE9oN2EyT3ZXNUhKcDZibks5T05JaEZjUTlWM1V3?=
 =?utf-8?B?R2wxRmJqelJiZVZyQlNCS1Y4VWliOTgwNkFWWGwxNVJONjNvcCtTbXFzWmJH?=
 =?utf-8?B?cVZ0YXk1TUlwL1B6VllzU0d5WUlEb3ZqSnRTaHMzQkIwaHoxaWEzYkxTUGRY?=
 =?utf-8?B?eHlxaWRsZDhRdElCcWR6YnNXcXM0Y0Exb3hzUWtpdGJndWVHQVBSUGN5cURn?=
 =?utf-8?Q?X1eEoJbZWVF0wfyCBiRtpM8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D9E45DCF3CEBA4C9FE64C36F14E1A9B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ff2bf2-c867-41a7-177a-08dd185eca6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 14:35:55.8190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3mL4zMn9cKXsJX/F7b86mUOKWx+joigo7QIf+NBME8uajy5J1JqgdH2yH8+SqtHBRFp2L2p3xyhCx2qBMzlV2I/m1JhDweVA+oF8+5FNpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8990

SGkgQW5kcmV3LA0KDQp0aGFua3MgZm9yIHRoZSBwcm9tcHQgcmV2aWV3IQ0KDQpPbiBNb24sIDIw
MjQtMTItMDkgYXQgMDg6MjkgLTA2MDAsIEFuZHJldyBEYXZpcyB3cm90ZToNCj4gPiArwqAgcmVn
Og0KPiA+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOiBJMkMg
c2xhdmUgYWRkcmVzcw0KPiA+ICsNCj4gPiArwqAgIiNhZGRyZXNzLWNlbGxzIjoNCj4gPiArwqDC
oMKgIGNvbnN0OiAxDQo+ID4gKw0KPiA+ICvCoCAiI3NpemUtY2VsbHMiOg0KPiA+ICvCoMKgwqAg
Y29uc3Q6IDANCj4gPiArDQo+ID4gK8KgIGVuYWJsZS1ncGlvczoNCj4gPiArwqDCoMKgIG1heEl0
ZW1zOiAxDQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjogR1BJTyBwaW4gdG8gZW5hYmxlIChhY3Rp
dmUgaGlnaCkgLyBkaXNhYmxlIHRoZSBkZXZpY2UNCj4gPiArDQo+ID4gK8KgIHZsZWQtc3VwcGx5
Og0KPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246IExFRCBzdXBwbHkNCj4gPiArDQo+ID4gK3BhdHRl
cm5Qcm9wZXJ0aWVzOg0KPiA+ICvCoCAiXmxlZEBbMF0kIjoNCj4gPiArwqDCoMKgIHR5cGU6IG9i
amVjdA0KPiA+ICvCoMKgwqAgJHJlZjogY29tbW9uLnlhbWwjDQo+ID4gK8KgwqDCoCB1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICvCoMKgwqAgcHJvcGVydGllczoNCj4g
PiArwqDCoMKgwqDCoCByZWc6DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOg0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgSW5kZXggb2YgdGhlIExFRC4NCj4gPiArwqDCoMKgwqDCoMKg
wqAgY29uc3Q6IDANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqAgZnVuY3Rpb246IHRydWUNCj4gPiAr
wqDCoMKgwqDCoCBjb2xvcjogdHJ1ZQ0KPiA+ICvCoMKgwqDCoMKgIGxhYmVsOiB0cnVlDQo+ID4g
K8KgwqDCoMKgwqAgbGludXgsZGVmYXVsdC10cmlnZ2VyOiB0cnVlDQo+ID4gKw0KPiA+ICvCoMKg
wqAgcmVxdWlyZWQ6DQo+ID4gK8KgwqDCoMKgwqAgLSByZWcNCj4gPiArDQo+ID4gK3JlcXVpcmVk
Og0KPiA+ICvCoCAtIGNvbXBhdGlibGUNCj4gPiArwqAgLSByZWcNCj4gPiArwqAgLSAiI2FkZHJl
c3MtY2VsbHMiDQo+ID4gK8KgIC0gIiNzaXplLWNlbGxzIg0KPiA+ICsNCj4gPiArYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArwqAgLSB8DQo+
ID4gK8KgwqDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gK8KgwqDC
oCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaD4NCj4gPiArDQo+ID4gK8KgwqDC
oCBpMmMgew0KPiA+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKg
wqDCoCBsZWQtY29udHJvbGxlckAyZCB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29t
cGF0aWJsZSA9ICJ0aSxscDg4NjAiOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDJkPjsNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbmFibGUtZ3Bpb3MgPSA8JmdwaW8xIDI4IEdQSU9fQUNU
SVZFX0hJR0g+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZsZWQtc3VwcGx5ID0gPCZ2
YmF0dD47DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxlZEAwIHsNCj4gDQo+
IFNvIHNhbWUgY29tbWVudCBJIG1hZGUgaW4gdGhlIHByZS1wdWJsaWMgcmV2aWV3LCBsZXRzIHNl
ZSB3aGF0IHRoZSBEVA0KPiBmb2xrcyB0aGluazoNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2Ugd2Fu
dCB0byBoYXZlIHRoZSAiQDAiIG5vZGUgbmFtaW5nLiBJdCBmb3JjZXMgdXMgdG8NCj4gYWRkIHRo
ZSAicmVnID0iIGJlbG93LCBhbmQgdGhhdCB0aGVuIGZvcmNlcyB1cyB0byBhZGQgdGhlICMqLWNl
bGxzIGFib3ZlLg0KPiBBbGwgdGhpcyB0byB3b3JrIGFyb3VuZCBub3QganVzdCBjYWxsaW5nIHRo
ZSBub2RlICJsZWQtMCIuIFRoZSBkcml2ZXINCj4gZG9lc24ndCBjYXJlIGVpdGhlciB3YXksIGFu
ZCB0aGVyZSBhcmUgbm8gaW4tdHJlZSB1c2VycyBvZiB0aGUgb2xkIHdheSwNCj4gc28gbm93IHNo
b3VsZCBiZSBhIHNhZmUgdGltZSB0byBmaXggdGhpcyB3aGlsZSBjb252ZXJ0aW5nIHRoZSBiaW5k
aW5nLg0KDQpJZiBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3RseSBoZXJlOg0KDQo+PiBBbmQgb25l
IGNoYW5uZWwgY29udHJvbGxpbmcgdGhlIG90aGVycyBpcyBvbmx5IGluIHRoaXMgIkRpc3BsYXkg
TW9kZSIsDQo+PiBidXQgdGhlIGN1cnJlbnRzIHRvIHRoZSBvdGhlcnMgY2FuIGJlIGluZGVwZW5k
ZW50bHkgY29udHJvbGxlZCBpbiBhDQo+PiBkaWZmZXJlbnQgbW9kZSAoc2VlbXMgdGhlc2UgbW9k
ZXMgaGF2ZSBsZXNzIGZlYXR1cmVzIHdoaWNoIGlzIHByb2JhYmx5DQo+PiB3aHkgdGhlIGRyaXZl
ciBkb2Vzbid0IG1ha2UgdXNlIG9mIHRoYXQgdG9kYXkpLg0KDQp0aGVuIHNvbWUgbWFwcGluZyBi
ZXR3ZWVuIHN1Ym5vZGUgYW5kIEhXIGNoYW5uZWwgd291bGQgYmUgcmVxdWlyZWQuDQpXZSBwcm9i
YWJseSBkb24ndCB3YW50IHRvIHBhcnNlIGEgbm9kZSBuYW1lIGluIHRoaXMgY2FzZSBhbmQgY2Fy
dmUgb3V0ICItMCINCnBhcnQgb2YgaXQsIGluIHN1Y2ggY2FzZSBhIHdlbGwtZGVmaW5lZCBwcm9w
ZXJ0eSwgc3VjaCBhcyAicmVnIiB3b3VsZCBiZQ0KcmVxdWlyZWQuDQoNClNvIHByZXNlcnZpbmcg
dGhlIHN0YXR1cyBxdW8gbG9va3MgbW9yZSBmdXR1cmUtcHJvb2YgSU1PLg0KDQotLSANCkFsZXhh
bmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

