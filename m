Return-Path: <linux-leds+bounces-6820-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFh6FwLIgGl3AgMAu9opvQ
	(envelope-from <linux-leds+bounces-6820-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 16:51:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FCCE707
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 16:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2BD83067581
	for <lists+linux-leds@lfdr.de>; Mon,  2 Feb 2026 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B82376463;
	Mon,  2 Feb 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mJVkWn8P"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020141.outbound.protection.outlook.com [52.101.196.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201783793A5;
	Mon,  2 Feb 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046924; cv=fail; b=GtvHcaFbBCNBeEeZpNuF86VSdlDSOR7czdcrWXuNEg38Psp6x8DCY+8G759iCGQDQOrvw1sHx84xCOtiL9kQQ1RjwWLSumEs0KRsHCAbrDVFnEE6cxnppMlgQGY3PkEmzTGjjNQnCiYWkTqxpCKDVGp31cVy0arJ35cGb0nF8eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046924; c=relaxed/simple;
	bh=BlBx6zAXpkqiMgNAwXlq6i2skNq4nn1fVUfyqov5vbo=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Xp4Ema31JfBtljG7XnZ2aRaXk6WuyA31XyGjrO4PK9ujdytB1CFuf9s5p/k3qUou99odK+G+xAv4o8dy9aUjBpsFGRVrHQWiyeq2b/HI65zm69E0SoMOy4UHWM2VplGSyIw7r0VjEaBySEewdZb8yLxh1cgAR9i8+Cfohccio6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mJVkWn8P; arc=fail smtp.client-ip=52.101.196.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqeE2yaM6WLsOI7mWN1hm1wVA9MY3WEOMTk1s3Yi4Z0/djd9ISuYNJz3q5ETeJRCbeGHyVDM+hfppVwPA8x8NjznYbbCd4g1ksdglNbNiAyblwyFG5J0dJe9W36U23LEgCRdnXRWtrp+wpE0MWn2CASVCeVz5NrL0OKiUsQMBsfdaH1LMnAX5GFcdXuF9BftpbcH9qeV1JIFkyjWrL31y1/jRicoPdGGjCODI5L43pR/22Sc1pHvbk3ueOj4nIeSw09RcmsDrJJF09q6H3Fke71upJlWC1PotsqadB4cwHycfX1XFVQBgb9DTV/BWpgIbjktfHcoUcIQEqchQ70+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbAB8VIvXtoO+6nlgAzU6J/E5YeUm2+h/qdmsMsGsAY=;
 b=xaAG1apEDuWQJw0GilB/VpB8/7SegKIDkqvUd6i1PWoK7wUJ4IvwsuTAb4/LDHu9xG4qQo6Sk4bsbyCRPmRUWVW4BJGM4ipxMldB4PPekuMnX5VYL+K9HWu4A2g02U2N5OIwpPt8Z7S2w0vm/Q5LQz/e1rRUMB6GKsalXdWBZshZbqDyWSbTAcPaU2rH/VcMqGF0kYcd44l6yd8LB8PoYMCINiHtjnYQ7emOGSjOE9m3lJCSEVFP0GhAab8X6KgKZT23UE5yYHwPPpt8wfuQhXZPG8WlijMQTGnvBimQ5y6HXM/CHDtaNtGew6C/WKcqlIIEZWHHw32/tGKixMNUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbAB8VIvXtoO+6nlgAzU6J/E5YeUm2+h/qdmsMsGsAY=;
 b=mJVkWn8P4oWRSVw7OCsPNuv164Amaz0obZ7tf6FTmPH4QELYgqX+0vQZrW+WfGAdveeIcAKEe4UJyyoHaYQ8xiXA9D4tctMWTgsQ27pKJA/IMDNu99iIvLFZUfG8i+o5SsUF1zlk3ZuANImcaqKrvTw0CuvBCU3XyDbe2nKmAhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1942.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:41:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:41:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 15:41:56 +0000
Message-Id: <DG4L9K0RYU1R.38F7D0ZY2YL3J@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Markus Probst" <markus.probst@posteo.de>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Leon Romanovsky" <leon@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v11 1/3] rust: leds: add basic led classdev abstractions
X-Mailer: aerc 0.21.0
References: <20260202-rust_leds-v11-0-585d1c8be20c@posteo.de>
 <20260202-rust_leds-v11-1-585d1c8be20c@posteo.de>
