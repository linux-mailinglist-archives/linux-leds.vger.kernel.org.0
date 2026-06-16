Return-Path: <linux-leds+bounces-8616-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mQaqEtz5MGpoZwUAu9opvQ
	(envelope-from <linux-leds+bounces-8616-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 09:23:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57968CCE8
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 09:23:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siemens.com header.s=selector2 header.b="qHD/tEcY";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8616-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8616-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=siemens.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D095B318A86D
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 07:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE9537418A;
	Tue, 16 Jun 2026 07:17:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2B370AF4;
	Tue, 16 Jun 2026 07:17:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594250; cv=fail; b=OTUjFsE4qQH9GTjDblfmyVaMDIEC8SONSwfZLcwXSPE8iLy8J8dVuYbjbx7yHkFHgoyN2BoI1oS0Lqtah97OdBuSU3ldpx4UVmnKL5iNAo6tdOsYorYaSwLX2wbGQAG2ULNo6O6Vzt7/SV4nrguA4PFEkE3J/awKppdxxHs+VhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594250; c=relaxed/simple;
	bh=8GhbAPxS5r5Fi/SAAtOLq5lp5Oq+0rRXzwcdwU6eZ2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhnigJpZt8sFapobBfS9mco+E8T7LGQCZ+pkFSHbDreQwnxwNvjKok28zLdeoP+FM8oeQlJepl1QeS3HbUz98msPtjOtWL6+5h3AfFRf8hobjXi2TLyg/QaWe3AZ4h3fEt0XJI+dORFVdET2Fcyc20BXhznYr4KW2mI/NoWbtOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=qHD/tEcY; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHf8YsBHjNYAFYXuTdDLUbwSlyf/ULyE9olI9R/nopXw/CoTUintZkPYce9oypbsQTpTI5mMfsCMK3VbMgUYmi2J0WL6KLaHf0nagPsYw567YL1mUbTgxOgiGqapeCQ3tgOHCR43gBvSGfKBHIo/oVUFNNTOKR6NktFHAUryc4Ivtj6hLZd601MP7Ht4NxigudR4EHDv6wHU4eK9E+KOMUWXl0A3gLD24fo35N0zfT5oxI48bOdubmyCqlc+WItCNqUkiigfBmA7gMrnRm6JlP/24GV8fVdDiWq6/E8p0/itt6wsfYwwxTKMIz+jqja9h1Twvic/8YyL6BmiV+dsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GhbAPxS5r5Fi/SAAtOLq5lp5Oq+0rRXzwcdwU6eZ2M=;
 b=faC6vH+dQcRjadRpgJoBxf9QXdJg8tr1kvvviKfI1mnv7Dc8x2ZwllyI7pi9Pxg0+rp1U8ZrSqERrg5QibuF5NmmgJ18vuOkkTwPsOXbC+1gVJo2vVy8rmu7toOA7P6FqjIT+9qXHI0f3/ruPExGwBBt0InRlVomQd5okuDMB5s5lUIG+Wn67sdrL0EioiLsmLBreFbe/ct9UbpqGmI5gXWBzUP5Tcq6lkcmIe4ZR9MJBige7tGewILY5IL/9kmwfhL3+DLHAo4n80aVkzRj0ghv6hfb8yN+2tnajXVLxM/MOxKQEevRrkp7wrZueGFuVcoh8pnQDy0WcCs6J0P6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GhbAPxS5r5Fi/SAAtOLq5lp5Oq+0rRXzwcdwU6eZ2M=;
 b=qHD/tEcYofSSJ0bshQmH8k8J2UmFE3ZRU5ZDUR5eFqrVNV8dXIRncIHU+K3ae8Js/fJRKbsMQySOOZEsrLgDQ1HO7noub0o4Qr23ZNJ0KS34BiWrWknXWgdqTmhj6kYMsvwIGXWpZrcB+hl6DAhpTppi8B2uetYsJa1UvWRvuNnGKaW9C+kYLOb3u0oEEOJiKey/Y+s74IF7T27tHGKMDcPd5ylTDDLieC0rkZmnfn0AbHmFF3pC/P76ZfxqwtNbQIdsferWPOxm+MsIJFR8rSYm8ZGiddAH5nje2l4E9UXkaTFUhZM5FhONsSBxWWQ/OMZ3/HRd9gzlnvO9C9wqEw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB8660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 07:17:24 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 07:17:23 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "afd@ti.com"
	<afd@ti.com>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"danielt@kernel.org" <danielt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "deller@gmx.de" <deller@gmx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight
 class driver
Thread-Topic: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight
 class driver
Thread-Index: AQHc/L9Bd4MT7UWYqkaHc9ldpDCobLZABz2AgAC/nQA=
Date: Tue, 16 Jun 2026 07:17:23 +0000
Message-ID: <acb13aca040ab72b9e53abee3a5c8733ebc5b8dd.camel@siemens.com>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
	 <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
	 <0b39450b-559b-43d4-a1e9-bb6684691cb5@ti.com>
In-Reply-To: <0b39450b-559b-43d4-a1e9-bb6684691cb5@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB8660:EE_
x-ms-office365-filtering-correlation-id: 836e568a-ba6a-4a80-f9e1-08decb77500b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|55112099003|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 zrsrt9TFofmblRe/s3Q0I2KZ1U43ihTMQJWNznM0MbGh5cCROD0Bi1jvvFKXQ003E60duAP2/h8qyPCA2Z21OGWbFmX1fWLl24K8Lb1GRD7YP+IBV/BpXLS030kCA43cyI2WGa/08kIR0AQXapyiBaSgaLPnN1uH1r0Ql83xPRX1hpWMlr5Ouh6XMYFZIqVLpuxxSKRX85YR8/uceSxmCqFWIjmFVabAdknimH27J+GCqYUHoOduejul8WjtNu+APStoiO6W/eqOcgbhH17bxkwtiYb9UzklUqqokOOXoxegRnFr+4Eov8l0U06zUPcwyabAKaiMeoqZPP6hGHJYkl0CXJPkQonhVAgutBeTtsCQ+/hJYnM56LEs6GXMwDUa6wr69tSYoR9UX3kil808y3oF0BvWwZMP6I1uffTjvJcvAFWcPLjHwU8xOgUH/doaOBLBKLDEoh+LvlgrWvtM+XXfuLhJWb9w0Gnf7chM6vqTRmD6btmucAPzv892Qpazxb45zXLM6jnY7mX4mlY5PfWLykXR3cw3DXLXb2UkQtM3H+iI6aLqUK8uP75wagJzMvaWTAt27aXWAETKsmnQHb1cMfZelYEoLmX+JeJZWFrFWz/xisNrCHf9qXRjW9Rex1rte+mbfFurKMfLViSaO47yzXu6Dju7D4JEfM0pedZFDDqwrtxQiebipMRDVaf7CGj4Qwd4ENDwgaovhQYmUQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(55112099003)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2Z6STNob1dLQ0lRNGp3Q3ArM3FnbkJGeTV3V0JBelRlYjBrNzVhLzFsWVYx?=
 =?utf-8?B?ZWhjaU11Z2ZWWWIxYkVjaDA0WEVHOGlkRkRTT0pBdWJYUmVOTnRnWWFjYndS?=
 =?utf-8?B?RVgvOWc2bTl6QnplRFRLcDRSSHo5c3I2M0RCcnJZOEhqVlVHNjNYaHlPa1kx?=
 =?utf-8?B?cVJhVnJFZWdla2lxa0U0bVlyT2FrZFl6bTZCRlVScVNWTTZyZ0xUcDg2cmUv?=
 =?utf-8?B?SG5pWXNYdnl6MTZJTis5cFJhTDE0V2MwdmRUaExQdHJ5YVZDeWYzcVZnSTdR?=
 =?utf-8?B?VUVnZnp4L0RpSWlZQzArVklvU3p6MThjZkY5ZHo5SnczajV3NjF3SUk5RXQ5?=
 =?utf-8?B?Q0VuKzA4Um9LSFZuUzcrVDRJVFpSNVlUMWt5NzhKUmlUa0JhWUZ4enNGRUdw?=
 =?utf-8?B?N1NsMVl3RllQOXo1cEpEZ01haHdaSnd0OEltUDN1cHBTMHVNc3RrUno3ZzJn?=
 =?utf-8?B?cHhhUFUxcnA3Qk9OT2VSNlMvMTVLTHNEekNZSHlwQVRVc0ZwanF2eWtubVcy?=
 =?utf-8?B?SFMyZkQ4dGxYb3AzYzRmVkQ0VGttMjFKUmgxNi83TERBWHFxOFVXRC8ycDVm?=
 =?utf-8?B?RGZKQXhTRE5nOXBpdytQRGMrUDJYLzlkUE5OcVgxSWZ6ekx2aDl2VkNzeEJ4?=
 =?utf-8?B?WFArSVQ2WXNpNjRyQ3VtM004UThBaHlPbDlwYzlOZEhUaEhqRTArcVluNmh3?=
 =?utf-8?B?Y09lTUlKWEhRUWRMZlQ0M1EzeTRYZDJyaVpUdlk1QzZlOGtlV09NOGRUQVFn?=
 =?utf-8?B?dWhXbWxITTNDYWlLU28rcFNaSzk0U2w0ZW5TZjY1RmhJL25QWDdxWmwyamVl?=
 =?utf-8?B?YXZhdGN4N2RVY0JtL3BaU3dxMVhhMUxYMkhUWGpwdldqMlJGbHFYaGRJeXpD?=
 =?utf-8?B?VURQS1RJMkJCVlp2RjREM2xFNVlQbHFibWorSlplcEwrQmJOMlEvWC9KbTVh?=
 =?utf-8?B?M29lV0p4NzVrcVdzS1UvRzcwNjF3U1dMZzJGcWZ1U0JPclRvTmliRFQxdEpR?=
 =?utf-8?B?MUlHSUppUXVMSzFFNUhraUQ2NUxqYzVqUzdsMEFEQ3FXSUFyV2czZjdaa25B?=
 =?utf-8?B?dHN3NXVaZm5PaThTV2IrRkxnQWIrQjNUOVZpL3FsVjRiTWZMTmRVbExCQTdU?=
 =?utf-8?B?ZEppcnhjVUZQb20xeU52VWsrWk8wUEVSTnp2dENTZElMczBTQm9hN08zZHBW?=
 =?utf-8?B?Z2FoaFZ6ekpPdzN6UTREdlQwRkZndWRwRzNVOW5JREdBbmNsVGZQOVpFMldY?=
 =?utf-8?B?RDVrbFF2SWlSUzVtcG5Cd01OZjFKSGJQUTZ0SHBSWHJTdG1kb3JjUG5qVDdP?=
 =?utf-8?B?aGhnQkIwRmZQTEZhSmJXUnJjMVBCNTI3b1U2MkxTTFZFTXV2QzM2YVFKeFBh?=
 =?utf-8?B?OW1DanBGeGRQaVYrWFB1dlVJQ240MXlFSXE2NDBUaWVsTTZUMDlmbG9GNFU1?=
 =?utf-8?B?Q0FPOCtuc1lET0FBd0w4MjRTMktZZ2hHSlhhVGtGNm55c09aNDZIRkFWdXVX?=
 =?utf-8?B?ME5qNjJGVVdlMGRMTTdvU3htbHNJNFhDOUMxTXA3TnlJZlRER1piRWg3RDdj?=
 =?utf-8?B?c2p1QUozVjhrdFlxdjgyRTlUN3AwZ0dwb0E1YkVmOU0yb0ZVZFN4NHZCZWl5?=
 =?utf-8?B?MU85MkVnNlFwWTdlQWRiZUg2YkowaUdOUVlVMEhXaFJvakJOajZPWEU5T3pI?=
 =?utf-8?B?U2VNQ2FtNUxEUUxaL0xkbkswRzFvY2tpZFBUakZPWTMxYVpNU1FkRDY4K0R6?=
 =?utf-8?B?Sk05aUkvUWdkQTZVVnZObnM5SzhRTzlxWUZWaDEvVDVLU2lyNXNnL0lIbEUz?=
 =?utf-8?B?cVpXVVJEMVI5Uk5Dd1pyUmdId0pUZ3gvRk1HT29iZ2x1ZUI3SU81cEp1NFFz?=
 =?utf-8?B?MWI2MzFhNVB6alh4Z1VNM2hncE9qS0VCUzh1ekp6Y2ZrakFNSWQ3RXlZeGE3?=
 =?utf-8?B?UnJzNHdLdWgxbU50WkMrRzV4VlVjdElBbTZ2bnhWVTRPb3ZmVnEwTzVJM25o?=
 =?utf-8?B?cDZnY1BEdmhGbE1TMGtMNjE4cDYvN1YvSTdJTjVJRWl3Z2ljUnBlVnlXTmR5?=
 =?utf-8?B?Y0hOZ0hmd2lVTWU5dW04OW1FY1p3a0ZnN0IxQU9rWlpLYWtpd0lKM3p2MWt0?=
 =?utf-8?B?QVgrdXMvcWt4Rks1UWlNWEtqd0JZa2RlVVhWMWZRK0VCNjg5bDd0OHorUVpk?=
 =?utf-8?B?YkZKdmZNZk9KVTA4TjhXS1FJekhLekdiQzV3bHdUQjVHb0tuay8xNlJQVFlF?=
 =?utf-8?B?Q3NXRm5JTnI0WDNianozZTdjSnA0MmFuNXZJU2g0OTVpQWJGWHJvRHF2YnB2?=
 =?utf-8?B?L1V5SjYxOWFCZ0pFQS92anJiUFNYZEx1T3ZMLy9kSnBGL2k0Vk9FRC9QWkNl?=
 =?utf-8?Q?PAHbcLnJonXB8oz4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B1C45125E74FE41A6A3679AC19478BD@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 836e568a-ba6a-4a80-f9e1-08decb77500b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 07:17:23.7413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpqHYUySnvKqWTNkXrAG6SLKCKGPbs1Z/G3e7wmUAMlCXe2KkgSGiPE+gafKwC8t6qEwX941tf9R/mZYPodDsmma+gOc4/t0Sj3GIzK85Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8660
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8616-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:afd@ti.com,m:jingoohan1@gmail.com,m:linux-fbdev@vger.kernel.org,m:pavel@kernel.org,m:lee@kernel.org,m:dri-devel@lists.freedesktop.org,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:danielt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,lists.freedesktop.org,gmx.de];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,siemens.com:dkim,siemens.com:mid,siemens.com:url,siemens.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A57968CCE8

