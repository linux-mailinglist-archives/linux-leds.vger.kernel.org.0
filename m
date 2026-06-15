Return-Path: <linux-leds+bounces-8586-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wdQSOqJRL2qg+QQAu9opvQ
	(envelope-from <linux-leds+bounces-8586-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 03:13:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1CA682AFB
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 03:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=UElycMfv;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8586-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8586-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAB803004F6D
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 01:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76011214A9B;
	Mon, 15 Jun 2026 01:13:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED661D416C;
	Mon, 15 Jun 2026 01:13:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781485984; cv=fail; b=pj2odyCi6NcM6SNvLhnkF2uv4J+8IBlnDX5Ae0p0JxM5//Ye71hGrflo2uBt3qUUCMvTUBoO8KnxiusHpU/Rzzhf7r5FzVr+opUOQiT40SnTWiysaKjY/MMj5SjWTFQ2XjImp/aBwpTkCd4zn4ialzR/lDnO4G2JZyChM0ze68w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781485984; c=relaxed/simple;
	bh=42oX6c5EPoSfM+zwPbjKRLpiE3tvgUhYUHlVSQFqEWU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UiO9ZrjABO2+tZdskQPm3w70P7BQU6PHqdD8hu2mVEpgY3z/hyvKsATwSPT1mHUeyNxxJBqtmxR4FtYnuqLlKnO7yQvdJ2RgLYEhb3/QKjnFPVeQTDqxBVjmS12t7I7c8D79MWRoixAnti4ub5e8YXdHn3+oFM6/F09Re53Kv8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UElycMfv; arc=fail smtp.client-ip=148.163.139.77
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELHP1X3066244;
	Sun, 14 Jun 2026 21:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=WTYuu
	FJWuCdymD2ZRby822uKHfCsXTgg0IJRJ9BVAdI=; b=UElycMfv33DeackkN/eMw
	GAJuMRBobjp8yz+YveGsq3SUe0PB0OxxDug/e0bDfo32dPU1C+/9lpnuuT2MwN0i
	Tr7FUqDipC3FjKg99o3X6HEJkZSIexdJoCqie2Sn86YoeoXeRW6qMZj9qMovpSn1
	tOjMhsktgSOwMSj1wDIgLeRdEjFOiuS6akuVmV+x1V5zCs0XGk/gt+RDayORqdRO
	0HIJOnsM5S4th5jUiu2TUrAkKp+wTozjved9JAd5VZx4TZyErVj00yG4Q9z0DfNn
	/rSJmoNup8Mu0r9Z2ObW5YTlP1GrhmZGV8ZBOJvS9y7T1qXo1fnjhrk5Bz1Hj5hG
	Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4ess8d1f7x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 14 Jun 2026 21:12:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjPHpY9bA7Im+vlOOZZiiOVWJTENL/3KU77SQyyGgRsU5UqdIIxoXrpPs7qvG+yj4eZChGO9cSYmVigXNw5hSu22v/QxAD6N5j05K6i/DG9YMiyxLhaDB+jYNGeWywNftga5JFgsJXslNJJXbqP/cvHdnpQVno1fNxxEAouqAxtavj8UE/W/SAeH184Law/R6zANGNH03e73usMhHik9vT8SAXF4Xe8UCh3fpLDzTdHAX5LOGbjC7a/PoSk96W1Burt38zULIg7tH+un/kHvpYq6uW6aYxY2jDWxB4i3rCfH5SN8Xf6XsLHW5oCbOkqQpK4HU5w7LbCoSHsquq42Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTYuuFJWuCdymD2ZRby822uKHfCsXTgg0IJRJ9BVAdI=;
 b=wNO76XVqyrOPHGOXUbMFzqDs71gnC94KB0DXwuH/8VsM3ybZMuEroWSWb+vOniceBUVs1Q7N1j3xHhcTZ40Zz/uDQpZuNsuX94vCpVGSchHJeal7kk2BlDgfJdYlvdVbQT2OZ7dYYQgPO1P3izaLYiaf5Hs5gDVfrX2xymDy5lyWvpxBborfEPjm+44f5n8PzMpw/c/4/dBSnBZKBzqGk32YWrArH3V5JasL1l6xfPA92DQr5sS5sIUU0GkQzXR40bQIN7Qy88z7nUvns+MqH9YxD/9ZrinUv8Q5sl/Uo82bZO3Ek+fEkDIgklbzm5IMT7YTATVXSwmzjGN1KglQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by MW4PR03MB6524.namprd03.prod.outlook.com (2603:10b6:303:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 01:12:37 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 01:12:36 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Lee Jones <lee@kernel.org>
CC: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Topic: [PATCH v9 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Index: AQHc7n9PUwpxvh94v0iBPNncYTlEULY5UziAgAWALnA=
Date: Mon, 15 Jun 2026 01:12:36 +0000
Message-ID:
 <DS0PR03MB72284FEA2F0B9E0A06530CACEDE62@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260528-ltc3220-driver-v9-0-69450fc213cb@analog.com>
 <20260528-ltc3220-driver-v9-2-69450fc213cb@analog.com>
 <20260611114741.GP4151951@google.com>
In-Reply-To: <20260611114741.GP4151951@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|MW4PR03MB6524:EE_
x-ms-office365-filtering-correlation-id: 703f9051-e79d-4ca5-3a9a-08deca7b2fc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003|3023799007|6133799003|38070700021;
x-microsoft-antispam-message-info:
 qb3oSyWzba1PbbcE3CspePlI4vAmp6gXKXRSm40uZwIQZOOFrqYWXTelJESVRH8ugC/RU2WONdmhFBieKl34c1RIbLZjpL4FDf3AHmWkMSsszyBgaCCy0cc0EZgf/uufNPlqo4ybmUnZI9LQOJwxtlc0WrENCYQVneNKONrvTLSKuWvAEL0hMUqNVGwp6KilQjieqs7l+sVCYMsupIwmYufr38ys2rGrM7Wo+okm8RFED3y420RoSNbCXvmOZZFeypSMOSuaslEhHUByZMS//hkSuyTvIlyHOgO9Kqcn6ft6iO20xQT7OrcATywaUFchxNa/hE5eIHE6a4+Zy7AfrggLB20Cg2OYx1wIc8JV+f6UrL9KDVsOIfocXbf0T65vJk181TUNqNprviXRmJR1Bi+BHpFuCDzo/GeVAnr3KE5oOpSpsSOm/lk1gJaKOOyT/aH+YTa6aSQsgnd9n3zt41bXQZU++XSZjOe+9Y4laaB3mAJ+pwfRh/XDfwRj9B6t5IiktiQrSezsOYJNiqKIt7GaGoqDD1EI1Xver3Ud24O0NcW0JuAvyQoWd2xbdWbGi8VTKuXXrSGf9gFPFlEDFGhaj77grWXCXzM7vON9lml682V6O/tHPn67DJUqw+GA0uR1ZCf+GZL/TxyXUcklILMND/ESXf0hqEnXv3I0YcwN60GnFM1TjOfKDKC2Uqu17Rwn93EEqFw6yy+0ktaZ/58IKWj46xaJgN11M1hi4Qb1nlLCAMYm88ylnYGaX/AJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?q48j5FbspT591ebRhARU4bTqLy2JgCxMOjAwK1F1pEM9z2fGvz12tLtNgvaV?=
 =?us-ascii?Q?lgXUZ+PZzrnJAmJkgZ+RSdS+utSOjSj6B45SFNLrNcmuCCAcSCe2Y0iLwDNU?=
 =?us-ascii?Q?e0xV2SXT94UuR5N9HRxqSh+wQAOWiC/8JbroJmPLel9FaBCDA0hN/Aa65HjJ?=
 =?us-ascii?Q?ctqXQ6/W0ulV+uBHLv1CvyrGt0+1hmeQK4XQz82JeXrs02AJEPegGi7yCA5U?=
 =?us-ascii?Q?NtVpZyXf4fTaXPpnSt8Gxvo7jG84ofX6owLayOQ2g5Fu3FILSwcL9/xTMVD/?=
 =?us-ascii?Q?SyG/5idSjZmAMEeinZg4wpKVrEgkua1R0RckvgnE82ytZq3LxojXt5svIxJx?=
 =?us-ascii?Q?kpEGE6igNYdYb1aCVwj2QulZ+nYCRpXnvc1nfoGgbKwLdkhdgZX6f4J5CG8t?=
 =?us-ascii?Q?bgazBsoJb/kLyjfb7/Z21HE0DrMdSMNWIrskTCcoo98d7E4+EQphVI71AoEh?=
 =?us-ascii?Q?KT3H78LgrLKLx1GSajaxgNh+D2KBIe4mBD1HdcHAwhRG2FyYkm8HuZ1pGS3P?=
 =?us-ascii?Q?vfC8iZH2HN6/97VKz5HgXPFMxsfpmZti8R4tQg+ibwqA2mIlCL8WJkSegQyW?=
 =?us-ascii?Q?ihx/GLQKhVPBpsDlp0JlGk58lV5J7fip5qjrsiELnG1OooNlxxxDTALs2akm?=
 =?us-ascii?Q?ha2JLX/n2JEq4Pn5/Kg2pdjk2fICN0rC2tWUOQ7N/Uv8comEP0kGqi/x569N?=
 =?us-ascii?Q?ztYKJbM7r+972MGmsrjnw2HSOjvXhzVdIwtRxu3o1jLyIRgPlO7gPGISaBKB?=
 =?us-ascii?Q?v3MQ/RROuZ25b1Sj9PChxmLeBXaDR3CoKd8xggAI7+Ui8nLwZaQPTLTB1trY?=
 =?us-ascii?Q?+TY7Ii4nnBeb/9XNY0uh4G1SVNJcD0dOyicFcaNvs42/2rH34ekbdZmfgGys?=
 =?us-ascii?Q?e1s2Eudbn/bFhWmc5iyQCsi5ix6e6v5V5zn7JqEAHppCFa52kRfw3kN9Q8is?=
 =?us-ascii?Q?hPfsmgCtNMF94GXyzZIbUwj5f/ymD/PJ/qkEuNEFd+YEJOKN8sXGCW09EOO0?=
 =?us-ascii?Q?WOVNOhHD1kYg3b+r8zLNuJWIfqMk9lgUIsOj39HADEGeP2ovD/n5jSTCRUkN?=
 =?us-ascii?Q?QbBDX70qCC2Dz1QH+valdC7QcS8ppgrMkvOESSyITuheaBspNqJcyiGO+nHE?=
 =?us-ascii?Q?dDwe8Gyawip5MdQPYTy3YqcuzZ9OpfBQRvdWkBQz55SolU6+suxnmydLhnxk?=
 =?us-ascii?Q?Ec5/PUa0nbGwonKHlMiybmML+wfJoyJ8sJ/PbPQtax9U5TWiC0iCcjNE0L1m?=
 =?us-ascii?Q?s+sZOrVMYWPh7ALk+JBj5T09K/i9tWdwE7LOhXxrgHE7UTbt4siJlqY4fdPM?=
 =?us-ascii?Q?u3GT2b1P7nE8y1e+Maav2pW/eWqh7ArbD5QJcyT8xJpKd9ltOO86otB2VVci?=
 =?us-ascii?Q?FymwBVtxV4g2Kq03Miger13QpbyCmp7q1PfFeLAMTUHH9jkK5RPSqVj09fzA?=
 =?us-ascii?Q?Xfg82QfrXan9iiWSzeiddLObMUjCIAnvyyIOQGb3/T6hQX1mmzeYeQjXg2kQ?=
 =?us-ascii?Q?pU/z2paJMByxYw1ZrDMzs+Z2JWBWjm8e2PxNy6cC61t6EDB79YzGAipptGm4?=
 =?us-ascii?Q?HoDFiZkVSaJaW4zk5NSVp99JgHGeld/vvfcI/0dx1vpVf3gReTdT5HrlTafF?=
 =?us-ascii?Q?jW0TFFbwBs4fNoEbj0/wBFiRPQmJi/jltbWyRsqbhvJakwbdPiV1CQCCsmUD?=
 =?us-ascii?Q?XqaMUXlg64FB2iJRq/uiv9FgwBxNqyqjCMdRTERGbLG8yxSFWhc8hwf9ACD9?=
 =?us-ascii?Q?+/0WDLPjZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	HAIQYqw/+ucjCEV+Teq2kgIFjbQx8Jk6zdLUKfWtUvCv5cGbx7D0Y3mBs4FvinQ3o09h1V+E6R5BPI2Z/ay2NM1lSXHoFZrJIW3su65/BO2k6MYcBeqQ+VXU7hTZpjSNxWprGQ9EUp5Zlsma5OvtYCcREF6NBt0VHnltBQFA4RX3243nrmqVnyQI60QUtDlmO7qUGaiJ43RfiuhyDhhOGug+5/46c9pAdukoRY2tzZy1mg2Oaxk8ga62/1E9YsTH3zQswDmvO26Hdr33qsHF0z4M8oEY+sXNa9udRxQnK6o5kX+PtO6SYMKl/z5JIjlhUzBBv2MNSi7GX5DEy5nvTg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703f9051-e79d-4ca5-3a9a-08deca7b2fc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 01:12:36.2652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpNiG+6378rvp77pTHeVj5Txi4/ov+TMns0sl9FFy2ArAePkmJB5SppIjX0dpyqwxIY1WsRVcy/W303i9GSzRqriGOrkX4oBTo9thRwXdok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6524
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAxMCBTYWx0ZWRfXwBbg5D95rdsd
 b3BiZP9B9XmasjDgRlCxgOGDeciCclVxjaGCQqK/PsKRkVz65hhISoKbd6bL0U3aTW0OygBF2RI
 sa7LZaC35e8GDd94Sc+fFNZAIxSqDzhCi0/MXBLvuRjjMpAYIbGgjBMX+mWz9n5Fm+WMMzNhilL
 77k0MaH31o/jRO8QMDx641K/DM1d9poYW2PmVYmsZxlMURGA6V8zkpGPat31CzLWWxvfirL1DYb
 qyqBzGnknzZ40DEyY6iI3zrqjHXZjMEZnHdZoC6tOO/ti+irVWu6Evb8TngpawV6S9mb1wap6Dc
 A5XRqzpRf96MPxAyFOLKyPhNNQ39NVb5InrT2zetYzh8zvZUuYrqiJA2sc3Mw5R4JD2TuHK9HkN
 vFfEWUcXjom8oGcTaaiPFj5MeF+fRnjkPm3aS1bcKxZo4q7dqX0KsNw13ld2r+Hf0TTrBnk09bs
 G4tKdojD2D/znu5RD2A==
X-Authority-Analysis: v=2.4 cv=APVzlIg1 c=1 sm=1 tr=0 ts=6a2f518b cx=c_pps
 a=ItoRIIcZIWT0tNr6APkIeA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=bx34IP3p1rM70AAYGkIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAxMCBTYWx0ZWRfXxEgPydedCL8z
 6z8ci5yMHU+boOnW+y2aAxtPwStpEGkAsUd2VLTqysnVUevUcMTfJgHBiz8qjun9686ME3MnC1m
 hC1NptNBmerEoOitCAov6wM23C9ThWehDp8udgOfPdoA55puXyP+
X-Proofpoint-GUID: idCOu2AKS3V_RQHbuWPZrTjuIAxXnTe0
X-Proofpoint-ORIG-GUID: idCOu2AKS3V_RQHbuWPZrTjuIAxXnTe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8586-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A1CA682AFB

Hi Lee,

Yes I'll take care of these.=20

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, June 11, 2026 7:48 PM
> To: Escala, Edelweise <Edelweise.Escala@analog.com>
> Cc: Pavel Machek <pavel@kernel.org>; Rob Herring <robh@kernel.org>; Krzys=
ztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; linux=
-
> leds@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org
> Subject: Re: [PATCH v9 2/2] leds: ltc3220: Add Support for LTC3220 18 cha=
nnel
> LED Driver
>=20
> [External]
>=20
> /* Sashiko Automation: Issues Found (10 Findings) */
>=20
> Would you mind taking care of these before I conduct my next review pleas=
e?
>=20
> On Thu, 28 May 2026, Edelweise Escala wrote:
>=20
> > Add driver for the LTC3220 18-channel LED driver with I2C interface,
> > individual brightness control, and hardware-assisted blink/gradation
> > features.
> >
> > Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  drivers/leds/Kconfig        |  13 ++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-ltc3220.c | 440
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 455 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > c8a242577d2f..0f553ada61d9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
> >  S:	Maintained
> >  W:	https://ez.analog.com/linux-software-drivers
> >  F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> > +F:	drivers/leds/leds-ltc3220.c
> >
> >  LTC4282 HARDWARE MONITOR DRIVER
> >  M:	Nuno Sa <nuno.sa@analog.com>
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > f4a0a3c8c870..31b1e3ff094c 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -1000,6 +1000,19 @@ config LEDS_ST1202
> >  	  Say Y to enable support for LEDs connected to LED1202
> >  	  LED driver chips accessed via the I2C bus.
> >
> > +config LEDS_LTC3220
> > +	tristate "LED Driver for Analog Devices Inc. LTC3220"
> > +	depends on I2C && LEDS_CLASS
> > +	select REGMAP_I2C
> > +	help
> > +	  Say Y to enable support for the Analog Devices LTC3220
> > +	  18-channel LED controller with I2C interface.
> > +	  The driver supports individual LED brightness control (64 steps),
> > +	  hardware-assisted blinking and gradation effects.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called leds-ltc3220.
> > +
> >  config LEDS_TPS6105X
> >  	tristate "LED support for TI TPS6105X"
> >  	depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile index
> > 7db3768912ca..a68244bd50fb 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+=3D leds-
> lp8788.o
> >  obj-$(CONFIG_LEDS_LP8860)		+=3D leds-lp8860.o
> >  obj-$(CONFIG_LEDS_LP8864)		+=3D leds-lp8864.o
> >  obj-$(CONFIG_LEDS_LT3593)		+=3D leds-lt3593.o
> > +obj-$(CONFIG_LEDS_LTC3220)		+=3D leds-ltc3220.o
> >  obj-$(CONFIG_LEDS_MAX5970)		+=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)		+=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)		+=3D leds-max77705.o
> > diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> > new file mode 100644 index 000000000000..a633ac5ca6ae
> > --- /dev/null
> > +++ b/drivers/leds/leds-ltc3220.c
> > @@ -0,0 +1,440 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LTC3220 18-Channel LED Driver
> > + *
> > + * Copyright 2026 Analog Devices Inc.
> > + *
> > + * Author: Edelweise Escala <edelweise.escala@analog.com>  */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
>=20
> [Severity: Low]
> Is this include needed?
>=20
> It doesn't appear that any delay functions like msleep() or usleep_range(=
) are
> used in the driver implementation.
>=20

