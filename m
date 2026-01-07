Return-Path: <linux-leds+bounces-6543-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C1CFD0F2
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 11:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 602F4305E840
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 10:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2A932E129;
	Wed,  7 Jan 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="cBZO3W8t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098F3126DB;
	Wed,  7 Jan 2026 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779571; cv=fail; b=t709Cbzxgr75YsslBb541v5wZo1TrKHlroEC9hRiZntPasig2yLFEUfHQK6mLUKsAWH+OJM0NEOvKxhyq8FvZcX0AaVANbshhjpZIhehBi8c4SU0FE8c9W9k/FkJ98uwY/qnJRcnpBe3OV4RfrKFGD8DOpEYwG1uFUrE4lzNSgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779571; c=relaxed/simple;
	bh=Y6n90gShSyeqCTdNs5z2aumPwLAimePi5TtSFDXwTHs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B6XZU2hI5+QJ4s7qIaVRbUkkA7aRsj4hBWCvSyGzTOC+lkG6PuA6gp7G6kp35dOdxdN5xohhUgJcchoFvpbMNXxZA1uuluYB9b76ElG+hSgCL3bVpJJNuJip5Id00GVh1lt69BR2zrNq3YWYJRbjEugO6w5badzKDaPTVognOnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=cBZO3W8t; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607944671419645;
	Wed, 7 Jan 2026 04:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Woq4r
	zNUpSB2mN0pivQMmHhndmKkdAagwgaI3NFVPD8=; b=cBZO3W8t42Mw4igzjVNcH
	P5od6XT4ygpumVXDUuVSsfQG5yxnK1YJhuQXlT7xuYTbQaMRL5DJ4E0QTvr78diy
	3bBAUlYGn/TDGtweh7sdmgJs059oQsOi24cMut9vSUeaaa5HET8CBBXzv9iEFIDP
	/9X/TN/YBjmMy7oWrovCVA5b6cDsc5NSpt54ZaPPv8ErqdgXnMPiSrxWs5eUqnr1
	sX7Ekg0Ptwm6pWH9Q98PMCPUusqgSLMupO8IUFOKlH0ZGiWTKHVJUTE8e0+sLbQy
	lOUTw1GfqCS5cu6ZXAZAISjFnpZEgZY0i5W1/O0e5jycgRr/r5x8LmJhEQNsVdJg
	w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bhmhg07qj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:52:45 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKTav8Jak+x+q1y/99rfMWKvLIorwl+NI9Rdx+R5z75dRPujUzE87R+IkjACtlMXmD7J1lsFEtMoF59mlcYVjs+lvhlWlCWaI2hrXLg1my9xE90Vpld3WGqlUOKuYfz3rKeTykB9iUOBZirpFsqcchNaJZFEwGwk+T/FEqGWLQeqTzqaaQQt9vS35muIeHXZjK969TQEGglvowmNjPLGVBlUwcDwYbcPNEuVAB0atKLnG9Gi1Mey0SUkOvlV5xwU4vZHd5uF7JRWaL/50dSB/uDXvVrr+QfTJcSUZIhs6ONuE8XS4GFiONiJ6bv/+o01PryreR/uvf1OcDryvpiZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Woq4rzNUpSB2mN0pivQMmHhndmKkdAagwgaI3NFVPD8=;
 b=c3z6E+wsxRkdc8wO0Yia1EAsg0ZWCNT8HjI9cIfSBt6AB/cGr0D7DaGyNCWq9WfsB8nmRHmTsP6uJQXRDIsJAleWoRadTLgFaona7Y9EeeXuDhlgj2RpgIGwqA7DUbcG6U4P0iwBTXWf57E/0iF3iGlUHVDlRa3BkSXw5N9fOgvgIrL7XciLK5+E0qciPe8eblZ0wdWh9sRlLXOg5ByZu0Jhxdo6PDnwkf8uKPw06Jz9BltYtAlBF9bdM1FgDperoK+pfZ8Yu00szMg4NcmOHT4T2Trxb7iNrFM6h22c+6XZnZ/qoJf08sDebi9JkxRF+FGlR6m+1Yv2bL619cTjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by CO1PR03MB5891.namprd03.prod.outlook.com (2603:10b6:303:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:52:43 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:52:42 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] leds: ltc3220: add driver
