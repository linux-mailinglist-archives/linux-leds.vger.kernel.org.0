Return-Path: <linux-leds+bounces-4986-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5AAF728E
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 13:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C851C84429
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 11:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8072874E1;
	Thu,  3 Jul 2025 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="F8UeTwVb"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A532571BC;
	Thu,  3 Jul 2025 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542576; cv=fail; b=O0+Ogm+0EhhoCeWDcGNsbsiZVkhEgR1/jprJa0jmfu03/ebEgdfOqsfjC+HRJTqlLzrhI9wo+bot37y1u4UXKVhQKm9GvIlgONNo6Ka9eRmQQ0sUfSk82c2s1yvflfftXLe6XUV++bGQYeZQya//sCO+kr4ullb0w/tpWOVuZp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542576; c=relaxed/simple;
	bh=a8UcAtqR901qclkNWeObXPPOxKIX+9LHGAHT8PEr66E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lOyF2lt2Xq0j/9cvn4/Cb6CQv3fR40HVVJ1SPYsHOLeeb0SFAO1uY12My+vxtPB5Y3e8JHSzUABySVR2s+rf0FZ3ADA2tZMXREU5Qpgtva6dh8n2U6TD6elznYFDs4a/G3Qxw0IGD1cyTbAw4BlL4CnZ3pFLP28vL5DpPSsHEIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=F8UeTwVb; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8DsDsw7SlgRaIlbPuQTsBowEElf9QeHU4P1MlIXPQBW+sWSUtPE46qFxMxDe2CDyuup0x3NPOy4j1Dfb7kTyk0+LCymHu1fr662UNhlaSfK/qAB0JHU+/nbRt1mAhLBRgfLHkjnHRl5z7QjD766Ia9qMQG6MVtEphKgpjTBMu1x6pUazwXCH18ECzGZGiLQu3g/jiTuHroAjnPmSxrlgykOwTeBvdxZRkSejv8MuqMsrrJWtYLzqyfs/yBxD5C3e9j+6X5B4AdeCXxTDivVUqdZFzQCqxhdbQh252rBgqhqZoTgJc3CQnmj9fOJsmPMKoHQCckpaTfEScA4k7TLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8UcAtqR901qclkNWeObXPPOxKIX+9LHGAHT8PEr66E=;
 b=Lbz45urXc3fLRPyw5gil1tLDjoqYYvoYDISxeM5Bo+NnKKloEx6TvwuBSeS1sz/p9ShNj6MbsM7En0VYoeYbVNTHdRqb5ai8nXPSaivM8q/4TTFEQ/fY4/d/YLb5HI8nur+Mt1jPjeE9kVqTnN0Q+keZfDSIY3vt04wCS9+UYh8ozx/4kj1AfR5QcG2xSERIoDX3yZKb7Jn5KDRwEl8IYEi0oPjWOlZ/pLk0qsgz4NAJjYQRFsrM4NeqBSSKoQvmzZyhLXhjmR0ptnDjPtDquD9qctsccDqwWb6nABEgq3icypyIBBSXysoXeMKHJbBh+sCo4AaHroVLsVBJbIA9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8UcAtqR901qclkNWeObXPPOxKIX+9LHGAHT8PEr66E=;
 b=F8UeTwVbPJ7y8pBSruC6nwEpSII7suoURMjz2YjNWXxj4r3cre2Tzh7Yhy/g1quEdB4dtMTSZ141c2SwddWSToujIXkaV51F5TZHASaQtxXR94qFDs4AN5VhC4bOKdPV0RBxuF74G79F4xZLrDPYFKKIngWm3HpYDKWlLWG0qhM=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by PAXPR06MB8189.eurprd06.prod.outlook.com (2603:10a6:102:1ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 11:36:10 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8880.024; Thu, 3 Jul 2025
 11:36:10 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: RE: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Topic: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Index: AQHb6/20KOVFnvUpm0699jNoWMGGK7QgKlYAgAAGb+CAAAkDgIAAB0rQ
Date: Thu, 3 Jul 2025 11:36:10 +0000
Message-ID:
 <AM9PR06MB795513A172A70CB09462FCA8D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
 <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
 <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <1c95927e-a028-43fe-bdf5-449767b49ec1@kernel.org>
In-Reply-To: <1c95927e-a028-43fe-bdf5-449767b49ec1@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|PAXPR06MB8189:EE_
x-ms-office365-filtering-correlation-id: e20015d9-5499-428b-75f1-08ddba25cf2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2ZVdlF5MnpRalgvTFhxM2o3ejRlOG4rKzZWUUgxVE9mWFd4YVI2QTNKR2VX?=
 =?utf-8?B?RVZ4ZnhueXh2TXJWSTY0RHBUem5WZzRSV2JLS01LK1FCL0M5UkY0ek1JU2Jw?=
 =?utf-8?B?dmthRDhYZk5sSGlibUZDaSttZCtUT3lhTERyN2tQQWVKcjUzMlFEbzV4SzVM?=
 =?utf-8?B?cGttRkpxNFQ1b3VCOUJPVG1waWxJcDkra3N2R2YrUTJrNGlrZGpTcERFanU2?=
 =?utf-8?B?VlVDemhUZkJ3Nm00WXU2ZVhyMWFjYUI3bGp6SXIvQnViNCszVTJMbEc2c1Zk?=
 =?utf-8?B?cjNLaE5hMVB2K0cvSlVpMlhvR2o3UjVPbDU5TUVDZm1BbFNHMG9HeWtXbzRW?=
 =?utf-8?B?QUtiWHpaNWlKSER2UE9SdjM0bEs2aHBMeXdYa0VHUFRTZWJCSTErSUNKMVdp?=
 =?utf-8?B?enZaZmxSZGczZzQrZzJwempBa1p1WTFZWTBiMFVNeFYzelF3VUMzQnFyVmov?=
 =?utf-8?B?VHQxRy9KdlNpWEpxdlF1L05SRFpsUXF3c2dib0tRZzRtajZZMzRNeDRFWUJl?=
 =?utf-8?B?ejIrWnZWM0hqTEIxV3VvV3BJRkJEcEdFZ2xCSU9Ua3g2VkpqUytzaU0rdnVV?=
 =?utf-8?B?Sk1wY3MwejBwR2dCeUxtQzFzeWc5azNBdzFsU01KR2hUZExOb05EZForSko2?=
 =?utf-8?B?TGpoV1l3aDV0dnpiV1BraXh6Yk1Hc1RTWWJDTHk5YTFxYm9UMkZZWEw1eU80?=
 =?utf-8?B?NzAwaHVBOE5XYk9rTkppSUpUaE9SNVVpQTcxOVRMSlhrVFJjWWRmTm5neEZH?=
 =?utf-8?B?eUhhTW5SdXRGbVIzd2dHcTBPRnp3VGYza0ZZdkJTU1BvWFUxajNWV09jZlFU?=
 =?utf-8?B?ZDdMN1RjT0JsODI3MDBNQWhaVVBpajc5R2pvbGxya3hPTWpuZnpub3N1RVg4?=
 =?utf-8?B?STdjd2lQZ0V1aGEvSmN6Q2ZldU5VRXI1LzMwZEZXUi9FbGZQOWhHNkE1V0xt?=
 =?utf-8?B?N1RIcy9LL1NiV1lKWGtXMWduMXp4MDNyMGVoRVpxcWdxUFJrN0IzZERhYzVn?=
 =?utf-8?B?dVdWdkdkTXdVT29mWWhvRkRvcy81QnlvVW5Tall5VEV2SG0xQ0QvOUxheTJl?=
 =?utf-8?B?ZXk1YTdMRkpRWmd3U3QwZ2M2d0psRVEybGtXaXZZZm44bE1oK1ExSE1BS3VW?=
 =?utf-8?B?Vkx4U0VhSHduS0xBTDFYdHlNRDJQQ1RMeVFuWXh3U1dPcFlZeU5IU3U0aDZq?=
 =?utf-8?B?VjJNa29hQ0Z5QXM4OTlTSjAxcEFORmE1bTM0TVRRSVF6V2RTN1ZVQk1BdEV1?=
 =?utf-8?B?cmFhQStHRlBjbEpMejZiYkg0ZnEyQVczMHhSNGdDZ0lVbURyeVBMQUlsNEZV?=
 =?utf-8?B?YnNCKzQvazlNNEplc3M0Vm0zVm9RQTdDOUdxbzR5QjVpUjV6Z3dpVWNnNStl?=
 =?utf-8?B?MVJ5M0tXbS9nVkVnWkI3T3FTYXY0S3dLVFdJaEsyRmJHanJhRVlnQktIUkh2?=
 =?utf-8?B?c2Rwc0t1MXVYMGM1bStqVU9IVmgwZlFKVVpVNDlyVXVYV1NRWWZCamdDbDcz?=
 =?utf-8?B?RFVGWjEzeHdubkxvYmdDRkNqNnRGaVl5REMwWlJxOG00d2k3SFpWaklkWC9K?=
 =?utf-8?B?OWdDYTRyVi9QbDQ2VlVRcEJYTkw0OEsyZGJKUXVCTVhZallVdWNlYTZHeUI4?=
 =?utf-8?B?dHo5SFA4TkVuZEVSTllSYTRta1RQWUNmOUU0aStoRDlQdG52NDgzSEN5Mk43?=
 =?utf-8?B?SHVINVlqRFhxWUFMWWhuY2owQnVyUWc4Sm1xVDlBVDl3NFg1cjBKWXpnUEll?=
 =?utf-8?B?Y1l4VlJFNFlJQW53YzdTUWUvaG1xZU84UUJmSzBsVXBnYzlKMmdIOC9GOUtt?=
 =?utf-8?B?UXltOHEzbFFSV1VSQVJZMGRMclpJeHpHMkFTUE42V1ArUDlkci9GNGUxZjNo?=
 =?utf-8?B?SXVDYWFrTWZiaTRaRXVNOVZhOWZFdU5xcHdVbXpoVUZpSjNxNzFhcktLTmIr?=
 =?utf-8?B?dUZFaHdhUUhaQjE3Ny8vL1VlUHJLTUdsZ1B3SzJ6aUQ3WktoVmF0OUlHRGJZ?=
 =?utf-8?Q?FLOCFhOnQPFCh9Ov3xOyvXQgmEeIiM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qnc3ZWl1RHlMWk96NUJUYkFLaGh3ZG1WTE0rbDM1ZWZNcGFJREc4bmtqN3pi?=
 =?utf-8?B?Rnlydk9FemxJejl0dzQ5SUc4ODU5d0gzUU5QSGczZTR6WUF6Y21WVVBIQjJW?=
 =?utf-8?B?QWxZaHkreVdmNGpOTSsvR0lFZUp3UkV1djh6WCtVenQvbzZvWEVzWVlDQTlW?=
 =?utf-8?B?dnE4S2NwVDgwMkt3ZDNuRFY5N0NJWTRnYjhhaU9GOC84MHhVWTdVNTkzK0w2?=
 =?utf-8?B?bG9oWis5ejd4VVFZbm5KWDg2eHJVeHB1QllzdVNPUU1CQStaUUdJTGhUaGRn?=
 =?utf-8?B?R3B5Z2JOS1h0ellvVHlvMmM5QkZqYzhaUDliYi8veDEzTERGbjM0ZDNzVlpw?=
 =?utf-8?B?bkk1YnBtZTFKV09FdDRUSzc3Zk1EMkloZnhEWmplV0RlS2ZLL2c4ZktHdHhS?=
 =?utf-8?B?T01pZXg0UzZ4ckgrS1JPSXdwd3RUWm1ZYmhueHBDRFU2RTNvOExwZGNKc0g0?=
 =?utf-8?B?S3paSlcyUVNFSlJwcTVuMHlIQW1LWU8yVno1OEV3WmY3V3NHMnl3NmFjbUZp?=
 =?utf-8?B?bTB0Y0QvbFN4andLR1UxTDVPVUhhOC9ubFFKYjczN2xieTNhb002elJTbmhL?=
 =?utf-8?B?VVJXc29tQ0o2SVRmZWpSTlFTNEgvNWxpRHNTODE1K0hXMlczajQ3VkkrSW12?=
 =?utf-8?B?Q280UHhCdzdNTUJvV2hEUUNHcWRuTis2N2ZzVndRYi9mclVkM0NTMTBIalY1?=
 =?utf-8?B?dEhQQlFqclpZbi9JQ1F4M3dBYi9ZaGxsbVlLamRXUmFnRU13M3JXems0VkVz?=
 =?utf-8?B?a0hBKzAybnprOHJwS0pYRjRQZzdLeUpuaWlYMDZZeXJ2eTRGQk15WUZwY09S?=
 =?utf-8?B?MXg3dmFRNzc2SHVmbzVqQU5KTzhKby9DUEZIK3YwVUNzbDdBaS8vaHpnQzFS?=
 =?utf-8?B?eVMyVUd6bjR3UW5BQkpNQ0JGL3FHU0hMRlBSQUNSUGczNmxGMVdxbVc3ZTJP?=
 =?utf-8?B?Qmw4eXRtMm5iczhjZEVRUHJhN0pyQ2VkSXZ5NzFnbEFWbml5OGI5cTRSa2Jo?=
 =?utf-8?B?UFdqM2EwMldnUm85VWNlQzNvLy9saUo1dWJmUWRKRjM4dEJKeU04c1UrSWE5?=
 =?utf-8?B?OHd1ZC9WMUp5eXNuVDc3TzdhL2VsbmNBY2pIc1lVZTdYcXJXckhBOXJaRkVR?=
 =?utf-8?B?Zmt1Ni9qSE1GZDJON2lhclJsNThLdmdTeGgwRWhnT3VVd1AvY09hNStuN2pi?=
 =?utf-8?B?dUxzblg5ZXdyWW8wL0ZvUEh2bGkwQTJKSDQ2YTl2UDVYeG5CMVpsaE51cmhS?=
 =?utf-8?B?THAxSFRXWmNNcFg2K0JKd2hsbHlCcUUxdEJHRGVJVVJiTmFMRzZOaCtHK1h5?=
 =?utf-8?B?eFdsVzdZTkU5S0hKaG9PUW9hcGYzd2I0VzI2YTAzMDJaVTZNTkxBK2FoYW9R?=
 =?utf-8?B?NDZHR2lhUnJHS1JQMWtJZ2p3SGNPM3EwT2hrRHcwMmM5TWtVc3JKbG94bENV?=
 =?utf-8?B?TFUvZENJMzlnVWRDUDRrTlU5T2QwbHI0MjVnZjBBQncrcFVjcDk0N2Q2Zm5U?=
 =?utf-8?B?SktGdXJNQ1F1cFR4UXR3WUxLaDNPd0p1L1BCRm1UajVLQ04rbTJxT2kyazha?=
 =?utf-8?B?b25lQWRRRW5PVFFDUGMxbWREWVdvNmRCZlBPVUFzZmx5Q2ZtQ2VDREdtUlgz?=
 =?utf-8?B?dEhJbzBCai9jeHIycFJyTDhQSlVXZURWN1NhRjFZc1Jiei9udUFNK3l6Z1Ar?=
 =?utf-8?B?RWZEOW9UbTlvRkk3N0FQQ2crOVI0S2t2NzBDVzV4N0ZpbTQzNkk4emNxMmda?=
 =?utf-8?B?Vkg3RzZSN0N0N1RicFhyajk5MmZpb053TnJjV3hCblI3dmFPNHJvVzUrQ0ZK?=
 =?utf-8?B?MjhFbGxaSjlCQ1M4OU1DTEVWNjNlVGxEalkyVmhtcVZuS2Izck9UK0VFblZn?=
 =?utf-8?B?MXlUV2I2VHMvdm8wR2xteTdjT0hJMWtKSzBPcnBZUnZuV2wzZ1JrNHlDNUls?=
 =?utf-8?B?VlRlMHAwWHBydWhZbDVlRTg1Yi9ZWDRqaGJLVHpNa044TkJZMVNKSEo3dDBB?=
 =?utf-8?B?OCtQemczb21ORHBmWHE0Rk01Qld2SXVxRkJJZnpJRnhKSDhEbmRFYkxRQjJU?=
 =?utf-8?B?Q2cvYkpBU0hXemxURmplQ3UyNG81K1VURjNoR05RN2hoY0JTWkpsVlVROGNO?=
 =?utf-8?B?SzczL2N5SlVQK0tKR25uaHd0K1JTVlBBczJxOE5mdC8wSENhQW1lY2pwQXRN?=
 =?utf-8?Q?fGbkJgi0Rm4HRE1hrOvfvd8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e20015d9-5499-428b-75f1-08ddba25cf2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 11:36:10.8419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gsgYUCuyPbS8g0oVHZqHhSHifoopYiujlqqK6T+d7oq7RIMw4LYUwiLThCG2Kwfktg+nivizwv5lf5EfxyUEzzISV8TIl8olNC6tiLD9C0H3jN9Kd60fFDt5Kk8gZcqX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8189

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAzLCAyMDI1IDY6
NTUgUE0NCj4gVG86IExJIFFpbmd3dSA8UWluZy13dS5MaUBsZWljYS1nZW9zeXN0ZW1zLmNvbS5j
bj47IGxlZUBrZXJuZWwub3JnOw0KPiBwYXZlbEBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7
IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgbGludXgtbGVkc0B2
Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBHRU8tQ0hIRVItYnNwLWRldmVsb3BtZW50DQo+IDxi
c3AtZGV2ZWxvcG1lbnQuZ2VvQGxlaWNhLWdlb3N5c3RlbXMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIFY0IDEvMl0gZHQtYmluZGluZ3M6IGxlZHM6IHB3bTogYWRkIGVuYWJsZS1ncGlvcyBw
cm9wZXJ0eQ0KPiANCj4gVGhpcyBlbWFpbCBpcyBub3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2Ug
MzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1bCB3aGlsZQ0KPiBjbGlja2luZyBsaW5rcywg
b3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcgdG8gdGhpcyBlbWFpbC4NCj4gDQo+IA0K
PiBPbiAwMy8wNy8yMDI1IDEyOjI3LCBMSSBRaW5nd3Ugd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDMsIDIwMjUgNTo1
OSBQTQ0KPiA+PiBUbzogTEkgUWluZ3d1IDxRaW5nLXd1LkxpQGxlaWNhLWdlb3N5c3RlbXMuY29t
LmNuPjsgbGVlQGtlcm5lbC5vcmc7DQo+ID4+IHBhdmVsQGtlcm5lbC5vcmc7IHJvYmhAa2VybmVs
Lm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiA+PiBjb25vcitkdEBrZXJuZWwub3JnOyBsaW51
eC1sZWRzQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gY29ub3IrZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7DQo+ID4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6IEdFTy1D
SEhFUi1ic3AtZGV2ZWxvcG1lbnQNCj4gPj4gPGJzcC1kZXZlbG9wbWVudC5nZW9AbGVpY2EtZ2Vv
c3lzdGVtcy5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMS8yXSBkdC1iaW5kaW5n
czogbGVkczogcHdtOiBhZGQgZW5hYmxlLWdwaW9zDQo+ID4+IHByb3BlcnR5DQo+ID4+DQo+ID4+
IFRoaXMgZW1haWwgaXMgbm90IGZyb20gSGV4YWdvbuKAmXMgT2ZmaWNlIDM2NSBpbnN0YW5jZS4g
UGxlYXNlIGJlDQo+ID4+IGNhcmVmdWwgd2hpbGUgY2xpY2tpbmcgbGlua3MsIG9wZW5pbmcgYXR0
YWNobWVudHMsIG9yIHJlcGx5aW5nIHRvIHRoaXMgZW1haWwuDQo+IA0KPiBQbGVhc2UgZHJvcCB0
aGlzLCBpdCBpcyBub3QgcmVsZXZhbnQgaW4gdXBzdHJlYW0gZGlzY3Vzc2lvbnMuIFVzZSBub3Jt
YWwgZW1haWwNCj4gY2xpZW50IHdoaWNoIHdpbGwgbm90IHByb2R1Y2UgdXNlbGVzcyBoZWFkZXIg
YWJvdmUuDQo+IA0KPiANCj4gPj4NCj4gPj4NCj4gPj4gT24gMDMvMDcvMjAyNSAxMTozNCwgTEkg
UWluZ3d1IHdyb3RlOg0KPiA+Pj4gc29tZSBwd20gbGVkIGRyaXZlciBjaGlwcyBsaWtlIHRwczky
MzgwIHJlcXVpcmUgYSBzZXBhcmF0ZSBlbmFibGUNCj4gPj4+IHNpZ25hbA0KPiA+Pg0KPiA+PiBT
ZW50ZW5jZSBzdGFydHMgd2l0aCBjYXBpdGFsIGxldHRlci4NCj4gPj4NCj4gPj4gdHBzOTIzODAg
ZG9lcyBub3QgaGF2ZSBkZWRpY2F0ZWQgZW5hYmxlIHBpbi4gSXQgaGFzIFZERElPLCB3aGljaA0K
PiA+PiBzZXJ2ZXMgYWxzbyBlbmFibGUgcHVycG9zZSwgYnV0IGl0IGlzIGEgc3VwcGx5Lg0KPiA+
DQo+ID4gU28gdGhpcyBwYXRjaCBpcyB1bmFjY2VwdGFibGUgYW55d2F5Pw0KPiANCj4gSWYgeW91
IG1ha2UgdGhpcyBwYXRjaCBmb3IgdHBzOTIzODAsIEkgdGhpbmsgaXQgaXMgbm90IGNvcnJlY3Qu
IFlvdSBoYXZlIGVudGlyZQ0KPiBjb21taXQgbXNnIHRvIGV4cGxhaW4gdGhlIGhhcmR3YXJlIGFu
ZCBhbGwgdW51c3VhbCB0aGluZ3MuIEhhdmluZyBWRERJTyBhbmQNCj4gRU4gcGluIGlzIHVudXN1
YWwsIGJlY2F1c2UgeW91IGRvIG5vdCBzdXBwbHkgcG93ZXIgZGlyZWN0bHkgZnJvbSBHUElPcyBv
ZiBhIFNvQy4NCj4gQWxsIHRoaXMgc2hvdWxkIGJlIGV4cGxhaW5lZC4NCg0KVGhhbmsgeW91IGZv
ciB0aGUgZmVlZGJhY2ssIHdoYXQgYWJvdXQgcmVuYW1lIHRvIHBvd2VyLXN1cHBseSB3aXRoIHJl
Z3VsYXRvciBzdXBwb3J0ID8gDQpDb252ZXJ0IHRoaXMgcGF0Y2ggdG8gYWRkIHJlZ3VsYXRvciBz
dXBwb3J0IGluc3RlYWQgb2YgR1BJTywgdXNpbmcgInBvd2VyLXN1cHBseSIgcHJvcGVydHkgdG8g
Y29udHJvbCANCkxFRCBwb3dlciwgb3IgZHJvcCB0aGlzIHBhdGNoIGFuZCBnaXZlIHVwIHVwc3Ry
ZWFtLCBvciB3aGF0J3MgdGhlIGJldHRlciBmcm9tIHlvdXIgcG9pbnQgb2Ygdmlldz8NCmFwcHJl
Y2lhdGUgeW91ciBndWlkYW5jZSENCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg==

