Return-Path: <linux-leds+bounces-8083-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBrOFjpcBGqiHQIAu9opvQ
	(envelope-from <linux-leds+bounces-8083-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 13:10:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF376531EDF
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 13:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C23F3003EEA
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A193E9C29;
	Wed, 13 May 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DuTo16G+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FBA37C0E4;
	Wed, 13 May 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670637; cv=fail; b=dNsMWFAMG1vom8DZAVGQ3nW978mj3vIiZ7SbmpzU9MhzZEtKo4MVWdo91fk+VpkRebVtW6My2sHh5sj2F2r9RFvgUrcNb+ZbiCchaCE99zr9VF2rLPcuF5bVsjULRnoR3HMtsBsVA3De9t/AgZIBQChfZpWiRX9O1Eg3EWC3v+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670637; c=relaxed/simple;
	bh=sDbXtcLl81hMT7oq8PaMb8hUBPYtVSNzrJt94LVncmI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OY0feMhEsPtT71l/67go4Yls+Iu1R+oOdyR7hOvyMyIwB8ERISQjqA8G4lAmfRpdd1NwhRGMii5pFsMIm8C1IUhNm2OjwE+GEA0W7ifleCWsmcDrYuoolRaO6WLLU/ctErLMz29u3h0ENI14TJUh3bHUfaztQMdU7dDnoWnu9ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DuTo16G+; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8jVB11151440;
	Wed, 13 May 2026 07:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kWQBA
	F0h54T03eUu3GC5R/2OBvnsEJsEVQdo+oIsYyo=; b=DuTo16G+NROcYiIR6xmuR
	hd4OTojglwruJZsqzYUHRKIsupdCU41snqSXa/IxBhEpnBy+SEFe9ELc5PiheFqi
	y6s1sPc+LSc12httJOQ8FrMFBUf7jYtTOT+wHyhsvsKO4VnKoLqK3eGVsWIEp6jv
	W+Uie/1DgIBicgKkOkQxddiDU0oxHUKNo8+FUbOw1dHu9LU8/FJ3drxOkH5r019F
	BEWPDvGeoF6kydHllAFbpAa+5wA5rQ0ixebpR4Jkj2lMEZKCuEOEm/rhrnDLtdFP
	cAJWCOMyYr5Pgm/YA2i/xZM/oa45mgSTD495xr3JLwXNIFBvH+3oKXmxE16G1bzk
	w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4e3nw1xdhj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 07:10:20 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS/wh3DtAJQ8p4L/vzUc1eFNt/rAA3+yYl4flByh8KRg7NNQfZlJRJ0hbX320oQFoYPD+AAyaFdyia0/3JGuY0ayDnmz4El64VHmgHi1I0Kq7pXnQ2CJLjHFW8U3CtWMABAQb2u+TrMIv3t62UUwVCZjO9XtKj2yju2/ScYWsZdycGTMa+DH2A8rE3l2ZnzBdzQDHyw3kP7YTmWl+SpMP7pY1VfgVIzVis8jxTm3VZQC7y22+hjhXCyr70tZtWBYgPbT/mWQq4/aJW3eAHPM4NOOq6xlTl4xkKVYucLa1+JDAjV7oEJwZCj/lKMnm4hmNOJeyr+AAnrIuYMsjZSReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWQBAF0h54T03eUu3GC5R/2OBvnsEJsEVQdo+oIsYyo=;
 b=F1tPfi0Ifmb27NQnZCG/kZdc6dVdOI6x8Rzx0ECl8u7uXee+8rJLTSHk38uUvl4VTRNSyBB6k1sdwaRkVx++kqUJP74CF8U83+NyQI0mdzXDTq9cZd3Xb3MlECv6RsA9gOKwPHnhGEAzW/LyfOGcQm7OFA0TD84K0LFnFoFjhhPyqxwrWrUriCecjQ1SZR+m4SFZiJ/He5QtbLq8YP0sRd+KUu1cbiyLxcCvcZjL2CgW0H8R77DejNiOslmAi3PvkBfS1VZYpihUk2bZzB9Fb5ACVUwIgx9JLK56Qlow3NpjP+RZdlnp9qs1Vq4gXXpM9Lfpjks/sAgiFoNoje+FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by BY5PR03MB5202.namprd03.prod.outlook.com (2603:10b6:a03:220::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:10:17 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:10:17 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Rob Herring <robh@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v7 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH v7 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Index: AQHc3qCZbaWgcQZC90W7MgH8EXl+O7YEJ+eAgAer4TA=
Date: Wed, 13 May 2026 11:10:17 +0000
Message-ID:
 <DS0PR03MB72286830232274BA457FB1F5ED062@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
 <20260508-ltc3220-driver-v7-1-0f092ba54f23@analog.com>
 <20260508135717.GA1218557-robh@kernel.org>
In-Reply-To: <20260508135717.GA1218557-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|BY5PR03MB5202:EE_
x-ms-office365-filtering-correlation-id: 8b9326b4-075a-40af-bfea-08deb0e036d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700021|56012099003|22082099003|18002099003|11063799003|3023799003;
x-microsoft-antispam-message-info:
 VWVLJegyYBhlXuyBJGuHO+QKeefG1cR7b+L1RAKjjefWxWJun2Jj1ygTFVD2WwgTXPu2OK5vaBMJeuefpAp8EAAs2xsBcWJexjdNSSsc9Tn0mwCJHU58jVbEtn1i0UHM0ZjXAHWrz/AViL0RmgwzUO/ZsTOOYJFO8Gj3ZJnH6H73v5yBLNzL3Op2k1pPFfcYNnE3XioswkG3iFyP+1VW3m/zkTSnuShvmD3ODJES/XefcWphIPtoSb7A2d3bhhTJ1p9X4gLR6xq8iVZ+5Q0XLMDuXEFKnx4ppBnC2wiMOsIHUahsRxV8cFEM5vImrAtK1zhj5VQjbABwu6PtJM7tdVRjEQRYboMB3HZQczT229cgqvRTBc/HhjCbB0uNRBV+kUveIxBYFihYTYMg6gCD8Dnzmn6zt4vRmLbynvAUXOVBGr6tnByHosgm4fxo7b7oB79dBlMCQwiUJN6IKn5SisJkmKyElRebYKwmhpfXoBZTzKL+mAv5hZyktbZam2ZNGCnwwBbZbPPeWANgLxv9hDuwP0yNFLphd7syaHD2lGGxiWgI6W003pVE02FJhB+iEnb3MHOCF4MO1XyFlUjIIRq76tRgI0TDaqpUg8ZB9jvzT4yAXbR4SwYu9OdwPRMIDKsgNXgxv9o0ZwwJD8NhGn3XHmPlZCE+aQah07lHxK4Lz6wFF9HL9mBsWOKzrNUG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MyM9Y2J+LJkVKDG8nuLXvBXpXqJ+n8UWdNOgV4ZBJVkB6UDNByt5ME+EQs7Z?=
 =?us-ascii?Q?f/3QIcAE6nrsonAggMecdk4Wv+E5urkLPqXN7Fa7vT8X1Jk9RsceSIS3Dsnl?=
 =?us-ascii?Q?dDrxFkcCurnQjey48SRbth+wo7f3qtXsjnVNzqp9H/suhiYwAoitAhaIrJmE?=
 =?us-ascii?Q?XHQi+Q7EVLQdbEMJcTNyxvWt/fOa5Hh/e7c0vpMNLHZC260SuPZpzmwRBM3H?=
 =?us-ascii?Q?dMjzzIS4qfbVAMagarNqXwzzMhUQCOAjPb0RPSm0tSSKhViYx3o+VnCpOz9L?=
 =?us-ascii?Q?NHLhce/p6la7OSQEkFtW2vnxkat/QekjMgiCrdtgVfwqRoPGwVl/GkIq68z+?=
 =?us-ascii?Q?z45RhS8cN5uTHWnztXvVqCejOdA2Gqpv7NBON9MO370oQ7ya1Q/+kr72/kYz?=
 =?us-ascii?Q?D4OoYmsWO9jRbYju/55sACOHQdjeXW/uzLsujIjvaHBi+9uVG1zSlpDvEUHI?=
 =?us-ascii?Q?PIl60d6dJz5wDd5hpLKVrPP+ehOrLqcXqYbpRVkIGr9p0v0b+XTC7+IGhJ1j?=
 =?us-ascii?Q?U+Al3v/bS7I5dySHiG4auU0fNwQ4kg3syvGtHlbv+XewTwBMxT73chvgNMcg?=
 =?us-ascii?Q?xjXDLzEYv0lY04HOrUA49pkVphh/8KmB0tu/yrQySREJE38Nm3AFo2GfeMa1?=
 =?us-ascii?Q?0Lnt5EJ9tAGYhMsEVf7NkwylZMp+2my6fGmI0vdD+u12dBFh3KLEMroNFM7Z?=
 =?us-ascii?Q?w/ePsDCaAq/Ug9Ewvf0UVz/Uca1XdXftxU1bh27iC2yoiEv6kjAi4OiOMdsQ?=
 =?us-ascii?Q?hVDUOOqgMXOa+jF2eJJi8mIDHDZsITIjCoXroPU+Qkb+VZX+9KMpqd5A5zb/?=
 =?us-ascii?Q?5MSJHCvttFMGhzVCDHr2YSKDX/KKH+1shO1zd0lnU6VaMbDuwTKYmlseZlId?=
 =?us-ascii?Q?gektRKrAV7sZNSxuwa17CaLeBr9Psnmtp7LGuKIjU5mISQuPuz20hA4I0YS2?=
 =?us-ascii?Q?FPiZYTZ/zOP66UGuv2coPa10HvB0d3JYLUdsZymcI1Y/nRcj8oLHhknN7BEE?=
 =?us-ascii?Q?3hXtyt60/DYsa5rKnuqekh82DH7YfOPUfKkTWD9Flw2cyGjBcJ/YcJncNPOB?=
 =?us-ascii?Q?JdR/yWqSOYQsHl102SNhfqMMd8WH28+byW1KUAdDuNO7JwnBAz3EravOzjOT?=
 =?us-ascii?Q?4JlI3J/5jzQQ7JaHtGOHqOTzDneRtkAE/Zf6rAKJQhPOcXkz97Lg1aan8AfZ?=
 =?us-ascii?Q?+SIQDmQblzro6O9tep5+buC7m7oIoW4fZsPHQrlRfTN6UcADcUUIhUbqWBAB?=
 =?us-ascii?Q?xRUcxZyhSJOEAbonKC+RB5hpJzZYZXYWp3H5NkZeyEtrdmZHgxBaAFM3/LU4?=
 =?us-ascii?Q?6Vju5Cf8KwY4vgo2Thvoc//LWQ0gGD5kfZUp93h+lLykPY2fGAPlHy4Mg+QO?=
 =?us-ascii?Q?OEjmmT/rH3vO/7J+is65+5FnIudpDOMnV1yM0aKO44PFDSA27FfvZBPDNgbE?=
 =?us-ascii?Q?Gus7s2BRdPcCJHKKAvYrebZxW1roJvhYH9Y5CS0h8m6DbUw/qcjE7T1MGOwj?=
 =?us-ascii?Q?ujgSOeSFRprR9HKmzmiGZYWSWpq44YUkHQhQXvtC7uYUeIMkrwrdkwmzYY1a?=
 =?us-ascii?Q?EjJW3/RNNILE8ueYgG4vDTlkjfYbyhmcUnCX3MagBFwaugL44xXRxbmCL4oH?=
 =?us-ascii?Q?dwt60higEPxo5fSQ4ofJYiPhlmp+ygDDTogeJtiaor5H2pV7G+z07yTvS/ev?=
 =?us-ascii?Q?bfB2gmUl/V5EMfkEGpD6GPdoRMvKmHzV9wuhNTbNdX6tuxgtbVuugjP/UsOd?=
 =?us-ascii?Q?vKeB9wYjKYrtmLr9KznX2vz5jcnbBwlTZSQJqPgB5zRBbRVXPf0gScxm1CEp?=
x-ms-exchange-antispam-messagedata-1: XRTgdYrs8rNiZg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	BndmTnYIbYJhTgQ9jD6itP4RtvQBgxAD/I6rYaIB38k9FaaPMQLjjjT5MZpSVXqNRkH+J688sQYcnC6uISA2SH0SphOLET2G2rw5y9sH/nOYVxpiJ5ayS9JW4PtgVPc25dYY50Xy77viGDtcf9dJiIAn94jf6nPzrqU6mwPyMlzxTAiLaaTLYDEsVw5tHk/FWP8/HP9mHmKGMKmrxOK5WxtwBuDwHkJ34HBQ9UKK+7GtuNKYbl6R7KGUFob9UihQ+ILpCcO+CIBrEokXAwA2XGIO2K4TLYg3/MptNqFxlJfQCUooLAk12kSqY+p8X2A9Duzcf/DZGob9rcUKmtyglg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9326b4-075a-40af-bfea-08deb0e036d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 11:10:17.1846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J46/rLo52X/6xF5CelA7qMRmpxgfyyng7YYB/5fTS6oL5XbGYGEnP7otNt4QkkorF7KtjHT6ULuqATskZVGBno6s9Oh+MABOzDQBBtoLHTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5202
X-Authority-Analysis: v=2.4 cv=V7BNF+ni c=1 sm=1 tr=0 ts=6a045c1c cx=c_pps
 a=9FihqjIFmhICW6KbYStfAA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=uherdBYGAAAA:8 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8
 a=8FhUmo4RXVGgE7KyzrsA:9 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: D-BvsE1cOR001wRCsHQhmcNp6Xm5WYuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfXyHp08wGM7GEM
 zWC5f8GcnujXqCy7NlOYZ8rdntFNv3Vbafyf5khtIeiHmhZBd3GsCXdyNBBr386SeS8lDsQTgBE
 Q2lGXf6RjxT3mfd5G1GgRYF/iYHyyOgsiOUdE0uE6GH8BR+sEw1sfZfFtbCdyfXf86vEHLxomcH
 /rwVkBQtAbl/jUrkS0+AqbETbGG35EHCKSFgQfBK5V60tFaKzn5OoFD3MvuC2ARhHfpRgZ3N35d
 AZ6PKsNTUnJCqjMwkpWlkoehImVd4bPNZQ4MTODHA0pHJPSOaaO0IXACdO4DdbTkK11ejjcqXhQ
 x0N3WpivyBbxLw1wMqc7F6Ux7MKXTsJB7m3SDNtmJPOV+Z9yiPLc7s7lzRcQdEftfi+i/TG/V6C
 RzSkMyMdTDEAd6ezMAUKjfVw7RSUKFPlQbOUk4OW7Agqu/a0xwS0kqARJTcnesFq9H6fqpbmCBP
 /IU6UMDdU18uMVjlFyQ==
X-Proofpoint-ORIG-GUID: D-BvsE1cOR001wRCsHQhmcNp6Xm5WYuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130117
X-Rspamd-Queue-Id: AF376531EDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8083-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url,analog.com:email,analog.com:url,analog.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Rob,

Thank you for the review

> > +$id:
> > +https://urldefense.com/v3/__http://devicetree.org/schemas/leds/adi,lt
> >
> +c3220.yaml*__;Iw!!A3Ni8CS0y2Y!4aXJppTOoC_2MFbECSJDI6G6jFfk0Mzl1jxDj-3
> > +eTsiwvSa_l0oZwoalOp3RV4_m2HYvJ1lOmwObA2BoJA$
> > +$schema:
> > +https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.y
> > +aml*__;Iw!!A3Ni8CS0y2Y!4aXJppTOoC_2MFbECSJDI6G6jFfk0Mzl1jxDj-
> 3eTsiwvS
> > +a_l0oZwoalOp3RV4_m2HYvJ1lOmwMCRVBFDg$
> > +
> > +title: Analog Devices LTC3220 LED Driver
> > +
> > +maintainers:
> > +  - Edelweise Escala <edelweise.escala@analog.com>
> > +
> > +description:
>=20
> You need a '>' to maintain paragraphs.
>=20

I will add '>' for the upcoming change

> > +  The LTC3220 is a multi-display LED driver, which contains a
> > + high-efficiency,  low-noise charge pump to provide power to up to 18 =
LED
> current sources.
> > +  The LEDs are individually configurable to 64-step linear brightness
> > + control,  blinking and gradation control via 2-wire I2C interface.
> > +
> > +  For more product information please see the link below
> > +    https://www.analog.com/en/products/ltc3220.html
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,ltc3220
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '^led@([1-9]|1[0-8])$':
>=20
> Unit-addresses are hex.
>=20

Will fix unit address to be hex.

Best Regards,
Edelweise Escala