Thread-Topic: [PATCH 2/2] leds: ltc3220: add driver
Thread-Index: AQHcfs0um784cUmyDUy+GG4zFv+JibVFC0kAgAFd2nA=
Date: Wed, 7 Jan 2026 09:52:42 +0000
Message-ID:
 <PH0PR03MB652569B08C1E10F2280B56A5ED84A@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-2-73601d6f1649@analog.com>
 <3fe2eb05-f45d-4910-a9e5-8472c5c7f43f@gmail.com>
In-Reply-To: <3fe2eb05-f45d-4910-a9e5-8472c5c7f43f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|CO1PR03MB5891:EE_
x-ms-office365-filtering-correlation-id: 21a8db2f-0cba-4e30-7f86-08de4dd2802b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V+cLdPxr6rzAMkFMeNyp5wyEOEQIJGtd2MDSH2dSLqBVh8sa7XFgVfiwlEjx?=
 =?us-ascii?Q?DUDLonQ5o9p3Sr8Z6kDa6WWRUkE1CXa1hp55DbjFpWr1DO+irr9Lw6mFy9X8?=
 =?us-ascii?Q?Dlg1G9vNZinejod6tqhevmYNDKB0Y4uUwoJqRyqnBdxxyXY+eoYJ8sz+VLY/?=
 =?us-ascii?Q?WBSAfTW5sYR/NLMkvl/7HiHf8T+gU3BvWylFDWNQDm5JanDIAM1ypDIGhS1R?=
 =?us-ascii?Q?HJf0EyFBQqW2+NBWfSP+EoJZYEcKKqUkGgcFv/MUAVl4ldXiUsgNtTtlf1jF?=
 =?us-ascii?Q?TvrEfPXy06aUX2oDaMMYc6qEbFPYV1HKHBdykdORknSlYVOvEVyBCnbf1ert?=
 =?us-ascii?Q?QlqOSZeeb8KP6cxbxkFK+S/NEL/wCWcw1YkhIIMO5Om8VlsJGqPJFhJshALR?=
 =?us-ascii?Q?HawPFYs3BhBoVOV/lMi49MRxWTsUeW2da96zLyI9TV57G62pCni8dxtaUb19?=
 =?us-ascii?Q?JeCi1It8KYzmzS/7S4cCXB6Gkkh72+EazbbWpFEstiJwpav/oZJAV+LEShd+?=
 =?us-ascii?Q?oPA7Sai+5NPb3TQdXeArkq6ctfdVDewO8MxkTHLLOh1bdlNbkibBL3U5Bayg?=
 =?us-ascii?Q?5zTrwjjv34bJ9hnPIJ/HxbYwwVRuio3gK/+i3mZKUOH6PTI4BL6VGf2DTulU?=
 =?us-ascii?Q?95J4rQC9e4HY7BuXlYY2Pg3G2DYQOhONXNyOn9HDO+XCtwr8Z7acWiNAATbz?=
 =?us-ascii?Q?7K/buh9x3ckzTKfpZ1YhMZoBdIygO5zHUesVdPAHb/Up1wQOaYWFQyP9Jvl5?=
 =?us-ascii?Q?t6l0DE3o+EZslmuqDxEVO80L1QOc5CurEpSmiyprAdcYNfjIb+uhnOg68yDV?=
 =?us-ascii?Q?XgQTfgYVrNdT8SFWoalTSTu/zNKHITpuRxp2B/swE4OzhmgyVvdFUTT9PRxi?=
 =?us-ascii?Q?m8JD9t37+FQelxw9yFeKLlTIriH3vtvXTi0Q+tdpDCEW5p3qTDenZcjxBz5i?=
 =?us-ascii?Q?uzG7rcwbqp6lMg+D3apgDfYjcsBXvtrXZMJ2DVVCWZLTij4KBxrymP9KH32y?=
 =?us-ascii?Q?kG/3gzdPGBm9ihs41V4eY3PUyHSsEcFZqcKaHTuBtynwGzUPCS3Nt80lUWME?=
 =?us-ascii?Q?/1cGREbOxfdQbihCaCzlxrpHtcyxWtYIxQuRkYTPfVLdW3eunuJIOOSAn3gz?=
 =?us-ascii?Q?uxxemkT4g1D0EAxRBf6rUlHGDrHdcFWk/9L704zX6ZWvDsVuI43SPvQhpAz7?=
 =?us-ascii?Q?nVWCDgn/NZfqwIIdEigHFnql8ozGN/BUDFR1MKQG25/qZOGqgsnGdu7TOZXm?=
 =?us-ascii?Q?5QiCRgFrB8BqtvdAd7x10YHfSWH2RqqG697+P1jFPPybIa0GwZ0InWkJTZZg?=
 =?us-ascii?Q?friKXOmDQ5givX/8WGPtIa/Qtr7CM1BpFSSnKlSWdFVxLrP0KiubXqi6W3fE?=
 =?us-ascii?Q?F0DjCE5/HH1vq0xy6CpCR+KKxJdAjHYn0FzXb0/DRWDlCW0a8jPbOWz0VCw0?=
 =?us-ascii?Q?Qjt8cy60p1TOG2bN4Rm4lwmNb6kU0P+IPlcDPmH/4gnABPNwNyGABKxsRf7K?=
 =?us-ascii?Q?nAAnvrxJdcI/5U3hL3js/OMJFbOc+c7YeqVn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CXb1KC336j3aOUbs73zDBLrXyxMJyk0e5yFpcyj5Rk6fzbU4vZ0nDSm+LiWO?=
 =?us-ascii?Q?36GAAXUIuoJgIdIuFXNhn6DotxHt5ji/AtrwA+FqHBJiEzM72faGIDTTAPdM?=
 =?us-ascii?Q?ocYXHkB8zxO4FDW1HQXO7uP+dMUnbveaYfde7PIO0t9yBaFuFG5U1ycVeYYE?=
 =?us-ascii?Q?x7nlqG+WLIe+qAVZivkUq5/G92oWWf687w2SPAG1PtAoFuBWzReyR3EJJdot?=
 =?us-ascii?Q?yYuyHK8YWvwuQ4Q8/Z/pltLY7fpjk0NosqvH3J63XHAG1q/Aac6tWVCVfAzL?=
 =?us-ascii?Q?uBGysdc1vPayQDv2XBvNjbDssUHCv/B2bgv+CfLQ3NfjTjIXrrWgiKq3d7B9?=
 =?us-ascii?Q?J2k9jQgtu/iUdKCY9o9WELJIR8QHezt9jqxWbXKnI9mn2iFs7J8MhGblAv58?=
 =?us-ascii?Q?4lEWjxr3NbckPLqDW2mDc077lzPR/B0Jzs/q+m6O+wZhHGOl4uN+cpsd71/v?=
 =?us-ascii?Q?LXhpukhG7LFudMk8wt6Nqpdofdg0wn3jVy8feWSTi+nVPldFjWvkfJLGiOUw?=
 =?us-ascii?Q?RFkS1EdBEkH++lmW/MGnBZ55XDVVgfZt2Z4j5CAZIi2GTomyC9zYSNrWnxf5?=
 =?us-ascii?Q?QzlmPfu1cBTKDmDSEV7EphNLUWr7KfIjkxE6/wsLGyaWICKcv3w6hfleliEk?=
 =?us-ascii?Q?o1NZHYsY5+YDwgv8lPU+VAiSsS74fIwYdHJwiduNpoRCINSTl2cYSTOEyZfn?=
 =?us-ascii?Q?om4JQE7NzGtdCU9LkpbmjPnDlI7FUDSgXO1fFZyaWpkLLhiwkZBZBN9Wia3+?=
 =?us-ascii?Q?PblDzzvf9ipOgTso36vjzZlTlT6pQeuyKlIxFZ52a+X4kzjMzIn5PBHEe8B5?=
 =?us-ascii?Q?YNq+y/8sFoPLEy3Zc9R9QoUWEYo3wspsOpfSL5qjiml6+hUxCvy18UaXwj8K?=
 =?us-ascii?Q?/exCd50Ew/fILdfxhVqcJoa/9r192jI9sOkqaePXAavGIV5MlUQvPrPdd/j0?=
 =?us-ascii?Q?JD4t6zzczvwR3OESx4xlTMHto/tlZA+E6zS5ykhdZFOC8mEGOplO+zG9T5tp?=
 =?us-ascii?Q?TTi2Gf7VC1nWW8g027KJkBNmKfZm2lVwxjMq2o4P17ELfKcLFwx4wwbM8ldd?=
 =?us-ascii?Q?CMu0StKV+V6nJvNXlx+3RtFUtuA1wxvb76Dy/cTZ41gjzzLikU3YLXN7mUKs?=
 =?us-ascii?Q?tNLVKD78zgxlZmal3SKUKMQPHRooFdQLi4v1Dz0hNn+ke2euNkmEGJAC1Xm+?=
 =?us-ascii?Q?otuoxY+WNHmcEyyL37io0LJWi1NRrtNwWjMdDwrexGt9BP4c4KFcpBmmxe3I?=
 =?us-ascii?Q?qvnEucEHv9oDEqisTJXugoPt5/OnkFPVfiLkDGT54VMmWOM8VnLQjNgi8Kc2?=
 =?us-ascii?Q?zYozxeFadvL0eo29O/F7bgH2sZjAtqwwIqSFBZhM3RJZsczlYUK2f5ewS26B?=
 =?us-ascii?Q?x4IAGpfrRNT5+fa9/cSLsFIwQwZ+Z2v1dt86QBneUBo4+/ALvbodv8z8MMXM?=
 =?us-ascii?Q?FLvLHk0zIAgL468KDZI/8PbkMOLDsMUjAH1x3/YAC5wbIOJYd6/iGU3YTk9A?=
 =?us-ascii?Q?l+n0Ls4AKw6JIUFyzqOpOcMk02VJTd2X15W+nwMbVyysT10yZuX/eIMPC+ZY?=
 =?us-ascii?Q?3SV9biLj8y0oY4KNlCovEGbmYM+aFm6Ya6gtZxRujuoTU5uRMrWUr6IyncI9?=
 =?us-ascii?Q?XD3ipdJvjEmNeofk1NjrMStHZKP+rcFKf5FpgwBCtCa2sob0F20I7KVAmdEr?=
 =?us-ascii?Q?BCvFKBJfMsQQZj+gJ+XvuXOLQTyCJKExPjYgMKz/XgsatVyXUunzZK0Y3JGr?=
 =?us-ascii?Q?n56jlwZrSA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6525.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a8db2f-0cba-4e30-7f86-08de4dd2802b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 09:52:42.1392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y58MvTXvgE13aNM4+u/+f2Zn+RwJeVGbFkikXOXvDTEao8QZd8X4pDX5ar1uR5eVgeosBD7CarQfX04FntMM14MQ7x+3jysr5I4vaXOO5TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5891
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OSBTYWx0ZWRfX1P/VfJ1zpSnT
 BsNba8o+tjfa0eKF7LrsTYiN83uc6ZezrIHlHHywU5IGI5f1TY7CjdEHsGAzB73LFRay1kxFWF4
 ee3rqj9npwRkqG2Zrpb2+fpek+JUeVyt5U5fiWOMBdCeEs0IhD5bIYAbHceY4+PmQ9WixswNl8E
 av3shr0Ni68Q/thD6h+okuOxkMax+xJVtTjjPC/eDUhkx7EBQ1iJ5JmO0wjzlKk13ZgvG/wjCPU
 /wQsVl+I/9UkqzD7iYViy7rfm0Y2QWSsHN+cRrXVNaN315nr5IBdwXUYbHJ8ezAS/HQEFMgtvmd
 oY54IZEl+6Mg2M5+0bAKuCk9fl8bZDOkFFmpjHxyNdoMNiBug9dQ1pzlwdY4GoNblVGnEYrAJsK
 7PkdYMw95PSZJeCgjQXJoQZQEI4BjEPHNr1UsrRGgYFd+nxQBd/ksOKS8HKK0e1GSR6s8laiKGV
 793V2atNIIpAXzSPDPQ==