I'll probably need delay again for the reset comment later.

>=20
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/leds.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
>=20
> [Severity: Low]
> Should this file include <linux/property.h>?
>=20
> The driver uses fwnode property APIs such as
> device_for_each_child_node_scoped(),
> fwnode_property_read_u32(), and fwnode_property_present(), which are
> defined in <linux/property.h>.
>=20
>=20
I'll check this.

> > +
> > +/* LTC3220 Registers */
> > +#define LTC3220_COMMAND_REG				0x00
> > +#define   LTC3220_QUICK_WRITE_MASK			BIT(0)
> > +#define   LTC3220_SHUTDOWN_MASK				BIT(3)
> > +
> > +#define LTC3220_ULED_REG(x)				(0x01 + (x))
> > +#define   LTC3220_LED_CURRENT_MASK			GENMASK(5,
> 0)
> > +#define   LTC3220_LED_MODE_MASK				GENMASK(7,
> 6)
> > +
> > +#define LTC3220_GRAD_BLINK_REG				0x13
> > +#define   LTC3220_GRADATION_MASK			GENMASK(2, 0)
> > +#define   LTC3220_GRADATION_DIRECTION_MASK		BIT(0)
> > +#define   LTC3220_GRADATION_PERIOD_MASK
> 	GENMASK(2, 1)
> > +#define   LTC3220_BLINK_MASK				GENMASK(4,
> 3)
> > +
> > +#define LTC3220_NUM_LEDS				18
> > +
> > +#define LTC3220_GRADATION_START_VALUE			128
>=20
> [Severity: Low]
> Is this macro used anywhere in the driver?
>=20
> It appears to be dead code as it is never referenced.
>=20
>=20
Will remove

