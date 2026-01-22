Return-Path: <linux-leds+bounces-6698-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN9UO8jXcWk+MgAAu9opvQ
	(envelope-from <linux-leds+bounces-6698-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 08:54:48 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFE262B16
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 08:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B9464EC3C5
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 07:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC5E3BB9FF;
	Thu, 22 Jan 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jU+hZuiG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1762E374186;
	Thu, 22 Jan 2026 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068128; cv=fail; b=mWtalJGc+59uDHUlPkO8jj8YhbNfaLkvPtyAVsCR3P+5eRYAdPVv3claO/gOInUvHqXIoCdBOhzaLrkLPGUYMnCdxKDFQwU3YGo7kTUnecynBMjLO2Bub/IRPPB5SxtEZszYrUldjykc5kpRZJHh8tmeeVG9ZMQr1G5R4XXr0Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068128; c=relaxed/simple;
	bh=khIH2qfcdZRiiOZgHK6Dpub7r4lAcVA1k0hyW4Ivfq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DqzGY+J5H7HNUsIArHrCqngdOWrpb38ghdHStx1XcXY8Ae7ASRi1tQBhZGOcC/+JA7qnOHI4lUwtoqPuYvMV4qjEjgeusDzE0cXFjYS5Obhck48vRtlj1+QTpelIdYJOe1ZsuxWXepMkgq5pwMvqbqohqtMtQLWpuaLte8MFxUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jU+hZuiG; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M32E933981820;
	Thu, 22 Jan 2026 02:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=khIH2
	qfcdZRiiOZgHK6Dpub7r4lAcVA1k0hyW4Ivfq0=; b=jU+hZuiGiSnKrhzQDst/6
	6YbHJmX24FooGgnyfVnjDv5jz/lNF3+zHksQjphXELUlZIeDWAPX2mz0JbEWI6l+
	PoX8sgQgwaWoJ7VDpyQk8+zMXVQzJ7Xf19QkFPL9PQmVqxNRLuv2aRSNX3QCrN3C
	unAkrukoI8XM/HgvQwtlfIOmDyPg8Cn0N1wSZOcXYKijE1h2YFxYnDC6nZ0LX5Of
	lu4JRhtlDsH+7EriXGgeiPZgAS/BF0dwsuNIGYvvNHRTrUpoNw+lVclk395q7w8w
	1SZbPjUIdeDyv616YBxh4RlGkM5T2w815mWcJuI8erKFlucuwDMx/wCk4Q99+Gwk
	w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4btqvdw0h2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 02:48:36 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrhvV1+WILXrN1rYGUyIuFX7EotNZ2UzyBTLdmDNZ9arfvdOCc7i8cdNWpbOu7GTvr7U1ZQ+jfAMTc/G/N0EwdsRVtC953P3+9j/qB9TgR3S405iYBr+FMt36Cyc+f6sVSzMt55iuCDARcV6wnEAf1gpiQYqYC24JUWpVDhAnJHU8NytnRuEoFvB4VuZjHanAbz02SHc0Rmx2mZD6aowPX8dBaemsZim5t7P7DoKA8bED1/mSG2n6ENND3VcftoF+7+ZIQ7BKTKfHiJswkQggX8qH4w0tZ13sDHLUvE7EjNwsc0JUodmn1HbanByf22v4FaH/ojrPGpJ2WJwQznR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khIH2qfcdZRiiOZgHK6Dpub7r4lAcVA1k0hyW4Ivfq0=;
 b=C7z4NCSh8DquVlh3N90dahLb4GVsaT09Tr1Bu9UOl1uLv6GfnekDMd6707txZ5ubzgfVMXnpwRrKuiVQb08/9GeAxw7YelQ2ixaxL0q/uAcUcdglPRbwE2wl+lnzmjVOQxg8WvfXWIUkebrZ9Fd3Fc+ffbz2QqWNWgr1R++9HFyL1vFm05Qx3llLSosxWGT1YtNU8sQ92Nh6oKA0XA/rQThn2Ys8UHak0DKxP0pLweCufsKyq7avXg+bq57/8ukzVQuweh9YCHSyOaalHw2EcPdLtngurD77/Aql3eP5TbfoqhfuAIEfg4M2W0tQLCK8kZZdemuC5zfQRw8i01/2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by DS7PR03MB8266.namprd03.prod.outlook.com (2603:10b6:8:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 07:48:35 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%7]) with mapi id 15.20.9520.010; Thu, 22 Jan 2026
 07:48:34 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Index: AQHcic6tjFW+bcpmU0i2CxGvtjuC/7Vd0BCAgAADAjA=