X-Proofpoint-GUID: lM5-o_o60SiBd6KIlc55Ub3dMaxhTjtC
X-Proofpoint-ORIG-GUID: lM5-o_o60SiBd6KIlc55Ub3dMaxhTjtC
X-Authority-Analysis: v=2.4 cv=Fa46BZ+6 c=1 sm=1 tr=0 ts=695e2ced cx=c_pps
 a=TqpEWdQu6X+pWU0GeT7YGQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=WubsyECrv-f9JRv7qEAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1011 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070079

> On 1/6/26 06:27, Edelweise Escala wrote:
> > Add driver for ltc3220. LTC3220 18 Channel LED Driver
> >
> > Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> > ---
> >   MAINTAINERS                 |   1 +
> >   drivers/leds/Kconfig        |  10 +
> >   drivers/leds/Makefile       |   1 +
> >   drivers/leds/leds-ltc3220.c | 465
> ++++++++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 477 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > d640c35d1f93..fda0d2963c4f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14961,6 +14961,7 @@ L:	linux-leds@vger.kernel.org
> >   S:	Maintained
> >   W:	https://ez.analog.com/linux-software-drivers
> >   F:	Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> > +F:	drivers/leds/leds-ltc3220.c
> >
> [...]
> > +				     "Failed to set command\n");
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct led_init_data init_data =3D {};
> > +		struct ltc3220_uled_cfg *led;
> > +		u32 source;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &source);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Couldn't read LED address\n");
> > +
> > +		if (!source || source > LTC3220_NUM_LEDS)
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "LED address out of range\n");
> > +
> > +		init_data.fwnode =3D child;
> > +		init_data.devicename =3D "ltc3220";
> > +		init_data.devname_mandatory =3D true;
>=20
> Why? Please get acquainted with the section "LED Device Naming" in [0], a=
nd
> the documentation of this property in [1].

devname_mandatory will be dropped, Thank you

> > +
> > +		/* LED node reg/index/address goes from 1 to 18 */
> > +		i =3D source - 1;
> > +		led =3D &ltc3220_state->uled_cfg[i];
> > +		led->led_index =3D i;
> > +		led->reg_value =3D 0;
> > +		led->ltc3220_state =3D ltc3220_state;
> > +		led->led_cdev.brightness_set_blocking =3D
> ltc3220_set_led_data;
> > +		led->led_cdev.brightness_get =3D ltc3220_get_led_data;
> > +		led->led_cdev.max_brightness =3D 255;
> > +		led->led_cdev.blink_set =3D ltc3220_blink_set;
> > +		led->led_cdev.pattern_set =3D ltc3220_pattern_set;
> > +		led->led_cdev.pattern_clear =3D ltc3220_pattern_clear;
> > +
> > +		ret =3D devm_led_classdev_register_ext(&client->dev,
> > +						      &led->led_cdev,
> > +						      &init_data);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Failed to register LED class
> device\n");
>=20
> [0] Documentation/leds/leds-class.rst
> [1] include/linux/leds.h
>=20

Best Regards,
Edelweise Escala

