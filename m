Return-Path: <linux-leds+bounces-4978-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF4AF6DB3
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 10:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D54A67AB614
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 08:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C463B2D29D7;
	Thu,  3 Jul 2025 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="Uy+XZsfD"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE02D29B1;
	Thu,  3 Jul 2025 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532778; cv=fail; b=W8kU7CETDsPmQmoGfR25veuyrM1t0OY3xT7mawSJSrcMLTKgG709v84yPc0Zp/a5sWfS0fz5i3Ey3wcbnN5TCMvAgtZxQc+7QgRQK8cq6HE/TUlzOoDp1/qzSOlBR7syHb01jlbP9VGp3s2BmvYucE9O5HQX0qt7pamSqdKJGhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532778; c=relaxed/simple;
	bh=fQWkJ1axOeN4jlMDtG5tGA/zgCERvn9cWvUumpkc8cs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lPyLc27KzpwEE05WeRmrVKhcVO6rjQui+2ipd8g67JnkT1RFVeTmbrpq8qzzQ0w7isZBLBHi8n/Uo/Q7McL9RGDGzdXCL00gn+9v3XKvxh/MYKptUS/Qhub4TRAL0llEE0wfZxDyX9WxDLQlswYHjsccC5F9lFdxO+bH1yAkpf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=Uy+XZsfD; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXB/IGfFI91nXBBszYx1abPjvJoPQrPKrwjCebTMUmtb9DSrRQ4K76BETB2i2DUyiuwiDMGcCwIDi2sbkbg2n8jEEo7IkH8hZAw6qHsHmGlIzuth869StsPkdUyp5iGJWr0Fnm4jfr9hAtbcya/Bhx09DzbazvuNyCUdHv+rgetsGH9CaKfp1lUw0+EYC4A26UptykTbq5M4RBpZ544aM/EXl3zP6XkBWirGB2Bg8AM7Wa1AqZHk6WUbp9DSo/ZVPpER49myeRglK+CK/fluj6zc3XXTkgyNGImhIEGloJllsbm0EpeOlp9MKjDnC9pWXfxRI96mrxmkZ6hg47fUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQWkJ1axOeN4jlMDtG5tGA/zgCERvn9cWvUumpkc8cs=;
 b=CjANjH4xcza1B6Z6qTGRmHu0Zx1c1fm5mydEMGh/HvVzWocq6a4rq11vvdxI+N79Arnb+2L1sIWSzVU5bfCEORtB8DIZAiEsMoqhclAvHNt1w9IH85WuXqWU9MWCpoFGqD10VlczCF2t+v7vmfC9P3dEJoq3OT8BmpSswubprWW2klYD8+9MXsQIpypZ2yNh6yXW87nQOm/pjIuYymM6by372CgGaE5R/eTM4WDnc/GfMTxFJdPIruV5JNHJjo21WJ1IbhdNmI2wMFVi8Kz8sv7CjCeHfa465hhe0P9aV4OmoPfzgo8/mKti2RmrssXSRcapkZML9pPuH5c6GA8p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQWkJ1axOeN4jlMDtG5tGA/zgCERvn9cWvUumpkc8cs=;
 b=Uy+XZsfDpxfv//S112QEa0GnV69+v+V+sbB9XwaG2/f9AJz3k1g2KEx2JNaeYDbR29qEADGBP4Kf+KlwPaz1IQL/g3BdKAS7dE5yrc2eEF5uhO0yTEx9MRSJSVQ6TPoMbOh9L62h04vZb9l/JuLT1QJCeEgQSVEi4/VAtma2mYg=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by PAXPR06MB7661.eurprd06.prod.outlook.com (2603:10a6:102:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 08:52:51 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8880.024; Thu, 3 Jul 2025
 08:52:51 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Rob Herring (Arm)"
	<robh@kernel.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>, "lee@kernel.org"
	<lee@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: RE: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Thread-Topic: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Thread-Index: AQHb60cttvgZtWYm/0as3a8q/wD+07Qe09mAgADxulCAADdRgIAAG4kQ