SGkgQW5kcmV3IQ0KDQpPbiBNb24sIDIwMjYtMDYtMTUgYXQgMTQ6NTEgLTA1MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gPiBNb3ZlIHRoZSBUSSBMUDg4NjQvTFA4ODY2IGRyaXZlciBmcm9tIGRy
aXZlcnMvbGVkcy8gdG8NCj4gPiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC8NCj4gDQo+IFdoeSBt
b3ZlIGl0PyBZb3UgY2FuIHJlZ2lzdGVyIGEgYmFja2xpZ2h0IGRldmljZSBmcm9tIGFueSBkaXJl
Y3RvcnkuDQoNCkknbSBwZXJzb25hbGx5IGZpbmUgd2l0aCB0aGUgZHJpdmVyIHJlc2lkaW5nIGlu
IGRyaXZlcnMvbGVkcywgaXQncw0KanVzdCB0aGF0IGN1cnJlbnRseSB0aGVyZSBhcmUgbm8gY29t
YmluZWQgZHJpdmVycyB0aGVyZSwgdGhlIGNvbWJpbmVkDQpkcml2ZXJzIHByb3ZpZGluZyBib3Ro
IGludGVyZmFjZXMgb25seSBsaXZlIGluIHZpZGVvL2JhY2tsaWdodC4NCg0KQnV0IGlmIGl0J3Mg
T0sgZnJvbSB0aGUgbWFpbnRhaW5lcnMnIHBlcnNwZWN0aXZlLCBpdCB3aWxsIGJlIGV2ZW4NCm1v
cmUgY29uc2lzdGVudCByZWdhcmRpbmcgS2NvbmZpZyBzeW1ib2wuDQoNCj4gPiBhbmQgY29udmVy
dCBpdCB0byByZWdpc3RlciBhIGJhY2tsaWdodCBjbGFzcw0KPiA+IGRldmljZSBhcyBpdHMgcHJp
bWFyeSBpbnRlcmZhY2UuDQo+ID4gDQo+IA0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJwcmltYXJ5
Ij8gWW91IHNob3VsZCBiZSBhYmxlIHRvIHJlZ2lzdGVyIHdpdGgNCj4gYm90aCBmcmFtZXdvcmtz
IGFuZCBoYXZlIHRoZSBkcml2ZXIgaW50ZXJvcCBiZXR3ZWVuIGFzIG5lZWRlZC4NCg0KV2VsbCwg
SSBvbmx5IG1lYW50IHRoZSB1c2VyJ3MgKG9yIG15IG93bikgcGVyc3BlY3RpdmUsIHNvcnJ5IGZv
ciBjb25mdXNpb24uDQoNCj4gPiBUaGUgbW90aXZhdGlvbiBpcyBhIHVzZSBjYXNlIG9uIGEgaG90
LXBsdWdnYWJsZSBzZWdtZW50IG9mIGFuIEkyQyBidXMuDQo+ID4gVGhlIGdlbmVyaWMgbGVkLWJh
Y2tsaWdodCBkcml2ZXIgKGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jKSBpcyBhDQo+
ID4gcGxhdGZvcm0gZHJpdmVyIGFuZCBhcyBzdWNoIGluaGVyZW50bHkgbm9uLWhvdHBsdWdnYWJs
ZS4NCj4gDQo+IFRoYXQgaXNuJ3Qgc3RyaWN0bHkgdHJ1ZSwgdGhlcmUgaXMgcGxhdGZvcm1fZGV2
aWNlX3tkZWwsdW5yZWdpc3Rlcn0oKSwgc28NCj4gd2hhdGV2ZXIgeW91ciBtZWNoYW5pc20gZm9y
IHJlbW92aW5nIHRoZSBJMkMgZGV2aWNlIHdvdWxkIGJlLCB0aGUgc2FtZQ0KPiBjb3VsZCBiZSBk
b25lIHRvIHRoZSBsZWRfYmwgZGV2aWNlIGJlZm9yZSB0aGVuIHJlbW92aW5nIHRoZSBJMkMgZGV2
aWNlLg0KDQpsZWRfYmwgaXMgbm90IHJlYWxseSBkZXNpZ25lZCB0byBhY3Qgb24gZHluYW1pY2Fs
bHkgaW5zdGFudGlhdGVkIGRldmljZXMsDQppdCdzIHZlcnkgbXVjaCBkZXZpY2UtdHJlZSBhZmZp
bmUgKG9mX2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzKCksIGV0Yy4uLikNCg0KPiBXZSBkb24ndCB3
YW50IHRvIGhhdmUgdG8gbW92ZSBldmVyeSBMRUQgZHJpdmVyIHRoYXQgY291bGQgcG9zc2libHkN
Cj4gYmUgdXNlZCBhcyBhIGJhY2tsaWdodCB0byB0aGUgYmFja2xpZ2h0IGZyYW1ld29yaywgdGhl
IGxlZF9ibC5jDQo+IGhhbmRsZXMgYWRhcHRpbmcgTEVELT5iYWNrbGlnaHQgYXMgbmVlZGVkLiBT
byB3aGF0IHlvdSByZWFsbHkgbmVlZA0KPiBoZXJlIGlzIHRvIGRlLWNvdXBsZSBsZWRfYmwuYyBm
cm9tIERUIHNvIGl0IGNhbiBiZXR0ZXIgaGFuZGxlIGR5bmFtaWMNCj4gYWRkL3JlbW92ZS4gVGhl
biB0aGlzIExFRCBkcml2ZXIgc2ltcGx5IGNvdWxkIHJlZ2lzdGVyIGEgImxlZC1iYWNrbGlnaHQi
DQo+IHBsYXRmb3JtIGRyaXZlciB0byBoYW5kbGUgdGhlIGJhY2tsaWdodCBpbnRlcmZhY2UsIGFu
ZCByZW1vdmUgdGhlDQo+IGJhY2tsaWdodCBkZXZpY2Ugd2hlbiBpdCBpdHNlbGYgKHRoZSBMRUQg
ZGV2aWNlKSBpcyByZW1vdmVkLg0KDQpUaGUgbWVjaGFuaXNtIHdlIGhhdmUgcmVnYXJkaW5nIGhv
dCBwbHVnZ2luZyBjdXJyZW50bHkgaXMganVzdCBJMkMgYnJpZGdlLA0Kd2hpY2ggZGUtcmVnaXN0
ZXJzIGFuZCByZWdpc3RlcnMgdGhlIGJyaWRnZWQgYnVzLiBTbyBubyBhZGRpdGlvbmFsIGRyaXZl
cnMNCmFyZSByZXF1aXJlZCwgYXMgbG9uZyBhcyBJMkMgZGV2aWNlcyBhcmUgc2VsZi1jb250YWlu
ZWQgYW5kIG5vdCBnbHVlZCB3aXRoDQpwbGF0Zm9ybSBkZXZpY2VzLg0KDQpTbyBib3R0b20gbGlu
ZSBpcywgSSdkIHByZWZlciB0byBqdXN0IGFkZCB0aGUgYmFja2xpZ2h0IGludGVyZmFjZSB0byB0
aGUNCmV4aXN0aW5nIGRyaXZlciwgbm8gbWF0dGVyIHdoZXJlIGl0IHdvdWxkIGxpdmUgaW4gdGhl
IGZ1dHVyZS4NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVt
ZW5zLmNvbQ0K

