Return-Path: <linux-leds+bounces-8985-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I4VFCcf1TmocXwIAu9opvQ
	(envelope-from <linux-leds+bounces-8985-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 03:13:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E172BA01
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 03:13:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=ZcdHYvAH;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8985-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8985-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 669A3303CC11
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 01:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA437F755;
	Thu,  9 Jul 2026 01:12:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCF1B4224;
	Thu,  9 Jul 2026 01:12:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559567; cv=fail; b=WD7Wh3oi3r2RQ22+PrV6e8XSdziqvS6C9+HdTuoVj0DQGJK6bbXEswcYcm4dcCQPj/eh+Vq7gjlDXtDAae+zQ8+5xCx2cTIDF6lkSI3EmS1MNzL+hHsYS4lyftjO/CR+hoND244NHoWe2Dw8i8kECIPux3WyiyOXnemhcS/et3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559567; c=relaxed/simple;
	bh=kZsrwXzGQ77uKYW8NCzc2k5Xa4S9s7Ct/FlUPm+xDIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YLZh7oEyLZqOcGiBUxwMZUoU4MrsgUUxzO/3MzdeUiW7F3+pEamuRAVA1xolk1n1Iz3SslNek/bXNh6lWn8xstWoVAGebBupEoK0Rel+0zzc+GqBWEJYmwf59AB9lkMxQ7lBE/IoC37unOnqX2t9EimLPL6Tx9nL/ES6ZpuqNKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZcdHYvAH; arc=fail smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N5qqI3575429;
	Wed, 8 Jul 2026 21:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kZsrw
	XzGQ77uKYW8NCzc2k5Xa4S9s7Ct/FlUPm+xDIs=; b=ZcdHYvAHTU7+16jfmKK/P
	gdGzBt5HI0a82o//KVZOFztL47456ihJeSzhEUSx7VMFrpqPFLLkQeRPigpQHlET
	biWjePcezHToUbszqsqyfeaNvXRsKWBOAaJLQZnzVna0REFV+KMLZnsyjl3d55Hf
	hBfHYQL2TtIZow/OjfuDvxFaPukXLI68PaJ9Gsyucl1b1pWeCGLG6OVBZUTOPEOG
	q0L7ygbo/DMAFit9Qd3R0z/eUioJV3TYiyq0nfktFQxBaeTX5bFVFOkh2LxBH3rm
	uLkI5xg4XwoMhYcaxIKjB9uuuLeM6Oz/QNNYSwc8geCnwhDXFnNJBVZ9Q+w9X8hq
	w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f9kfpujt9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 21:12:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IriVuIkXFf7TSRsVHF0tryZcpmzklknZOfJC7bkBKSlq+/lqP2pjcAATrxpayAWCyN+E9MElnjFy4O9FoZtMqgfJBsc+nHSFsReZowLK4ljsjkDJdZiJXZrBTzT1upsHe6QWBUcU8Kt0HkhfMxyvJRqM+Sr9Y4fsBC4uuX9CrelY5wIylskXBBamAmqTCGD6PxVJTLZZJXTw/L178UaL++qC1tsGLbKkhhDyFerOSf3hxH18x39VYCWL9ahiLWyd2TMbIWVloMxJ2mi+nDTCtBJNMwwC/tE9qNrjokC9OOD4r3zNwNSSwhGModGCTemqjw/Lm38A0HsPP0YQpl81Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZsrwXzGQ77uKYW8NCzc2k5Xa4S9s7Ct/FlUPm+xDIs=;
 b=gcyYtjHVDi6bGkOOVigXGYSNTpQ4425X2yMeJC2qSPjGlR8bArySULhoYfeDgF7pAbFEJhucVTHnqVOTNksXjSWIalSGFre5ppjOUsf1ELxzSAqGH9RQqTJBMMaAyI45K+nqDam1OnK7gyLO8I+wSOz5zBK+GikEHBTEu3pFmP6eFp9rEdAimmlrVWtL5zc5pkyUq6nlzLVcQhIH7RHsuLU1lOyncGai1oim+3/oeIWmSD+ur+7lJ5+17jlswNpIh+PSv7cNfsgHtA23/GB2UNrbJuOM5qo6b7nvjsAnmyFDtKmeCsC7x9thLBdHasW29Ex3WHUHfnIuN2qFKCWlWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by SJ2PR03MB7110.namprd03.prod.outlook.com (2603:10b6:a03:4fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 01:12:39 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 01:12:39 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v13 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH v13 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Index: AQHdDzvZbmh8zVoDAUST3jISVnEbGrZkXE+AgAAEa6A=
Date: Thu, 9 Jul 2026 01:12:39 +0000
Message-ID:
 <DS0PR03MB722835ABFEF5B6CC3B862E35EDFE2@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
 <20260709-ltc3220-driver-v13-1-9b53237642eb@analog.com>
 <20260709005343.DAE521F00A3E@smtp.kernel.org>
In-Reply-To: <20260709005343.DAE521F00A3E@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|SJ2PR03MB7110:EE_
x-ms-office365-filtering-correlation-id: 6ffab4cf-f1cc-466b-3aeb-08dedd572b9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|5023799004|22082099003|18002099003|56012099006|3023799007|4143699003;
x-microsoft-antispam-message-info:
 aeZDASyXYJUP5NOTU8Ke462QLII61FvCN3pq55Cuvc9CgQZ00tY7JL56obbVyCbHB1UzjloRKRpgRoQQxFGjCuXcgkUYb9YLJoWKM3eatrz+YDB7VCUKwlK8HlxlET+yVFborcqecdgp7RNhytOHl5rvonxItLwvdkdBBhtKoHSFLwVObMM8MiHxOHVpOHydYAPTLRG3W3fPN7H2rKAV12Y/w1aQ+S+fi6EakzUxClgDcElCWLbWLnd2eEKF4B4yDwxBAZSJSXx3Q0PDVwrqPTs9mW8a92JdLQv7drrFJrbZFiKrwJUOYD+o2EHKICTeE4oYn7/Uck6DVWkil1mO86jz5TyHjpXUloGhGnZucCU3Smx5eINPNHZpH1mb3lWMc+HwdmmnWQ4LR/asaW22bCGhiJA4X1kCSyUs7o7AKFKshqpAjR0Vj7jyNwEdM26DHBiqSMRdKFtDX4OC9N200K2orG4/6fAoXMoWbvzdjDF1MY7m210379MJeJwUdju+ttdTWt3niszGW2bc6wTLVyKIvPaLdE/54Ng+Ot4hg2hXqKhC5Y6T8STgD1U7NSxKFM3EYew1p+1VZjSAqA7wE/c2tSgAeDOMRYpmPE8qnhzF1KH9xlWvSj8/BsCPtCWDnZEcv379Zj1o5Qjqi2t35ahvgeD5VoNXcMpOtpdfOKY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXBqK2t6NnVyU1gwOUZWNWpGdkNHVkY1b0d1UWdjejRnTlU2RUF3YTRXVjNH?=
 =?utf-8?B?TmpXcytnWmU0eU5pNGtyMjRmNlNCTUdRQXFWbTFBdHp3dlJzU2R1MS9NVTht?=
 =?utf-8?B?K0NtVVpWUXAxc1hrTWtPOEl2YVRPRVg4dkl3SjQ3eFRDTittV2tBSGQ1QUpl?=
 =?utf-8?B?MUFyRWZtTXA4NFRlTUFJMzFlVmhja3FsMGkyNTNEZ0ZqN0RMV3ZKdWZVU1pC?=
 =?utf-8?B?YUx3VlZ2WGFpaUdEVkxqN3pBR21IZkNFTnZ2QW1aU1NtaWdOQzJEQkJEdS9Q?=
 =?utf-8?B?TkFaZWFMR09HNGNYZDhtZFcxK0ZSWU9kQUJFL1hIVXNsaitodCt5TG1vMnZQ?=
 =?utf-8?B?azhqejR6a2poc21wc2pBOUNkZmxNWFFXdG9LNHJGdGJPa1o3ZlQzUTc2UEFD?=
 =?utf-8?B?dFg3UmZuVEJ2RS9ZMllaN3ZIRGhmY3VBemNxeS9mOEVYMlV0ZEY5S3l1K1hX?=
 =?utf-8?B?MFNLeTJ6NU9tZGVpMmVOUFBMQXAzb29KUnBQUGQwN3ZOdVlWOWY5cVdOZ290?=
 =?utf-8?B?OFpRTDlRY3dxaVBOa0djUGhkSkdqNkh5MEJxYXlkQUh0UU12UTdoVU1vT0Mz?=
 =?utf-8?B?UWk0ZlphRGZ6OXAvaEt6WFZlUnlsM2hzSUxheXZwNGhqd0hnSWJIdG9ScTlk?=
 =?utf-8?B?TVJlb05PYnVkL3Q5K0ZId3RvRXVaQVFPbzJ2eFhOT0p0ay9rdXR0c2FBSHhG?=
 =?utf-8?B?S1gyTHNraXhtT2tJYWliSHd4ZjF4MVg2b29CYmZKRmg2dkpmZEVVTXhIbjRr?=
 =?utf-8?B?eC82c29NT3Jac2toeklaMzRWTEhhTmd5RUhBT1c3N2QrRkpSZWgyN1FkbHB0?=
 =?utf-8?B?SEF2cFh6V0pPUkRQV2JlTDNvQ2pSZEVDU1VGazVNUENDTk5vT3B1VDA5QTIr?=
 =?utf-8?B?OHNtVmFabyt1UjVWakVEQ3dBNi8rR0gvRFFFVE13d0lta2d3bzF6M1FqTWZQ?=
 =?utf-8?B?N1hGQkpKdVd1alc0Ty93dE9YV2tsQ3hLWXFrQm81cVhpakduYlJzWitIRTZo?=
 =?utf-8?B?K3ZiQ0ZUVlEwaTJxZGUveWxDNW5rSlgweGlXdGtNNWZVWXBzSlpFTWoyMXgr?=
 =?utf-8?B?dDM3SDF1UUpxcmJOaDJnRWE4QWhzTGZ6Ukw3YTZuRXFtbU05cjh4SitURnQr?=
 =?utf-8?B?K1REd1lYSVAvSmFEbzhWaWRkZW95Q1NpUUNBZjNjbUt3N3VSSDAyeGVqOFla?=
 =?utf-8?B?aU1EQ2pBL1AxanJBR2JWWDEvSThLTFZXWHZmclEvcWNjc3p1c2hzNjdmd0ti?=
 =?utf-8?B?aDdiSS9RUUx5Mkx5QXVaekhuNzFacng0UUh1dFBjTUVXck5JNENPRk1FMEl0?=
 =?utf-8?B?M1hPZWR1cnZkdmFWY1NtQ3AvcDV2eFppWXlBUG01aWMwY2hkSEpyRHVMUFhl?=
 =?utf-8?B?TzFWZWdMWkd2UUFjbXlZV2daU3lPblRlUWdha3VRdVF2UkdqQkFid3djeS85?=
 =?utf-8?B?QS9laktVL1c0eUJFeWRTMHZIMDY3S0xaZlhCU1lta1lrMUp6NnR5UjRxUVZO?=
 =?utf-8?B?OHBhTmZHOEwzVXFRWUUybEVCd2dLYnVwV3d3Z0pJekMzQ2pXTG1QZ2NDODVr?=
 =?utf-8?B?L0M3NWVmT3JYZjVPN2hGaWkxMXpxTGlZaTdIUjB1VTdTbVhjS3JXTzNFWm0w?=
 =?utf-8?B?Nm9TV1VrWW5tK2lLdW85bGJqVDVzYnhMdnFDRGFEMldQcVZKRVFXK2laY0VY?=
 =?utf-8?B?Tk5PS1NZcnBadFhsbVc0bDYzcnNBS2pNRFdwcjN0eTBvMGFxMDMyN1JSVitX?=
 =?utf-8?B?K3NjenRIN2ZBckV6RC9CcUIzSWgxcTVKWWkvNlArRDZ0ODdyV1NDLzE1cVZp?=
 =?utf-8?B?Q1gzbHMvMkpJV3BmVzRTY1VjM0J0Q0NzV2JRWDR2T0ZPdlB5T0lwL2pVckdJ?=
 =?utf-8?B?SG5hcWJEcUE0NjlLLzUrTjNncmZlNU5qWkVzcWVOaFEzRmlmVEdDMzhCdEtR?=
 =?utf-8?B?cnhZblpOL2FTdjBkbzdkVEZ1Y1E5bzd1OFF3Tzk2Q1NtTTlVY3dxY2I3cXBH?=
 =?utf-8?B?THR0TWc0Sk9jeHhJcDYyYnp3dWdBSnl0cVNUdmxRcHBlNU10YjhLY2k3NnpM?=
 =?utf-8?B?RVlNak05SXY3V1F3SkJLckpWNW5mVm5IcTlSOGlaWCtQcjJyeCthNnF2MTJ0?=
 =?utf-8?B?QnVicmhidGdCbHVBNmhwZ0RvSkYyYkswcFkvckNMM1pwSXRROUxkbXdENkdU?=
 =?utf-8?B?cFZsRXQxZVhpOVh4UU9mRGZGclc0ZWE1TEZDSW8zallmeDRrc0Q2ektKRVUz?=
 =?utf-8?B?UHJYaFZ5bFJIcjRacVdlTzRVeklJNmc2Q0lMa1VkYVRoZ09XTS9XQSs3aHFO?=
 =?utf-8?B?WnhublplNlpsK2U0QWtWWHVsckpvSWYvMEVPWVNWZ0JKU2JFUUNtQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	OgS9ZrDjcjciS3WlpE8ZxtBGry+I8iv2ZO6PTU3a3o3MURC6cw3FTkTBC3Uj0ubM5gFvrCluUcdVSsSOfhO+hZ8Rdzzebxu8VXowKx641V/f2G5Mte9s6su34F6FLQdrXiKzafpVGS0AwxSfkBma15N6H54iol5hKCFbQZINN4nWgJn8oAXsqadePzEnUPKqwqvNKu9K6YXHA4S40oxKN35DgiMz++AHI+JtMw+sTUcbBH+Ecyw9ctgUfh3st1rPP+s2WSMbEMaVFBBfYQ7XTwKlM98RmBZSsz96aynoKOhINu3cwILXUV4sFn3RaFLpwBXCPsc2EecWDjIFqkRyhg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffab4cf-f1cc-466b-3aeb-08dedd572b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 01:12:39.6428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnh5w/6k2VxB3fLze/iTwytxCMDn+SM0D4ugHdXnNacBJ6nTbTH3LLNBpUlBYCOIGwmsD5b2dCnKWG5PABoXcWHUtkIR8PbX2AkJMPU+OWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwOCBTYWx0ZWRfX54yIcJfyBgHT
 FAgsfYjJkI+O5EJxMWFE4wnuH1VzyvnlhDBpRYVa4Wa1dzFcn8SQEYvWn+acmQLbfzBpFFLJ4KA
 BYA36cRY0EzEBctZLaxnuLmHfUGAEAyQt+kb4aeW89LvlJp5MaPI/oKUHRgmsr++hWkxEoz2ye7
 Iaey7S4Rk0ywNn6ZzyWBUwIfsIy/+cOEYH5c78Mk59HdmSirvVx4BoJPFM/mhwmTVAPjB+x7rsW
 e18+gcAyugBb4c3XSxE7y8v46UJBw+FvyTbgS1EuQQKf3Vxd7AObM0k7B9sI6BOI+zmGQGTKZr/
 06JGjTZMuSYXEvSxtCgIVe8C1gKiSIPSCDEdn5RXBVD+ayUuxqH7IQX5bqiFP9G0tSC3Pd1TZyr
 SuO7Icmp5djEfmLgITa9daYWRive07MRokZJVXV4VINgYljoSXi153RUwSQL+iGJDmsgrDrOYVj
 Mx0+fJe/2u6TLalj4iw==
X-Proofpoint-ORIG-GUID: CjqM5S3su38W19-K4ghqBqr1D1qfTf0c
X-Proofpoint-GUID: CjqM5S3su38W19-K4ghqBqr1D1qfTf0c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwOCBTYWx0ZWRfX7nyIfn18hJHC
 Sehm7cY5vYijp9i7+SO37R1EzLjUnMfnAF0fBLDadLpP5iZc00Y89FY4+xsHu8oVLUa8f2c3P0H
 Zk17DUr9DVFH/ygH044vZquBXPFnKR0fC/QbvURw2t57/Zyvli7c
X-Authority-Analysis: v=2.4 cv=IKIyzAvG c=1 sm=1 tr=0 ts=6a4ef58b cx=c_pps
 a=CM6yQ3ajfX3ct242QRRZiw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=HLiN16as4UwyhheZkb4A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090008
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8985-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:from_mime,analog.com:email,analog.com:dkim,vger.kernel.org:from_smtp,urldefense.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 703E172BA01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkg
OSwgMjAyNiA4OjU0IEFNDQo+IFRvOiBFc2NhbGEsIEVkZWx3ZWlzZSA8RWRlbHdlaXNlLkVzY2Fs
YUBhbmFsb2cuY29tPg0KPiBDYzogbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmc7IGNvbm9yK2R0
QGtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsZWVAa2VybmVsLm9y
Zzsgcm9iaEBrZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEzIDEvMl0gZHQtYmlu
ZGluZ3M6IGxlZHM6IEFkZCBMVEMzMjIwIDE4IGNoYW5uZWwgTEVEDQo+IERyaXZlcg0KPiANCj4g
W0V4dGVybmFsXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgMyBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+
IC0gW01lZGl1bV0gSW5jb3JyZWN0IFByb3BlcnR5IENvbnN0cmFpbnRzIGZvciBgcmVnYCBjYXVz
aW5nIGluZWZmZWN0aXZlIGJvdW5kcw0KPiB2YWxpZGF0aW9uDQo+IC0gW01lZGl1bV0gTWlzc2lu
ZyBhcnJheSBib3VuZHMgYW5kIHZhbHVlIGNvbnN0cmFpbnRzIGZvciBgbGVkLXNvdXJjZXNgIHBy
b3BlcnR5DQo+IC0gW01lZGl1bV0gRW5jb2RpbmcgZHJpdmVyIHNvZnR3YXJlIGxpbWl0YXRpb25z
IGludG8gRGV2aWNlIFRyZWUgc2NoZW1hIGZvcg0KPiBhZ2dyZWdhdGVkIExFRHMNCj4gLS0NCj4g
DQo+IC0tLSBQYXRjaCBbMV06IFtQQVRDSCB2MTMgMS8yXSBkdC1iaW5kaW5nczogbGVkczogQWRk
IExUQzMyMjAgMTggY2hhbm5lbCBMRUQNCj4gRHJpdmVyIC0tLSBjb21taXQgNGQxNTA0ZDJjY2Zi
YmI4YWMyZWNjZDI3MjhhMmM1Yzk3NmZkNGQ5NQ0KPiBBdXRob3I6IEVkZWx3ZWlzZSBFc2NhbGEg
PGVkZWx3ZWlzZS5lc2NhbGFAYW5hbG9nLmNvbT4NCj4gDQo+IGR0LWJpbmRpbmdzOiBsZWRzOiBB
ZGQgTFRDMzIyMCAxOCBjaGFubmVsIExFRCBEcml2ZXINCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMg
ZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgQW5hbG9nIERldmljZXMN
Cj4gTFRDMzIyMCBMRUQgZHJpdmVyLiBUaGUgYmluZGluZyBzcGVjaWZpZXMgcHJvcGVydGllcyBm
b3IgaW5kZXBlbmRlbnQgYW5kDQo+IGFnZ3JlZ2F0ZWQgTEVEIGNvbnRyb2wgYWNyb3NzIGl0cyAx
OCBjaGFubmVscy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2FkaSxsdGMzMjIwLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9sZWRzL2FkaSxsdGMzMjIwLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjQ4MjE1YWQ4MmQ5YTcNCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvYWRpLGx0YzMyMjAueWFtbA0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiArcGF0dGVyblByb3Bl
cnRpZXM6DQo+ID4gKyAgJ15sZWRAKFsxLTlhLWZdfDFbMC0yXSkkJzoNCj4gPiArICAgIHR5cGU6
IG9iamVjdA0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvbGVkcy9jb21tb24ueWFtbCMNCj4gPiAr
ICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArICAgIHByb3BlcnRpZXM6DQo+
IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gU2hvdWxkIGxlZC1zb3VyY2VzIGJlIGV4cGxpY2l0
bHkgY29uc3RyYWluZWQgaGVyZT8NCj4gDQo+IFNpbmNlIGl0IGlzIGluaGVyaXRlZCBmcm9tIGNv
bW1vbi55YW1sIHdpdGhvdXQgbG9jYWwgYm91bmRzLCBhIGRldmljZSB0cmVlIGNvdWxkDQo+IHBv
dGVudGlhbGx5IGRlZmluZSBhbiBhcnJheSBvZiBtb3JlIHRoYW4gMTggY2hhbm5lbHMgb3IgdXNl
IG91dC1vZi1ib3VuZHMgaW5kaWNlcw0KPiBhbmQgc3RpbGwgcGFzcyB2YWxpZGF0aW9uLg0KPiAN
Cg0KVGhlIGxlZC1zb3VyY2VzIHByb3BlcnR5IGluaGVyaXRzIHZhbGlkYXRpb24gZnJvbSBjb21t
b24ueWFtbC4gV2hpbGUgd2UgY291bGQgYWRkIA0KZXhwbGljaXQgbG9jYWwgY29uc3RyYWludHMg
KG1pbkl0ZW1zL21heEl0ZW1zOiAxOCwgaXRlbXM6IHttaW5pbXVtOiAxLCBtYXhpbXVtOiAxOH0p
LCANCnRoZSBkcml2ZXIgYWxyZWFkeSB2YWxpZGF0ZXMgdGhpcyBhdCBwcm9iZSB0aW1lLg0KDQo+
ID4gKyAgICAgIHJlZzoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgICAg
IE91dHB1dCBjaGFubmVsIGZvciB0aGUgTEVEICgxLTE4IG1hcHMgdG8gTEVEIG91dHB1dHMgRDEt
RDE4KS4NCj4gPiArICAgICAgICAgIFVuaXQtYWRkcmVzcyBtdXN0IGJlIGluIGhleGFkZWNpbWFs
ICgxLTEyIGhleCA9IDEtMTggZGVjaW1hbCkuDQo+ID4gKyAgICAgICAgICBGb3IgYWdncmVnYXRl
ZCBMRUQgY29udHJvbCwgZGVmaW5lIG9ubHkgb25lIExFRCBub2RlIHdpdGggcmVnID0gPDB4MT4N
Cj4gPiArICAgICAgICAgIGFuZCB1c2UgbGVkLXNvdXJjZXMgdG8gbGlzdCBhbGwgY29udHJvbGxl
ZCBvdXRwdXRzLiBPbmx5IHJlZyAxIHNob3VsZA0KPiA+ICsgICAgICAgICAgYmUgcHJlc2VudCB3
aGVuIHVzaW5nIGxlZC1zb3VyY2VzLg0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IERvZXMg
cmVzdHJpY3RpbmcgcmVnIHRvIDEgd2hlbiBsZWQtc291cmNlcyBpcyBwcmVzZW50IGVuY29kZSBh
IHNvZnR3YXJlIGRyaXZlcg0KPiBsaW1pdGF0aW9uIGludG8gdGhlIGhhcmR3YXJlIGRlc2NyaXB0
aW9uPw0KPiANCj4gSWYgdGhlIGhhcmR3YXJlIGFsbG93cyBncm91cGluZyB0aGUgMTggY2hhbm5l
bHMgaW50byBtdWx0aXBsZSBkaXNjcmV0ZSBwaHlzaWNhbA0KPiBMRURzIChlLmcuLCBMRUQgQSBv
biBjaGFubmVscyAxKzIsIExFRCBCIG9uIGNoYW5uZWxzIDMrNCksIHRoaXMgc2NoZW1hDQo+IHJl
c3RyaWN0aW9uIHdvdWxkIHByZXZlbnQgdmFsaWQgaGFyZHdhcmUgdG9wb2xvZ2llcyBmcm9tIGJl
aW5nIGRlc2NyaWJlZC4NCj4gDQoNClRoaXMgaXMgYWN0dWFsbHkgYSAqKmhhcmR3YXJlIGxpbWl0
YXRpb24qKiwgbm90IHNvZnR3YXJlLiBUaGUgTFRDMzIyMCdzIFFVSUNLX1dSSVRFIA0KZmVhdHVy
ZSBicm9hZGNhc3RzIHdyaXRlcyBPTkxZIGZyb20gcmVnaXN0ZXIgYWRkcmVzcyAweDAxIChMRUQx
KSB0byBhbGwgMTggY2hhbm5lbHMuDQoNCj4gPiArICAgICAgICBpdGVtczoNCj4gPiArICAgICAg
ICAgIC0gbWluaW11bTogMQ0KPiA+ICsgICAgICAgICAgICBtYXhpbXVtOiAxOA0KPiANCj4gW1Nl
dmVyaXR5OiBNZWRpdW1dDQo+IEFyZSB0aGVzZSBtaW5pbXVtIGFuZCBtYXhpbXVtIGNvbnN0cmFp
bnRzIHByb3Blcmx5IGV2YWx1YXRlZCBmb3IgcmVnIGFycmF5cz8NCj4gDQo+IEJ5IG5lc3Rpbmcg
dGhlbSBpbnNpZGUgYW4gaXRlbXMgYXJyYXkgbGlzdCwgdGhlIHNjaGVtYSBhcHBsaWVzIHRoZSBu
dW1lcmljDQo+IGNvbnN0cmFpbnRzIHRvIHRoZSBhcnJheSBpdHNlbGYsIHdoaWNoIEpTT04gU2No
ZW1hIGlnbm9yZXMsIHNpbGVudGx5IGFsbG93aW5nIG91dC0NCj4gb2YtYm91bmRzIHZhbHVlcy4g
UGxhY2luZyB0aGVtIGRpcmVjdGx5IHVuZGVyIHJlZyBhbGxvd3MgZHQtc2NoZW1hIHRvIGNvcnJl
Y3RseQ0KPiB2YWxpZGF0ZSB0aGUgaW50ZWdlcnMuDQo+IA0KPiA+ICsNCj4gPiArICAgIHJlcXVp
cmVkOg0KPiA+ICsgICAgICAtIHJlZw0KPiA+ICsNCj4gPiArICAgIGlmOg0KPiA+ICsgICAgICBy
ZXF1aXJlZDoNCj4gPiArICAgICAgICAtIGxlZC1zb3VyY2VzDQo+ID4gKyAgICB0aGVuOg0KPiA+
ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIHJlZzoNCj4gPiArICAgICAgICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiAxDQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1
bV0NCj4gRG9lcyBhcHBseWluZyBjb25zdDogMSBpbnNpZGUgYW4gaXRlbXMgbGlzdCBmb3IgdGhl
IHJlZyBwcm9wZXJ0eSBmYWlsIHVuY29uZGl0aW9uYWxseQ0KPiBvbiBhcnJheXM/DQo+IA0KDQpQ
cmV2aW91cyByZXZpZXcgKHYxMikgaWRlbnRpZmllZCB0aGF0IHNjYWxhciBjb25zdHJhaW50cyBk
b24ndCB2YWxpZGF0ZSANCnVpbnQzMi1tYXRyaXggcHJvcGVydGllcy4gVGhlIGl0ZW1zIGFycmF5
IGZvcm1hdCB3YXMgYXBwbGllZCBhcyB0aGUgZml4IGFuZCANCmR0X2JpbmRpbmdfY2hlY2sgcGFz
c2VzIHN1Y2Nlc3NmdWxseS4NCg0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9zYXNoaWtvLmRldi8qL3BhdGNoc2V0LzIw
MjYwNzA5LWx0YzMyMjAtDQo+IGRyaXZlci12MTMtMC0NCj4gOWI1MzIzNzY0MmViQGFuYWxvZy5j
b20/cGFydD0xX187SXchIUEzTmk4Q1MweTJZITVuaEcyYTlkWVBOZ05sU21pYg0KPiBkZ1FpQ1dq
UE80MzBPdFNjSjBMX3plX2tQUXJIZ3RscnhIV2hKaFVhVDBZUXpzQkdDOFktDQo+IHRNS3ZXcUhj
el92QXJJZkNzZDdJSSQNCg==