In-Reply-To: <20260202-rust_leds-v11-1-585d1c8be20c@posteo.de>
X-ClientProxiedBy: LNXP265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1942:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8689ef-2aaf-4ebe-430f-08de6271995e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Szk2YkNOc2JFUUFIMi9ydEs4cElURysvVVU1Nm8yUDlRMU9OWWFZNm54aXU2?=
 =?utf-8?B?dDNIdklucjJmSTRnSUNnT2IvdVcwWUlMdWNBS09hYThPdkY4UWRtV0NZVlc0?=
 =?utf-8?B?Q2tISi9PSGppN2hJN3dCRUpQUW9KTFltZnFnMC9vWHhmdk1QeFYrRlBTcGIx?=
 =?utf-8?B?TjZWcG5OOFRRRDBYZW5qV2xCOW84RnhJekFBUHBNajQxbS9LclhEVy9IK1BO?=
 =?utf-8?B?a2N4Ny83TFhROXZySnlNQzlXQmhkYms5RU03NXdvWDlTcFpSUTNzaEcxOS9p?=
 =?utf-8?B?cFBpdTdBeE1CTXRzVUFsZERWME9oWFhPRWJrNmpaaGFhNjViUTN1TThDS3ZN?=
 =?utf-8?B?dTY1ZGJ1RTBtdjEzU1U2WkhWa2RpSEM0K1liZWI3dTRKVEYvUGdUbFJxZTRv?=
 =?utf-8?B?UW5zUWFyOXIrOWIyR0pMS20yZDlpL2JYQnBndlo1aG5wbWRXK3h5eHVkcFFC?=
 =?utf-8?B?a0dmSW1LQ2tPTkszRmVXbllVOFFKWk5TTlF1Z3pPWGhWb3ZnKzN0Rlp6U1ND?=
 =?utf-8?B?ME1HS01ZZTF3c1lFemR3K1NKVFQrNTlrbW1HNGZwVTg5Sy9uMEpjMFJFcUQ0?=
 =?utf-8?B?enhLQ2ZHRXVzN2pYNWdWeDVneHNqcVdyM1pMMVRmejlhK2kyaGx0enpydGNY?=
 =?utf-8?B?anFWWjJkYmdxdlpRc29GS3ludlRWdHJxRmordCswaVdPWXNZTGZlZXZTVHZ0?=
 =?utf-8?B?N3IwZjRIY0kwYkRBY2VrR0t0VEpOTUhKdlN2dDBEQU1ZN3dLRG84VkxEK05n?=
 =?utf-8?B?MkdzZkg0R1FTUVJ1bFpQcEFNdlJtY0FRSWM0ZCtTeEU3Y1JjdUMwbFVDSm1J?=
 =?utf-8?B?QnFkc2FxbW1HaC9RSTlHaHVHa0xUWnQ0U0FPSU9XYTJKMkdIV0FCR3F1SVEy?=
 =?utf-8?B?R2t2a1E3Y0FpUkdaMEVYUlJYYlE1ekJjWTA4S3QvQ1ZOM3BvaW5ZMStxZUsv?=
 =?utf-8?B?L3M3andUNWVWOG8wbW1kajV5TkQrc05FTFZueWR3ancrTkFLNUxzQldLTEVh?=
 =?utf-8?B?OTNhT0F1dWJkN3FvQ2xMMm0vdjEydlpmVTQ0ZDU5M0MwZzV3azJjWUEyYW1P?=
 =?utf-8?B?TGRWNGhZWitndW12eUVPeGJGdEl2Mis0aDRXU1ZKTnpkaGpFTm80WnF3UVVj?=
 =?utf-8?B?QjNVd3A1VW1EbG5ReGd3M1lpbkZzbUphOStJVkE0SHR1R2xVTFp1ZEF5UlZ4?=
 =?utf-8?B?bXJPK3p0UnVSZGhreGNZL3hkZUN0TG5QZ3QrL2pncUQxZnFSeEw1THJPK2hC?=
 =?utf-8?B?a3M2dW1rcVhQc1Y2UEtISWY0RHo5QjFvWExKOVhFZ0xHZ3FRdHl1MjFPQ2tr?=
 =?utf-8?B?NHNDNjVDRU5JbVZmZEdNb2NndVdNeGpJeU42V2pBbW4zdzNQQmJuUTdUR25N?=
 =?utf-8?B?YkVJL3JNeklPc2RuaFQ2L3YxTkw0eXVkN28zTlZaK29XN2llcnZyamJHeHV6?=
 =?utf-8?B?RzJVbzlKQnJ0Sis1VEZvU0dZOEhxVlBReGJDM2VqRlB1dUJuRWdoSEtOZk1u?=
 =?utf-8?B?Ynl6TzZteUpJVDhWVXdaV0IxeHdRNk5zeHdOZG1hSGFNOWluMGhQK2FraXY5?=
 =?utf-8?B?SFRQVUwwTjBxdGVpVVZQdEZ6UURhTlJCY2V6MzdBMjlKRVpRSFRlbHZnMVlx?=
 =?utf-8?B?ZCtUVWJiQm0zQktKTEFYK1JYMlcrREk3S3lweVZUODJYZTRXZG9XNGk5Y3Jn?=
 =?utf-8?B?WDJNUnBzcmhsZUVWQXdpaEhvMVArWDlaTlRVL0JzNnlUNytXMTluVy9FVDR1?=
 =?utf-8?B?R0tMbHZTYjdxdFhmK3ZDL0UrdEhqY3g0TGZMc2MxWDNWbCtyTnRpdWxQY3Js?=
 =?utf-8?B?Q2hXNFZLZjdJOTB1eDZtV0c1eThxNzdEYS91S3hiekJRNkE2OGgxYXdySWw2?=
 =?utf-8?B?ZnQ0YVRiakgvNnlpOHlDaGFVSGY5WlkwalF3VnhSSkx3UXB2MkVtYmFKQzZa?=
 =?utf-8?B?L1k5cHBuUVFkNzdlLzlMclFxd3ZyTGxjM2lJOTRLSlVzanZNcUZCR0k0UnB0?=
 =?utf-8?B?SXBPMEZZZlF4Y2M4RFE1eSsxM3VUY1h2YTNDNmhGM2lMaWVodTZHYThMNTZU?=
 =?utf-8?B?OTMrc3lHNS9zanFVV3p2cHAxYjU0Qk1qcEVnSWZjQlhoVnBFRENJY3pBWkYz?=
 =?utf-8?B?Z241NXlyb0hyOGlzaUxKc2FuT041S0trbTN2bjg0K1FLTXY3U29MN3JnaTlK?=
 =?utf-8?B?cXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENMK284eER2VGoxeWIrVXU4Qit3a2dOSlE0UnNma1M0clpIcE5wdlB1QUQx?=
 =?utf-8?B?QUR1T1FBWXVBM2R0RzFWa3BZWm4yQkIzRTdnTjNsTGp5YjUzOFBOUWVsZS9z?=
 =?utf-8?B?WU5wbFBIY0NwbkFwa0ZuWGNiUks1djRyOEpWZWg4NlhnbXdsdUtRU1lGaVFw?=
 =?utf-8?B?YXZIVnRKNW5NeDBONXN3WlU1Yk9ZVEFUbVdIcG9vTGlGd3hBUDlhT1NyemRs?=
 =?utf-8?B?Q2VzYzlxYTQ2OHNWRGV5V2diQ1hBMU9oM1NUT1dKSkgrYk9xcTFiRVRUaE5F?=
 =?utf-8?B?cTR5SDdncUFMdXVGZGtUcWhiSkhQR0c0TFBtTnNYVlhGL29oc1FkSmZYNXJY?=
 =?utf-8?B?TnNOVzNMNkVDS0JEUXFFL3hGSzBVMy9OQzg4MVR5NEJhU3JVY1E3cnhEdmZ6?=
 =?utf-8?B?QWorQTZRTU9SSXlicGRGc1VDS1ZBUzZHMkxia010dlNUa0xzaEFObDFSeFMz?=
 =?utf-8?B?S05oQlU1bmhoNElQaHJHMWJucDQxRUV4R1dBUWZvQzU3bzhXcDdXOGo0R2NC?=
 =?utf-8?B?VlBIWnp6ZCtwQWJpNlFxWU1rRHdzVVphZzluVnhqU3BNUE5SY2cwcVdlc0Rk?=
 =?utf-8?B?ejJFZ29PTkRNaDQyRFNyb3RUQUZZbXpjaExIcm55QWUyQk05dHFSWHpLQnNP?=
 =?utf-8?B?RUNWWHIzQ1J0MEFieU5pbzdMd3lieTZZSldIZkRqQUErcVVvR04xUWl3TnN6?=
 =?utf-8?B?WHhhejJidTd5MTBwNkFDM2JXOXdLdFNiNDkxeUdFMDBvVHF5eHl5YVRUbEtK?=
 =?utf-8?B?aTM0bDF0enJEMGZYQnVrc3lVblEyc3pJUnJXczBBZFhSVnhNQXFYbmJmL3lk?=
 =?utf-8?B?c3BJTDljYStTcjVhT3kxc1BsVWJGVTA5RFg2T0RtRVVYODJ5UkU0SmNKdVB5?=
 =?utf-8?B?OXlQdlNsOUdRUkw1VXh2WlpkMkpvWFJRa2dHWjFtSzJOV25DcUxhSS91Wmly?=
 =?utf-8?B?S2pmQ1VYbVJjWWd6Y2xwZjFrcXpSUndhQ1pUV1l6SnRRdzRMZ0lwWDdHbUk2?=
 =?utf-8?B?YjNwSXNBZ3E2WmxqSGdSZUt0RUZVejdNaGV1b0Q0bnZLUGJEK1hoNk55YktT?=
 =?utf-8?B?MkNkTFIwNUVGMVdaMndBWkt1SjlNb3grdEN1S3FrUGd0OUtxcTZTRnNPNEVp?=
 =?utf-8?B?UFRHWGk1cisySyt0QlZwZE9aeE5xbFg5dUxIdmNsMGdFcXlZMFladTZuZTNP?=
 =?utf-8?B?M1l1R0pFQlMvMitEdkJTZUREYzE2TEsyUDEycmxsR3NpTlJTeVBPU2xINUh5?=
 =?utf-8?B?cGVESXBUU1h2cDhJRGlYZGdFYUpoc2pOaUJNUW9hdDBGL2lGbUdMcHpITlRm?=
 =?utf-8?B?U2NqaVVjbjJianpMWWU4KzV3UUhqYTFsODhWaHJkOFhvanpOWDlzNlpjUzJ6?=
 =?utf-8?B?UXJ5bTlmSmFaSlJVckVzOUYrUllOcENSNjN1R3VnUFg4aG00bnRzQjUxaHN0?=
 =?utf-8?B?K0ZHWnNuTThQVCtwVnRVWUlmT0wrcCtJc2djMVRHckg3dkJSejNScldSdEpp?=
 =?utf-8?B?UFFrMW82Yy9YdHMrbTVZQTladUp6M0tuUjAwSy85S29aMUJLZ0JhYXNFZE96?=
 =?utf-8?B?VVBHT3h6czhvVmJrZURhRURHQ0gzb0I4cEZ0U2pFdTlIZXpVOVV6VHhQWWI3?=
 =?utf-8?B?aW5RUlhEeFdCZk9PdGlWOG95QW1ZekJKR3RKMWJXRGhkaVlKeVBtQXlTYi81?=
 =?utf-8?B?RGpiSnNRSi9wUTlrVUZDKzVYZ3lXR2hxUE05dVc0ODl1aXdCMENFeFNPdTZH?=
 =?utf-8?B?Qm83RTRrSUdxMll5T0hMaVl4S2NEdXY0OTlmKzI3RHZqcVQvSm9ENldjbHRt?=
 =?utf-8?B?L0pJY1BIU3Q3bURhd0htZm1EbnZEdW1GVEZtUk1RdGpmTFJFVVZNcjFFZXEy?=
 =?utf-8?B?NUt1UXZEak5WMlY5cnZobjNtbElQYXlXNXFNUzhubE4wWC9BZHlzZC9ZbzRw?=
 =?utf-8?B?WE5CUkFHc0xkQ0VwZWt1RFAxeHV6T2s1WkhyanlEQ2FxMkM4SkxaRXJYYXVQ?=
 =?utf-8?B?WDJlaDZENUJTQWZSV1R0QXlLdnV3a1l3Nm5oSm12dHpUbVRpV0JZbElFbDNi?=
 =?utf-8?B?d1NLKyt4WDVWNGxjZ1VvV0VIUmZ4YWFOemphY3I4N3BmM2JIMnNTMkRsOWRa?=
 =?utf-8?B?YXlhNnZIenBWT29TT2pRSmRqd0JUcE5BeTVCUks5SjlqcXZyKzNCRWtaakx6?=
 =?utf-8?B?Um8rSkVINnhnSjc0MDlha2dXRXlhclo5U0IySks4U3ZqbThwYUR4dXpKbXNR?=
 =?utf-8?B?ekJ1d2tNTElYUGFra1dTTTlsYlROYVdNSW8yM0VZcm9KRVc3ZFZVdUNtWjFt?=
 =?utf-8?B?RSt5Vzg5VjBlUUR6U2d3cHh2QndIQTB6VEoxREpVMkhIM3J3SURZdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8689ef-2aaf-4ebe-430f-08de6271995e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:41:58.0166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBTHImaOgzmvA2mEL3K8acyAQR+hwNwQB176dd11bqAjVDNHyFL0mfc//dRxtO19PpJ7MfE5X4i6kYzNLBXD6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1942
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6820-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[posteo.de,kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,garyguo.net:mid,garyguo.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C12FCCE707
X-Rspamd-Action: no action

On Mon Feb 2, 2026 at 1:52 PM GMT, Markus Probst wrote:
> Implement the core abstractions needed for led class devices, including:
>
> * `led::LedOps` - the trait for handling leds, including
>   `brightness_set`, `brightness_get` and `blink_set`
>
> * `led::InitData` - data set for the led class device
>
> * `led::Device` - a safe wrapper around `led_classdev`
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  MAINTAINERS        |   7 +
>  rust/kernel/led.rs | 453 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/lib.rs |   1 +
>  3 files changed, 461 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0efa8cc6775b..26765fecb9a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14279,6 +14279,13 @@ F:	drivers/leds/
>  F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
> =20
> +LED SUBSYSTEM [RUST]
> +M:	Markus Probst <markus.probst@posteo.de>
> +L:	linux-leds@vger.kernel.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/led.rs
> +
>  LEGO MINDSTORMS EV3
>  R:	David Lechner <david@lechnology.com>
>  S:	Maintained
> diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> new file mode 100644
> index 000000000000..9acb6946f3da
> --- /dev/null
> +++ b/rust/kernel/led.rs
> @@ -0,0 +1,453 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the leds driver model.
> +//!
> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> +
> +use core::{
> +    marker::PhantomData,
> +    mem::transmute,
> +    ptr::NonNull, //
> +};
> +
> +use crate::{
> +    container_of,
> +    device::{
> +        self,
> +        property::FwNode,
> +        AsBusDevice,
> +        Bound, //
> +    },
> +    devres::Devres,
> +    error::{
> +        from_result,
> +        to_result,
> +        VTABLE_DEFAULT_ERROR, //
> +    },
> +    macros::vtable,
> +    prelude::*,
> +    str::CStrExt,
> +    types::{
> +        ARef,
> +        Opaque, //
> +    }, //
> +};
> +
> +/// The led class device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct led_c=
lassdev`.
> +#[pin_data(PinnedDrop)]
> +pub struct Device<T: LedOps> {
> +    #[pin]
> +    ops: T,
> +    #[pin]
> +    classdev: Opaque<bindings::led_classdev>,
> +}
> +
> +/// The led init data representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct led_i=
nit_data` with additional
> +/// fields from `struct led_classdev`.
> +#[derive(Default)]
> +pub struct InitData<'a> {
> +    fwnode: Option<ARef<FwNode>>,
> +    devicename: Option<&'a CStr>,
> +    devname_mandatory: bool,
> +    initial_brightness: u32,
> +    default_trigger: Option<&'a CStr>,
> +    color: Color,
> +}