> > +#define LTC3220_GRADATION_RAMP_TIME_240MS		240
> > +#define LTC3220_GRADATION_RAMP_TIME_480MS		480
> > +
> > +#define LTC3220_BLINK_ON_156MS				156
> > +#define LTC3220_BLINK_ON_625MS				625
> > +#define LTC3220_BLINK_PERIOD_1250MS			1250
> > +#define LTC3220_BLINK_PERIOD_2500MS			2500
> > +
> > +#define LTC3220_BLINK_SHORT_ON_TIME			BIT(0)
> > +#define LTC3220_BLINK_LONG_PERIOD			BIT(1)
> > +
> > +enum ltc3220_led_mode {
> > +	LTC3220_NORMAL_MODE,
> > +	LTC3220_BLINK_MODE,
> > +	LTC3220_GRADATION_MODE,
> > +};
> > +
> > +enum ltc3220_blink_mode {
> > +	LTC3220_BLINK_MODE_625MS_1250MS,
> > +	LTC3220_BLINK_MODE_156MS_1250MS,
> > +	LTC3220_BLINK_MODE_625MS_2500MS,
> > +	LTC3220_BLINK_MODE_156MS_2500MS
> > +};
> > +
> > +enum ltc3220_gradation_mode {
> > +	LTC3220_GRADATION_MODE_DISABLED,
> > +	LTC3220_GRADATION_MODE_240MS_RAMP_TIME,
> > +	LTC3220_GRADATION_MODE_480MS_RAMP_TIME,
> > +	LTC3220_GRADATION_MODE_960MS_RAMP_TIME
> > +};
> > +
> > +static bool ltc3220_volatile_reg(struct device *dev, unsigned int
> > +reg) {
> > +	return reg =3D=3D LTC3220_GRAD_BLINK_REG; }
>=20
> [Severity: High]
> Does this register need to be marked volatile?
>=20
> Marking a register as volatile tells regmap to bypass the cache and read =
from the
> physical hardware. If the LTC3220 is a write-only I2C device, the physica=
l read will
> fail, causing regmap_update_bits() to fail entirely in
> ltc3220_pattern_set() and ltc3220_blink_set().
>=20
> Even if the device supports reads, this register is exclusively controlle=
d by
> software and does not change autonomously, so could it be cached normally=
 to
