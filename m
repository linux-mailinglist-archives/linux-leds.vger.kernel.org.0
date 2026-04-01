Return-Path: <linux-leds+bounces-7619-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KvwC89izGnZSgYAu9opvQ
	(envelope-from <linux-leds+bounces-7619-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Apr 2026 02:11:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 297CB373054
	for <lists+linux-leds@lfdr.de>; Wed, 01 Apr 2026 02:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D16C301533B
	for <lists+linux-leds@lfdr.de>; Wed,  1 Apr 2026 00:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790D51862;
	Wed,  1 Apr 2026 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JKH0l1Ip"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23458F4A;
	Wed,  1 Apr 2026 00:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002312; cv=fail; b=VlSaFpgcJakR3NtzsUCIh1PgyIp4oEqt1gFWJJAHOGioV15Vv0Ildh4qJoz53ow7ren9TULk27zdNbD/nRbndmmrL1XxvKrQrrvb3YiJzgty2AkSWEy9ig081NzM2X/sRD0KhJb9UaIo7wzyqcFxUk2kZEvJseiKHTbEFK66jqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002312; c=relaxed/simple;
	bh=nrgX+rmkk+SrYOpJxlnZUWtzKQ3QmJYfQqctUcZPvNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JtHZUyOLvf6ilHXm9AyNJosYp3OAe16cXfq+NG/fKupzshaEYqhIU6Ad8DUhVaZNu6NKSbwK2OUrv8bTCFQMlhuVWuthTvTwEwGx4IX0qhTVvSxPC2wbCKEFjfZLTma7HYIfsAUz0fJkjAxNYB3C+U0AYg9ExfjVf2YtX0fLFcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JKH0l1Ip; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VI9HsP2150047;
	Tue, 31 Mar 2026 20:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=65LPZ
	2zpz8NfaiCQqFlF1g/e4/CV7arjMZ2pQTqO7tg=; b=JKH0l1Ip/eQDz3KXBaHvZ
	W2e6+FLr8yGcoftJUDT++CRFRZIFlMu4EF8iJOJyZuH1HsXDQt3Vd8nyE56YA7rB
	DW/Pm6xYy1OhF+9AjjlqzS7+g0u1N9BiRidDX1Fi4I00tlYkg5XxhhLaFeeaFcG6
	TxW/oY0HtsXO3PLWdQmnIhZpbSHzFPSwckYgj29ync4nTc1Xjc4ThuNfhsiJi5R2
	iHhYu963KVhT4NbTI3GVv7kobCd/Q73SRC56/WR36RFeYu/ztUtx0UWhJEAZG/MI
	hqg9AI6fkePRA6152AXQ+MtcUaVsWjvt+cDYo9x2g9kBvkf3MkfFsrmmzWAhyiJe
	A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4d6bm4w979-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 20:11:47 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD6vY2T5uF1diyexxJAETHAxkyI7IpZxsgl20DsMwkCC8JwruWocTs7Rt4/wpy9RdiLTwJUjb6N9oGnufFZQerJ9BiOFaRb4423El87A1pVQkc5J+yFrWRHzcVB7K5rawzHDX97Jx8GEbWj/FPhnNPEt1U9qMwUtmr2aNPsn6vouu5A4TSMffaIZBUnR2ftbP7fJJD4RodxOX3YjFRqz44svBCDURiU9Eh8oSX2Nr5KGt6dDkmZbbdltlBuf4YvWC10a7GhUyfUU1w5HyzwKMuvuqjjPbpQCpIcYMfLnUyFXwNLf1gsHU42FB9/8RP1yU7iandHYWant8h5hL5brOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65LPZ2zpz8NfaiCQqFlF1g/e4/CV7arjMZ2pQTqO7tg=;
 b=vr24qbcfOLTiMtwtmJVsSiphYUsm0/iFWYa3AKiGOlVnBy6wQkPtwb4xl7uBFfVP7L3nDrQ3GEleUu82bXqwUU0iwJD01PvoWWg+Vdo+ek/ch90LM+SDrQhoQ5wKZ1qlcu7fnqWWo/czBMqyD1cOPJ3/jKq4SEeE/5VYycASJJsl1sKYStK1nTTSkZffSg/9pEkbidSCeeq0B83HzMZR+8EDgV7l8hoodDa0ztnBvWSnM60wSEZBxka68ivFUIHWPoRKmASLhCYua+I7/aqDTrc2jLx8GhrR+wYgJq2P/SJqugf5UdabJXBGSECXaQNiDzZD1q6Q+znaraNw4kPJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by SJ0PR03MB5485.namprd03.prod.outlook.com (2603:10b6:a03:28a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 1 Apr
 2026 00:11:44 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 00:11:44 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v2 3/3] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Thread-Index: AQHcvKdCfkN6qGfQL0yEb5AtVTHl0rXAiC6AgAjQWYA=
Date: Wed, 1 Apr 2026 00:11:43 +0000
Message-ID:
 <BN8PR03MB4977205D8FD06E7646AEA2E39650A@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
 <20260326-upstream-ltc3208-v2-3-3dbc992b6098@analog.com>
 <20260326-nimble-sociable-sawfly-515a36@quoll>
In-Reply-To: <20260326-nimble-sociable-sawfly-515a36@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|SJ0PR03MB5485:EE_
x-ms-office365-filtering-correlation-id: b98203fe-67c8-45b2-9c60-08de8f8341c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 Lv6jeTq6tH/BSmLLlETo7YopXU/vI+y/ggJQsfE378Ji6UzPmAc7nJtBlPALP1Wi8BdAHN6gBIvq7V8b+cx19O5fD3KqAP63mR1rwm/l5FucplzFlmD+GvbNW7guPeVzfdjAC5CK0LaowTAeS7Wt2XOSTT34numJECCpUa3PTekSAm5STdKtPoJueNCmJxJa2LQJoueTgQlsp7lGlNWvtWCGBb14FzeILgetiHQTcDlXBBIrUlMal/aroaqzZAoJvoOuT/dSvNdaieL2mNgKnrriAFiBT9Ryd9f25K1ZlX+bWkSDmOh89OhRRrhK+Swsdn/rofP6wYye4oB5cxzE/BCGdxGYiyNhJHzN0PG3V9C7R8i/Wl7kpfnlj5vqf4oERn5r6Ep7yj9oy3D2Htzy5cfy5h/BI9FRiOTYbwjbsXGO/YlXPJUVJBsTVYptBuAiXbV/ff4Nr3feIyHIScVeAqypqsnMMieO29baY+xKl4SS17Qc+OLO0hM3VVi+clCN+WaIyl996mxA4U4T8nAhq9xm1rewjsTjEfHjaCwbaLFI4ksF8NEIzlkrdymp2gEuW9nx7DYkirW76N2lotxWqJ6BcljyUJvExN1y9jy9nHuzhScjL+VKgSEiM3+QlPazaL3eKcHPDw9aIX/yCyQ27bVWJN7VnOrF0rUkhSkHpP9lTjiazAITzXU5ap2BeIbMYOEDD1rbRbLFqX6EYSS/nZDMNqZauYCaQq5Y/SbifCMarCh+92YVWcnlwJvHx/KI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wWSMjipx0nKm9jO9VX0LkImSpq8s7k6Tj4CpE3plPrnQhsecu0fAQa9rFv?=
 =?iso-8859-1?Q?A1zqBkmqwZVltk8uWbS7Dj2FJ9WdJhGY079lySRmpbENo76EyVnEcnTa23?=
 =?iso-8859-1?Q?lqKVT9azXhO8kjoVWxa57I72CVCCyeiU0ChBtcAjfMi7OLw5Y+0efe1dL+?=
 =?iso-8859-1?Q?zhwdU1Ac3KDhJAMHbmWgQJL0leaj2VjafMwMEn4R03UggXep5FHpGYx4d5?=
 =?iso-8859-1?Q?fgyjkBLdSUabLnuuQe5uDzY8n2rPPK2dg4hld5mybzfI96N7WvUOPsRcCV?=
 =?iso-8859-1?Q?wTsD2r1AiYrbABMG3XYx/qlW3GxZstEMzKKEm3PgSPalFU8Fory/sL6jqO?=
 =?iso-8859-1?Q?LNPBKNBUpCSNIYQReRvOWvo3kTpK0nFqTyLsIWmDSirwVq3xK2YuSigVFq?=
 =?iso-8859-1?Q?gP2PZo6rn6IrrwGzrJ7fQt9mGcLsAavSSq0YlV7qHZK+0A2eUTczuL5Ytn?=
 =?iso-8859-1?Q?YHUHZ4sjU/9kT41TZmq7pKEs/9np/lTTn9ez9Ty79OGnueMBeRCe4WBvoX?=
 =?iso-8859-1?Q?zEay3wZqZogUD3Vyvd3KdTwyk2T0Jn1om1FAOoKFcYQAAChsGWiMBNyy8R?=
 =?iso-8859-1?Q?/6Bd/GP/nY67LRgnsF/ypkS+S/folAO7ZZr4FsXIxfs2O0zgwZE36l5GRA?=
 =?iso-8859-1?Q?xZoVyjvkujIPJpsm4JYYj/9ojjbdnSX+USAiYp+eRF5K3x87f4pt4n2ysC?=
 =?iso-8859-1?Q?K93So/rowWYGcelF1XvhFNZ9XPmODs01pciXpvQA4J2Nbhl05nhlxJ1YBe?=
 =?iso-8859-1?Q?nPPd45gI5qKRpnVQzToVyLiP44/j2uzjgcS1lo14EmukbkczLDul81xK+3?=
 =?iso-8859-1?Q?ZsjX1MKNnd7G+c/rslkaRyPvwi9MMpOxlPQ6ePYkl3nxfePgBhuEHtXtvZ?=
 =?iso-8859-1?Q?MUqlQqpFHdiNKyrL0IET6PmIWie+Fvt26/5qB1wLEWSVDQcgxHyXuTPrSe?=
 =?iso-8859-1?Q?acntXBfa/1pe2XPdCQUVc9fQ682SYedXRMUvUa1gfWm+X6GdB08dXqmbHb?=
 =?iso-8859-1?Q?c1mXAufcnwDJkcAqIieJmM3pgN6J1TE33kWt1VO5Ty9rCw4agey9LBqUaS?=
 =?iso-8859-1?Q?1qm+Nt/y5IfpnZeKCqzfHgqaYww2sVYGPDOzb3gcaSLsYtiBEM0dTmBfbr?=
 =?iso-8859-1?Q?GVT+pvPf+Y8sdRqXnYfDZAczI3AUICX323zIbnDfwlEKeM/EmxNnmHtQfh?=
 =?iso-8859-1?Q?Gd+D88AxUmxesX7WxIiotdaRLsXICxByZPG2O4Mw0AL3qmFy5fnfwAVgCs?=
 =?iso-8859-1?Q?eNjgP3fBgrrrgXVzZzknAtoQ8GNMCpJShLsiCEdvEOh6gB4OxtbxXIr+QZ?=
 =?iso-8859-1?Q?g0jD3smQqcLNsPUlgD0Npi6I/ruAxKqCh3w4FwoBaOz5bR/wob5nPYGDQc?=
 =?iso-8859-1?Q?W5XmeSpHHvU3EWcYS/ggn8eyz+/E4kCZJKG9OJXlnU0Od0ZLaVMYjdv+gP?=
 =?iso-8859-1?Q?AKfpfqTX7AcI0WjbJYM2UfKaCJ+xX+BeBUhmG7BPPnj5GzNmdQqzzwxF1f?=
 =?iso-8859-1?Q?Tsw/ozl/cqb/6d7uDGSD8CV/1eWPQ7DXLHKCD3XiWddQLAHABwFqyYQPk1?=
 =?iso-8859-1?Q?W+p7NxPS1Vv8xZKAeCFvvWMe9T/qLUjrrW56umFFG4Q4aBP+S6dAg3kJh1?=
 =?iso-8859-1?Q?C+Uv+iBJZa5yucyPQEHASIIVudsaza2tK4IOjU4hKKKy7HRb6Rjjq4gvNC?=
 =?iso-8859-1?Q?AdTXIBl+iNOY/SHKLxTvVeOhXYpoDhbs1mfu36gMVWspS6KPswOuJyn8uj?=
 =?iso-8859-1?Q?dvAndfBqyyv9D/MD4f3z8AUqCGQPa52TMjAsIqW/cUsAGa4Gp4FXwnjETT?=
 =?iso-8859-1?Q?uuTpzy6UHA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	wP73MXxzYyMFqI27i5JJz1GIameFINV6i+9mYgMbDYT68dNa97Y+kFJWtoDJP1pkkjsMKDNCpfLBH5LwSYfcAvJ2R3fgZow8Z18YPIbs14QwDAnScMwQfC/tf43VHEcg3tzokEbBTnjKkzzv3cKvQsITtDxO5RoCN4je8dmITVoNxarzkqltphWmXGJKZm+ckKJITxOiJuBmAZFMZ4Ji0cBj9vR/AYVohbZt+wNYsMF/IaUvXfsculjJYra4a5Gj4dcFzqsjCDoVqPAxPaOXXi5pwi8/JsAdTUg6gB/NDYgXXjCzMO++xkfZ9CtsmL7DF2UmhodFq+A7oI2JEKMreg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98203fe-67c8-45b2-9c60-08de8f8341c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 00:11:43.9985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKl8bCN6eE8nSGk5GwzQU1PXgmp9QG1OYwlU+yr1S5JtyQvg2IY9uNvYaBcVRPACUjVJdmriOz7dt/Tb46H3AjphuM1iC/IeGOxtxBIMHlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5485
X-Authority-Analysis: v=2.4 cv=NvvcssdJ c=1 sm=1 tr=0 ts=69cc62c3 cx=c_pps
 a=aGwn47qLKbf7B3DwPvQeXg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=uherdBYGAAAA:8 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=QscebiB92ML2sGzvX5gA:9 a=wPNLvfGTeEIA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDIzNSBTYWx0ZWRfX7bb2JQ9MyakO
 ahNOYnGNISY63xuMDDiaXYa/AQ+cU4yJtED+9HitcG1cQbLH12DXjv2Slxz8vliC2t8rFNJgt3/
 6n33/z6+LE+kdS83YM1oRLnnM3JycqtUa0bZOceeHKQQCb5L0jXilXUpeUb3AqVz1jEm0Qduz5i
 6TK9gfN1SDSBhpoBvS+tA9DtHwVsJ8jSXteuXBShX/g2nHCtRsX6Dm/fFUcqW9qcBrjHD7x0Svq
 vwEUYbMRs779dK5GAfiq1fnpvXwllUJ8ccQ5m9FsVmII1ilwpwMpUpe6OSHY7pOdtTbmnZRmZz5
 CswyTvaWkNvoEf9kQaVIdQc/5fuOWVyGYo4rBaMuyvSzE7PkIYhVJHP8U2xJMrqDF2ewAM1Qfsq
 Pi1srOxYKPU9u6t9FBiTLvpe+Fj7wKZb5jtI+PHX1Jciki7+OtZgIptBUnkhoAIcNef1s+uoaUh
 nquMufw0z3/bt9b5mSw==
X-Proofpoint-ORIG-GUID: bcUfvLLsQp3x3FPvhNB7V_sw2Bn09T0d
X-Proofpoint-GUID: bcUfvLLsQp3x3FPvhNB7V_sw2Bn09T0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_05,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310235
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7619-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1b:email,0.0.0.0:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jancarlo.Roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 297CB373054
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

Thank you for the review.
 =A0  =A0=A0  =A0=A0  =A0=A0  =A0=A0 =20
> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, March 26, 2026 5:13 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 3/3] dt-bindings: leds: Document LTC3208
> Multidisplay LED Driver
>=20
> [External]
>=20
> On Thu, Mar 26, 2026 at 06:30:12AM +0800, Jan Carlo Roleda wrote:
> > Add Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Please organize the patch documenting the compatible (DT bindings) before
> the patch using that compatible.
> See also: https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6=
.14-
> rc6/source/Documentation/devicetree/bindings/submitting-
> patches.rst*L46__;Iw!!A3Ni8CS0y2Y!89AXjtFhkqneWfAb9nXM8SHuCn0WqS
> pM9sWtt8bobLpZEy9L5KSXPS69lkM99faQ_-SeUAFS2ZnuL4E8$
>=20
> >
> > Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > ---
> >  .../devicetree/bindings/leds/adi,ltc3208.yaml      | 158
> +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 159 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> > b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> > new file mode 100644
> > index 000000000000..c139937936bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > +(c) 2026 Analog Devices, Inc.
> > +%YAML 1.2
> > +---
> > +$id:
> > +https://urldefense.com/v3/__http://devicetree.org/schemas/leds/adi,lt
> >
> +c3208.yaml*__;Iw!!A3Ni8CS0y2Y!89AXjtFhkqneWfAb9nXM8SHuCn0WqSp
> M9sWtt8b
> > +obLpZEy9L5KSXPS69lkM99faQ_-SeUAFS2ZsFLfHP$
> > +$schema:
> > +https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.y
> >
> +aml*__;Iw!!A3Ni8CS0y2Y!89AXjtFhkqneWfAb9nXM8SHuCn0WqSpM9sWtt
> 8bobLpZEy
> > +9L5KSXPS69lkM99faQ_-SeUAFS2SZpZqA4$
> > +
> > +title: LTC3208 Multidisplay LED Controller from Linear Technologies (N=
ow
> Analog Devices).
>=20
> Drop full stop
>=20

