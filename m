Return-Path: <linux-leds+bounces-8185-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJCRIq3jCmpr9AQAu9opvQ
	(envelope-from <linux-leds+bounces-8185-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:02:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC156A3EF
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF5853010F00
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DFF32470E;
	Mon, 18 May 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="gyq8L1jH"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47F322C77;
	Mon, 18 May 2026 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098030; cv=fail; b=EYbVLx3tSVFBEWenxZZAXz2xZCYt433x65MDmpGetjf1z3pf6keJ2hoJhlaoXq97I5CFGUWCHehR3xdLQT+vUsTylXubYEY4NLE0RvjgCVvM6k0MmSUO4zOknwkP5+ZI0bAIJEirP9+CNA3osePdHf0zm7zrpzOSnRnHOeuKHgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098030; c=relaxed/simple;
	bh=oGsJNqRiiwysP54yQ+vIxChx5R+vM8lFqHb3D0paqsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H1yJvF28fBbspWnhizONG79Ni4NObAFmgJcCiRhyb5hOw85FG4M5gAUu8yn2nD9hSiAm+CvLR/4ys1wnE6DiSeC76PDINXbO8p1yLehNpVy1U7parztRJOoVkqjVqhLfrv6fldQDsrxhckn6sgSKdLo7N9eZztheW+wOXuK2/tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=gyq8L1jH; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWulNQD+Xha0/wUiL/7vQcuyZTiVhMjW6IyVQ4T78PFPf0BpVjcF6UOpI7b9lBPCcJYo8f2fFfARXf3Fo9P+x91+S+hLFHy0r0UZwKi1hqc1e9agX+nWgPOPdRPXCfrHTCvl4Pe1WciQ4A10ZNuQ4bGegGBgIWReOabHJbkwZwTawKaA+JMN3p73I6D8SgTf5LuV4HC+seWfTdDfx0qMwlu0wQEQyYP2k23CcfZHZdyxR3onNqa7ZkC5TGpe8QOmKAEC1pQippBGMENq7nMwMSEVeRs1DC8+ZjWvoReQf43d0vxMfAXceGcYVZf5+XZjqKkAg03gNZMbT/UrhH9tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGsJNqRiiwysP54yQ+vIxChx5R+vM8lFqHb3D0paqsg=;
 b=msoBpSPLyMLTjB4irHN14BsC27WRYz3ZNu1LRxQDObjBFcaMKCEHSW8gMSEygt7AGp5g3Kcl6HI6/ddI6dJud7v1AASERsDdCA2z2WFhmZAQj4glVG6wwmKyXErH9+RpFe/ydFqFD/QhMKqjOe2VTAwap7vqGZZSWAVCcHsJdSMM35gmKmCBy+W7cppAYEtjKzeeeICnj4I9dRrTYak3CuZtVAymMHy+HJHIE9PxQYuQMW5nYew025vdtGspKtMQPh7+BFenARWIdXdr6naJwhCqsysexjAgwsecKsewov+em4iGqbUznshJkP1BOAPWnJF9e5gCYcNX3QWYT0E8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGsJNqRiiwysP54yQ+vIxChx5R+vM8lFqHb3D0paqsg=;
 b=gyq8L1jHybBb1yUjTKm5abcgQRV9+JTKvlS40VM8NOzo77R3bPfMrzndUGm8bltRnk87kUCCvJ8/iSU6HjJlfRQvWa3ckDp6dCVyqHsbJ5PEUYDClkpJ7tNCp6wAV8VFYQp37kme7cuGiNNkzj/dcHNLUb3BlJ5rRf7aS3L44R1HEhBmYJdD5InaibN8fZR2m27NDwS/t7MnL6ukP8Vzo8grnTu3xihNOMV672La86Td9oU9GLIg2ZIukFaLwkU4isZZHq2LmK2yAiriFoxztkZVWoZZeLwr+zKWbEHnFvBpt1fa7EKvB9w/fkBjVo0qkEEwg5+Pkpxc8WSuCu6GWQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA1PR10MB8431.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:442::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 09:53:43 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 09:53:43 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: Use named initializers for arrays of
 i2c_device_data
Thread-Topic: [PATCH] leds: Use named initializers for arrays of
 i2c_device_data
Thread-Index: AQHc5qwwm6mGByZ0Zkmha6bwAXZ7Tg==
Date: Mon, 18 May 2026 09:53:42 +0000
Message-ID: <b8223eeed0835423b39cfb59e080efb362f347e2.camel@siemens.com>
References: <20260515163325.471175-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260515163325.471175-2-u.kleine-koenig@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA1PR10MB8431:EE_
x-ms-office365-filtering-correlation-id: 028e59cb-6c16-49a5-f16f-08deb4c358a4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|55112099003|11063799003|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 J2hCnoobcwrRkbD+czLUKibGwItfSFxkX1xhHz+MU78d0RBvX3iA3TlVQBQIx48zvEumGvAHhd8O8Cc8VMn4lo3oacOQ6g+5wLcMmgRk+OXXVIsubjdeIwzaulLAW6i2yU+FvuX8oanrgEO86eH9j4Wmp1nEYpx/hdVO7FGKnRRdYxHIPOTYxTckN/M322yMGNiyKtjXQ+7pGajX+UN0dcR4tzl/ihA6I+iwsddSVfJd21AdayoRryhs3Ko0hbNo9MTvKga8Jvql5cjKfLCVXsEflANmUTG2AxgSucuThFgyiHrdHGeGhYQgL1hn1/qWnP4p/mtYSreoW0T3foOQa27j8UGK+jHmlhFm7Rtej5X9ZdooguCPdwo4ZTWh8s0YvAv1xpiShA2yx3/JzeVJiGUan48CJD3PxpJyeDAnQWzt5izX8Qet1QICQx4BK4MMlk5xUkZxqs5fFcH6gxvXeJ4JkEVYaA24Ow9wkFsbM73M6TRD3p5nU0qGbpqk3XAQyv53IipIK17vTAHPglz9d9m7evFgygNPIDqgEtezd5fpRFncR3Fi7QBW3j66hIw0VHgOcW6rdECjULFduCQbQ7tYQiAogJPrrIIuAwp49gPu9CVrWdFNRwPcJBcgNXqukb2fCXAV+wbUEglbbeGt2p1/s4YCjzGiMMgzPc6WT0SG/EhAa9Q/2bMM1bgHkp2L667shVNCwwBKphqsE705Bg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(55112099003)(11063799003)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YStYRnNIWU1aUmN6OFluZ0hHdzA4enBQZXV0UUpRb0ljeTZVYUNTYjNMZi9O?=
 =?utf-8?B?YzRFZjl1eGtudllSQVEyVXlLMHd0Z3hYSWVPTXBKVmZDUTdURVNla0JZU3J1?=
 =?utf-8?B?Zm51aFhIbnh2WE1oaUp2bnFUQ2FIdTFyYmlmVFhWOU41L2ZwZ3JhWUdNdlZP?=
 =?utf-8?B?ZU1iSEJYa3VzVHFqVkUxd01UcEt6VWtxU0ZCQVBGcHA0WUJtcnZuTVRDS3NV?=
 =?utf-8?B?UGNxK0x5NjBuTytjeUdUMWhZc2ZSNElDZmErZDlSSGpBdU92dlZIYll6R0VC?=
 =?utf-8?B?dFUxSExYSFE5dURSNENaV0Q5RlAxZkd0M2VNK2dqQ01RU1BBWWV1QVlCTC9y?=
 =?utf-8?B?Nlpyd2xxM09qc3dpTVFYc0dZenFyaTl2d0FZWjc4emw2aGJTWFowbk5HdzRN?=
 =?utf-8?B?NlhqRGw5QUtPYmRNWlZjT2Rwc3N0Q2hSQUttSC94U1pBQ3Z5UERrR1F0T2xH?=
 =?utf-8?B?RUF5allBc1JPekVMbVIwRWlIdy9iYXNvelFWRUVDOC9ZWG5TU1FrSWRva285?=
 =?utf-8?B?QjVtY0VyZTBoaFdiYVNuWGFXeGovb1dNdVJGTlhlQTFFRDFDeHA5dkZucHd0?=
 =?utf-8?B?U3ZkTGMxd2MzYlA2N0RITzQ5STFYMnpqLzhZaXpIOEpyZTFTVlZwVldSbHNG?=
 =?utf-8?B?VmlOZXh4RXNobFAwV0I5enVsaXR2aElVZ3N3b1FJZFZVWi9uazUwbFM5ZjI2?=
 =?utf-8?B?aHphZSt4OU1HOEc5QUxmbGNtZ0JuMHNLeTJ4ZXdsM1VlMHRhR2pBRnpiZFFE?=
 =?utf-8?B?bnVOS0hURkMwRFZFUnJ4eDc1Yk1SQldjZDJEbytOV0NSM0JkMzExQTNOUFR2?=
 =?utf-8?B?UklVaGtsZWhmVTJpQUhxN3R6NVllOEV6R2tOZzVRdmdaZjBMYURWK3lyUDNC?=
 =?utf-8?B?VnlFRGR4YWZvOC9sSExyUUNpMzJPSjVDUWxTeEJFcUs5bnZ1QjQvSUlaUjhY?=
 =?utf-8?B?MEhYVkRLUkE5VkYvSnFNL1E4RERWczNEMmoyN0g5QnNmc2tyV1grc0dSazRB?=
 =?utf-8?B?WmMwM09WeEVoT05mTGt1M0hTSzlETk5abjlvZlhJTkhNYlBnUzRVQ0ZXRjV1?=
 =?utf-8?B?emtZZjAxdGFZRXBxOFBCOWtvTFk4M3VBdWE3QjZESmpDRkxsOGFVL2xLUmNB?=
 =?utf-8?B?MGI1dkJjVWtKdlZlbGhKM3J6QkljRU5tNVJDMHlUUklHVnFueFpYOUlvR2c5?=
 =?utf-8?B?RWJSeUdOOW1GUEVVSmVHNXhPaDQ4MHV5M1hTRmZYS1YvbmcwejlEVEF1Rjg1?=
 =?utf-8?B?VlM0NjBnUUVpSDVpQkJndVptM1N1blVyL0FEdElOMlY0WU5hUkZkcUhSc0F1?=
 =?utf-8?B?NGZJU0dON0VNbG5rODZNU2Q5WlQ4UnRMcURIV1kzeUhyc3BxVzNTc1YxRzQr?=
 =?utf-8?B?cW82bFJJSDlkVGd1UHJKb1JDRS9uV2cxS3pwRTgvWEhqTEZpZG5CUUdrS3pI?=
 =?utf-8?B?eXl3Q3hxcm4rSk91VE5xeWgrdWtFbWg1bGRhSkRjL1dsbmpXMWhIV2lobmxR?=
 =?utf-8?B?TU5Za3lWK1pjSEhKbTFWTkRzczhsK2tTM0gvd243dE5hL1I5bFN3UjMxOGNT?=
 =?utf-8?B?b0g0Nk9jYWVQcHh4WXJZQ0hTUUx1NlJzSWJqMmZoc1NyV1FmV1NrZGtDMWQ2?=
 =?utf-8?B?eUZ2eWJpZ1BVWFdFSVNtMzJHUzV2VThzbmlPYnJVcFpKQkpmNDZzazdDbGsx?=
 =?utf-8?B?VzdvcEFTZXVUNmxOYWVVdkVva3V6aGZLV1F4TjhVT2tjNkhPUk1pNThrRE9j?=
 =?utf-8?B?ZjBvZXRHQkJodjB6WVMrYjA4YXBENXlVckJjZURBRWtUd1Z5UkU3QmFsVzcx?=
 =?utf-8?B?Rk4vTmx5UHRObkZZR2tKNjZpemVkVFl4NHdtdCtuai8yQ2NwUXBOdWRJdWx1?=
 =?utf-8?B?TlpCYWpERkVITDBPZG5Tejdsc0oyRjJVS0QxNXZjcXg3aW42Y1lhRnd5dm5B?=
 =?utf-8?B?dDNsWVhRWWMzZ0dKN2tGM2tPV0hnb1BMUDRPelJ0bmYvWiswdVgydGtPUStn?=
 =?utf-8?B?WmEyQVJINXF3VWFpTG03TTJ3ajErOFdoRkNma1lNRUpHTzN2SHVhcG1VWmUv?=
 =?utf-8?B?M0J0RVltU2tQU0pZZWEwdFFLTzJ5SW0rb1g4VE9ITHZHYnp4QmdXZXZWUTQ4?=
 =?utf-8?B?ZEhNOXB0SHpJWU1oYnBnUjNzK0I1cUhLdmw0WUdLZUR6VkFSbGVjN2duQTB4?=
 =?utf-8?B?VTIxRjJHWDZlRXRqbThuaWJPdlYzaU1ZSDdtUExGSis3MkFyaTZKcStwV0JT?=
 =?utf-8?B?WllrUThFNVdLSC9QQURJMVhhN0lxdWxsMGdtK1hab1VNdjhCa1lqVkc4N0FN?=
 =?utf-8?B?NHVpdU5WREZZQVBJVGRpVTAzbTMzdTl6ZUxjSDdKUlZaN0RZaDdZUW1mTEtB?=
 =?utf-8?Q?NDeYXFWotCcRXy2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46109618645E4D4993EB44E8DBCCDEF4@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e59cb-6c16-49a5-f16f-08deb4c358a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 09:53:43.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwtceHinIFrdXT/FKXNFbdOYEuNsAVmGrtBo9l7sriprae5GxumUwl88CB3eUpNtw9MopgH57B2AjERWZZ23/briDHSRliDoBse1Jdfky+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8431
X-Rspamd-Queue-Id: 8BBC156A3EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8185-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:email,googlesource.com:url]
X-Rspamd-Action: no action