> avoid unnecessary I2C reads?
>=20
>=20
Will check if it will work if I remove this, I had an issue with the gradat=
ion and blink register when I did not add volatile regisgters=20

> > +
> > +static const struct regmap_config ltc3220_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D LTC3220_GRAD_BLINK_REG,
> > +	.cache_type =3D REGCACHE_FLAT_S,
> > +	.volatile_reg =3D ltc3220_volatile_reg, };
> > +
> > +struct ltc3220_uled_cfg {
> > +	struct led_classdev led_cdev;
> > +	u8 reg_value;
> > +	u8 led_index;
> > +};
> > +
> > +struct ltc3220 {
> > +	struct ltc3220_uled_cfg uled_cfg[LTC3220_NUM_LEDS];
> > +	struct regmap *regmap;
> > +	bool is_aggregated;
> > +};
> > +
> > +/*
> > + * Set LED brightness. Hardware supports 0-63 brightness levels.
> > + * Mode switching (blink/gradation) is handled through dedicated callb=
acks.
> > + */
> > +static int ltc3220_set_led_data(struct led_classdev *led_cdev,
> > +				enum led_brightness brightness)
> > +{
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
> > +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg, struct ltc3220,
> > +					       uled_cfg[uled_cfg->led_index]);
>=20
> [Severity: Low]
> Will this dynamic variable index inside container_of() cause a build fail=
ure?
>=20
> The driver attempts to retrieve the parent structure using uled_cfg[uled_=
cfg-
> >led_index]. The container_of macro relies on offsetof(), which strictly =
requires
> the member argument to be a constant expression.
>=20
> Since uled_cfg->led_index is a runtime variable, this violates the C stan=
dard and
> can abort compilation on compilers like Clang with an error about a non-c=
onstant
> integer expression.
>=20
>=20
Will fix this as well as other container of issues

