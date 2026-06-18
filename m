Return-Path: <linux-leds+bounces-8682-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vlPyJ6VXNGqtVQYAu9opvQ
	(envelope-from <linux-leds+bounces-8682-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:40:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 436976A29F9
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:40:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=qVWLkWJW;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8682-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8682-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11D90305C112
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A4634C9AD;
	Thu, 18 Jun 2026 20:39:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013079.outbound.protection.outlook.com [52.103.51.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235B72DC76C;
	Thu, 18 Jun 2026 20:39:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815184; cv=fail; b=c88iYFzZH2/4+xB6B6t48FZgClxm8O6YLe1pBPZtLFmAtUhBDdAY8F/jcOvmk6GpjZV7IsQOR9qPTCH1CM6fyiCFJaQKeZ5SXOBj3acfFAx1eUo/YYzlu0OvQMfdEw1L9Vqth58C/jmYaxzSr3dQv8YTzwW5WwGXbr+5/LFasj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815184; c=relaxed/simple;
	bh=aLdAczq2HbqGagLtQnH+K6rHQI9sUEB6IYYftzQVdac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jY5vAIbKve/0cA3FFqGBmmn6w+iXJExHYJW8UgFyMLcPRdOmsZsdJCy/A39INfib0a5kjjC4AJQnGhTOn6tf+5c/kafYeYX9FoEJBx1NOf3wGvLdOzkrmeQsG5I6vkP2fPCO/IfHjQVJEjrZuFydtblvE7EuOOtfWrgAWwQc/VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qVWLkWJW; arc=fail smtp.client-ip=52.103.51.79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssO+XilOxmdEeam9NXO8I1T5yqSVXU6Lfq0KwAB8VC6B7qqs3O4KP9Blil2fyqHCQBSuSakSZOfBpa2YmVjR87vOaSALDXzM7m4Tebv/kY4gg9BfhZF57hkUwkYqdUazBwAw2gbux1o8bwKQO/4PIF13qGncOadII1iLr4y7Hb/lEMyTsh0cOUTb7+4IOufDVZOLAwvZYMAIzRJcdlJGJpwgGoEkUi0zKrGCXgJhq6pRgNY+4pYhX1cnCU/63j9pvvdWt6QUJ9nRl0idqd4Ad4SjmItBODEk5tRoxVFt1X781mfhkIqy+UpXIHAp38x8yBFRa/KeESQT3n05W7o5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2W90yOZUVw76oYiYOP1XkkGHnxJxsJAgH2GITIdw04=;
 b=BeZaxVuA37fdJ2u1Du3sjcw2FFB9K7FFHOXrDRSvWOQjrcTvdgASH1f0+8hAFNXTSoVgWwQtTe6cky0gjUydkZH6zNej2lZrhzwXni/gJ4WajDdEIknQSdQogG14bLKragAiFg4Ef8DDHhqzl+JWF73zxzjiq/GUqMPY3OGoeffH0iRL9ivmrSflupEw58sOD7FP9mm2DgkjlAbrmN47F6HOqrSXENdwm1/Cfs9fMNvLNVhpi8h5E5YUfiW7s8S9gnIswXcGh2Tj7KZvinNq5KpKDH4A1qC0U2TYQ2MyfaN08gASmE9LQ/wHV7GiRKHWj3SL+4QWb9ZN1YyxstZHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2W90yOZUVw76oYiYOP1XkkGHnxJxsJAgH2GITIdw04=;
 b=qVWLkWJWkB+y83BLLgInvCgFAKoNc9tEBx3zES5TcQUj8ZhcfH1Zjx+Vy7YtH6LSzZZ/SntfN4sp/678h6WsbPYBlKKZ4Sof7/olPFHb9Md8EQwk6pXnZ8jXtRftZmsP+NCDblHfwphcW7mJrEeEGcmhmkVnN7fbQPuWzokysmROPWmlAyPtOCWihOCbWRqOsN15VA4Z0veuZGZi2/eypp/Zhw43XtIm3EA6adSi4/6BgON4MtAUWhMnHBbIgGn9vO7QQQQcpht+z55qGowvapmZ0+6D1uQWhMQ8X8w32aKaScw58WvpVtC1XM7sPQyrSysLyqD6LpMNu373M1fCQg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7812.eurprd08.prod.outlook.com (2603:10a6:10:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 20:39:40 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:39:40 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/9] leds: st1202: disable channel when brightness is set to zero
Date: Thu, 18 Jun 2026 21:39:27 +0100
Message-ID:
 <GV1PR08MB84978534CCF36301889E48A9C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203927.3341284-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: e8943f92-e62c-43f5-a010-08decd79b83f
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR1sEDWlVmUlDJ6ENLfRu57JRaFrbBZ9Ln5F267mdF+pK7p9W2Ud9P8vPcwBfYvSqFcY6o1bJCQLf3A2WBC6CjRZjsvDGjmw4Uh1pfyBq5kfVIXeilz8UR2cFoLqApeUJeYwFVsFZ/hrS3YlptN4gi9/x9c7ah9ufSetRY44frkKKrhKwfUZVP/Az1G3uSBDgKGEG3v6CeTGwkfGyr1IBzsnn/dAX6+7dHG79AeCB5Z9SAX0v12zWQ4CBsA2OBAFi2gV7Pladkb1w4LeMnkgcLvPzP02WzJuqisuRy/AKQYVwTBraSlUiwmPHeLWa2nkT+P0EKRQ+qnhuGYbWUzQ+YXaHMo8ijKRx81gasFq3i+x6ukBU+UZrtjrO9dKr1/X/jlocxfHOSmIrBK6mWW92UGPgG0hfWkvxHOMFFiGHVjZGaGJ0Yio7WdSvqe/bz6QMRsXYBVGkzFazcXuWg37AOef5VoDTHSAJyEZ7eNQpSEyYSHpjZlMfr0FbxabO86/xRKysnl8yyP/omYLqFgLd6Vcjmhwl0ZoQshC9SGsNi9zE6MgrB8x2Tdy1TzKpqKpHn0DXLJZES3V4ov/KX4PxSac/rii5lHzVhf8whNrtieVcQCrAqaG637GOK5AB47wIR6lUk5er51YGebT3EMl9gCIIdce0pdWLQLfiUUvfisP1Dl6uxyoXioDTxlLJDiabI17eg+NY3pzaAY8KdS+ikjz4by+N2jgEky+5QL6bJjys=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|37011999003|15080799012|23021999003|8060799015|41001999006|24021099003|51005399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GDmX3Srn6K0URb/r5tEVtfN8p3Z3iI6MKlvD8YkKcMSTrwsnap2ecHfFb6o0?=
 =?us-ascii?Q?86k5eR6N3Rq4AQPYZanGnP4gphNU1WNFqHyPyq50nU5ltIQfzL6B96xjwLng?=
 =?us-ascii?Q?PeXi0QJsZiBbAnGq33CWPy7GKcTKH0bE0/IuiHW4rGXs/flPa7hTf5pM7kOv?=
 =?us-ascii?Q?KQ28BfTu3kK9KulrGsnss8FgORLj5Edk63if/ekcVbp/PVdcRZpww+1q9038?=
 =?us-ascii?Q?ULgS2d7M4cN/7NgHHpHPdR2dsDbqIcP3SabNKw4WUemarLDzqIQDy5MIUN0V?=
 =?us-ascii?Q?RJxD43QN0v5+pEF6IRCoAU0c+h0eGNKWB3d7JjwQHLX5rlFpdZ3yvJDhmb3T?=
 =?us-ascii?Q?vJgVXS4VwoqSckx8BiiQ2+4O8j2XG7PnhwY2unOFnc6A50/b72zex5nqIDRe?=
 =?us-ascii?Q?ympucvXm0yjcz3LSM1rZJEHxwEvIC/iNAhUXSpaQ+d+fCmFo3qv4ay+Q2zeD?=
 =?us-ascii?Q?tb/vrzzul2AeB9wUl7YFKZ4ryUiM3MamZAQmFXIBSaM+KOQU9baJohHoFpB9?=
 =?us-ascii?Q?g+Dt6e+7uDnKAOm97GQ3bironAH6UcvClDL4ZSNu9nOX4kmiLXj6JrpD20lP?=
 =?us-ascii?Q?xXflXNwqfNHAxvdAMbpccVKSNvAebbj2XiTMyqyzCcO7ZXToPZ+NIX0fhljf?=
 =?us-ascii?Q?RI63KZslpPPWEgMLNjNiLL2n6EzYQi0YbYGL3qhnvOzH14uQksnSudlboiYa?=
 =?us-ascii?Q?QghNUFXd5+r4W6ocl8P7TIkA/PFWwpfGxYrCVkWWjf0Bw72o/A3HLaWTrvaI?=
 =?us-ascii?Q?7b/5ZMEe8XE1EQtwAkTrUa2eNTjXcQ4j4/qGjCRTFWeHNH2UC+Ph0S1FSvRi?=
 =?us-ascii?Q?2QBiUcS1jF1IU3MOzLGvMQMYHiqQ/RgvhnnWpKxl/4YoFU1dvP+tqtLBl4OY?=
 =?us-ascii?Q?qGNsbI0h00v7nJJxVyCotOs1L9AIqRRKCMsPMJ6lO0CkOWtDwKeDFasspGER?=
 =?us-ascii?Q?CdJ6Rji/XhvJAnW0ZwC8AxFiL8QcaKNbSyvpLNt2n6/FsbeQdeXpZfnRKG/L?=
 =?us-ascii?Q?iTKa?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7oWhGIJ/KE0lT09lXv1nhVatafO5X8Has7xuDaxRBXkfPBYYHgxbAZptIT3v?=
 =?us-ascii?Q?ys9J3XLBVxkKmb8RA6Rfp2bddfO0diklPjuyeiDZHSvYOFLHAgT5/4Ig29vm?=
 =?us-ascii?Q?GC6zaTshZtfpB5RqwPF3fmMFjI6bT9YHGjBDFh1NiVU/PR+/aXOU6jBClOg4?=
 =?us-ascii?Q?00S51BEsf7k1Yc+lWMNmQLVGpSuBzrqIuXVKxfjjbBlA+RJJqITfv88ccO+3?=
 =?us-ascii?Q?2xnm53MT/d3v7JB7I57FORPtwsccsP/J9OvdA4k9jrPEegSvfZathrNt2b4F?=
 =?us-ascii?Q?hmxltXJ4caf4yCZmOv9UGFs1E//2to+NUGHE77kT2gMMHWdsUVxd+6a8ZWkW?=
 =?us-ascii?Q?d3SzQujMGmvVVQFZ43nzUaeRbrivk4qaTYM1Z25+EL6mdSyir5ERPqz1i6Hm?=
 =?us-ascii?Q?chej8qoFoVzlWTnG52v22H4MkXspkkxcl1GdAT7AS3n5RKtSO4hZrmlDsJAl?=
 =?us-ascii?Q?n15i82ebhZ9/imQRD3FOCu27ccVouVncb+U+YnZmIJ9aBA6PiggnKlxORagU?=
 =?us-ascii?Q?vubpl11ZZ75ARCOhcidZ378fOId3Sm7vDn9QrHfwMJToen4jcwnX3lSfj4hk?=
 =?us-ascii?Q?g7WCsHJx68bLl7E9AuufjQOo+D0IQOqJOu07FZwvsNVS4MIxEYIjnFTIyS9L?=
 =?us-ascii?Q?QrZQoGf74wUOkhEdb8NEKXqkz2D3Utq9Zx1T1UPrnBRbM3+S+bt2FZK9SCI0?=
 =?us-ascii?Q?5jMUp+P0ff1mBQ9AaWnvLiJNqAK1s6e6l2d/tz4IRR0y0YItahaytkIki1iF?=
 =?us-ascii?Q?3fKyUI+mAEOp6399COCiLFEflb0TlgSXUBblzNIhBhjCYAkU4Bi6tAlUvtJK?=
 =?us-ascii?Q?QzulBNuqCNZXwnC/QLdMOZsvLcSyuHhqfklIHfenMnOkwGPMtLd4oZf2U49/?=
 =?us-ascii?Q?WuNs4IHP5xH5OAJCht4vjVT6HoKl4PU1+k1tDUf3+T12ZSOrx4fcGOBXgpm0?=
 =?us-ascii?Q?9DJPveWmD8LfHvoUMJZhigqoXu2MV3jzdDxYOGwMzjVwyl+z/MYQE/Tw4A/e?=
 =?us-ascii?Q?SWZTkUUPQPJSJXGPLNQvfDynjA3E9xzX1xyVBuUaXKGJ9CJ3K3R8k+sEiuvn?=
 =?us-ascii?Q?QzWX59HR6iU3NqB/Bb1Luf+qXfSj+2Pf2aeq6giB5SfXWN063yjNrNGo3iBs?=
 =?us-ascii?Q?Y2hzSCzBp37hxzJRJ5kxyWGM3Ud5UQ84GKD9WWn/bs0Sbm+RWpxlNnVoYk9S?=
 =?us-ascii?Q?dxka+PtTmyfzd4SlEE2KH3fBVGxtid8B37IbxjOxMaXrMK+7rq/cjnQfOvv6?=
 =?us-ascii?Q?HTLElkTuMkHJJ2/q4Utggo9aJ3SPHzspbhidTMOLI8mGZpptumeF51RfLf3D?=
 =?us-ascii?Q?ECuApMjE8darExRm/nJ/tg48l3tmXBx5Fh+l5VJEaqQFZIkOysNFHFYwKakL?=
 =?us-ascii?Q?hRNg2CiKskULvacDgmv+DSUUVkWB6D1wHN+c08VymL6z27o9J1YK3tnBOcH+?=
 =?us-ascii?Q?5QWo6ERNp7TuYNt4elnI5nu5/PyLrAS1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8943f92-e62c-43f5-a010-08decd79b83f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:39:40.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8682-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 436976A29F9

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 67 ++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4fa41cc74412..0610d4bd191d 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,38 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -187,6 +160,40 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
@@ -264,6 +271,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret != 0)
+		return ret;
+
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
 							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
 	if (ret != 0)
-- 
2.54.0


