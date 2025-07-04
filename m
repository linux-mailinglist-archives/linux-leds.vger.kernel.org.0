Return-Path: <linux-leds+bounces-4993-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFDAAF8C41
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 10:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41BAC16B954
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 08:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9472F1989;
	Fri,  4 Jul 2025 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="dOjYD6tL"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4A2EF651;
	Fri,  4 Jul 2025 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618146; cv=fail; b=Jct06i1uVdq6PPqjvOBmulsvWXAObohNWiacagxKlYXygC6ETSEazWG0UPhdzMOzgfaYHnwNGpYEvfPxepzHKvXf2mjShmiUtZvvtPK+LHe2vx2eQ7k41YbuOGAQTGxK3j3pYc/2dl0SiZ7pfr4IWItD+6u92+BfOzU9snGlbTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618146; c=relaxed/simple;
	bh=r5E4Y/A/uqrQPTv20nQrV3JZWeDT1H81EbXnH9cR8lM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cUrBfpHvASitezuLzQo39AzadVuN34OGnx/EJCjUP3G3vNWjF5iShCFELttds3RBV0e/8VT4evgMwAj/4N+DCFNMUeT9ayvEdpw+JKZBaH8oK62Dz8NZzDndoPUHkkk0QiWLup27CkY29eUVYeaqJRrC6a3YeSBIKZyxnBmx/Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=dOjYD6tL; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leKSL8Qc305ouFW8eKI6anQ9Kjpj57ytZtOtUR61x9l1evbNNKnSdHyHOiXXABVyw4ZKGyO8dRY8MRnPNTim8Exob4+Uc+8Z02O9WIPWnBQrvNXcwCYm9BpIh2e95bbOJ2CGg52q6CedMi9ZFi+Z9yPRT2C95McaN3wMf3ZQFmoDrhlkJYKMKlUt8Kb5clnj8Jpsg75dkkoUt9D4j2WPeLGWy4m6FZHkBu3Oii1VTKrvOPhOL2yszUQ/aGU90QRqEVan8Ck2LIR65rZaek/3fJeU1zo+wGZocaT4kRxJOnqrBZfxLVOph27957NYci3VEpcJyImgaqlj7W7YdRjxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5E4Y/A/uqrQPTv20nQrV3JZWeDT1H81EbXnH9cR8lM=;
 b=Au2iFBN00JMMcZVmzHCATdAHe3nWwa5o9pz4082xZyLLHJdsgeuUDKU4jYk1gPbi03NegnSKo1p6RgygtWUVQluIuVbU6F05pxHV+4cBYtNNmCSeiYEkGYBAtBkbKcHQ+fA2Wgt7DIkw75xuC6vI/Qn5CFH+MJX+/ifHy/vDuYWXisLIHiLYOJ5EHovBELBlwYrx2tOr06W2cScCkhVlwuoXxAH0D6Pb/7PNqA7jOHGcRc4VYw2ZT36KbvLke2FfhaljknmEb7h3S3duVdyCQFN4PPnL4LVD6qigsJkCx9guUzO+LFwFAE+iyOEqakARoHB6Jnk8XQ30RLgAXPsK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5E4Y/A/uqrQPTv20nQrV3JZWeDT1H81EbXnH9cR8lM=;
 b=dOjYD6tLhR9CM8h8ewFm9SiLfQm1WKrfIQwmh/x4jZXzqU17QcmULQNb4CVL3gf4ae13jtHn1Ji1oam1dEhxohSQ8sogjuYitg4sNMAkmlcCUmWbt1IzZ0yYsGysS5qqCY5kQ8X/VkNbMpd1pB5XD8a6dqQMXI+yYAhbCDl7yJ8=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by PA4PR06MB7182.eurprd06.prod.outlook.com (2603:10a6:102:d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 08:35:38 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:35:38 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: RE: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Topic: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Index:
 AQHb6/20KOVFnvUpm0699jNoWMGGK7QgKlYAgAAGb+CAAAkDgIAAB0rQgAFXpICAAAxRgA==
Date: Fri, 4 Jul 2025 08:35:38 +0000
Message-ID:
 <AM9PR06MB795541A95E9A1089CA95AC1ED742A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
 <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
 <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <1c95927e-a028-43fe-bdf5-449767b49ec1@kernel.org>
 <AM9PR06MB795513A172A70CB09462FCA8D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <20250704-devious-badger-of-contentment-e0a00a@krzk-bin>
In-Reply-To: <20250704-devious-badger-of-contentment-e0a00a@krzk-bin>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|PA4PR06MB7182:EE_
x-ms-office365-filtering-correlation-id: 0a4a6e14-0ba3-466b-b47d-08ddbad5c0dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFQvcG9wSk5yZFRDNzF2T0gyb3k3c0tUeE9TSUw1c1lWQytxUVlNQ1p1aFUx?=
 =?utf-8?B?QVhUS0JHR0UvY2ZPeDVrODVHZGM1dmxDVXlFaExzOTBzSzZqR3p3Z1ZIeVM5?=
 =?utf-8?B?MFVXaWxDUE9KRFFZeWRGTnRtVWFsRnVNbmVkbkJ1NFpnQTQzSG1UVW0vYTE2?=
 =?utf-8?B?OE9hbjBaMllLQzJMbGdFMWJnZDNoZWtQK2k4YzhwRnQweCszbFp1cmNKWk5M?=
 =?utf-8?B?bWVFZUhZWm1OZ05vb05nc0pHUTNRMzRXNUtQQkNHVVoraDh6R201NkFyOVBH?=
 =?utf-8?B?RDVsR25xaThId2NFdGZCQnRLemRUU3V1SzMvWTJISG9rRTNBeU1qQ0RUSnl5?=
 =?utf-8?B?d3RoM2FuMFgvbEdIb2JycUZ2Q2dxMDMvL3ZTQUM3R1k3WC83YW0yZG5pWmIr?=
 =?utf-8?B?OVR5aXVIVm5aYlU1UUZZR2QwWTh5WUpRcWc4T2RQYjY5TTBTNUZrUGFoa1Vw?=
 =?utf-8?B?WDBZM3pxQ21qWTExVWo2Z1hBY01DWTVvSm8xcDZzQ1hTR1g1NDlEMmtpRzJ1?=
 =?utf-8?B?c0RZY0o4VTB5d3BjUjV4ek1lNWE4b0JaN0w3UExwUlNZRHJ3djYxc2R3K2tz?=
 =?utf-8?B?alVNcVp0dTBZRFFIWlRUTVdnRDkycEY2UUpOckxnd2FOSmUwT1daNGpsbEx0?=
 =?utf-8?B?N21aeUsvZit0dTVMR2I1MzhTUzFZU0JVZTcvU3ZUSHg0aGhhK21tSnc2Z1F4?=
 =?utf-8?B?R3k2K0NweTNZY2RMWm1wZkpDMUZydUdSWXdBUXBsVlJzMmp4bUF3MlptTG8z?=
 =?utf-8?B?aHlraHZPVGdhNGRxU2NXdXluMEFWVzFFK3JPVVJ5Ym01WnhOMk1jbmlXcllk?=
 =?utf-8?B?YUdzZWl6dVV5Znd0ZEVMREx6SEdCT3prUytqZTNRdGJPY2drelV2M295aTMx?=
 =?utf-8?B?cXZxcXhWbk1hMWJhZm1RczR0ZHRXdG9NM2xZTlhKZUxiY1BOKzBRRVhPelNp?=
 =?utf-8?B?T1g0aTh1K3lPVlV4WHpvU2tuVXN5VENmSlo1NHpnT09FQllrcmFYZEF3L0c4?=
 =?utf-8?B?QU9zOG5kZHEya2xEUnFTZVhkNkdmUmxQaldWMWM5WDc4WU1WZUhNdDI3eDZK?=
 =?utf-8?B?N0EzZ2s4SWFZTkZZbU55M0o0eThSQXVDclQ2YVBJOFI5SmlFUjlnanFCUzV3?=
 =?utf-8?B?N2J1L0lkdUxSTTFKbnQ4d1czOWoxdHl5WjRxeHlGYXBiYlpCSzVwa1pWTE15?=
 =?utf-8?B?dVBFdFJMcGErQytzdlpDL0orQzgxUUl1amkyMEpyU2M3dGI3QkFsMkRaYnQv?=
 =?utf-8?B?RWtEME5UdXhrR0JXNVdkNTgzSXBXUnNxdUdqTHNhNTU4dUJ2WnEwWHk1SWRN?=
 =?utf-8?B?bmZoVEk2TjNLWWRZbUtmaDYvNG8xRG1hUVB0ZzI3S2tDLzlzaHp6d3hQZ1oy?=
 =?utf-8?B?ZDF6TkhLVDRUSTZOZWxDN01HS2pkQjUzVFNmeGYzYkpBTzI3RHh1dkliSmUx?=
 =?utf-8?B?VGFBeFRiM3NRVmxvbHZxZGh1ZGoxN2RNNGNYMXBvR2U0djFieFpKYzFXaTNX?=
 =?utf-8?B?bUl3UndzbWx2cXJQNi9udUY4TzRIdEhYU2VvTzk5dFhBNjhkMlNubko3dWt0?=
 =?utf-8?B?WmdqVjZvQ3B2UEFWSnFvNVVYakY4MzJZWXN3bitXOG5Xc1kvZlRYVFZibysr?=
 =?utf-8?B?NW90UGFLU2o5OXhFNDA3Y00vaWs2alM1UVBFQnRibG9BMEdxcUJ6N0NTN0Ni?=
 =?utf-8?B?b2UrbHk5dWxiVTh0QkYwU3oxQ0o0VXhaQk4xaDRZWkZZdzBENVU0UHV4eW0y?=
 =?utf-8?B?TnNDVXZqSTlWUlpuRk9UeWdzb0tLWTNHKzFubmNRdVdrV2drY21lMmxpRVBS?=
 =?utf-8?B?TTYrWDhxZFM5MEFtdjRiSFBQNGM5YWR6MjVaT2thbDNobXlpSG9hbWkyK2tF?=
 =?utf-8?B?TTFuNU9Xa3dWeGV0RGRPZ3V4aHF0VnF2ZWlOSG5reS9KbmlaY3hVbHN2TzRs?=
 =?utf-8?B?QW1XZGF4YlcyRmNqUzltcnlqNTcxeTNteEV3MHNMYVdVOUlXL1NSV0JDKzJo?=
 =?utf-8?Q?uk9Mw+P4rEV4LVMyVPeydDIBHlNw/Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUtJVFVaSUNETlV4S2kyNHkzMWJkSHV2UVYvenB3bncyTkxYNWhUc1lkSDF5?=
 =?utf-8?B?disrbEcxTUZnRWVIUWJrOGlxb3RzNU1reGFUSlN4ZUdGVTF2ZEZ5VDFiZkQ3?=
 =?utf-8?B?YjZpMlJqck1EY3Q2STJKOVRWQzc2elBwakQ2Q3NCWlUvTHBHckVRZzk0cXpy?=
 =?utf-8?B?WjVkZmVXSVpWcGREcG9tNGpqNFY5aThqM00rQ041UHpWYjE5a2tiMTBLTDJa?=
 =?utf-8?B?YzBpallPdnEyWU9RVStVK1FmRURiNUJ2UVZjM1QxQ2hqOVNJSmFRWlNSTHdE?=
 =?utf-8?B?SllxdHdVS3pYaVhFRWpRQlpMT0Q4M1VBREY0WEpsTTlCYkx2UlpYWFRrempV?=
 =?utf-8?B?elVLZjFER0hwOHIybndBUmJia2pYTnhlWUJZaUo4aStMUlVTUUIxS3NYaUZQ?=
 =?utf-8?B?UENkTDd3aE04RjhxNHZyKzljMU1SZFRsTEN1MkorbUxTZ1U1QnhwZ3dxSlVT?=
 =?utf-8?B?SnZ0UmtQNmdPWDd3RmpKalh4U2lBV3d1MmJpQjM1YnhCWHBpdXRQOUtDMnNW?=
 =?utf-8?B?UFVwbmJTZzFRZkFUdTB6enJRMmw4eVdVZUZDeVZQYkVTWVRKZUlRYk1nMnV4?=
 =?utf-8?B?L3pBcFhIejlwRks2UlI5UmtVeUpIYm5SRVAvM3JvbzYxdEhqQjBublhZNjc5?=
 =?utf-8?B?TDc5aWNHYUtIVjFieHl5bFNFVWZ1c3E5UERhQ3JaWVJsRXg4UzM0ekVzd2g4?=
 =?utf-8?B?Uk1raER2SVVaeldKZ1d4MDZSR3NiZldJZkxQQzNsdG1PMkNkZlRTcnpBMDBM?=
 =?utf-8?B?emZWZ08yZWRvUzdXNjdkTDVkLzJVMFUvTWhzRGw4NmNsZHM3RlY3L29SMDNv?=
 =?utf-8?B?eld6VmtBaCs4d3M3bWxWZkVqeGxKM3FmSEZHNTZwVkYyNFNQUVdBSytjR1Zi?=
 =?utf-8?B?allhZGRQMnNNSHNhTGFZMDBWUWwvSFdGUzhzc2p2MmJtMFpmaStTWmt1aDBT?=
 =?utf-8?B?TjNuVUlBQ0RZaXBFU0ZpeE9YTDhEN05RT3VVK1hhdE1oNE9PcS9BeWUxWUhj?=
 =?utf-8?B?dmFiTU1HVDVVZmpkQ1NXMEF5QUt4VHpmNmVISzlrU0ZHNGtBbHJxb09MNHhG?=
 =?utf-8?B?dEp1WEY2a29HK1RxYjNuNUZQUE1mRjUzc0J3R1B1cHQxeTBpNXFDUDZtbnhR?=
 =?utf-8?B?VzgzODU4ZHFoWnpoRVBlZjl0dHFMSWNIeW51OXZFcjhjYWtDTWxJeHpsbmtQ?=
 =?utf-8?B?WUtRYXhHOFptYTVuTnNKN1dmSkZFampvU2VQM2YweTVZK0NlUjVPUnE2ZW9H?=
 =?utf-8?B?KzR6eGhyMzErQ0VjakZta2c0WVN1aVhwMEU5UnFGTFZBeWFGbmJ0RkdjcTBH?=
 =?utf-8?B?Z21xMVMySHlCT1FKc1lEaFE4ME9WS0JSeDc0WU9vZlhpQTRFbUtVc0lyU1FJ?=
 =?utf-8?B?N1IrUW5GR0FtZ3RiV0NGWmpwUVM1S2pnSXk5ZlhmQzNUSkJxUVAzMGJzYXZw?=
 =?utf-8?B?ZmpjcVJXeDM4WnFFS2lUbXp0eFJMZlFVZGkxbTdEWlhDZFR2VVZlL2MxMGto?=
 =?utf-8?B?ajAxUUtVOUFIYVdJUDgveW9EdEpEMnNubzVxNU1BNFplRFZtVGJRckVNUytD?=
 =?utf-8?B?d2IvbjQyT250TjUzM1ZGQVZNa3dHTGFpeWFIVXladDZCV0NLVnZqK08zWkgz?=
 =?utf-8?B?a2pKdFpFb3BNa0R5OUZwQ1lFaVRQbCtzOTdaS2FGaFo1RHY5S2FMUEkxYlFV?=
 =?utf-8?B?dmxrdnB2cXNKTFY1SCtNVG1RVFFhRU9BZkUwakhlM2x5Mm5qZXVSVksvNTVw?=
 =?utf-8?B?Y1g2MVFvYXVMb2ZZZDdWK0plNFZBYlZveW1uYUFlY0NhUzNBZlFFM0RaT1NO?=
 =?utf-8?B?eldTRkkvempoRVQzMjhPTk1BeUlEdjR4Nm10QlNtU3J4Y0c4TjhsMld1bjU1?=
 =?utf-8?B?L3ZVay92Uk5qMWpZMXRUUVl1bVlhZTFZS3VXeTA4M1VRTnhRaW03TENiS3RC?=
 =?utf-8?B?a3o4ZHlzU042Vy9BZVY3dW52dHhPaGtCazRsNlBHRHdYT1dQU2ErVkxIQmxX?=
 =?utf-8?B?YzNaVEp6U0s3OVo4dVhyS1hldnBzcmk0Y01tNjk3VGlHRFdkaFZ3Y1dST3dH?=
 =?utf-8?B?QWhSRjZzcWc3V0F0bXJpZkxObFVPNERaa2ZYWFFFT2VwNHBTa01aa3dUWDNJ?=
 =?utf-8?B?NGFZenJyNCtyQm0wcVhJT3F3dE82TE1QOVpEVHJxc0xYdkRuZFZCNlRVNjNa?=
 =?utf-8?Q?sHvJJMFhSxywE6MbybmnSAk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4a6e14-0ba3-466b-b47d-08ddbad5c0dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 08:35:38.2836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bz8aluqJlRY//wWM41addo/+j3Q0in+BsmR27YwUUENlTEJcRc4tNCExvf+flElLqrD2nYOirEmI5wnjLo7FoH8L7Bog1HOoge0r9sxY4vc/mpQp7ddqRGCJPQYGT3S/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7182

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgNCwgMjAyNSAzOjUx
IFBNDQo+IFRvOiBMSSBRaW5nd3UgPFFpbmctd3UuTGlAbGVpY2EtZ2Vvc3lzdGVtcy5jb20uY24+
DQo+IENjOiBsZWVAa2VybmVsLm9yZzsgcGF2ZWxAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3Jn
OyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LWxlZHNA
dmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgR0VPLUNISEVSLWJzcC1kZXZlbG9wbWVudA0KPiA8YnNwLWRl
dmVsb3BtZW50Lmdlb0BsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBWNCAxLzJdIGR0LWJpbmRpbmdzOiBsZWRzOiBwd206IGFkZCBlbmFibGUtZ3Bpb3MgcHJvcGVy
dHkNCj4gDQo+IFRoaXMgZW1haWwgaXMgbm90IGZyb20gSGV4YWdvbuKAmXMgT2ZmaWNlIDM2NSBp
bnN0YW5jZS4gUGxlYXNlIGJlIGNhcmVmdWwgd2hpbGUNCj4gY2xpY2tpbmcgbGlua3MsIG9wZW5p
bmcgYXR0YWNobWVudHMsIG9yIHJlcGx5aW5nIHRvIHRoaXMgZW1haWwuDQo+IA0KPiANCj4gT24g
VGh1LCBKdWwgMDMsIDIwMjUgYXQgMTE6MzY6MTBBTSArMDAwMCwgTEkgUWluZ3d1IHdyb3RlOg0K
PiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4gPiBTZW50OiBUaHVyc2Rh
eSwgSnVseSAzLCAyMDI1IDY6NTUgUE0NCj4gPiA+IFRvOiBMSSBRaW5nd3UgPFFpbmctd3UuTGlA
bGVpY2EtZ2Vvc3lzdGVtcy5jb20uY24+OyBsZWVAa2VybmVsLm9yZzsNCj4gPiA+IHBhdmVsQGtl
cm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiA+ID4gY29u
b3IrZHRAa2VybmVsLm9yZzsgbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBjb25v
citkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gPiA+IENjOiBHRU8tQ0hIRVItYnNwLWRldmVsb3BtZW50DQo+ID4gPiA8YnNw
LWRldmVsb3BtZW50Lmdlb0BsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggVjQgMS8yXSBkdC1iaW5kaW5nczogbGVkczogcHdtOiBhZGQgZW5hYmxlLWdwaW9z
DQo+ID4gPiBwcm9wZXJ0eQ0KPiA+ID4NCj4gPiA+IFRoaXMgZW1haWwgaXMgbm90IGZyb20gSGV4
YWdvbuKAmXMgT2ZmaWNlIDM2NSBpbnN0YW5jZS4gUGxlYXNlIGJlDQo+ID4gPiBjYXJlZnVsIHdo
aWxlIGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBvciByZXBseWluZyB0byB0
aGlzIGVtYWlsLg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBPbiAwMy8wNy8yMDI1IDEyOjI3LCBMSSBR
aW5nd3Ugd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPg0KPiA+ID4gPj4gU2VudDogVGh1cnNkYXksIEp1bHkgMywgMjAyNSA1OjU5IFBNDQo+
ID4gPiA+PiBUbzogTEkgUWluZ3d1IDxRaW5nLXd1LkxpQGxlaWNhLWdlb3N5c3RlbXMuY29tLmNu
PjsNCj4gPiA+ID4+IGxlZUBrZXJuZWwub3JnOyBwYXZlbEBrZXJuZWwub3JnOyByb2JoQGtlcm5l
bC5vcmc7DQo+ID4gPiA+PiBrcnprK2R0QGtlcm5lbC5vcmc7DQo+ID4gPiA+PiBjb25vcitkdEBr
ZXJuZWwub3JnOyBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+ID4+IGNvbm9yK2Rl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gPj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ID4gPj4gQ2M6IEdFTy1DSEhFUi1ic3AtZGV2ZWxvcG1lbnQNCj4gPiA+ID4+
IDxic3AtZGV2ZWxvcG1lbnQuZ2VvQGxlaWNhLWdlb3N5c3RlbXMuY29tPg0KPiA+ID4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBWNCAxLzJdIGR0LWJpbmRpbmdzOiBsZWRzOiBwd206IGFkZA0KPiA+
ID4gPj4gZW5hYmxlLWdwaW9zIHByb3BlcnR5DQo+ID4gPiA+Pg0KPiA+ID4gPj4gVGhpcyBlbWFp
bCBpcyBub3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUN
Cj4gPiA+ID4+IGNhcmVmdWwgd2hpbGUgY2xpY2tpbmcgbGlua3MsIG9wZW5pbmcgYXR0YWNobWVu
dHMsIG9yIHJlcGx5aW5nIHRvIHRoaXMgZW1haWwuDQo+ID4gPg0KPiA+ID4gUGxlYXNlIGRyb3Ag
dGhpcywgaXQgaXMgbm90IHJlbGV2YW50IGluIHVwc3RyZWFtIGRpc2N1c3Npb25zLiBVc2UNCj4g
PiA+IG5vcm1hbCBlbWFpbCBjbGllbnQgd2hpY2ggd2lsbCBub3QgcHJvZHVjZSB1c2VsZXNzIGhl
YWRlciBhYm92ZS4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gPj4NCj4gPiA+ID4+DQo+ID4gPiA+PiBP
biAwMy8wNy8yMDI1IDExOjM0LCBMSSBRaW5nd3Ugd3JvdGU6DQo+ID4gPiA+Pj4gc29tZSBwd20g
bGVkIGRyaXZlciBjaGlwcyBsaWtlIHRwczkyMzgwIHJlcXVpcmUgYSBzZXBhcmF0ZQ0KPiA+ID4g
Pj4+IGVuYWJsZSBzaWduYWwNCj4gPiA+ID4+DQo+ID4gPiA+PiBTZW50ZW5jZSBzdGFydHMgd2l0
aCBjYXBpdGFsIGxldHRlci4NCj4gPiA+ID4+DQo+ID4gPiA+PiB0cHM5MjM4MCBkb2VzIG5vdCBo
YXZlIGRlZGljYXRlZCBlbmFibGUgcGluLiBJdCBoYXMgVkRESU8sIHdoaWNoDQo+ID4gPiA+PiBz
ZXJ2ZXMgYWxzbyBlbmFibGUgcHVycG9zZSwgYnV0IGl0IGlzIGEgc3VwcGx5Lg0KPiA+ID4gPg0K
PiA+ID4gPiBTbyB0aGlzIHBhdGNoIGlzIHVuYWNjZXB0YWJsZSBhbnl3YXk/DQo+ID4gPg0KPiA+
ID4gSWYgeW91IG1ha2UgdGhpcyBwYXRjaCBmb3IgdHBzOTIzODAsIEkgdGhpbmsgaXQgaXMgbm90
IGNvcnJlY3QuIFlvdQ0KPiA+ID4gaGF2ZSBlbnRpcmUgY29tbWl0IG1zZyB0byBleHBsYWluIHRo
ZSBoYXJkd2FyZSBhbmQgYWxsIHVudXN1YWwNCj4gPiA+IHRoaW5ncy4gSGF2aW5nIFZERElPIGFu
ZCBFTiBwaW4gaXMgdW51c3VhbCwgYmVjYXVzZSB5b3UgZG8gbm90IHN1cHBseQ0KPiBwb3dlciBk
aXJlY3RseSBmcm9tIEdQSU9zIG9mIGEgU29DLg0KPiA+ID4gQWxsIHRoaXMgc2hvdWxkIGJlIGV4
cGxhaW5lZC4NCj4gPg0KPiA+IFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLCB3aGF0IGFib3V0
IHJlbmFtZSB0byBwb3dlci1zdXBwbHkgd2l0aA0KPiByZWd1bGF0b3Igc3VwcG9ydCA/DQo+ID4g
Q29udmVydCB0aGlzIHBhdGNoIHRvIGFkZCByZWd1bGF0b3Igc3VwcG9ydCBpbnN0ZWFkIG9mIEdQ
SU8sIHVzaW5nDQo+ID4gInBvd2VyLXN1cHBseSIgcHJvcGVydHkgdG8gY29udHJvbCBMRUQgcG93
ZXIsIG9yIGRyb3AgdGhpcyBwYXRjaCBhbmQgZ2l2ZSB1cA0KPiB1cHN0cmVhbSwgb3Igd2hhdCdz
IHRoZSBiZXR0ZXIgZnJvbSB5b3VyIHBvaW50IG9mIHZpZXc/DQo+ID4gYXBwcmVjaWF0ZSB5b3Vy
IGd1aWRhbmNlIQ0KPiANCj4gRG9lcyBpdCBzb2x2ZSB5b3VyIHByb2JsZW0/IEl0IGlzIHN1cnBy
aXNpbmcgdGhhdCBvbmNlIHlvdSBzYXkgaXQgaXMgR1BJTyBhbmQgb25jZQ0KPiBhcyByZWd1bGF0
b3IuIEhvdyBpcyBpdCBpbiB5b3VyIGJvYXJkPw0KPiANCj4gUmVndWxhdG9yIGlzIGxvb2tpbmcg
YXMgY29ycmVjdCBoYXJkd2FyZSBkZXNjcmlwdGlvbiwgc28gdGhhdCBwYXRjaCB3b3VsZCBiZQ0K
PiBmaW5lLg0KDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayBhbmQgY2xhcmlmaWNhdGlv
bi4NCk9uIG91ciBoYXJkd2FyZSwgdGhlIFRQUzkyMzgwJ3MgVkRESU8vRU4gcGluIGlzIGNvbm5l
Y3RlZCB0byBhIEdQSU8sDQp3aGljaCBpcyB1c2VkIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBk
ZXZpY2UuDQpBY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldCwgdGhpcyBwaW4gaXMgZGVzY3JpYmVk
IGFzIA0KImVuYWJsZSBpbnB1dCBmb3IgdGhlIGRldmljZSBhcyB3ZWxsIGFzIHN1cHBseSBpbnB1
dCAoVkRESU8pIGZvciBkaWdpdGFsIA0KcGlucyIuIElmIGRlc2NyaWJpbmcgdGhpcyBhcyBhIHN1
cHBseSBpcyB0aGUgcHJlZmVycmVkIGFuZCBjb3JyZWN0IHdheSBmb3INCnVwc3RyZWFtLCBJIGNh
biBpbXBsZW1lbnQgYXMgc3VwcGx5IHJlZ3VsYXRvciBjb250cm9sbGVkIGJ5IEdQSU8sIGFuZCB0
bw0KbW9kZWwgdGhpcyBiZWhhdmlvciBpbiBkZXZpY2UgdHJlZS4gDQoNCm9yIGlmIHlvdSBoYXZl
IGEgYmV0dGVyIHN1Z2dlc3Rpb24gZm9yIHN1Y2ggY2FzZXMuDQoNCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQoNCg==