Date: Thu, 3 Jul 2025 08:52:51 +0000
Message-ID:
 <AM9PR06MB7955DCFFBADEF3A56A923D92D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250702114759.223925-1-Qing-wu.Li@leica-geosystems.com.cn>
 <175146290821.1131432.4001907939183416459.robh@kernel.org>
 <AM9PR06MB79557F8FFA113011C4D824D6D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <e98aa9ed-2d32-4db2-b7f2-a5e5ce1d1d84@kernel.org>
In-Reply-To: <e98aa9ed-2d32-4db2-b7f2-a5e5ce1d1d84@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|PAXPR06MB7661:EE_
x-ms-office365-filtering-correlation-id: d50d1438-20e8-421e-81bc-08ddba0efe74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnUrRkhkMEtaV3QrL1JPejB3TGs3V25ZSWJWQzdpTHppOWd5QllTdWtNWGZQ?=
 =?utf-8?B?ank2UXFBRkxBVWJaT2NEa3lSOUF0TUJ3azJiMTJ2dlZLUmRCMkRmTlFNS1V5?=
 =?utf-8?B?dDJZWi91NlZCWmRnc095T2RIQ1NidXIvOTNvRWhMbjYvbVFqMnFpczVEelN1?=
 =?utf-8?B?eVRRcnl2dURTZ2lUdlJCZnlpeE1BT1Q2Vm1rclM5bHlVelZ6R0RaOC9GaERu?=
 =?utf-8?B?ckhMVWlhTVVIZHhEK0V3MnBURGM3amJ2d1g2YWRmUjVhRDdtQkd6UmJmZ091?=
 =?utf-8?B?NENoOFd4cU5uNlFHYkdjZ0hLNlVRdkpncXUzclA2eWJ1K0RrMzVQVEdrdGNu?=
 =?utf-8?B?QmM3Y2l5UE1RM1RrV1dqVHphRUhRZ2QyOW4xRFY2cFpLSjVGUE4yOUN3b1Ji?=
 =?utf-8?B?OWpNTnp1djRONll4WXpLUk5tcG9lYkZNKzNLa0NnU3ppSmhiRFlrU01UYTJP?=
 =?utf-8?B?NUo0bmhxaXQ0aWFpL0hESE5ZN0FmelVWZlNkUmpTRk05aVJjR0hZNVhrOWtW?=
 =?utf-8?B?Q2VUVW9POW44YzlBd0tUR2M1NmNwUkJEaEprL0JzRzh5UVRtZ3JmOEs2d3BP?=
 =?utf-8?B?NFhjQ0FFQ2hrKy85bXZ6TzJodmcvdTRZekJNTTU4UFVDbC96cnY1bnRTYnpq?=
 =?utf-8?B?R0ozL0NsL0V3a0pTUGdoZitXbDNNNE96NTNWa0RSQkpZcFZzT1BGY0wwUWFa?=
 =?utf-8?B?N1NQRms0aDlhUlVBVnBjekxKVFE1Z3g2anpLTyswU3U4SGtrNUZvbURNL3lu?=
 =?utf-8?B?cHJRMEt3bkV6S09QRkNjR2F0cXFNQjcvR2pJZnhYZmt6a3kxd1Era0VFTDFJ?=
 =?utf-8?B?VlAzTVZzRHFFK0JJR2cremFlNG1ycmgwdEtCelF4V3pOTVlPYnJxT0hBeDNz?=
 =?utf-8?B?dk5LZTAyMjgycHE3cFVLRllZUWI2TlRIL05oMnpYR1Rib1hjS2pSQVFIemtl?=
 =?utf-8?B?SWx0YlZpNlRxTkxoK0hzeUl6QXBtejZZTlpVcDhrelFOT0xvZ1VUVEw4bmJP?=
 =?utf-8?B?Nk9DTlNaRkZBS0JMUmx3VWZTSktTV1REWmZWL1NpNVlzenJGaWJKUEVwNlVl?=
 =?utf-8?B?a2phOUxjOGtTTUpSOWNCdk4wcmtwa3F4Z1pma1k4VzZPdWxqV1JNczdMQ3NZ?=
 =?utf-8?B?QXRydGpxanNvK0hGbTBCZjEwVTFBNlFPaUQ1M1RTek8rM2MrdFhrRzRrRm1J?=
 =?utf-8?B?NzA3SFY4VElHVUIwRmg0VForVTh2djFTc1kveExFRnZ1K3c1TDBIdGJtb2Ri?=
 =?utf-8?B?Y3pPL3o5SUpVNytQbVk5Wlh2Zm0vN3B4aFdiWkgxcjJnc1dPcUZMZHhjMDVv?=
 =?utf-8?B?dHhkbVlvZjlLNXBhQTJsVVIwQ2hiN1QzYk1uSGltemNiOVdWTFdYekk5eEZT?=
 =?utf-8?B?WHBaeU9mVXFhVGJWbnJBUUllWWFTVDlpa1pPSDIyRWQ4djlYaklPK01zeXhK?=
 =?utf-8?B?Zi9KRjlwOFpSSGpZam1xZTR0YlFISThMY29TSEFkb0ZyV1gzT0EvMzlYcVNv?=
 =?utf-8?B?Q2pvdFA3UVZuUzRxSC94WGl6UWRPR0g4azhQZm15Ymt3Y1p3YloxUk43UXJs?=
 =?utf-8?B?amU3OXNZUnJuY0J0aC92T0F3YmFqcjlwV29pQTQ4UWRJOVBheUdXNkR1eFB6?=
 =?utf-8?B?M0xMTnZaNHJtSW5ZSFhHMkYwUUoxdVdZcnVzalgvZ3V3bXlISU83R1NRZ0E5?=
 =?utf-8?B?bEMvYVd0QjlaZDBqVER3bFFESmd4TkdsZElDMXM0cnlOKzZITHZyU0owV0lw?=
 =?utf-8?B?WC9qY3VIK3grbTlqNUowTXZiYWNkaEVEZFljMWVBeXc3TEJXZ2JzZmFZLzdi?=
 =?utf-8?B?UFYxZHNsb2J3S1ErKy9PMXQ3RTlRT2JUaVZ4QTRjbkFhakJoWTZzNW1kQlJv?=
 =?utf-8?B?bXFpc3FGdTZ2WW9mQVYwb3BVREhSeTdrNU5LOStxaEhQZ0pNa1U4Y0J1Y3Zr?=
 =?utf-8?B?S0ZIS0NuZlMyNUdjUmF6dkJXTG1NRUR5dHViZ3p6Y0puTFBKbEd5VHBTRDRJ?=
 =?utf-8?Q?F1LOiIUTKYgTLT2isr+Dp8Jt+KpPOM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFJBeHQyZEFVTUxIZzNOQUU2OFNtY2lXaFN2OWtsSWVEeEdLQjJNVDI0aitv?=
 =?utf-8?B?SkMrb1Z2SjhlYWNtUW5lbGozWHRGK1QybnZUajNwa21Rb2NJYklTcTJSelkx?=
 =?utf-8?B?aDk0dndEcWkxWXY2cmhNbzE4Yy9iMEV0ZW5jK1ZQWnJUTGZsU0lGV0JDMld5?=
 =?utf-8?B?dEFaWVZkdkVmclJZSDZBVzcyQW5GRlA3OHRGR1FqRmRNeHZYdEQ4ZlphME9N?=
 =?utf-8?B?akVFZ2FEaWUzdE5mVUZ6MWR2SlZlbysva2ZoOGk0elFaSDUydmpkRmxveEFJ?=
 =?utf-8?B?RVBNb2QvYXhXR280YS9oWVVmdnJNa2ZKM3VRTGlwcVptTFpIV3RyQVNzbmRG?=
 =?utf-8?B?UWdaU1ZNUDJxTHAzQlYzTTRXemdKODJOcjRVTUxSWm43cUgyTlB3V2phVUFu?=
 =?utf-8?B?bHdLc2VOalludHlaOFpEK1l2SWlnOGVlbjBKN2k0R0ZRd2RQSEJrNmZ2NXhB?=
 =?utf-8?B?YmdUd2wwS3k5WGNDQmNUUitYcnpEQU5Pb2o2RkJwOWs5N0lNYWxUUUxudk9D?=
 =?utf-8?B?cEFDeXhaMEZWUG91Tlh0dUNObUdnV0cwUGxEYXVPMTgyODFzRHdzbWRrVlB0?=
 =?utf-8?B?RzZwL2hrTHZPTzJDaUg4K1htbkMvQnVsTDFqUDRRdW9DeFJuUWt4QTBQQnlX?=
 =?utf-8?B?WDlWdUQ2VDRvWWJQT2Y5WDg0SGFVSDNBcGJTNnZ2eVFtaU5ON0NqVGdHR0xs?=
 =?utf-8?B?R21MMytCTWk5dkJjdjdOZkoyZmVvTG11WFZJS2kvV3g4WVIrdThseVpTTXFV?=
 =?utf-8?B?cDludjJCR0UzNzZLN25VaWFYaGpXQlJvNW1sWVdxdnF3b0hEV1NKdzZxYVhi?=
 =?utf-8?B?Y1VGUzFYdFVlMjZSdmt4dzZOakhRK0RpUjBXZ2RyYVovdWQ4aEJaTFBLREVS?=
 =?utf-8?B?Vml5U2t4MjlreEdYb0FNMHV1NlBiZTg5QlJQOGVVTUpQTFpyY1BVK0JlT3Vu?=
 =?utf-8?B?dng0MTdCYUtJdzBvbllxZHA0MVc3OEZmZVZPeUsxS3dhWDd0NzJ0Y3UrbWUr?=
 =?utf-8?B?c2x0NWhob213eHd5OTNSTzdrYUZNczhvU0E5VzJtajkxajhSZmVyOTJtMGll?=
 =?utf-8?B?K1lkN3JvL1VJaHZGSDdKV3BpRGszb0ZmdjZWYzV3U3JYay9DdUhJTU5VN3dl?=
 =?utf-8?B?dFkwUGRXeS9DOGFRaDNzRlBvcjI2UnRxMXlwUmUzQnhrR3pGYnJhMGJqdnQ1?=
 =?utf-8?B?bHRwVURoWk5TditvRGcvdG5ZTjFKRllJbU1qTCsrQWNjZCtteXhZWDhEZlB1?=
 =?utf-8?B?QlFDMVRxSzUwZk0wS0JVRFdyRCtkT3lwSGRFbXdmL2pQZlZZYzJ3aU4zZDJr?=
 =?utf-8?B?a09oYnc4MkJoQW1oTk9ZN3REa1E1czVKa0NpVGpCQ3Y4eUR4SDJBeGo3VUdy?=
 =?utf-8?B?aHhnbjVqTzNCY1lpWGNNc3ptckI2dHhxRDJENFlaQk96bURWaWpHVFZrOUFx?=
 =?utf-8?B?aStHQmdHbUVCa3hITDZZbXBFenpTTy9NVmxUU2N6MnBxc2xxNGtKampLRFVt?=
 =?utf-8?B?enZ0cWxrdm1teTJNQ0RKUmZCZjRhQXdRM1NKMUlNQ0wyYWRjMVN6T0lZVFNR?=
 =?utf-8?B?a0VSZFNKU1RMdUplbFZXMXdZelNnTzZ1aEw0Wkd2eTFVSy9HZGxKclpOS2J5?=
 =?utf-8?B?WDRqcWIvaFAzV0pmSzdqMk84RHdhbXpMRHhGdFBoTENTb25MNFpvay9Bak50?=
 =?utf-8?B?Rys0S29LVkxrWGFqRE8wUHd5QzJBd2JjQklHZlFYaDRZSXVFd1JzUjVNQk81?=
 =?utf-8?B?ZnJrQkxtL3hva0p0b2VndDlhQnNOYllSMVk1UERsM0xuckhwbEh2ZHlsK05H?=
 =?utf-8?B?OGNIZEdTWGplYUZwd2pic1hZay9CYUg2THFqSXk1MnVQbzIwQjgyeXh5UFFu?=
 =?utf-8?B?UVhPaG1WeHpsNXUwU0xjY0crdjV2Yk5WdHZ4YWV4THoxcTdHK0pEZExJN2hp?=
 =?utf-8?B?d1ZFbmlCTlk1d1M3cU5TNnJTU0l2VzJyeWh3RGVnempaMWJ4KzFOWExKUE5U?=
 =?utf-8?B?U1VkUFFQT25wTDFKWEZGaDlIRzNSTEE2Tldqc2N1Y0h1aGJ3eFhZVGpLc0xk?=
 =?utf-8?B?ZzAxb0hXSVllQUtHWUpra1dURlErYjBHL1Jma1RLekMrWlNhWmJjYTFzd0tJ?=
 =?utf-8?B?N2hxYm5qMEgyd09FN1hKbDUwbkR1Y0tXdkYzMDFCTVdnZlVrOTVVWXp0K3dC?=
 =?utf-8?Q?1jH7IG5jwUD6VoRZ7ThOOTQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d50d1438-20e8-421e-81bc-08ddba0efe74
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 08:52:51.7669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwgDSsTGLGvpfDyyNooli0Z4opzw+cJeHJ3yASZSt6EAGaTSrrz18679X0ooKGuRvJfpG26zwLnop18PzVHfMv1uWsglWenPh18bMJuXM3g1hX7askkwrWmBLHa+OvHe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7661

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAzLCAyMDI1IDM6
MTIgUE0NCj4gVG86IExJIFFpbmd3dSA8UWluZy13dS5MaUBsZWljYS1nZW9zeXN0ZW1zLmNvbS5j
bj47IFJvYiBIZXJyaW5nIChBcm0pDQo+IDxyb2JoQGtlcm5lbC5vcmc+DQo+IENjOiBrcnprK2R0
QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7DQo+IEdFTy1DSEhFUi1ic3AtZGV2ZWxvcG1lbnQgPGJzcC1kZXZlbG9wbWVudC5nZW9A
bGVpY2EtZ2Vvc3lzdGVtcy5jb20+Ow0KPiBsZWVAa2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IHBhdmVsQGtlcm5lbC5vcmc7DQo+IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSBkdC1iaW5kaW5nczogbGVkczogcHdt
OiBBZGQgZW5hYmxlLWdwaW9zIHByb3BlcnR5DQo+IA0KPiBUaGlzIGVtYWlsIGlzIG5vdCBmcm9t
IEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFzZSBiZSBjYXJlZnVsIHdoaWxl
DQo+IGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBvciByZXBseWluZyB0byB0
aGlzIGVtYWlsLg0KPiANCj4gDQo+IE9uIDAzLzA3LzIwMjUgMDU6NTQsIExJIFFpbmd3dSB3cm90
ZToNCj4gPj4NCj4gPj4gT24gV2VkLCAwMiBKdWwgMjAyNSAxOTo0Nzo1OCArMDgwMCwgTEkgUWlu
Z3d1IHdyb3RlOg0KPiA+Pj4gU29tZSBQV00gTEVEIGNoaXBzIGhhdmUgYSBkZWRpY2F0ZWQgZW5h
YmxlIEdQSU8uDQo+ID4+PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBzdXBwb3J0IHRvIHNwZWNpZnkg
c3VjaCBHUElPLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IExJIFFpbmd3dSA8UWluZy13
dS5MaUBsZWljYS1nZW9zeXN0ZW1zLmNvbS5jbj4NCj4gPj4+IC0tLQ0KPiA+Pj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtcHdtLnlhbWwgfCA4ICsrKysrKysr
DQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4NCj4g
Pj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9u
IHlvdXIgcGF0Y2g6DQo+ID4+DQo+ID4+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4gPj4g
Li9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3bS55YW1sOjQ0
OjIxOiBbZXJyb3JdDQo+ID4+IGVtcHR5IHZhbHVlIGluIGJsb2NrIG1hcHBpbmcgKGVtcHR5LXZh
bHVlcykNCj4gPg0KPiA+IEZpeGVkIGluIFYzDQo+IA0KPiBTbyB5b3VyIGFuc3dlciB0byBteSAi
bmV2ZXIgdGVzdGVkIiB3YXMgdG8gc2VuZCBhZ2FpbiB0aGUgc2FtZSBhcyB2MiBhbmQgc3RpbGwN
Cj4gbm90IHRlc3RlZD8NCg0KTm9wLCAgIkZpeGVkIGluIFYzIiBhbnN3ZXIgImJvdCBmb3VuZCBl
cnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyINClRlc3RpbmcgaW5mbyBjb21l
cyBsYXRlciBpbiB2NA0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