> > +	int ret;
> > +
> > +	ret =3D regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg-
> >led_index),
> > +			   brightness);
> > +	if (ret)
> > +		return ret;
> > +
> > +	uled_cfg->reg_value =3D brightness;
> > +
> > +	/*
> > +	 * When aggregated LED mode is enabled, writing to LED 1 updates all
> > +	 * LEDs simultaneously via quick-write mode. Update cached values for
> > +	 * all LEDs to reflect the synchronized state.
> > +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for
> how
> > +	 * to configure aggregated LED mode.
> > +	 */
> > +	if (ltc3220->is_aggregated && uled_cfg->led_index =3D=3D 0) {
> > +		for (int i =3D 0; i < LTC3220_NUM_LEDS; i++)
> > +			ltc3220->uled_cfg[i].reg_value =3D brightness;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static enum led_brightness ltc3220_get_led_data(struct led_classdev
> > +*led_cdev) {
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
> > +
> > +	return uled_cfg->reg_value;
> > +}
> > +
> > +/*
> > + * LTC3220 pattern support for hardware-assisted breathing/gradation.
> > + * The hardware supports 3 gradation ramp time 240ms, 480ms, 960ms)
> > + * and can ramp up or down.
> > + *
> > + * Pattern array interpretation:
> > + *   pattern[0].brightness =3D start brightness (0-63)
> > + *   pattern[0].delta_t =3D ramp time in milliseconds
> > + *   pattern[1].brightness =3D end brightness (0-63)
> > + *   pattern[1].delta_t =3D (optional, can be 0 or same as pattern[0].=
delta_t)
> > + */
> > +static int ltc3220_pattern_set(struct led_classdev *led_cdev,
> > +			       struct led_pattern *pattern,
> > +			       u32 len, int repeat)
> > +{
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
> > +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg, struct ltc3220,
> > +					       uled_cfg[uled_cfg->led_index]);
>=20
> [Severity: Low]
> Will this dynamic variable index inside container_of() cause a build fail=
ure?
>=20
> The driver attempts to retrieve the parent structure using uled_cfg[uled_=
cfg-
> >led_index]. The container_of macro relies on offsetof(), which strictly =
requires
> the member argument to be a constant expression.
>=20
> Since uled_cfg->led_index is a runtime variable, this violates the C stan=
dard and
> can abort compilation on compilers like Clang with an error about a non-c=
onstant
> integer expression.
>=20
>=20
> > +	u8 gradation_period;
> > +	u8 start_brightness;
> > +	u8 end_brightness;
> > +	u8 gradation_val;
> > +	bool is_increasing;
> > +	int ret;
> > +
> > +	if (len !=3D 2)
> > +		return -EINVAL;
> > +
> > +	start_brightness =3D pattern[0].brightness &
> LTC3220_LED_CURRENT_MASK;
> > +	end_brightness =3D pattern[1].brightness &
> LTC3220_LED_CURRENT_MASK;
> > +
> > +	is_increasing =3D end_brightness > start_brightness;
> > +
> > +	if (pattern[0].delta_t =3D=3D 0)
> > +		gradation_period =3D LTC3220_GRADATION_MODE_DISABLED;
> > +	else if (pattern[0].delta_t <=3D
> LTC3220_GRADATION_RAMP_TIME_240MS)
> > +		gradation_period =3D
> LTC3220_GRADATION_MODE_240MS_RAMP_TIME;
> > +	else if (pattern[0].delta_t <=3D
> LTC3220_GRADATION_RAMP_TIME_480MS)
> > +		gradation_period =3D
> LTC3220_GRADATION_MODE_480MS_RAMP_TIME;
> > +	else
> > +		gradation_period =3D
> LTC3220_GRADATION_MODE_960MS_RAMP_TIME;
> > +
> > +	gradation_val =3D FIELD_PREP(LTC3220_GRADATION_PERIOD_MASK,
> gradation_period);
> > +	gradation_val |=3D FIELD_PREP(LTC3220_GRADATION_DIRECTION_MASK,
> > +is_increasing);
> > +
> > +	ret =3D regmap_update_bits(ltc3220->regmap,
> LTC3220_GRAD_BLINK_REG,
> > +				 LTC3220_GRADATION_MASK, gradation_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc3220_set_led_data(led_cdev, start_brightness);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg-
> >led_index),
> > +			   FIELD_PREP(LTC3220_LED_MODE_MASK,
> LTC3220_GRADATION_MODE) |
> > +			   end_brightness);
> > +	if (ret)
> > +		return ret;
> > +
> > +	uled_cfg->reg_value =3D end_brightness;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc3220_pattern_clear(struct led_classdev *led_cdev) {
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
> > +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg, struct ltc3220,
> > +					       uled_cfg[uled_cfg->led_index]);
>=20
> [Severity: Low]
> Will this dynamic variable index inside container_of() cause a build fail=
ure?
>=20
> The driver attempts to retrieve the parent structure using uled_cfg[uled_=
cfg-
> >led_index]. The container_of macro relies on offsetof(), which strictly =
requires
> the member argument to be a constant expression.
>=20
> Since uled_cfg->led_index is a runtime variable, this violates the C stan=
dard and
> can abort compilation on compilers like Clang with an error about a non-c=
onstant
> integer expression.
>=20
>=20
> > +	int ret;
> > +
> > +	ret =3D regmap_update_bits(ltc3220->regmap,
> LTC3220_ULED_REG(uled_cfg->led_index),
> > +				 LTC3220_LED_MODE_MASK,
> LTC3220_NORMAL_MODE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ltc3220_set_led_data(led_cdev, LED_OFF); }
> > +
> > +/*
> > + * LTC3220 has a global blink configuration that affects all LEDs.
> > + * This implementation allows per-LED blink requests, but the blink
> > +timing
> > + * will be shared across all LEDs. The delay values are mapped to the
> > + * hardware's discrete blink rates.
> > + */
> > +static int ltc3220_blink_set(struct led_classdev *led_cdev,
> > +			     unsigned long *delay_on,
> > +			     unsigned long *delay_off)
> > +{
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
> > +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg, struct ltc3220,
> > +					       uled_cfg[uled_cfg->led_index]);
>=20
> [Severity: Low]
> Will this dynamic variable index inside container_of() cause a build fail=
ure?
>=20
> The driver attempts to retrieve the parent structure using uled_cfg[uled_=
cfg-
> >led_index]. The container_of macro relies on offsetof(), which strictly =
requires
> the member argument to be a constant expression.
>=20
> Since uled_cfg->led_index is a runtime variable, this violates the C stan=
dard and
> can abort compilation on compilers like Clang with an error about a non-c=
onstant
> integer expression.
>=20
>=20
> > +	u8 blink_mode =3D 0;
> > +	int ret;
> > +
> > +	if (*delay_on <=3D LTC3220_BLINK_ON_156MS)
> > +		blink_mode =3D LTC3220_BLINK_SHORT_ON_TIME;
> > +
> > +	if (*delay_on + *delay_off > LTC3220_BLINK_PERIOD_1250MS)
> > +		blink_mode |=3D LTC3220_BLINK_LONG_PERIOD;
> > +
> > +	switch (blink_mode) {
> > +	case LTC3220_BLINK_MODE_625MS_1250MS:
> > +		*delay_on =3D LTC3220_BLINK_ON_625MS;
> > +		*delay_off =3D LTC3220_BLINK_PERIOD_1250MS -
> LTC3220_BLINK_ON_625MS;
> > +		break;
> > +	case LTC3220_BLINK_MODE_156MS_1250MS:
> > +		*delay_on =3D LTC3220_BLINK_ON_156MS;
> > +		*delay_off =3D LTC3220_BLINK_PERIOD_1250MS -
> LTC3220_BLINK_ON_156MS;
> > +		break;
> > +	case LTC3220_BLINK_MODE_625MS_2500MS:
> > +		*delay_on =3D LTC3220_BLINK_ON_625MS;
> > +		*delay_off =3D LTC3220_BLINK_PERIOD_2500MS -
> LTC3220_BLINK_ON_625MS;
> > +		break;
> > +	case LTC3220_BLINK_MODE_156MS_2500MS:
> > +		*delay_on =3D LTC3220_BLINK_ON_156MS;
> > +		*delay_off =3D LTC3220_BLINK_PERIOD_2500MS -
> LTC3220_BLINK_ON_156MS;
> > +		break;
> > +	}
> > +
> > +	ret =3D regmap_update_bits(ltc3220->regmap,
> LTC3220_GRAD_BLINK_REG,
> > +				 LTC3220_BLINK_MASK,
> FIELD_PREP(LTC3220_BLINK_MASK, blink_mode));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_update_bits(ltc3220->regmap,
> LTC3220_ULED_REG(uled_cfg->led_index),
> > +				  LTC3220_LED_MODE_MASK,
> > +				  FIELD_PREP(LTC3220_LED_MODE_MASK,
> LTC3220_BLINK_MODE)); }
>=20
> [Severity: Medium]
> Will the hardware blink activate at 0 brightness if the LED was previousl=
y off?
>=20
> When the LED is off, its current bits in LTC3220_ULED_REG are 0. The driv=
er
> updates the mode bits to LTC3220_BLINK_MODE using regmap_update_bits() bu=
t
> does not update the brightness bits.
>=20
> Because the core expects the driver to handle brightness configuration fo=
r
> hardware blinking, could this hardware blink execute at 0 brightness, lea=
ving the
> LED unlit?
>=20

