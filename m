Return-Path: <linux-leds+bounces-8667-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SC9QL/4ENGryLAYAu9opvQ
	(envelope-from <linux-leds+bounces-8667-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:47:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3EC6A0FF4
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:47:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=hYC+0lGH;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8667-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8667-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92F88300F9C7
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E4027FD4B;
	Thu, 18 Jun 2026 14:47:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011032.outbound.protection.outlook.com [52.103.39.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57B28690;
	Thu, 18 Jun 2026 14:47:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794027; cv=fail; b=RKTFN6ndLnI/D8L9mfM/OYzBW7EcDHHy43TsIeaqRExIXsAIEr/sqlZ0iv4BsLevdA0l4dikbXT0b3u9+XNKUrDPL8gG0IbcyXyN7hkwLZ1T/A4f3HrBkZC/gVEx3xxUsBPOeJRUu8F9cf1AL/eyfsOSCv0l76GTM6p7TCrnOu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794027; c=relaxed/simple;
	bh=MZHou7e4nBm13v+EHD5RZjAHKBD12CFWkQ0tAVtniqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KWvCbHzgnM8PrG+Dgr2bywKzgpyTdDZ2eXg2DD5IK+ZjcAJrGOcS3+ps2JGWZDlJXdIwb3HPLOXAjoL4ma1DGjCM0+JKv8ROdzqreZYHXa6xYN0bREdOR3CCxU4hklVsE0KmHZkqwmozaeI2kGk9vyV1WTj5Zni9slFfzu7r0nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hYC+0lGH; arc=fail smtp.client-ip=52.103.39.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmOLSQWLzeKq1LHY6UcK5gDp0XuEjvq4CN/0EOPYdDdM2X7dnxGZm8uN4lXBIbVT2phk4/64Hs091rKocyOk+X1GntJ4iwifticL12+qXMOI40HQag/6uZg6ucrgHYgISF1LaIF9SK3Pk2ish/wU1TULGab6y04gLDhLLx4rMvB4DOIzc4HxXKJlr+SDRB4+aPhpHGmp0GUb1yARuei2AuwPWFkNkghXtkvqhivmOK9l0VfwWqclMWqmozCBIQrdZlcEA0AXSBbz9BrOPaEWfDE3Z2f3kI1gFv6XddLH39RI+Jw8SRKFByZ1z8SmF0PBCQiniDOzfH0y44c5ilKqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y1duXiTmQqiDM7fRmEVsTgMdl6vl5ewNDfio0OFOXU=;
 b=XZ8REy+XThkrJm3DStaS+rm/iXUkRK8LBQ/1c7CFS5E4y46mXMMNK23126XNEfLE3dI46Xtkk4ZIovhCitfv1Q6Mi46F5KCeiKaSSH7ovEZOATSq9kJ+TtcIOOTNVlRpKktxsSqXhbFMTIhyg8jTZZcd0xZbrT1YDqLsHeU4BbUjSiWKMVufMoCZ+xkP1ETPGoszZDqd2QQ7lw9e992/0MKCPyGh/BsZw+JeP0oQIk6CopKPKQVMkg/UskV/8Vi4zkQeOl4AWyxH6z0iXnpwyUmjbhd4RC6NswqLG9lG6g3/0qKYoFxPFDdnCNq0hEpMxuHW+UzUDQ9GzNQWJnIc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y1duXiTmQqiDM7fRmEVsTgMdl6vl5ewNDfio0OFOXU=;
 b=hYC+0lGHpMw4VUYLxE4p6MPV1IIhzCOF1zqO1tDuyj8n3IrgD7OLk49fi2pzrd3GHyYPmpPo6sOd82DOgAaSmTlLDhraFgOWBx9o7mu60Pic6DXvtuPY+QEZ3btNaai5mvmUWNM1Qd6AjjLdq522gyqxJ0W47R3J2xjSkbTOHWJAIaPq7/8Gv3oWmTeZqgB5H0NCTGKMRGg1NFoRnFiGlIWtve11jzP/HJsj4CxZtouuoT7fOzHzOg+uMHAB3oOZ0T8I+VHaUmEhbcGvYFULJhyLP3iM5mMaUHnRpg2/FH66p2z87qMQf7e/1Jcuy31pOkrtJ3Z1Wwh+LtpgLVfxeg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11612.eurprd08.prod.outlook.com (2603:10a6:150:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 14:47:02 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 14:47:02 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/9] leds: st1202: validate pattern input before stopping the sequence
Date: Thu, 18 Jun 2026 15:46:49 +0100
Message-ID:
 <GV1PR08MB84972B541BA2B491EFEECC01C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618144649.549267-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11612:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a16f7f-906c-4e66-5789-08decd4874d9
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRDHdeyC1gU1gCypSF7nE2vrCzfhO4hOKm8vV9HU9EwTXsOgm41Tl8gPyNI0X5DhcM+g2K0coVSkoDT+patoaO9Zk9q9WF0CGv5gCgK+7MehYiAMj9Oe+WdBSlnQv2Uaocp+wsavyeHDvrH8lLLAl1Nzl/csMf3lzBX3Dj89y5DdtutOxARw6Lao2IpPce+aUl/wynKgewPxwcjpf5oW5pbtOboD5hdCr8i8XFU3oPNhfc/QF5ssvZswFSfK5s3M8KkgTjtkIvcCRCvZtLXdIHCCw9++PUXiSu6hB2rFvViqR3aQStSfK1j551MaluTR6gcEs+MsG6I6nBR5WeZiXPziDs3xRRE5bRh82ABMtlsoQKrFXzeWOCMwN1uqBVXhjwaDYn93oMWzjSzjzBV4sruP2lJJ6ifTPl63yFwMw34a1XPOiiEgqNnUsZ27L6Ak8yruzjKIOPTPJLX/9Nb98iOUjHxoUJgNRv4h29fq4hucDB3klL7XKPA+uaYToJeNBolJRDtOKNHvlpOHB2jdQ0s69mywRoRhMeu8IWGT3sepfukGZu8Rw9j3ztI0jHC54YeQQJIHAZSFgZmlqRKucoBDG5FgmRyuQx7BLbIIx8vqX24BNI0Cuj9zsg8yMmS0aI6btJHLDct5+yG1Fwxk+Z1s1/Qo20Po5ZHdkE7/wJZaZoNo1WgDJ2R9fKB5ThKb+FIrfqhPZIvUY7gcLbpUZUgjmPHthCYHz9QdsQr8qtoow=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|51005399006|23021999003|19110799012|8060799015|5072599009|37011999003|41001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9b8ddmXcLPixEyieuWTeBuRdHdfWhxYCmJU7lvbo5hE9zu/CGVRvc8JRv2VH?=
 =?us-ascii?Q?oAkT939pCOUwO9ZPk81H0ZuCaI6j9jcEdRXI/sEmWbzX7NJQm3j5DPRAHh8Z?=
 =?us-ascii?Q?DFZbOHYCQB2XxXroWMacNjfRqa5IkWt6HCBQfZNkxhgmemkIzcFMJ5Bzr0Vb?=
 =?us-ascii?Q?MBios0mC0Vqkdh5KjWpt/NDjWJlnBpE7DAclHk0Xm7c63B+Ffk3kOYeu0Reh?=
 =?us-ascii?Q?9KXi+PkGyVygQrS9A1gU36IiVDhftYzSuCL55n5/BBmvrTbTXvj8CSDuNr+y?=
 =?us-ascii?Q?L3xySqm0AUeFKMBX6DFy7kjxC59ArnJ8JNXVNAiVoKPZuqAirwA+8jYnK1S9?=
 =?us-ascii?Q?ckbXYe7qUYFXMi8Jpvc4ekZDp5/496WCocYPPDnYVUhWrJUlUjLjgg59bBEs?=
 =?us-ascii?Q?BdRjUneqV92iBxxlF3weIWN8t/UadfmspK4+hOD1j6I6yBXSawEu8QMwGlDA?=
 =?us-ascii?Q?CFTVel+rir7Z1APr8ARZ7lzttrfaO2tnuDtU1TH/TgL2iP95gwYN9sWgNsFE?=
 =?us-ascii?Q?I9RNw/Z9xunT+8cudohESxi6TNeV28si/Gwyhesf3vK7JLGIim6/yCAmNciQ?=
 =?us-ascii?Q?ylFf3PzSdoKU26Sq7EnMrtWtaqIlMfLhs48jSvmENmD9WSgeJHrU6uCzTqP+?=
 =?us-ascii?Q?EaqpRdFrIQy68CkMB9nd36kjTxp9bTZTxQewnIoCpObNE3noZgSmI9oyFLdP?=
 =?us-ascii?Q?SPJZE1SHzUganozJVQYny2rqyi7q/WZSPxAeJ07FxFEKg8bd9PdB+2HMlNDW?=
 =?us-ascii?Q?GJjQB/B2F5PAnrSjjGZQhLs1dOglknkQ3/a9/S0lOrpXr5FKE1sLToRWeyE3?=
 =?us-ascii?Q?R6D/ZxGd7poSq4vbpq4+iUabj0485yztpL8hb147Hze6SmMfZwkUM6U2GvoH?=
 =?us-ascii?Q?nEzc2HslWM9wYoR6m6ex73xpDCyCXTM+9flGAPQoGBx36qm6S0bgcn0qmYyy?=
 =?us-ascii?Q?mjMjGrWs/u1U8n+AA96Uj0AhUPfkmELtMDE7Cv8+0Qbhc6rLU5er7D9Fi9CA?=
 =?us-ascii?Q?s0fW?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?krQ8hRNuou6T5IGcfmPte/Z29QVvnXuacZ+17v4dSgiO9P504rTnj84gQ14Z?=
 =?us-ascii?Q?HAyl5Bs0uOmrW9LGFSTMQoy7VV8GG7mTfERgBuISfRZQpl3ZyFgIcLHUSTRv?=
 =?us-ascii?Q?3W2WnqbLg6dA8T1skEMHq4eWikVppKWg/myrylvieutpKf9tDkJrB7I72f53?=
 =?us-ascii?Q?1nqthocIAqGF3oRl0lqXmwIk/lvwYmvqhd+9Db4sG3LB8Y8YmL0XRc9UEBAc?=
 =?us-ascii?Q?tNOBAmOkjJJ0qmmLhPSU7awCySNM+bLO/IBZ1qYIu4Ffs0SJQQMzoOce0NsW?=
 =?us-ascii?Q?RnzIco6lzO541u3Qn/TvzutjPcKTdammlkK2aTbUQYVQanVx3JMlW5aexWqN?=
 =?us-ascii?Q?Xi8om7ERNfbRXCdNvvWKZt8q40EAkmOoHNM9OhPwmlW7uegsk8m6B8B2x+I5?=
 =?us-ascii?Q?J3JglQCtLvfnJCcZehUSP1P71tb600ADoSFXZEBfHlShIVgxCAYsZEVUwAxG?=
 =?us-ascii?Q?Z09T/Zd5hrgX/ua7vFIcwrWYd2a1iIhuTgTvVvmwtlQ60ITIavLjOSxQ4LwU?=
 =?us-ascii?Q?vfiXNfJFOdac3jkzYV6EcNUideChoZhEorzzjD4WBbWWJoZFSD1o2uZjtsIP?=
 =?us-ascii?Q?Pj5Op7Gq490hPtfdi+Mx8d6QXm59ng+slukqya2hv2EB98kN6H2nohOs520N?=
 =?us-ascii?Q?5+ip5gL9GT1iTJruDttFtE2VILRGnbjkBmAL6kYtFqYOPvDQCswZJgAIxefB?=
 =?us-ascii?Q?ogIZvpE0qlsvgb7DXCEbIDq2hHZKg4C+AWiYC8lRWPHgCPjZjiFfje/AOy7X?=
 =?us-ascii?Q?8HhDIM/T1BZmmqDeeZECQfTgRtIbmtkkueFnovKOE+T6ueWWZmfdwfo+gZA2?=
 =?us-ascii?Q?P78yhVv9wTCTJxk5gpk4BGD9AbCr+qs+UoX7ovlkBxddyYbZaCnfuyHBoYhl?=
 =?us-ascii?Q?6SesKDVME1+fcioPt/r9EzMXLgJ+mrYlJeeTcEUes9jy90QzOtlRqbNQ7CZ8?=
 =?us-ascii?Q?Dta1VKswmnBAnWjkMf0RzdwLV/OqEQ30GthnRxQHlvRuJThAtkDIdGXMhdWj?=
 =?us-ascii?Q?W7TIVW4zf/Rl45TfcisMyKg7UM4Rp4wlFqSCssxlcYMk2xeArDh0DV+892Xz?=
 =?us-ascii?Q?Mu47bZTojr7pDW2aEvQETE6M9Ag5oelfKlfbop9XjkxwDbWTR1aiP77LEcpf?=
 =?us-ascii?Q?J5cLoLMdejyK1QKEMDjF/l5RHPVkjLfYbMlgbtysPDwuT0pXHI2Qqu3bueaa?=
 =?us-ascii?Q?ZNV9qD3KDZWTltT9y7o1jSM53tXwA6AxdFmdsiBkOU7x7ayq52Lz8T46LbE/?=
 =?us-ascii?Q?/O5F19MBGRyjr1ZCFu+qGiX+Elv1ZGaTUnIREhaC1NdmKAxrJMPHD6pGzMKu?=
 =?us-ascii?Q?cfOnbv/18IdAaapZGo7UOLCwZmi1n3wHGptMKeZ9rPa9AowU5PRNWGQohzb2?=
 =?us-ascii?Q?uLby+rguBmW2TLZEyWbL7ypKcadxdn4+BeLyOgmdgbUv1BBvmqhphb9U4w5N?=
 =?us-ascii?Q?HYjvKmJwltMisZW26nNXlP/iMi1SE/ZU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a16f7f-906c-4e66-5789-08decd4874d9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:47:01.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11612
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8667-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,outlook.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D3EC6A0FF4

Input validation for pattern duration is performed inside the write
loop, after the pattern sequence has already been stopped. If
validation fails mid-loop the chip is left with the sequence stopped
and partially written pattern data, with no recovery.

Move all input validation before the mutex and before any hardware
interaction, so an invalid input leaves the chip state unchanged.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 316ed8eb054f..a750c95ef3f8 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -228,6 +228,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+			return -EINVAL;
+	}
+
 	guard(mutex)(&chip->lock);
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
@@ -235,10 +241,6 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 		return ret;
 
 	for (int patt = 0; patt < len; patt++) {
-		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
-				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-			return -EINVAL;
-
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
 		if (ret != 0)
 			return ret;
-- 
2.54.0