Will remove the period (full stop) on the title.

> > +
> > +maintainers:
> > +  - Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > +
> > +description:
> > +  The LTC3208 is a multidisplay LED controller that can support up to
> > +1A to all
> > +  connected LEDs.
> > +
> > +  The datasheet for this device can be found in
> > + https://www.analog.com/en/products/ltc3208.html
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,ltc3208
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
>=20
> Use consistent quotes, either ' or "
>=20

Noted. I will update the use of quotes for consistency.

> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  adi,disable-camhl-pin:
> > +    type: boolean
> > +    description:
> > +      Configures whether the external CAMHL pin is disabled.
> > +      if disabled then the output pins associated with CAM will
> > + always select
>=20
> s/if/If/.
>=20

Sorry, I'm not familiar with this acronym.
Is this referring to capitalization of "if" to "If"?
If so, I will update this in the next patch.

> > +      the CAM register's high half-byte brightness.
> > +
> > +  adi,cfg-enrgbs-pin:
> > +    type: boolean
> > +    description:
> > +      Configures which channel the ENRGBS pin toggles when it receives=
 a
> signal.
> > +      ENRGBS pin controls the SUB channel's output pins if this is set=
,
> > +      or RGB channel's output pins if this is unset.
> > +
> > +  adi,disable-rgb-aux4-dropout:
> > +    type: boolean
> > +    description:
> > +      Configures the RGB and AUX4 dropout signals to be disabled.
> > +
> > +  adi,aux1-channel:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      LED Channel that the AUX1 output pin mirrors its brightness leve=
l from.
> > +    enum: [aux, main, sub, cam]
> > +    default: aux
> > +
> > +  adi,aux2-channel:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      LED Channel that the AUX2 output pin mirrors its brightness leve=
l from.
> > +    enum: [aux, main, sub, cam]
> > +    default: aux
> > +
> > +  adi,aux3-channel:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      LED Channel that the AUX3 output pin mirrors its brightness leve=
l from.
> > +    enum: [aux, main, sub, cam]
> > +    default: aux
> > +
> > +  adi,aux4-channel:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      LED Channel that the AUX4 output pin mirrors its brightness leve=
l from.
> > +    enum: [aux, main, sub, cam]
> > +    default: aux
> > +
> > +patternProperties:
> > +  "^led@[0-7]$":
> > +    type: object
> > +    $ref: /schemas/leds/common.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        description:
> > +          LED Channel Number. each channel maps to a specific channel =
group
> used
> > +          to configure the brightness level of the output pins corresp=
onding to
> > +          the channel.
> > +        enum:
> > +          - 0 # Main Channel (8-bit brightness)
> > +          - 1 # Sub Channel (8-bit brightness)
> > +          - 2 # AUX Channel (4-bit brightness)
> > +          - 3 # Camera Channel, Low-side byte (4-bit brightness)
> > +          - 4 # Camera Channel, High-side byte (4-bit brightness)
> > +          - 5 # Red Channel (4-bit brightness)
> > +          - 6 # Blue Channel (4-bit brightness)
> > +          - 7 # Green Channel (4-bit brightness)
> > +    required:
> > +      - reg
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
>=20
> Where do you use it?
>=20

You're right. This is not relevant for this example. I'll remove it in the =
next patch.

> > +    #include <dt-bindings/leds/common.h>
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      led-controller@1b {
> > +        compatible =3D "adi,ltc3208";
> > +        reg =3D <0x1b>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        adi,disable-camhl-pin;
> > +        adi,cfg-enrgbs-pin;
> > +        adi,disable-rgb-aux4-dropout;
> > +
> > +        led@0 {
> > +          reg =3D <0>;
>=20
> Please list other applicable properties. Otherwise listing all these chil=
dren is
> pointless - feels deducible from the compatible.
>=20

Noted. Only the reg of the led is relevant for the compatible,
So I'll reduce it to a single led child in the example for brevity.

> > +        };
> > +
> > +        led@1 {
> > +          reg =3D <1>;
> > +        };
>=20
> Best regards,
> Krzysztof

I will update this binding accordingly in the next patch.
Thank you.

Regards,
Carlo