Will make sure to have brightness when setting blinking
>=20
> > +
> > +static void ltc3220_reset_gpio_action(void *data) {
> > +	struct gpio_desc *reset_gpio =3D data;
> > +
> > +	gpiod_set_value_cansleep(reset_gpio, 1); }
> > +
> > +static int ltc3220_reset(struct ltc3220 *ltc3220, struct i2c_client
> > +*client) {
> > +	struct gpio_desc *reset_gpio;
> > +	int ret;
> > +
> > +	reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
> GPIOD_OUT_HIGH);
> > +	if (IS_ERR(reset_gpio))
> > +		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio),
> "Failed on
> > +reset GPIO\n");
> > +
> > +	if (reset_gpio) {
> > +		gpiod_set_value_cansleep(reset_gpio, 0);
>=20
> [Severity: High]
> Does this sequence lack the necessary delays to ensure a successful reset=
?
>=20
> The driver asserts the reset GPIO by requesting it with GPIOD_OUT_HIGH an=
d
> immediately de-asserts it with gpiod_set_value_cansleep(reset_gpio, 0). T=
here is
> no delay between these calls, creating a near-zero width pulse that may f=
ail to
> meet the IC's minimum reset pulse width requirement.
>=20
> It also lacks a wakeup delay before subsequent I2C commands might be sent=
.
>=20

Will add delays
>=20
> > +
> > +		return devm_add_action_or_reset(&client->dev,
> ltc3220_reset_gpio_action,
> > +						reset_gpio);
>=20
> [Severity: High]
> Does returning early here skip software initialization and regmap cache s=
etup?
>=20
> If the reset_gpio is successfully acquired, this function immediately ret=
urns 0,
> entirely skipping the subsequent regmap_write() calls intended to initial=
ize the
> hardware registers.
>=20
> Because the driver does not define a .reg_defaults table, skipping these =
writes
> leaves the regmap cache uninitialized, which can break subsequent read-mo=
dify-
> write logic via regmap_update_bits().
>=20
>=20
> > +	}
> > +
> > +	ret =3D regmap_write(ltc3220->regmap, LTC3220_COMMAND_REG, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (int i =3D 0; i < LTC3220_NUM_LEDS; i++) {
> > +		ret =3D regmap_write(ltc3220->regmap, LTC3220_ULED_REG(i), 0);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return regmap_write(ltc3220->regmap, LTC3220_GRAD_BLINK_REG, 0); }
> > +
> > +static int ltc3220_suspend(struct device *dev) {
> > +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> > +
> > +	return regmap_update_bits(ltc3220->regmap,
> LTC3220_COMMAND_REG,
> > +				  LTC3220_SHUTDOWN_MASK,
> LTC3220_SHUTDOWN_MASK); }
> > +
> > +static int ltc3220_resume(struct device *dev) {
> > +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> > +
> > +	return regmap_update_bits(ltc3220->regmap,
> LTC3220_COMMAND_REG,
> > +				  LTC3220_SHUTDOWN_MASK, 0);
> > +}
>=20
> [Severity: High]
> Are the hardware registers left permanently off after resume?
>=20
> In ltc3220_suspend(), the driver sets the LTC3220_SHUTDOWN_MASK bit. On
> many such chips, asserting the shutdown bit resets internal registers. Ad=
ditionally,
> power to the IC may be lost during system suspend.
>=20
> In ltc3220_resume(), the driver clears the shutdown bit but does not call
> regcache_mark_dirty() and regcache_sync(). Could this leave the physical =
LED
> outputs permanently off, while the kernel's regmap cache and LED classdev=
 state
> incorrectly reflect that the LEDs are still configured and illuminated?
>=20

Will add regcache_sync() call to ltc3220_resume()

> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend,
> > +ltc3220_resume);
> > +
> > +static int ltc3220_probe(struct i2c_client *client) {
> > +	struct ltc3220 *ltc3220;
> > +	bool aggregated_led_found =3D false;
> > +	int num_leds =3D 0;
> > +	u8 led_index =3D 0;
> > +	int ret;
> > +
> > +	ltc3220 =3D devm_kzalloc(&client->dev, sizeof(*ltc3220), GFP_KERNEL);
> > +	if (!ltc3220)
> > +		return -ENOMEM;
> > +
> > +	ltc3220->regmap =3D devm_regmap_init_i2c(client,
> &ltc3220_regmap_config);
> > +	if (IS_ERR(ltc3220->regmap))
> > +		return dev_err_probe(&client->dev, PTR_ERR(ltc3220->regmap),
> > +				     "Failed to initialize regmap\n");
> > +
> > +	i2c_set_clientdata(client, ltc3220);
> > +
> > +	ret =3D ltc3220_reset(ltc3220, client);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Failed to reset
> > +device\n");
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct led_init_data init_data =3D {};
> > +		struct ltc3220_uled_cfg *led;
> > +		u32 source;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &source);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret, "Couldn't read
> LED
> > +address\n");
> > +
> > +		if (!source || source > LTC3220_NUM_LEDS)
> > +			return dev_err_probe(&client->dev, -EINVAL, "LED
> address out of
> > +range\n");
> > +
> > +		init_data.fwnode =3D child;
> > +		init_data.devicename =3D "ltc3220";
> > +
> > +		if (fwnode_property_present(child, "led-sources")) {
> > +			if (source !=3D 1)
> > +				return dev_err_probe(&client->dev, -EINVAL,
> > +						     "Aggregated LED out of
> range\n");
> > +
> > +			if (aggregated_led_found)
> > +				return dev_err_probe(&client->dev, -EINVAL,
> > +						     "One Aggregated LED
> only\n");
> > +
> > +			aggregated_led_found =3D true;
> > +			ltc3220->is_aggregated =3D true;
> > +
> > +			ret =3D regmap_update_bits(ltc3220->regmap,
> > +						 LTC3220_COMMAND_REG,
> > +
> LTC3220_QUICK_WRITE_MASK,
> > +
> LTC3220_QUICK_WRITE_MASK);
> > +			if (ret)
> > +				return dev_err_probe(&client->dev, ret,
> > +						     "Failed to set quick write
> mode\n");
> > +		}
> > +
> > +		num_leds++;
> > +
> > +		/* LED node reg/index/address goes from 1 to 18 */
> > +		led_index =3D source - 1;
> > +		led =3D &ltc3220->uled_cfg[led_index];
> > +
> > +		if (led->led_cdev.dev)
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "Duplicate LED reg %u found",
> source);
> > +
> > +		led->led_index =3D led_index;
> > +		led->reg_value =3D 0;
> > +		led->led_cdev.brightness_set_blocking =3D ltc3220_set_led_data;
> > +		led->led_cdev.brightness_get =3D ltc3220_get_led_data;
> > +		led->led_cdev.max_brightness =3D 63;
> > +		led->led_cdev.blink_set =3D ltc3220_blink_set;
> > +		led->led_cdev.pattern_set =3D ltc3220_pattern_set;
> > +		led->led_cdev.pattern_clear =3D ltc3220_pattern_clear;
> > +
> > +		ret =3D devm_led_classdev_register_ext(&client->dev, &led-
> >led_cdev, &init_data);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret, "Failed to
> register LED class\n");
> > +	}
> > +
> > +	/*
> > +	 * Aggregated LED mode uses hardware quick-write to control all 18 LE=
Ds
> > +	 * simultaneously. This is mutually exclusive with individual LED con=
trol.
> > +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for
> details
> > +	 * on how to configure aggregated LED mode.
> > +	 */
> > +	if (aggregated_led_found && num_leds > 1)
> > +		return dev_err_probe(&client->dev, -EINVAL,
> > +				     "Aggregated LED must be the only LED
> node\n");
>=20
> [Severity: Medium]
> Are the LED sysfs interfaces exposed to userspace before the driver probe=
 is fully
> validated?
>=20
> Inside the loop above, devm_led_classdev_register_ext() is called, which
> immediately exposes sysfs interfaces. If the validation check here fails =
and
> returns an error, userspace could have already discovered and interacted =
with the
> LED devices before they are unexpectedly torn down by devres.
>=20
> Could these validation checks be completed before registering the interfa=
ces?
>=20
Restructured ltc3220_probe() to use two passes:
   - First pass: Validate all device tree configuration and set up LED stru=
ctures
   - Second pass: Register LED class devices only after validation succeeds

> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc3220_of_match[] =3D {
> > +	{ .compatible =3D "adi,ltc3220" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ltc3220_of_match);
> > +
> > +static struct i2c_driver ltc3220_led_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc3220",
> > +		.of_match_table =3D ltc3220_of_match,
> > +		.pm =3D pm_sleep_ptr(&ltc3220_pm_ops),
> > +	},
> > +	.probe =3D ltc3220_probe,
> > +};
> > +module_i2c_driver(ltc3220_led_driver);
> > +
> > +MODULE_AUTHOR("Edelweise Escala <edelweise.escala@analog.com>");
> > +MODULE_DESCRIPTION("LED driver for LTC3220 controllers");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.43.0
> >
>=20
> --
> Lee Jones


Thank you!

Best Regards,
Edelweise Escala