Date: Thu, 22 Jan 2026 07:48:34 +0000
Message-ID:
 <PH0PR03MB65253C572A9567FEE3312FDFED97A@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com>
 <20260120-ltc3220-driver-v3-1-fef612ec4faa@analog.com>
 <c99aa76f-2a36-42f7-8394-8eb38078f236@kernel.org>
In-Reply-To: <c99aa76f-2a36-42f7-8394-8eb38078f236@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|DS7PR03MB8266:EE_
x-ms-office365-filtering-correlation-id: 239470e6-ac5b-4b7f-8dd2-08de598aa573
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TVJHUUNNaGJUbU5ieHFDSEJ2NHoxblZoVHQwcDVFclJMeGtHT0prZ0daUXVj?=
 =?utf-8?B?bTVuaHhNUnBWNlc1aVYvTm1OZEpiK3k1blZ6K0RKVW51TC9JMGRXdmFSK05h?=
 =?utf-8?B?RGh2U1pyWjNXSlk4SGo2Y21NSDdtVTVJUXBlcXhYL0hhMll1ZldOWkVrYy81?=
 =?utf-8?B?RHJld21wR0dRejJFcW9rbDQ5alpYdG9KM216Znp6OU9DdGRtN1JtamtKWWlS?=
 =?utf-8?B?YmtMVmhsTUNaL29iRGFYOE9rbStHb3EyTmdxT0lONUw4T0JvdEE3QWpITlI0?=
 =?utf-8?B?MkRaSzdzMGhlMkd2eWQ5dUZBVS9wR1g5bXg3S05Lc2tCNVVFNXVaVVF1OU9W?=
 =?utf-8?B?aWZaTFpDV0FyY1pYRWNuRmJTYmVLVm8zR1lKWjRLQ3Z1R1BlVDV5TEpaRnJL?=
 =?utf-8?B?L09mVTJ0Skk2ZUhnaFR6MW5HN3lQdjRMTUZPVGhtVWhWK2g0dVhIZHNPTVBa?=
 =?utf-8?B?WVNXUzEwM2t5OXQvVXkzTmxxODV5QnBGSUtiNGhHT0F5aXoyVVlBMzFKWURE?=
 =?utf-8?B?YkpLeVRkSmFLUVpyNDZpWnE0SS9HZVFHSlFIcEk4aG9POGFQM21tS1BrU0hS?=
 =?utf-8?B?Q2dxRE0yK2RGTFR5TWF3QnpWcG95NlpEK1ZkNzlLbmNmczBjeERLT1Rick01?=
 =?utf-8?B?bExJQ0NvbWhzUnlUUW92dktEb2NWWHZiV3lIT3d3Ujg0S1hrd004bVRRWFV1?=
 =?utf-8?B?bnpmWjA1ZGhYRU83Z25ZaG1IcUM0ZVdrMUVDNzhJdlZoM1lMRUJWNFBvcmd6?=
 =?utf-8?B?MXV0RjVKVHZyNGpkSzUvY1lFRWM0ZXFEV1RhQmlFYm9Kd0xFaTdHdE5qaTRU?=
 =?utf-8?B?NGlRS0J0YVJqRUpQZWVKOGZUbVFWVi9MYkdubzJPUVUwQ21GRzJzejdLUk5B?=
 =?utf-8?B?cEQ5RFU1Ykdpem8rNzFpS0s3aE5lWFN1NmY5VVh4bjNhc0VlTDZmQTlCUDBo?=
 =?utf-8?B?akFnQmhZOEM4SnpLMkR3MFBzVm1aK1M0TUFVT2NKakhMZEF5dmNBaVhxMkhL?=
 =?utf-8?B?UVpuYmlHb00xQTRDWnpDcDZhRUV6YzMxSFJYdmJNK3JQT0ViYW8rMzg2UHNX?=
 =?utf-8?B?YXkwK3lWcEFrVTRhWXF6Y2xzeWpmSGh1TUZDbCsyZ1lPYTZiOTk5anZ4ME8r?=
 =?utf-8?B?Qnh5MmhIQ3FpcTNzNUVKNVhBbGE2UjlGVFRXT0JyYThDOS9oeG1VNXFGVmd0?=
 =?utf-8?B?MFVxdmZJeEZiUHdicHN0YnFDRld6N2k4cHFpMitGMGtwd3VOQ2pMaXNNWENy?=
 =?utf-8?B?Sm1JMDdZRVZXSGQyU1ZyVktldFo0ejdRdExKcnZ3R2IvZWJESUJGalRrODl6?=
 =?utf-8?B?R0kvSk1SVlZWTGNBSVlmQm4xZ1l0Y2RPeGR2ZFAyVW9sT0w1b0YwaUxNdC8x?=
 =?utf-8?B?ekovZ200MHRpV0NEUkk1Q2Z1Y1l4dDJlMWEweXY4VSs1bzdBRHl1dTBwaEFp?=
 =?utf-8?B?bG9vZGtMWGlmU0c0dWdPclozR3pDMVZFSTVZQW9naHh6Q1ZTbklrdGdwT290?=
 =?utf-8?B?OENaOUl0QU9NVm5wQ1Z6Sk1reDFLMUkzZ3hwMWJWczg0b2ZscWViTEVueWFZ?=
 =?utf-8?B?Q0pxbzV5anFKT1VGTjhPTkxXaWoxUks0elp4dXpqZ09Qb1c4QnR4bnNRWUlT?=
 =?utf-8?B?cmxVWHZKWUR1cHlyZ0QxM1hOYStwbWFRYWZsaXBmd3RnSkNXQU1Fb2JMS0xi?=
 =?utf-8?B?YnIvMkwwUDIxUENoNEpZY1p2d25oTFFDbU9FMWFBaWRZQTZ4VG1hZlNRMDZ6?=
 =?utf-8?B?MndTN0tUNDU2Z3FuaUdzZXpzM1NoWVV6b3N5WnJUK3VRM1dLNlRYL0VYaG84?=
 =?utf-8?B?QVdBSHdxUElHbG1Kc3BRWVpaaFNnWWE2YlMyRHNaNnU1ZE1BNXUrb25pdEdM?=
 =?utf-8?B?UTdhSUdVQk85UVRqOURHdjhaMnhpUGwvNlI4ME1BUkRBZmYvMHZzbEJrUzVm?=
 =?utf-8?B?TEZTK3c5Y0g5RHJDbmNwbW1DeUh1MDhsZWpyaE5sc2EyNDFqRUVZTXk0NTht?=
 =?utf-8?B?RmtPUGtoRStkeDFBa0pUNEFaYWV2Q2RVMy94WUc1TnQ2MlY1TVZudWM5MHBW?=
 =?utf-8?B?MWRXOXJtVDRjUXkvRk5ObmdCUkdKUDE3bk9TWjN1K3FiTFZQUmtsSVNyc3lq?=
 =?utf-8?B?dFE0anZJNHdseVcyaHlMaER6SDNKd1QrWDhjS2ZFaFR0N3dXeStCUDl6S0JP?=
 =?utf-8?Q?VGhwycxvjhqCTFnaSK2g4ik=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amZtaFluNEJXMVpXVm1zZ3hiYjdFYllReUZLQUV5dXRPSk5hOHZYNGdJSnJl?=
 =?utf-8?B?djNPUHFGOXU2SjBQNS9ZOFAzb21pRm1aUTdPdFhBY0sxODhQYWxUbzYrOElR?=
 =?utf-8?B?eENoeGNWNTQxckVTMTBsalJ0MklwR1E2emc5NUxIYlRjdEJzUklRN1Y3ek9I?=
 =?utf-8?B?QWRkSENuempUVisydlIrdzlPVTRublpubWZkNk02OUNacjRQRGM4QWNyVGFr?=
 =?utf-8?B?aW9kbUlaeW9rdThqalNrZjRiZm9taTgvY21mV2RkbEltWHhXTFNzSzUzVk1u?=
 =?utf-8?B?bVg0VmNlTHUxU2RDa3Z5VU5rZ3MvaFRMTEFZY0xVYXpGT2ZxM0p0MFMrVWRC?=
 =?utf-8?B?ejg4ZEFrL0ZRVW91c2FCbk1zNndXR2lHVDY5QmF4S0tjd01STWJreUxyWWtF?=
 =?utf-8?B?WVN2alBFZDZYMHRCTkxVRXc2OEtKYkNuTFEzdmZ2NXdsMWpLaGFORHJzRUdv?=
 =?utf-8?B?U3dRMmN6aHhMZ1dvN01JR3NpVk5WTEdQcG8vNFN2SkNIMFMrTzRROTBUbVFW?=
 =?utf-8?B?UzdpVkREeDNXZVBZMjRCNVlqR2ExMHc2M1FPMEdsQWo2NWl5aE9Lc3YxT1BD?=
 =?utf-8?B?bTdMa0ZSdjR3eWtoRW93d1JSc3oyQXYzT3BIWHA2ZGFvTUYyUml5dVkrUXlL?=
 =?utf-8?B?ZysvUWl4OE9aRnU5SGl0YXNGVllMRWlXOW5yUHcvY0VJNUVnSkpDZTkyZTRK?=
 =?utf-8?B?NlBaVmkwenN0SVNhY3NUaTdqR1JBZ2YyanRCRGlrcEowdzdlVHU5VXVIUmFx?=
 =?utf-8?B?NkYrYy9EOVJTN0dmMjVjYWZaZmtCWWhKeXRjdkc4akRMYzhaemJheTRBUnhz?=
 =?utf-8?B?OUdET3hDTDl2RjRxVWh1MEoyeDVLQ3V4VDNJdk1UbDhBSjlHYUlLUDB2aGhw?=
 =?utf-8?B?WHZOU3NPNHk0bE1aVVpGcmE3QnZEdTRESGVEb05URm1nY3RSRXFOQXBEOXFy?=
 =?utf-8?B?d3VlTmpTWk1YV2FjUFhkMlBZVU1OeGJHei9DNmpuNEdhbmg4dGtrVVVOd3R4?=
 =?utf-8?B?aGtldHF6cUdSUElGS2VWT1pvd2kxc21RUEkwZTJjRnkrNTNyQ0RrTFBVR1JE?=
 =?utf-8?B?ZmE2UXJlY3J4TytQYXg1b21tMmJISjdXZzJvZzB6SU5PdDZ4eEZYbjN1QjAr?=
 =?utf-8?B?NFVDQVRWVnJNRTR1bWZ1YTliRC9wRTkvNzErelo1NFNrZUZFTzBRMUhKVG4v?=
 =?utf-8?B?T2NkTXlZTWRUNWcwK3ZlVkV1bU5OT0tNMW14TTZnVjVDWSsySnFuNGNoZmU2?=
 =?utf-8?B?K3haWjdWOGY5UzVGUGptamQwcVpuZ01CQ0l2QmVSL0xJdUVUR1B3aHlKU0s2?=
 =?utf-8?B?bTFodkFiYVN0R0xyTnNNcGlzbnlSUDBQSC9RdGZIZGlRbXNQbXdMK0huWWhp?=
 =?utf-8?B?SXoxd0xzTWVzcW05UXgvWmk1aDJ6S1ZkN1N6NjZKNVdkcVpLUWpwY1krY2l4?=
 =?utf-8?B?eDd0YjNYb1V1a240VjBOOHhiL3EyeDVTY0o4Z01hVkRZSmRrRERGTDQraFhO?=
 =?utf-8?B?NzhiZ0FWTzR2eVZudld2Q05NWk80REhJRDh6RHZFbjg3T2hialV4Wk1ocmo2?=
 =?utf-8?B?QlVWcXlxS253UWQxdk1jbXpHYklKeVNDbi9yRWM2NjU1Q1VnaEtaTE1iVEFm?=
 =?utf-8?B?WE1aR1YvdFNCbmpmNEREM3J5UXZvRmNoUUY0YkVYZzljbk9uS3pIMDRqWUlG?=
 =?utf-8?B?OTZxUWE1L3ozbEdScEl3VGx1bXgzTXBOWWM0Vm83Y1hNRmtQVTQxaHBuRFc1?=
 =?utf-8?B?TTBZQnk0VFY0VjVhT3lkMnRmY1VKWmQzWVlxc2dxTVNmMEtRZ0pPZ1FaWXlI?=
 =?utf-8?B?WGdnUEt0dHNYK3FVaHNGbHZIT3F2NHNzNmtSQnBNc0lMelVhb29JbnI1cUF0?=
 =?utf-8?B?UE4xK1ByS0J4ZmhUaVFyZ0MrdW9qNE8xNTc2S085MWp6K3JkaktTZm1YUXlh?=
 =?utf-8?B?UExqalpUaVBqRXhZWE45bkcxQnFiM1UvVVg4STlJYVNhQm0wRk80UzFDR1NX?=
 =?utf-8?B?QzB0SXlHVzJLSkl2UldXczhiZUE1eWNCejZzblFMSTJIK3I2VVRWdTJJYUM3?=
 =?utf-8?B?QURqNVFPa1ErVEdlY0Mxek5pLytLYis3V05uNFQydWNuYUFMRW1ER1JEV0hS?=
 =?utf-8?B?STVLaUY3ellPcGhmY2tYQUh3SitrRFJ3RDVkckNhRzZsUElUT0xaMXppTFhE?=
 =?utf-8?B?UlNyT3ltckJvSDBGLyt6VXdUc0x3YzdXMEpjVW5wWjMzYmVpc0FNVnNpVlVP?=
 =?utf-8?B?SmhLUHhOeGFTcTJTczFKNklTSUd3cmp1RVRhNVNxb2NOVDF3YzNGcjVIM2pB?=
 =?utf-8?B?SEZ4bVk4ZnZ3V09aMGFRUEFaaCsrczlMZzJuUmdvQXFUQTh6NnVtZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6525.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239470e6-ac5b-4b7f-8dd2-08de598aa573
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 07:48:34.8867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJYdEWw3/12DQPE37tv7/Bk2NpQMJZQo68v/KzUDnRHPqLheOoPfaGSsoBBqwK9BxNkpT9vRT/94g9JzOs35bvkIJe1CdeOMM9Z60R5Ft+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8266
X-Authority-Analysis: v=2.4 cv=O8E0fR9W c=1 sm=1 tr=0 ts=6971d654 cx=c_pps
 a=QHQ/c+VJRs0sJIezHEQ2hg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8
 a=m06XID_fvevRdxtvxlwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Qg021tcK2F4NCmJEqSANDzGbKFmFovZa