SGkgVXdlLA0KDQpPbiBGcmksIDIwMjYtMDUtMTUgYXQgMTg6MzMgKzAyMDAsIFV3ZSBLbGVpbmUt
S8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIHdyb3RlOg0KPiBXaGlsZSBiZWluZyBsZXNzIGNvbXBh
Y3QsIHVzaW5nIG5hbWVkIGluaXRpYWxpemVycyBhbGxvd3MgdG8gbW9yZSBlYXNpbHkNCj4gc2Vl
IHdoaWNoIG1lbWJlcnMgb2YgdGhlIHN0cnVjdHMgYXJlIGFzc2lnbmVkIHdoaWNoIHZhbHVlIHdp
dGhvdXQgaGF2aW5nDQo+IHRvIGxvb2t1cCB0aGUgZGVjbGFyYXRpb24gb2YgdGhlIHN0cnVjdC4g
QW5kIGl0J3MgYWxzbyBtb3JlIHJvYnVzdA0KPiBhZ2FpbnN0IGNoYW5nZXMgdG8gdGhlIHN0cnVj
dCBkZWZpbml0aW9uLg0KPiANCj4gVGhlIG1lbnRpb25lZCByb2J1c3RuZXNzIGlzIHJlbGV2YW50
IGZvciBhIHBsYW5uZWQgY2hhbmdlIHRvIHN0cnVjdA0KPiBpMmNfZGV2aWNlX2lkIHRoYXQgcmVw
bGFjZXMgLmRyaXZlcl9kYXRhIGJ5IGFuIGFub255bW91cyB1bmlvbi4NCj4gDQo+IFdoaWxlIHRv
dWNoaW5nIGFsbCB0aGVzZSBhcnJheXMsIHVuaWZ5IHVzYWdlIG9mIHdoaXRlc3BhY2UgYW5kIGNv
bW1hcy4NCj4gDQo+IFRoaXMgcGF0Y2ggZG9lc24ndCBtb2RpZnkgdGhlIGNvbXBpbGVkIGFycmF5
cywgb25seSB0aGVpciByZXByZXNlbnRhdGlvbg0KPiBpbiBzb3VyY2UgZm9ybSBiZW5lZml0cy4g
VGhlIGZvcm1lciB3YXMgY29uZmlybWVkIHdpdGggeDg2IGFuZCBhcm02NA0KPiBidWlsZHMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4NCg0KdGhlIHBhdGNoIGxvb2tzIGdvb2Qgb3Zl
cmFsbCwgZXhjZXB0IG9uZSBtaW5vciBuaXQgYmVsb3cgYW5kIHRoZSBmYWN0IHRoYXQNCmh0dHBz
Oi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xlZS9s
ZWRzIGZvci1sZWRzLW5leHQNCmJyYW5jaCBhbHJlYWR5IGhhcyBjb21taXQgYzdkZDM0M2EzNzU2
N2U2NTBjMjYzZDRjMDY4NDE4YjBiYjgyYmY3OQ0KKCJsZWRzOiBhczM2Njg6IERyaXZlciBmb3Ig
dGhlIGFtcyBPc3JhbSA0LWNoYW5uZWwgaTJjIExFRCBkcml2ZXIiKSwgd2hpY2ggaXMNCm5vdCBj
b252ZXJ0ZWQuIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcmViYXNlIGFuZCBjb252ZXJ0IGFzMzY2
OCBkcml2ZXIgYXMgd2VsbD8NCg0KPiAtLS0NCj4gSGVsbG8sDQo+IA0KPiB0aGUgbWVudGlvbmVk
IGNoYW5nZSB0byBpMmNfZGV2aWNlX2lkIGlzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAJZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmggYi9pbmNsdWRlL2xpbnV4L21v
ZF9kZXZpY2V0YWJsZS5oDQo+IAlpbmRleCAyM2ZmMjQwODBkZmQuLmFlYmQzYTVlOTBhZiAxMDA2
NDQNCj4gCS0tLSBhL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgNCj4gCSsrKyBiL2lu
Y2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgNCj4gCUBAIC00NzcsNyArNDc3LDExIEBAIHN0
cnVjdCBycG1zZ19kZXZpY2VfaWQgew0KPiAJDQo+IAkgc3RydWN0IGkyY19kZXZpY2VfaWQgew0K
PiAJIAljaGFyIG5hbWVbSTJDX05BTUVfU0laRV07DQo+IAktCWtlcm5lbF91bG9uZ190IGRyaXZl
cl9kYXRhOyAgICAgLyogRGF0YSBwcml2YXRlIHRvIHRoZSBkcml2ZXIgKi8NCj4gCSsJdW5pb24g
ew0KPiAJKwkJLyogRGF0YSBwcml2YXRlIHRvIHRoZSBkcml2ZXIgKi8NCj4gCSsJCWtlcm5lbF91
bG9uZ190IGRyaXZlcl9kYXRhOw0KPiAJKwkJY29uc3Qgdm9pZCAqZHJpdmVyX2RhdGFfcHRyOw0K
PiAJKwl9Ow0KPiAJIH07DQo+IAkNCj4gCSAvKiBwY2lfZXBmICovDQo+IA0KPiBhbmQgdGhpcyBy
ZXF1aXJlcyB0aGF0IC5kcml2ZXJfZGF0YSBpcyBhc3NpZ25lZCB2aWEgYSBuYW1lZCBpbml0aWFs
aXplcg0KPiBmb3Igc3RhdGljIGRhdGEuIFRoaXMgcmVxdWlyZW1lbnQgaXNuJ3QgYSBiYWQgb25l
IGJlY2F1c2UgbmFtZWQNCj4gaW5pdGlhbGl6ZXJzIGFyZSBhbHNvIG11Y2ggYmV0dGVyIHJlYWRh
YmxlIHRoYW4gbGlzdCBpbml0aWFsaXplcnMuDQo+IA0KPiBUaGUgdW5pb24gYWRkZWQgdG8gc3Ry
dWN0IGkyY19kZXZpY2VfaWQgZW5hYmxlcyBmdXJ0aGVyIGNsZWFudXBzIGxpa2U6DQo+IA0KPiAJ
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL2FkNTM5OC5jIGIvZHJpdmVycy9yZWd1bGF0
b3IvYWQ1Mzk4LmMNCj4gCWluZGV4IDAxMjNjYTgxNTdhOC4uZGZiMGIwNzUwMGE3IDEwMDY0NA0K
PiAJLS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvYWQ1Mzk4LmMNCj4gCSsrKyBiL2RyaXZlcnMvcmVn
dWxhdG9yL2FkNTM5OC5jDQo+IAlAQCAtMjA3LDggKzIwNyw4IEBAIHN0cnVjdCBhZDUzOThfY3Vy
cmVudF9kYXRhX2Zvcm1hdCB7DQo+IAkgc3RhdGljIGNvbnN0IHN0cnVjdCBhZDUzOThfY3VycmVu
dF9kYXRhX2Zvcm1hdCBkZl8xMF80XzEyMCA9IHsxMCwgNCwgMCwgMTIwMDAwfTsNCj4gCQ0KPiAJ
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBhZDUzOThfaWRbXSA9IHsNCj4gCS0J
eyAubmFtZSA9ICJhZDUzOTgiLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmRmXzEw
XzRfMTIwIH0sDQo+IAktCXsgLm5hbWUgPSAiYWQ1ODIxIiwgLmRyaXZlcl9kYXRhID0gKGtlcm5l
bF91bG9uZ190KSZkZl8xMF80XzEyMCB9LA0KPiAJKwl7IC5uYW1lID0gImFkNTM5OCIsIC5kcml2
ZXJfZGF0YV9wdHIgPSAmZGZfMTBfNF8xMjAgfSwNCj4gCSsJeyAubmFtZSA9ICJhZDU4MjEiLCAu
ZHJpdmVyX2RhdGFfcHRyID0gJmRmXzEwXzRfMTIwIH0sDQo+IAkgCXsgfQ0KPiAJIH07DQo+IAkg
TU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIGFkNTM5OF9pZCk7DQo+IAlAQCAtMjE5LDggKzIxOSw3
IEBAIHN0YXRpYyBpbnQgYWQ1Mzk4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+
IAkgCXN0cnVjdCByZWd1bGF0b3JfaW5pdF9kYXRhICppbml0X2RhdGEgPSBkZXZfZ2V0X3BsYXRk
YXRhKCZjbGllbnQtPmRldik7DQo+IAkgCXN0cnVjdCByZWd1bGF0b3JfY29uZmlnIGNvbmZpZyA9
IHsgfTsNCj4gCSAJc3RydWN0IGFkNTM5OF9jaGlwX2luZm8gKmNoaXA7DQo+IAktCWNvbnN0IHN0
cnVjdCBhZDUzOThfY3VycmVudF9kYXRhX2Zvcm1hdCAqZGYgPQ0KPiAJLQkgICAgICAgICAgICAg
ICAgKHN0cnVjdCBhZDUzOThfY3VycmVudF9kYXRhX2Zvcm1hdCAqKWlkLT5kcml2ZXJfZGF0YTsN
Cj4gCSsJY29uc3Qgc3RydWN0IGFkNTM5OF9jdXJyZW50X2RhdGFfZm9ybWF0ICpkZiA9IGlkLT5k
cml2ZXJfZGF0YTsNCj4gCQ0KPiAJIAljaGlwID0gZGV2bV9remFsbG9jKCZjbGllbnQtPmRldiwg
c2l6ZW9mKCpjaGlwKSwgR0ZQX0tFUk5FTCk7DQo+IAkgCWlmICghY2hpcCkNCj4gDQo+IHRoYXQg
YXJlIGFuIGltcHJvdmVtZW50IGZvciByZWFkYWJpbGl0eSAoYWdhaW4hKSBhbmQgaXQga2VlcHMg
c29tZQ0KPiBwcm9wZXJ0aWVzIG9mIHRoZSBwb2ludGVycyAoaGVyZTogYmVpbmcgY29uc3QpIHdp
dGhvdXQgaGF2aW5nIHRvIHBheQ0KPiBhdHRlbnRpb24gZm9yIHRoYXQuIChJIGRpZG4ndCBmaW5k
IGEgbmljZSBsZWQgZHJpdmVyIHRoYXQgYmVuZWZpdHMsIHNvDQo+IHRoaXMgaXMgIm9ubHkiIGEg
cmVndWxhdG9yIGRyaXZlciBleGFtcGxlLikNCj4gDQo+IE15IGFkZGl0aW9uYWwgbW90aXZhdGlv
biBmb3IgdGhpcyBlZmZvcnQgaXMgQ0hFUklbMV0uIFRoaXMgaXMgYSBoYXJkd2FyZQ0KPiBleHRl
bnNpb24gdGhhdCB1c2VzIDEyOCBiaXQgcG9pbnRlcnMgYnV0IHVuc2lnbmVkIGxvbmcgaXMgc3Rp
bGwgNjQgYml0Lg0KPiBTbyB3aXRoIENIRVJJIHlvdSBjYW5ub3Qgc3RvcmUgcG9pbnRlcnMgaW4g
dW5zaWduZWQgbG9uZyB2YXJpYWJsZXMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVXdlDQo+IA0K
PiAgZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMtYXMzNjQ1YS5jIHwgIDIgKy0NCj4gIGRyaXZlcnMv
bGVkcy9mbGFzaC9sZWRzLWxtMzYwMXguYyB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvbGVkcy9sZWRz
LWFuMzAyNTlhLmMgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1hdzIwMHh4LmMg
ICAgICAgfCAxMCArKysrKy0tLS0tDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1iZDI4MDIuYyAgICAg
ICAgfCAgMiArLQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMtYmxpbmttLmMgICAgICAgIHwgIDQgKyst
LQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMtaXMzMWZsMzE5eC5jICAgIHwgMjIgKysrKysrKysrKyst
LS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMtaXMzMWZsMzJ4eC5jICAgIHwgMTggKysr
KysrKysrLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1sbTM1MzAuYyAgICAgICAgfCAg
NCArKy0tDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1sbTM1MzIuYyAgICAgICAgfCAgNCArKy0tDQo+
ICBkcml2ZXJzL2xlZHMvbGVkcy1sbTM1NXguYyAgICAgICAgfCAgNiArKystLS0NCj4gIGRyaXZl
cnMvbGVkcy9sZWRzLWxtMzY0Mi5jICAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvbGVkcy9s
ZWRzLWxtMzY5MnguYyAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvbGVkcy9sZWRzLWxtMzY5
Ny5jICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1scDM5NDQuYyAgICAgICAg
fCAgNCArKy0tDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1scDM5NTIuYyAgICAgICAgfCAgNCArKy0t
DQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1scDUweHguYyAgICAgICAgfCAxMiArKysrKystLS0tLS0N
Cj4gIGRyaXZlcnMvbGVkcy9sZWRzLWxwNTUyMS5jICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJz
L2xlZHMvbGVkcy1scDU1MjMuYyAgICAgICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL2xlZHMvbGVk
cy1scDU1NjIuYyAgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMtbHA1NTY5LmMg
ICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvbGVkcy9sZWRzLWxwODUwMS5jICAgICAgICB8ICAy
ICstDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1scDg4NjAuYyAgICAgICAgfCAgMiArLQ0KPiAgZHJp
dmVycy9sZWRzL2xlZHMtbHA4ODY0LmMgICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9sZWRz
L2xlZHMtcGNhOTUzMi5jICAgICAgIHwgIDggKysrKy0tLS0NCj4gIGRyaXZlcnMvbGVkcy9sZWRz
LXBjYTk1NXguYyAgICAgICB8IDEyICsrKysrKy0tLS0tLQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMt
cGNhOTYzeC5jICAgICAgIHwgIDggKysrKy0tLS0NCj4gIGRyaXZlcnMvbGVkcy9sZWRzLXBjYTk5
NXguYyAgICAgICB8ICA4ICsrKystLS0tDQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1zdDEyMDIuYyAg
ICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMtdGNhNjUwNy5jICAgICAgIHwgIDIg
Ky0NCj4gIGRyaXZlcnMvbGVkcy9sZWRzLXRsYzU5MXh4LmMgICAgICB8ICA2ICsrKy0tLQ0KPiAg
ZHJpdmVycy9sZWRzL2xlZHMtdHVycmlzLW9tbmlhLmMgIHwgIDIgKy0NCj4gIGRyaXZlcnMvbGVk
cy9yZ2IvbGVkcy1rdGQyMDJ4LmMgICB8ICA2ICsrKy0tLQ0KPiAgMzMgZmlsZXMgY2hhbmdlZCwg
OTAgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25zKC0pDQoNCltdDQoNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbGVkcy9sZWRzLWxwODUwMS5jIGIvZHJpdmVycy9sZWRzL2xlZHMtbHA4NTAxLmMN
Cj4gaW5kZXggZWU0ZmY0NTg2YmMwLi45NDZjMjdmZDc0Y2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvbGVkcy9sZWRzLWxwODUwMS5jDQo+ICsrKyBiL2RyaXZlcnMvbGVkcy9sZWRzLWxwODUwMS5j
DQo+IEBAIC0xMzAsNyArMTMwLDcgQEAgc3RhdGljIHN0cnVjdCBscDU1eHhfZGV2aWNlX2NvbmZp
ZyBscDg1MDFfY2ZnID0gew0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNf
ZGV2aWNlX2lkIGxwODUwMV9pZFtdID0gew0KPiAtCXsgImxwODUwMSIsICAuZHJpdmVyX2RhdGEg
PSAoa2VybmVsX3Vsb25nX3QpJmxwODUwMV9jZmcsIH0sDQo+ICsJeyAubmFtZSA9ICJscDg1MDEi
LCAgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZscDg1MDFfY2ZnIH0sDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICBeXg0KZHVwbGljYXRlIHdoaXRlc3BhY2UNCg0KPiAgCXsgfQ0K
PiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBscDg1MDFfaWQpOw0KDQpbXQ0KDQo+
IGJhc2UtY29tbWl0OiAyNTRmNDk2MzRlZTE2YTczMTE3NGQyYWUzNGJjNTBiZDVmNDVlNzMxDQoN
Ci0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