It appears to me that while this reflects on the C API, on the Rust side th=
is is
more commonly known as the builder pattern.

I think this should properly be name `led::DeviceBuilder`, as it does more =
than
what `led_init_data` does on the C side (e.g. initial_brightness).

Perhaps the device creation can be part of this too, e.g.

    LedDeviceBuilder::new()
        .fwnode(...)
        .devicename(...)
        .initial_brightness(...)
        .build(parent, ops)

?


> +
> +impl InitData<'static> {
> +    /// Creates a new [`InitData`].
> +    pub fn new() -> Self {
> +        Self::default()
> +    }
> +}
> +
> +impl<'a> InitData<'a> {
> +    /// Sets the firmware node.
> +    pub fn fwnode(self, fwnode: Option<ARef<FwNode>>) -> Self {
> +        Self { fwnode, ..self }
> +    }
> +
> +    /// Sets the device name.
> +    pub fn devicename(self, devicename: &'a CStr) -> Self {
> +        Self {
> +            devicename: Some(devicename),
> +            ..self
> +        }
> +    }
> +
> +    /// Sets if a device name is mandatory.
> +    pub fn devicename_mandatory(self, mandatory: bool) -> Self {
> +        Self {
> +            devname_mandatory: mandatory,
> +            ..self
> +        }
> +    }
> +
> +    /// Sets the initial brightness value for the led.
> +    ///
> +    /// The default brightness is 0.
> +    /// If [`LedOps::brightness_get`] is implemented, this value will be=
 ignored.
> +    pub fn initial_brightness(self, brightness: u32) -> Self {
> +        Self {
> +            initial_brightness: brightness,
> +            ..self
> +        }
> +    }
> +
> +    /// Set the default led trigger.
> +    ///
> +    /// This value can be overwritten by the "linux,default-trigger" fwn=
ode property.
> +    pub fn default_trigger(self, trigger: &'a CStr) -> Self {
> +        Self {
> +            default_trigger: Some(trigger),
> +            ..self
> +        }
> +    }
> +
> +    /// Sets the color of the led.
> +    ///
> +    /// This value can be overwritten by the "color" fwnode property.
> +    pub fn color(self, color: Color) -> Self {
> +        Self { color, ..self }
> +    }
> +}
> +
> +/// Trait defining the operations for a LED driver.
> +///
> +/// # Examples
> +/// ```
> +/// use kernel::{
> +///      device,
> +///      devres::Devres,
> +///      led,
> +///      macros::vtable,
> +///      platform,
> +///      prelude::*, //
> +///  };
> +///
> +/// struct MyLedOps;
> +///
> +///
> +/// #[vtable]
> +/// impl led::LedOps for MyLedOps {
> +///     type Bus =3D platform::Device<device::Bound>;
> +///     const BLOCKING: bool =3D false;
> +///     const MAX_BRIGHTNESS: u32 =3D 255;
> +///
> +///     fn brightness_set(
> +///         &self,
> +///         _dev: &platform::Device<device::Bound>,
> +///         _classdev: &led::Device<Self>,
> +///         _brightness: u32
> +///     ) -> Result<()> {
> +///         // Set the brightness for the led here
> +///         Ok(())
> +///     }
> +/// }
> +///
> +/// fn register_my_led(
> +///     parent: &platform::Device<device::Bound>,
> +/// ) -> Result<Pin<KBox<Devres<led::Device<MyLedOps>>>>> {
> +///     KBox::pin_init(led::Device::new(
> +///         parent,
> +///         led::InitData::new(),
> +///         Ok(MyLedOps),
> +///     ), GFP_KERNEL)
> +/// }
> +/// ```
> +/// Led drivers must implement this trait in order to register and handl=
e a [`Device`].
> +#[vtable]
> +pub trait LedOps: Send + 'static + Sized {
> +    /// The bus device required by the implementation.
> +    #[allow(private_bounds)]
> +    type Bus: AsBusDevice<Bound>;
> +    /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_set`=
] must perform the
> +    /// operation immediately. If set false, they must not sleep.
> +    const BLOCKING: bool;
> +    /// The max brightness level.
> +    const MAX_BRIGHTNESS: u32;
> +
> +    /// Sets the brightness level.
> +    ///
> +    /// See also [`LedOps::BLOCKING`].
> +    fn brightness_set(
> +        &self,
> +        dev: &Self::Bus,
> +        classdev: &Device<Self>,
> +        brightness: u32,
> +    ) -> Result<()>;
> +
> +    /// Gets the current brightness level.
> +    fn brightness_get(&self, _dev: &Self::Bus, _classdev: &Device<Self>)=
 -> u32 {
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
> +
> +    /// Activates hardware accelerated blinking.
> +    ///
> +    /// delays are in milliseconds. If both are zero, a sensible default=
 should be chosen.
> +    /// The caller should adjust the timings in that case and if it can'=
t match the values
> +    /// specified exactly. Setting the brightness to 0 will disable the =
hardware accelerated
> +    /// blinking.
> +    ///
> +    /// See also [`LedOps::BLOCKING`].
> +    fn blink_set(
> +        &self,
> +        _dev: &Self::Bus,
> +        _classdev: &Device<Self>,
> +        _delay_on: &mut usize,
> +        _delay_off: &mut usize,
> +    ) -> Result<()> {
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
> +}
> +
> +/// Led colors.
> +#[derive(Copy, Clone, Debug, Default)]
> +#[repr(u32)]
> +#[non_exhaustive]
> +#[expect(
> +    missing_docs,
> +    reason =3D "it shouldn't be necessary to document each color"
> +)]
> +pub enum Color {
> +    #[default]
> +    White =3D bindings::LED_COLOR_ID_WHITE,
> +    Red =3D bindings::LED_COLOR_ID_RED,
> +    Green =3D bindings::LED_COLOR_ID_GREEN,
> +    Blue =3D bindings::LED_COLOR_ID_BLUE,
> +    Amber =3D bindings::LED_COLOR_ID_AMBER,
> +    Violet =3D bindings::LED_COLOR_ID_VIOLET,
> +    Yellow =3D bindings::LED_COLOR_ID_YELLOW,
> +    Ir =3D bindings::LED_COLOR_ID_IR,
> +    Multi =3D bindings::LED_COLOR_ID_MULTI,
> +    Rgb =3D bindings::LED_COLOR_ID_RGB,
> +    Purple =3D bindings::LED_COLOR_ID_PURPLE,
> +    Orange =3D bindings::LED_COLOR_ID_ORANGE,
> +    Pink =3D bindings::LED_COLOR_ID_PINK,
> +    Cyan =3D bindings::LED_COLOR_ID_CYAN,
> +    Lime =3D bindings::LED_COLOR_ID_LIME,
> +}
> +
> +impl TryFrom<u32> for Color {
> +    type Error =3D Error;
> +
> +    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
> +        const _: () =3D {
> +            assert!(bindings::LED_COLOR_ID_MAX =3D=3D 15);
> +        };

`static_assert!()` and move this out from the impl.

> +        if value < bindings::LED_COLOR_ID_MAX {
> +            // SAFETY:
> +            // - `Color` is represented as `u32`
> +            // - the const block above guarantees that no additional col=
or has been added
> +            // - `value` is guaranteed to be in the color id range
> +            Ok(unsafe { transmute::<u32, Color>(value) })
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +}
> +
> +// SAFETY: A `led::Device` can be unregistered from any thread.
> +unsafe impl<T: LedOps + Send> Send for Device<T> {}
> +
> +// SAFETY: `led::Device` can be shared among threads because all methods=
 of `led::Device`
> +// are thread safe.
> +unsafe impl<T: LedOps + Sync> Sync for Device<T> {}
> +
> +impl<T: LedOps> Device<T> {
> +    /// Registers a new led classdev.
> +    ///
> +    /// The [`Device`] will be unregistered on drop.
> +    pub fn new<'a>(
> +        parent: &'a T::Bus,
> +        init_data: InitData<'a>,
> +        ops: impl PinInit<T, Error> + 'a,
> +    ) -> impl PinInit<Devres<Self>, Error> + 'a {
> +        Devres::new(
> +            parent.as_ref(),
> +            try_pin_init!(Self {
> +                ops <- ops,
> +                classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::le=
d_classdev| {
> +                    // SAFETY: `try_ffi_init` guarantees that `ptr` is v=
alid for write.
> +                    // `led_classdev` gets fully initialized in-place by
> +                    // `led_classdev_register_ext` including `mutex` and=
 `list_head`.
> +                    unsafe {
> +                        ptr.write(bindings::led_classdev {
> +                            brightness_set: (!T::BLOCKING)
> +                                .then_some(Adapter::<T>::brightness_set_=
callback),
> +                            brightness_set_blocking: T::BLOCKING
> +                                .then_some(Adapter::<T>::brightness_set_=
blocking_callback),
> +                            brightness_get: T::HAS_BRIGHTNESS_GET
> +                                .then_some(Adapter::<T>::brightness_get_=
callback),
> +                            blink_set: T::HAS_BLINK_SET.then_some(Adapte=
r::<T>::blink_set_callback),
> +                            max_brightness: T::MAX_BRIGHTNESS,
> +                            brightness: init_data.initial_brightness,
> +                            default_trigger: init_data
> +                                .default_trigger
> +                                .map_or(core::ptr::null(), CStrExt::as_c=
har_ptr),
> +                            color: init_data.color as u32,
> +                            ..bindings::led_classdev::default()
> +                        })
> +                    };
> +
> +                    let mut init_data_raw =3D bindings::led_init_data {
> +                        fwnode: init_data
> +                            .fwnode
> +                            .as_ref()
> +                            .map_or(core::ptr::null_mut(), |fwnode| fwno=
de.as_raw()),

This should be `fwnode.into_raw()` which directly takes the ownership for
`ARef`, rather than `as_raw()` and forget the `ARef` later.

Best,
Gary

> +                        default_label: core::ptr::null(),
> +                        devicename: init_data
> +                            .devicename
> +                            .map_or(core::ptr::null(), CStrExt::as_char_=
ptr),
> +                        devname_mandatory: init_data.devname_mandatory,
> +                    };
> +
> +                    // SAFETY:
> +                    // - `parent.as_raw()` is guaranteed to be a pointer=
 to a valid `device`
> +                    //    or a null pointer.
> +                    // - `ptr` is guaranteed to be a pointer to an initi=
alized `led_classdev`.
> +                    to_result(unsafe {
> +                        bindings::led_classdev_register_ext(
> +                            parent.as_ref().as_raw(),
> +                            ptr,
> +                            &raw mut init_data_raw,
> +                        )
> +                    })?;
> +
> +                    core::mem::forget(init_data.fwnode); // keep the ref=
erence count incremented
> +
> +                    Ok::<_, Error>(())
> +                }),
> +            }),
> +        )
> +    }
> +
> +    /// # Safety
> +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded =
within a
> +    /// `led::Device`.
> +    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &'a=
 Self {
> +        // SAFETY: The function's contract guarantees that `led_cdev` po=
ints to a `led_classdev`
> +        // field embedded within a valid `led::Device`. `container_of!` =
can therefore
> +        // safely calculate the address of the containing struct.
> +        unsafe { &*container_of!(Opaque::cast_from(led_cdev), Self, clas=
sdev) }
> +    }
> +
> +    fn parent(&self) -> &device::Device<Bound> {
> +        // SAFETY:
> +        // - `self.classdev.get()` is guaranteed to be a valid pointer t=
o `led_classdev`.
> +        unsafe { device::Device::from_raw((*(*self.classdev.get()).dev).=
parent) }
> +    }
> +}