X-Proofpoint-ORIG-GUID: Qg021tcK2F4NCmJEqSANDzGbKFmFovZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1MCBTYWx0ZWRfX0/+/X18OkzPp
 lHw06JzsMS9lN41uwaWQVZm2/psIUVyii6fCH1bBXNPly8sj2uCRxcGaAAMkaK5c1pzgQZsMo24
 KQXoJCPvW5aCf4XZ+rFzw8ZcTHFIyiCBKTsoKzoqBnQ5W094+PkvWOeAqtZSaA4oaKZ7+zH4t5J
 aTutPWFNuEl+F+PhvmJv1M7JHWguakmWt+wAOOjTxSpyR6lMxO2HaFNqvsH6x0bDjLvktwha10w
 452SuqIHpAg3txLtCLrYNuzXAJxyODT455pxcqOQiTjNmaDH+xIHxJsJNfcqROBgkKpqyhAFXHs
 nlC9Z/09b5+4NbnSHZdsNqfw/uCwMr/0+RlFrcEyPZmjB8H1ALBZv4tHbN7KONI2FuJR3WborVA
 JHMRNRIt/5cgoI9QfVv9/KBLC4OxjrvG7gZs+d52q42hbKYmWzuy+3o975ubdhw2F42O3PUM3WJ
 FZBsyFaQ2RpS8PSMjZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6698-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,analog.com:email,analog.com:dkim,PH0PR03MB6525.namprd03.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[analog.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FFE262B16
X-Rspamd-Action: no action

PiBPbiAyMC8wMS8yMDI2IDA2OjM1LCBFZGVsd2Vpc2UgRXNjYWxhIHdyb3RlOg0KPiA+IERvY3Vt
ZW50IGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgTFRDMzIyMCAxOC1jaGFubmVsIExFRCBk
cml2ZXINCj4gPiB3aXRoIEkyQyBpbnRlcmZhY2UsIGluZGl2aWR1YWwgYnJpZ2h0bmVzcyBjb250
cm9sLCBhbmQNCj4gPiBoYXJkd2FyZS1hc3Npc3RlZCBibGluay9ncmFkYXRpb24gZmVhdHVyZXMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBFZGVsd2Vpc2UgRXNjYWxhIDxlZGVsd2Vpc2UuZXNj
YWxhQGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvbGVkcy1sdGMzMjIwLnlhbWwgICAgIHwgMTIwDQo+ICsrKysrKysrKysrKysrKysrKysrKw0K
PiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNyArKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspDQo+IA0KPiAN
Cj4gUGxlYXNlIGdvIHRvIHYxIGFuZCBpbXBsZW1lbnQgQUxMIGNvbW1lbnRzLg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSSdsbCByZWNoZWNrIGFsbCBjb21tZW50cywgYXBv
bG9naWVzIGZvciBtaXNzaW5nIHRoZSBmaWxlbmFtZSBjb21tZW50DQoNCkJlc3QgUmVnYXJkcywN
CkVkZWx3ZWlzZSBFc2NhbGENCg==

