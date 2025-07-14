Return-Path: <linux-leds+bounces-5053-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A5B034F7
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 05:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D4A13B7900
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 03:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149251C84AB;
	Mon, 14 Jul 2025 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="PQiEaHvD"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1121A275;
	Mon, 14 Jul 2025 03:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752463962; cv=fail; b=hbHldSioPkoMXGRVNr5Wt8SMdz7QtPZGd6g2I4vl6zX/UP+ZDH5AqhBgeBBjQyfUuRijB77TuZudWgTV+B7EiQhrFYnEt46wb7uvVcjBEMdsuqC6NMUUoT7Slv1nhzs0TaP2X18tC0V27SNlgZblYZ6mXlBxYemm/KuMMYvQdTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752463962; c=relaxed/simple;
	bh=POjdLLqEZEVPuizB53ekLFxZuS+yWgByR1y2+Z4vPAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kWE36efHEBdhMxpXPumg5yYrKlM11EynUL2K1JqkDLpTUDAE6P+f7SVJZA9bRG4WzyOp73krjrrE5L3NF5hLtldFEzv9ZWRUOIqf/OwloloS2fvZpYss0ZargKaf6i1KNSL93RJNV7Uwe6AdRXqKA9utYtytkR2ud+2NDd3N4ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=PQiEaHvD; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY7ccBfaOd7/RIPC8YB/cEOGNzTbEYWPp9HuZmA5xw70i4KagB/pdVaC1kKze+UsT4soB5MldQfPi22b6KGqKH5qkkHZaCx0n4qctkRla6fDao2EM5aG8olsMbd/K7QN8Cp4AnSVsnSB1CsysHiywsUBLN8maXbdIWAJK2vroxOW8yPslHvUoHc82GnOHslDvOqOGcFCYX4FKX1/gaH2KucmqaxW5c6Tk5mJfpQLpj0eQFT+PKZnA1nMgjMg2aPOUkR68vxbKeB/kF13shfYJwnzUwCI2olVCiSqqOxKRhXXrSaxevWutVVqZt0p+XPokWWysi+V9L/2y9MNgVHtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POjdLLqEZEVPuizB53ekLFxZuS+yWgByR1y2+Z4vPAQ=;
 b=gYZN99BYqIb8dBGtB8SsYlmyGxFe6dIMZBiUO2zIOLcmY1RAygBibDUqnbMPz7m4qLvHL7cPhgg1/kohbtLTcdxt28fKOD7oqFvZXzlHxtcUTl7fmwxmRvwRUHojAnhvILEMsA2/7HyM12oyZNHc2xjYL0aN4UGmAG5fO4kZPvZzvBZ4smT+x4vjmL4pON+b0fyr/xvoKVuIYTHYqKEMhM2QbPzK1exQ6oSPKJagHnMM9UzaG9d86PKHs51aQvwS/6cvBMFir8oADIvsILUElW4iLzsGBCoCahkwBzD5sy0Mqu+g7yKU222Ex5054/fHY2Xc5fxPYKpkg871bzzprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POjdLLqEZEVPuizB53ekLFxZuS+yWgByR1y2+Z4vPAQ=;
 b=PQiEaHvDKSgtCSKDBHaJV/DV+KTkchxNZevgwBfLwsedGve34+ixh4QupHiZ/qHM/kT3k6UdXnJPWY2ys0RjvGnOaAzH65h2H8y8I0E73/HhQLTkosBGkZASqazlYluz+xkY2/gfB9cOsqpXSk5vMovZ7h4Z90OpUgaNaw/sxyE=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by AM9PR06MB8161.eurprd06.prod.outlook.com (2603:10a6:20b:3ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 03:32:34 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 03:32:34 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Lee Jones <lee@kernel.org>
CC: "pavel@kernel.org" <pavel@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: RE: [PATCH V3 2/2] leds: pwm: Add optional GPIO enable pin support
Thread-Topic: [PATCH V3 2/2] leds: pwm: Add optional GPIO enable pin support
Thread-Index: AQHb6838XTY341x2o0+HAPD3BPynrbQrJOEAgAXdKmA=
Date: Mon, 14 Jul 2025 03:32:33 +0000
Message-ID:
 <AM9PR06MB7955567B37C06BA7FCB05E22D754A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250703035256.225289-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703035256.225289-2-Qing-wu.Li@leica-geosystems.com.cn>
 <20250710093726.GD1431498@google.com>
In-Reply-To: <20250710093726.GD1431498@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|AM9PR06MB8161:EE_
x-ms-office365-filtering-correlation-id: 5af2946b-3443-40a0-b641-08ddc2871268
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZTQ1L1I0RmJxNXQ1Q0V3b2I0UGxySVZrSVY5WTM3NHlxcld2eFZveUJ2YmJy?=
 =?utf-8?B?ZUtaalZpN3dRQjVLaUlKYVZrdTVlRENsb1FDditTdVJ0UVJGem9Ndnp3Y2dM?=
 =?utf-8?B?ZlV1b1Fod3RqRGYwd2U4Mk5BVXRtbnk1aU95am56NTFCU2JrWlRMZnE4bXRw?=
 =?utf-8?B?dUtjaXRReU01UGxBRVR6cHc2R2thOWZTdEg3ZDN6YTZDNjZyc0RIdjBqcWVC?=
 =?utf-8?B?dng1aDAxaUZYUDBJbnpUNjFCUm1DNWdYNTlnamxkUGVaWnV2NmFvMW9GSk50?=
 =?utf-8?B?ZXdiZXdLRldNMFJVREw4L1F0SFBxUkZUQ3hvRHdkTXJnVjdLZnZkSS9POFZ6?=
 =?utf-8?B?OW9xWVhXdmJmdDVRbWt3TEtaOUdEM0FUMllWTFZYanFsQjA0Y084Z0VEWkNR?=
 =?utf-8?B?ejJ4cXhON2NFeGF2Z1d6Y2tMYWZndENSZUVHeExWOU5OaVNUT0xuTHNhWXcr?=
 =?utf-8?B?RWFpUFFIS0dHZUxjRlNWUUhQZlJpOXcrWVdXc3RMQnJCUVF6Y1NDM0lLai90?=
 =?utf-8?B?b09sQk5GM016ckxUbTVuWmFocGxKU0RVU0UwTEdrZnY2bU9McnhkN0UvRGtj?=
 =?utf-8?B?WHhDaXdlcC9zU0VJQ3NjYXU5UHN4QThwamNUMDNlWVdMQlF2azNaRG51ejZZ?=
 =?utf-8?B?WGh4dzI2cHU3bzNUbmkxb2I1WGRjSllxZkpTa1NvcFhuMzV6YmZDK2ZLOEds?=
 =?utf-8?B?QjUrWW15YklrdUtyd21Zc0xvQzBlTUFjMEZKbXR2azQ0ckxGRnc0TDFrYVRz?=
 =?utf-8?B?aUFlczgrZXFWVW1ZeU9jRnB6dlRKUTR4Y1BQU1l4KzdQczBXd1dBZGZHcUh4?=
 =?utf-8?B?di9DdzExMkRLYjF5enpoOWl5MU50UFdTWEhuS3VDSFNieE1YUnM1ZUdyUGcz?=
 =?utf-8?B?UXQyWU1VbXJrZHk2eGs0UEszbjlncFdqOWhnUkp3VUJ6Ky9sMEY0b1pBUm9o?=
 =?utf-8?B?Ri9WeWhXdThCRndSNVM1bEFsQ1pYK2dHWlJCaUZYbEl2WlR6eDZFMis2Vy91?=
 =?utf-8?B?bEp3UWRCSWk3aTFMb3NnalU1RldXS2ZndnA3a3hmWEpSY3VjbTZSbUY2WlB3?=
 =?utf-8?B?dzBYZnVEU3VaU0pPRWczeDg2Nmc0RytCeVVPcWwzUjdXSFZHcEZsRGQyMnc5?=
 =?utf-8?B?VEt2Q0JpcUVGZGN5TExFVVg5Sk9sM0taTW1WeG44ZldjSXVGTytRL2t4b1Zj?=
 =?utf-8?B?UTBUbWtBQkpzcHJVd1g0elY4YkltRDRkT0k2Z0REMWxSamtXS3RLQTJ6TUh3?=
 =?utf-8?B?MVB3R1RpbnZ2d3pFYnRSOUsxa0g5ZjIzcFUwcmFMdk15cXlvZXZBZEFzK1hh?=
 =?utf-8?B?VENyaWJJQlBBVnovYUdBVUg4OUwyQk12Q1dqd1ZmTGZZUVJRVkUrUlZzWkcv?=
 =?utf-8?B?a2pDZGNkelV5aVRjNW0rNXRLNFhzTExzK05KMno1RDIwMHBtVklrbk9OUnIy?=
 =?utf-8?B?eGNMTnNWb2RiTnJQeEozcSszQU5RS25WM2NUQzk4NlVVUVVMWmFkbWREWHdw?=
 =?utf-8?B?N210RmJBUDVLSXh3WGt1L1VOWWx2N0NBc2dNblBaUFp3cWxmLzc3OHNuSllN?=
 =?utf-8?B?QUpIaGtuK01DQ1FrNmNtY2R3dmVrSURHUDBxQlh1MDRhVEJhQjZGdnNSZWl3?=
 =?utf-8?B?T25JbnFVWm1idUIvdGcyNFo1WElQNUVUVHgwSXBrOEx0S2w2L3ZjVXAyd21M?=
 =?utf-8?B?SDNLREtDUXcyQlJ5N3BoTjU3bDl0T2VtTkRlekwrck1GaThYNlk0dlViTlJw?=
 =?utf-8?B?czU0M2ZpaGV6V1d4N1J1S2VBZEV2dWllSmVuOVlIY3FsYnZQUWRiNENON3c3?=
 =?utf-8?B?QTZFWEplNDNmS3RNano3ZTJEb1FaaURpS3dOMjduazlNNmJHYURJMFlIZDZE?=
 =?utf-8?B?Rm1od0syU0QzVHdINC9BL29IOVgzYytvTzg5T01lVzdJWk0zT25YVGQzeUNm?=
 =?utf-8?B?TTdJZm1ydXdiSTRBaEhORyswUDY0dGFnWnl4empGTUdTR2lYNWlicFVxNGkv?=
 =?utf-8?B?UHoyNlgvMXJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1NtME9JZnhJYWVUcitlb09sRnNNMkZ1b2lkV2pmR3lJK1Yxcmt5N0xDTjZU?=
 =?utf-8?B?bFBaZ21YWWcyWHlOZzg1Y1JGbitPcjYxeHVrWi9KanVRUHBqUW54R1kyeVp3?=
 =?utf-8?B?YmNteWN2R2Q4WUtGVG0zWGlHQ2lsMDF5aXRBam1KRjF1SmtsVks5dEpjTkN5?=
 =?utf-8?B?Q3NDVFd2dVJBMlhETjlvV0MwYmRYUGNxL0x3cjhqMUdhU1VGUlRUaGI2aUVL?=
 =?utf-8?B?d3hVM2xoTE1VaCtnT0dKcWdLZHNJV1JUUWNTT21YRU5oR3h4T1Z0N3d2c0xy?=
 =?utf-8?B?bWI5SUxCWUY3bmk3dXkvbnFVQUIvUHFOWUp3NXJTNFZoT3g1S2VxSldmUUtH?=
 =?utf-8?B?V3NjZXk1V0tXYmwzWVZia0NUU0trS09BNVB1ZnhDSnJVTzE2My9kSWxubU82?=
 =?utf-8?B?QlZJQ1U2bER0WEE3RkRPYXV2SEN2SkMyMGFWV3FaNHpiRldRWGNCOTB6eXNx?=
 =?utf-8?B?Zm5ONUNhUkJVV2JYb0svbkh6YStJYk45dTUrb3hjQkhYWkRzd0tIOEdGS3Bx?=
 =?utf-8?B?VG9QUk9CNHA0Z1k5aXZUTThVempzOWVhM081K2JwWFZ4RnhHZkxuWGY5WnNz?=
 =?utf-8?B?Qy9qT3RKcVJaeGtSbG1sbzlKcTY3bGJ5NGxCYkhzMkFYT01aSUZHc0tIM1pD?=
 =?utf-8?B?Z3UxZnlCZHNEcjM4UDkxZEs3Ym1NWXZMY084cmdOQXVCSUJjRSttVU41THN6?=
 =?utf-8?B?d3ZCREE0Qmc0dHFpZWVCNitNZkdLZEtpYUxnYjBCWFlMNFNBVy9FMnVSTE96?=
 =?utf-8?B?NTBwVnljWkRjaXpTQ2ZmdlkrTDljZDV0ZWdISFpnL3RQTGxGUjFPbXdNcjFY?=
 =?utf-8?B?c2tvNy90N0YydVk0SXN6bE9PNlpOVExEKzc1ekFjVDNjM1U3cFc3alhBS0pP?=
 =?utf-8?B?VVlIRnVvYkJnSEd2UEhaZ01SV2xUM2Y4Y3FVWitYQVlUVEdhdlphbjZHd0NY?=
 =?utf-8?B?SkJlQnZuZERDeG1JekJVb2YyZFp5SHVuMHZHeDdWZEVLSTNVY00zS0IrVVdh?=
 =?utf-8?B?cVIyMENNVEdSdTU1UHNFelI0cFVoSjl4aVByT1VwTkJuMkE2eGFnaml1djc4?=
 =?utf-8?B?TmhNUEhoc3haSEhSZ01rVm41MndwS2ZwTXR6Q1l2dWM2Z25wcnd4VW5qZ3NB?=
 =?utf-8?B?VS9FVEI4VndDdmk2ZEc1UGJxSGNaTnoyWFEzb2ZXOGJ5UmVDZjdyYURJNG1R?=
 =?utf-8?B?d1ViZUEzQWF0T1JuYmZnUjdnUStoMDVsLzFVV1BKY1BZd3Q3R1dTY1B0OSt4?=
 =?utf-8?B?ajZXbkxWdERmUHFmRVJyNHBtNjN1NGVEYzc2NEZYdFpDSjlhb21WcVJxV2Qx?=
 =?utf-8?B?TFBwelBDdlYzVDdsamJOV2JBR0tPdEJDek9vdktlRnhzSWNGMUNuNTROQ1Zp?=
 =?utf-8?B?OWlIVXVxbG5HOXZQaEovMFdEdlVrSGlrR0FjNmFqUzVaMEE2YUNJZXBUVFRZ?=
 =?utf-8?B?YXZuKzZaY3NCK04rWXlQNDlqNjJ0Q0lVV3h1T3ZwVEl5dUFraEt4QTc1RmpM?=
 =?utf-8?B?WlNYbHZaT2RYMDdlQ0phTUcxMFNNSmFkRTBIbVhnbUF1ZFBBQ3lDRm9UNW53?=
 =?utf-8?B?QmMzWGNrVGZjVDNFNnA4SnZRaDJpZmZ1RmdaUXNuY0VKMnc4QlVubGFxOVQ1?=
 =?utf-8?B?dlFxS1BkTURNNjZpSHFkS3g2T2VVcFh0bGlyOWRCRWFmbXI0U2gvTzFmT0d2?=
 =?utf-8?B?dVY5ZDhOQUVnanFvM3BUaStudzg0dzRpcURlWnJldGxNZ0lKN1JiVy9rUDFz?=
 =?utf-8?B?NU1jamRSTVlDUy9GVndzRjN3cXhVaFpyN2JWVGdYd0pDZ04wTHMvVjZDMTMr?=
 =?utf-8?B?Rk04UHJ0enFVVUxqV2ZMM29oWWI1NVJibDZvT3NkZmdUU013R2lET0NHWWVk?=
 =?utf-8?B?Z1NXeHlBZnBoVXh1YmxyeHFoR0xhTXVVa2RXaWJ3bURIenZLZTQ1S3QyeWs4?=
 =?utf-8?B?NXFKbGxhcVhpL09mbnhnNTRnZFFaTEplZENrSTNSRkkzblkrT09RT05STHhh?=
 =?utf-8?B?cXA5WGZJa1A2K3FDdS91emJXd2QyS0swd1o4UjdCQnhCUzNHNWtBVmk3R3l4?=
 =?utf-8?B?SmZvbWFqVE9QaWZ1QUdHcmQ2VGVhbVFvSTZqRFJtZHJpVkFPR2xkaTM1UU5C?=
 =?utf-8?B?eUthWSs4QWNUTTNRbzFDYmFETlF2RmUyWUZGVk95MlNFeXd2K0FjaFAraXg2?=
 =?utf-8?Q?FznxFm8BJGM5rhBKkGyCt64=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7955.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af2946b-3443-40a0-b641-08ddc2871268
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 03:32:34.1290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: enE/889OB8trAejZpDtGw5/wBs4tSh6IGd00X9ts/kWYOCE0BFOnEkLpQIX/Ipv6RAhiV5b1gBeprIzY96kFyVAHq3FRMQxjjOvTCV5xqvw/E3Ta/LV2qr7F1lLaulAK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8161

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExlZSBKb25lcyA8bGVlQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDEwLCAyMDI1IDU6MzcgUE0NCj4gVG86
IExJIFFpbmd3dSA8UWluZy13dS5MaUBsZWljYS1nZW9zeXN0ZW1zLmNvbS5jbj4NCj4gQ2M6IHBh
dmVsQGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBj
b25vcitkdEBrZXJuZWwub3JnOyBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEdFTy1D
SEhFUi1ic3AtZGV2ZWxvcG1lbnQNCj4gPGJzcC1kZXZlbG9wbWVudC5nZW9AbGVpY2EtZ2Vvc3lz
dGVtcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMi8yXSBsZWRzOiBwd206IEFkZCBv
cHRpb25hbCBHUElPIGVuYWJsZSBwaW4gc3VwcG9ydA0KPiANCj4gVGhpcyBlbWFpbCBpcyBub3Qg
ZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1bCB3
aGlsZQ0KPiBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcg
dG8gdGhpcyBlbWFpbC4NCj4gDQo+IA0KPiBPbiBUaHUsIDAzIEp1bCAyMDI1LCBMSSBRaW5nd3Ug
d3JvdGU6DQo+IA0KPiA+IGFkZCBzdXBwb3J0IGZvciBvcHRpb25hbCBHUElPLWJhc2VkIGVuYWJs
ZSBwaW4gY29udHJvbCB0byBQV00gTEVEIGRyaXZlci4NCj4gPiBzb21lIFBXTSBMRUQgY2hpcHMg
aGF2ZSBhIGRlZGljYXRlZCBlbmFibGUgR1BJTy4gVGhpcyBjb21taXQgYWRkcyB0aGUNCj4gPiBz
dXBwb3J0IHRvIHNwZWNpZnkgc3VjaCBHUElPLCBhY3RpdmF0aW5nIHRoZSBwaW4gd2hlbiBMRUQg
YnJpZ2h0bmVzcw0KPiA+IGlzIG5vbi16ZXJvIGFuZCBkZWFjdGl2YXRpbmcgaXQgd2hlbiBvZmYu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMSSBRaW5nd3UgPFFpbmctd3UuTGlAbGVpY2EtZ2Vv
c3lzdGVtcy5jb20uY24+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWRzLXB3bS5jIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gQ291cGxlIG9mIG5pdHMuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2xlZHMvbGVkcy1wd20uYyBiL2RyaXZlcnMvbGVkcy9sZWRzLXB3bS5jIGluZGV4DQo+ID4g
YzczMTM0ZTdiOTUxNC4uMTM5NzE0OTQ2NGIzNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2xl
ZHMvbGVkcy1wd20uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbGVkcy9sZWRzLXB3bS5jDQo+ID4gQEAg
LTE3LDYgKzE3LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvcHdtLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+DQo+ID4NCj4gPiAgc3RydWN0IGxlZF9wd20gew0K
PiA+ICAgICAgIGNvbnN0IGNoYXIgICAgICAqbmFtZTsNCj4gPiBAQCAtMjksNiArMzAsNyBAQCBz
dHJ1Y3QgbGVkX3B3bV9kYXRhIHsNCj4gPiAgICAgICBzdHJ1Y3QgbGVkX2NsYXNzZGV2ICAgICBj
ZGV2Ow0KPiA+ICAgICAgIHN0cnVjdCBwd21fZGV2aWNlICAgICAgICpwd207DQo+ID4gICAgICAg
c3RydWN0IHB3bV9zdGF0ZSAgICAgICAgcHdtc3RhdGU7DQo+ID4gKyAgICAgc3RydWN0IGdwaW9f
ZGVzYyAgICAgICAgKmVuYWJsZV9ncGlvOw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAg
ICAgIGFjdGl2ZV9sb3c7DQo+ID4gIH07DQo+ID4NCj4gPiBAQCAtNTEsNiArNTMsOSBAQCBzdGF0
aWMgaW50IGxlZF9wd21fc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2LA0KPiA+ICAg
ICAgIGlmIChsZWRfZGF0LT5hY3RpdmVfbG93KQ0KPiA+ICAgICAgICAgICAgICAgZHV0eSA9IGxl
ZF9kYXQtPnB3bXN0YXRlLnBlcmlvZCAtIGR1dHk7DQo+ID4NCj4gPiArICAgICBncGlvZF9zZXRf
dmFsdWVfY2Fuc2xlZXAobGVkX2RhdC0+ZW5hYmxlX2dwaW8sDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyaWdodG5lc3MgPT0gTEVEX09GRiA/IDAgOiAxKTsNCj4gDQo+IFB1
dCB0aGlzIG9uIG9uZSBsaW5lLg0KPiANCg0KcHV0dGluZyBpdCBvbiBvbmUgbGluZSB3b3VsZCBy
ZXN1bHQgaW4gODcgY29sdW1ucyBhcyB5b3Ugbm90ZWQuIA0KSSB3YXMgZm9sbG93aW5nIHRoZSA4
MC1jb2x1bW4gZ3VpZGVsaW5lIGZyb20NCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5
bGUucnN0LCB3aGljaCBzdGF0ZXMgIlRoZSBwcmVmZXJyZWQgDQpsaW1pdCBvbiB0aGUgbGVuZ3Ro
IG9mIGEgc2luZ2xlIGxpbmUgaXMgODAgY29sdW1ucy4iDQpBZGRpdGlvbmFsbHksIEkgdXNlZCBj
bGFuZy1mb3JtYXQgdG8gZm9ybWF0IHRoZSBjb2RlLCB3aGljaCBhdXRvbWF0aWNhbGx5IA0Kc3Bs
aXQgdGhpcyBsaW5lIHRvIHN0YXkgd2l0aGluIHRoZSA4MC1jb2x1bW4gbGltaXQuIFRoZSBjdXJy
ZW50IGZvcm1hdHRpbmcgDQpmb2xsb3dzIHRoZSBrZXJuZWwncyAuY2xhbmctZm9ybWF0IGNvbmZp
Z3VyYXRpb24uDQoNCj4gPiArDQo+ID4gICAgICAgbGVkX2RhdC0+cHdtc3RhdGUuZHV0eV9jeWNs
ZSA9IGR1dHk7DQo+ID4gICAgICAgLyoNCj4gPiAgICAgICAgKiBEaXNhYmxpbmcgYSBQV00gZG9l
c24ndCBndWFyYW50ZWUgdGhhdCBpdCBlbWl0cyB0aGUgaW5hY3RpdmUgbGV2ZWwuDQo+ID4gQEAg
LTEzMiw2ICsxMzcsMjMgQEAgc3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdA0KPiBsZWRfcHdtX3ByaXYgKnByaXYsDQo+ID4gICAgICAgICAgICAgICBicmVh
azsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAgICAvKiBDbGFpbSB0aGUgR1BJTyBhcyBBU0lT
IGFuZCBzZXQgdGhlIHZhbHVlDQo+IA0KPiBFeHBsYWluIHdoYXQgQVNJUyBpcyBwbGVhc2UuDQo+
IA0KPiA+ICsgICAgICAqIGxhdGVyIG9uIHRvIGhvbm9yIHRoZSBkaWZmZXJlbnQgZGVmYXVsdCBz
dGF0ZXMNCj4gPiArICAgICAgKi8NCj4gDQo+IFVzZSBwcm9wZXIgbXVsdGktbGluZSBjb21tZW50
cyBwbGVhc2UuDQo+IA0KWW91J3JlIGFic29sdXRlbHkgcmlnaHQgYWJvdXQgdGhlIG11bHRpLWxp
bmUgY29tbWVudCBmb3JtYXQsIEknbGwgZml4IHRoYXQuDQoNCj4gPiArICAgICBsZWRfZGF0YS0+
ZW5hYmxlX2dwaW8gPQ0KPiA+ICsgICAgICAgICAgICAgZGV2bV9md25vZGVfZ3Bpb2RfZ2V0KGRl
diwgZndub2RlLCAiZW5hYmxlIiwNCj4gR1BJT0RfQVNJUywNCj4gPiArIE5VTEwpOw0KPiANCj4g
T25lIGxpbmUgcGxlYXNlLg0KPiANCg0KcmVzdWx0IGluIDk2IGNvbHVtbnMsIGRvIHlvdSByZWFs
bHkgd2FudCB0aGF0Pw0KPiA+ICsNCj4gDQo+IERyb3AgdGhpcyBsaW5lLg0KPiANCj4gPiArICAg
ICAvKiBlbmFibGVfZ3BpbyBpcyBvcHRpb25hbCAqLw0KPiANCj4gQ29tbWVudHMgc3RhcnQgd2l0
aCBhIGNhcGl0YWwgbGV0dGVyLg0KPiANCj4gUGxhY2UgdGhpcyBjb21tZW50IGluc2lkZSB0aGUg
c2Vjb25kIGlmICgpIHN0YXRlbWVudC4NCj4gDQo+ID4gKyAgICAgaWYgKElTX0VSUihsZWRfZGF0
YS0+ZW5hYmxlX2dwaW8pKSB7DQo+ID4gKyAgICAgICAgICAgICBpZiAoUFRSX0VSUihsZWRfZGF0
YS0+ZW5hYmxlX2dwaW8pID09IC1FTk9FTlQpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGxl
ZF9kYXRhLT5lbmFibGVfZ3BpbyA9IE5VTEw7DQo+ID4gKyAgICAgICAgICAgICBlbHNlDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGxlZF9kYXRhLT5lbmFibGVfZ3Bp
byk7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICBncGlvZF9kaXJlY3Rpb25fb3V0cHV0
KGxlZF9kYXRhLT5lbmFibGVfZ3BpbywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICEhbGVkX2RhdGEtPmNkZXYuYnJpZ2h0bmVzcyk7DQo+IA0KPiBPbmUgbGluZS4NCg0KcmVzdWx0
IGluIDg0IGNvbHVtbnMuDQoNCj4gPiArDQo+ID4gICAgICAgcmV0ID0gZGV2bV9sZWRfY2xhc3Nk
ZXZfcmVnaXN0ZXJfZXh0KGRldiwgJmxlZF9kYXRhLT5jZGV2LA0KPiAmaW5pdF9kYXRhKTsNCj4g
PiAgICAgICBpZiAocmV0KSB7DQo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxl
ZCB0byByZWdpc3RlciBQV00gbGVkIGZvciAlczogJWRcbiIsDQo+ID4gLS0NCj4gPiAyLjQzLjAN
Cj4gPg0KPiANCj4gLS0NCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQo=

