Return-Path: <linux-leds+bounces-8692-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qoA5K7RnOGrnbwcAu9opvQ
	(envelope-from <linux-leds+bounces-8692-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 00:37:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A606ABC3F
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 00:37:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=yWiBxVpK;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8692-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8692-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D885300650E
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jun 2026 22:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADD2377023;
	Sun, 21 Jun 2026 22:37:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537A237187F;
	Sun, 21 Jun 2026 22:37:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782081455; cv=fail; b=fdmvlbW/yQUaFGtiLPxJuzAWS/6v9JAu4J+vXzwSUhMjs8nao2qrYO/CXpa1As0HmTlk6QPd5+1r41v0IWofixp87gMOFs2uhvCYK+Qq4kjooOWlTDmDxs3JroTXBbdAz5Hmx6aoWP79OTclocs2qkyvAbTUgL+D1D71eeymf1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782081455; c=relaxed/simple;
	bh=yJxtzpCdykrwq+VYeW+H5KIAEmn8Imkua6WM7w07IS4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ry+jlN7LCRnYj+lCsmQ79+p22ZJVMGWctvS2RTRaQ0Ujh+r0hCV3Mdjci3TcB+1x1ZKKehzw1a7lpmt8q5PLlwfnvltWBiyX2THZWVumyrdqBt9vaSf4beHcy0/YPo5+DeLg1HdOnGw405mmvXDtedZRc870i3cIdGdhE132ekQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yWiBxVpK; arc=fail smtp.client-ip=148.163.139.77
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LDseLl4162542;
	Sun, 21 Jun 2026 18:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=u4vDG
	HGkAqCD3fuvly3U4W+tjqmybyTJVqRWOlFSNAY=; b=yWiBxVpKaKfQM53Q2Vcr4
	ey/BnWhixvCLQq7fuwU0qXDcRY4lQNJIc8M2s5ICkUMOhpmNlxIjEEwHJgwbuGcM
	CRFdrmG2ugRIZc6IM1NFcV7NgQzsBu2gD15uFvFFB1ydYIB/6gWuN0XAe9OF4xsY
	n3eDmETkLzWs1poTZXbMoGRX5ra0VW4iQhrKUdlUpzzTf786doxl3nnZ9N1Z7t2z
	mi78xyebeogKUxFq1a16e1k7aRF29iMQPTIR5vdExlrxTYkrxsxKyVQhl2mZOoea
	1WngeSEQ78iRBTv02DkBfGJJIK/fhXPCiaSZdmzxzSp1h5C4gPl5VDkEdFWDvTwY
	w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4excwdh76y-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Jun 2026 18:37:20 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjRMt1cPrsM2VTUtt3fh9KjryAInamYV0AeD3W3Wv0ylgvvwf598sttU2M8K8izLzQeFOfKCE2Nol+BPCxmXfCpM7UViCNBPmzwAL5W5GMoqdt8t21l5LWs8XGnkki1bPImmnsvgACLaC+yk9a62B0JCEjiJjumLVBY4WThE7RRU1UI3nMIeWfgsw91bXKJtmLZeq81QdV3646LYrEapD/7RBWTWtYqBhPKMhgna9pD+okOMNnHo/hSgsrbkj38XODjbbrGl77Zp2Nkoy8hIwt1K4dgaOIRFkoTv08MoRdlGv5xQhOjayAKJhpQaeEbuMjNV1QJglzz+bty6XEVF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4vDGHGkAqCD3fuvly3U4W+tjqmybyTJVqRWOlFSNAY=;
 b=jJp5w6JZYT4n+K9JmtRV09xZ16bRLkCsWNQqz/yYbA4rqSC7vIIcRrTubIXGwBqHmFvSIiHHsgXNbDs15q1oY4FnSnBZbbzJvixnE6m41/8jWDVwpHV34ueG8jChgrUg/YtJ6qC544SxJSgwCjouL84LT9iXOCBPNOt+bUbaikdSOMcCPHK2/uuHuGK6tB9JXmHc+LKerCX6QSa3N/yZQwSLcxZzcFXaH5hNv+zh1B8cNl+et5QgRfkVaIxBpJh4gFha5pt/Nhls7DvMbVg5zfPSt9EU9gBgxRqjmbdqVziREn9ZbG8e6J9Am4aCZC28mWqV//UdxXIP0zJhwhma/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by DS1PR03MB7896.namprd03.prod.outlook.com (2603:10b6:8:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sun, 21 Jun
 2026 22:37:18 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%5]) with mapi id 15.21.0139.018; Sun, 21 Jun 2026
 22:37:17 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: =?iso-8859-1?Q?Uwe_Kleine_K=F6nig?= <u.kleine-koenig@baylibre.com>
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
Subject: RE: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHc/3RQBEQBhG4pik66+6niKGtc/rZF5fAAgAAvNoA=
Date: Sun, 21 Jun 2026 22:37:17 +0000
Message-ID:
 <BN8PR03MB4977CF969932F5CE506B5BAA96E02@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260619-upstream-ltc3208-v5-0-075d18060606@analog.com>
 <20260619-upstream-ltc3208-v5-2-075d18060606@analog.com>
 <ajVHk3__YAhZX5ao@monoceros>
In-Reply-To: <ajVHk3__YAhZX5ao@monoceros>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|DS1PR03MB7896:EE_
x-ms-office365-filtering-correlation-id: 91651538-8beb-432e-f78e-08decfe5a653
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|22082099003|56012099006|11063799006|6133799003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 ds/WcI1Xf2G/hGp/ZT9JiY2Y6XKeCV4SzNf/Gmwha5gIDeUSRNiqkl1pQDx9Dc4pf9jScdnSMfz9Yax8cstZvF62RKUUtG0v9Mifa6wSi3B3/8CclfZHD18FaXamzj/GLRyF/x8+XEWyiq/PufYaSSL/bpgJuJKijZGgT8mQKo7xwqlqXSnGbowyCJbm09OGBGf9fsVuU5lZsCLPY1NARzL/LjaeVhSnXm8Fn+UKlvFOxgkMXWVmapG8Dex+n9ZIdNfFnZS41al3PjpDtSY1Zr6cjFGtijPLKm7zBV9psMgI1Sr0LjAbYtodWfrXJLqUBp5/5spwmzq4/uV9lp90JSxp7oKvPKcn4ISlrUQ+zqrKpZqV+XQDrmIsIbS3P1jWk4VxxJB92246v8MDJVxrKOm99qQq30niRc4CnaYCQ+DNESOSGNidTuFRBlv//crH+IJaP+G/S+F24LVyy2ORouUJjZmlb+HrJRrWj1VXQ7rMdF7zRraaJiHES/NDeuKN4pv6ydlstaMljonlL8uR2BqSwzuiGd4MsqPsq822uzAzUDwaAeb++AN2IaEG8XSJAvrK6Db451SvSR6mYh0pz9DEi8eJz3X3qBEjSry6brGFgToFvFCbbbQmky3ftxrUnUhCG7DjyliU/bhBSU6muxbFfXvs8iMwGPxtDAz6plKsQ7pNWm8FKktg1jF/Z8zLEjvM09ovloUj5OJ4c54xMYV5f/YYI9/90rsf+pFoaUo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(22082099003)(56012099006)(11063799006)(6133799003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?V6RFWqnaoJqseGQiglIaZq96i5+GDjnZD4Lw8eIK8dBGL0UrWKIUSB+kaN?=
 =?iso-8859-1?Q?WM8kHrJqRygP16RElJcVtKBtx0INMcldg7LgGQI4RJvkNIbZwuaxIq+wiW?=
 =?iso-8859-1?Q?v/2sTSHk7YRs/ehwTQZTNbA4wx++M0qLJzNYNZhVYR17wQfESoaKS/QoQv?=
 =?iso-8859-1?Q?n44xChB0sR33DD7AhRh2kEdEVAFRAo+kJMKAepPjY1Gq7TClwpNtNNQS48?=
 =?iso-8859-1?Q?hEJ0l6JyNAgEtWPXocdBQgtYaGLnv5vujGqFddyuATtrjFHpg+btcvZEvC?=
 =?iso-8859-1?Q?+4BgdTFP76YKrUQtw6fITJ3VvJOj5HRg/brj8Vvv8cFJg9Ll8eGG6VRvVl?=
 =?iso-8859-1?Q?2J2hDRkRaOWuEkWePmnC7OnJ772ART1N678Wu9q3upg0Qy4kraRV6EIOuX?=
 =?iso-8859-1?Q?OgTngB6oBU5gxTmsA40oHsaszEwRN89RmHYSq38mwZ3BsbdAH8t+bY+4nT?=
 =?iso-8859-1?Q?/NkRU3t9WPZQ5AAwLZPY0PWu5Usiwo9wK9duFTCjoVbhoa00uhNx8Jxqt6?=
 =?iso-8859-1?Q?df33J717GD+VFeb7mhGg0I1sM/t3Zxc//gk5RySqHgBziSxrcL4i1mC1F8?=
 =?iso-8859-1?Q?WMPeZLcShoGlzlbEBtOHLYd3rS0JN/CuNDkOctUHrDAqQwhTFSWRZkkpDt?=
 =?iso-8859-1?Q?A59nfnR0Uu5NRdEaOP2Yh4bdMULs/mmog9Tk1KI03wVrBfMQeeXyqosnzw?=
 =?iso-8859-1?Q?LGL50SEr0l2xYHFSbGM6tMAzn6EwlLPjL7s9TpssiQ4cS/Bv1pjtc5lsDt?=
 =?iso-8859-1?Q?+BNFspwN6rgrAlYp9Hdoig5myqsoA94SCFrXb/vnUtR4qUnRpncc1u9HaC?=
 =?iso-8859-1?Q?8rRsaW1VfNWjwoTNSRJC7kZ4Tk+b8GyANm6Wfh8Btog/yR1O5OiY6WpnNc?=
 =?iso-8859-1?Q?7+BNZZtnbmt1b7+dDTmZuBPcJAUmBpbj07J54JYZZAbJR1z2LpqGThtuFL?=
 =?iso-8859-1?Q?pXBOEo0i2vFOk3y0XmltrpoUvTv7tPXN9twnBY0EaKfYzCzbOt9tONhoyj?=
 =?iso-8859-1?Q?dnhZO7bN1lNyyMFUvUUrYVslPZjjY2LJlIxRB7Av+1DEUm7CRjG0qB1Lro?=
 =?iso-8859-1?Q?eTLm+B6LtFAr6nxeYIC2NPOfxw/Scm8n/q9fmIFu+EU7PGJpdXmTBuXu6F?=
 =?iso-8859-1?Q?5MqA0bituu80ZLSwori6nttcN+S6GbTC3mUGHD3aFGYEw9Z8DunSx+fg0c?=
 =?iso-8859-1?Q?rs4afKI4n6NdWYksxD7fM4fiNzZ4YUHy1oqqKX88CF9k+St5TLUmNdkKAH?=
 =?iso-8859-1?Q?J5p9ZNb1Uus6AGp5dO24EsNbUWZLz5uIZiQ/nVp87lT8QUNMLCFDDJVSTz?=
 =?iso-8859-1?Q?vqYfsMePTOj9qWN2Undwid1uTxUJkYzUvRFia3NoXK9+w/IWq/jyRgfMr7?=
 =?iso-8859-1?Q?vcxB4GZv2JMkfHdxapWw7GPcos6SLRnSez/CRrHhH9tcKI3w2qisJZTvjT?=
 =?iso-8859-1?Q?0wHHDbmDl5Xb0FGCcBHcmQbBTwBKSFEaqUWlXLWWCgJkpwa6W+d4svjcBa?=
 =?iso-8859-1?Q?7tjgCmk9PUEZsEmJByfAbD5f7u2SL9p044BDcspgdv3ctboPHCZHkKgdhH?=
 =?iso-8859-1?Q?zb3VN8ZuFAMH2jTKM6NGmYeVkRZlifOTtdzKYYsiQ7hMpnYanHx5HWCWt5?=
 =?iso-8859-1?Q?dVXe0Ysjm+tUzO0dSmY7xbChz/u070VpbRsEuPMHUn7l+SKexUWI8sviMY?=
 =?iso-8859-1?Q?/RP4QmH9xQGrM2dg0QvQej2hLw1nO4j9RGqr+6k/pSS4JBYhc1mabPUVAm?=
 =?iso-8859-1?Q?W9z97VV/7NNQR/HSGZ10xelrUEeIZrSCGFZ2162Y8hCd2enMDBNEnX2FJ4?=
 =?iso-8859-1?Q?6xkFI/mQKQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	FQX79tNykixXQnCpcPjxdg1UauRhSBLNGCK9/o4EN6GcbKLceV7mwTuU55xBfzSEkWpObpsgONJJsGrB0kIsFknhwGQrM9bqO3bT2GflgJKFhntgez5SSa3hmx1VBt+MVr48PxVH9t0FH9MgjQ2QVJh2v1TL9PmHMsI4Uz5i5Nz/G90ucDLvm/d3YNkgWTcg6DQBllJ4esA5R+ncnF4vW58QjZDvnS05+pnZglXHOUzheGbwKves8sb9xmnwxGqO1pYpHiukanH1FywWTA9t7aPxeiT8eqDXxD6albF+IY/9ozSbAGHYKmxqwvLZw1isIqj1vZOMCMBIOLkH8EeK1w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91651538-8beb-432e-f78e-08decfe5a653
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2026 22:37:17.7867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FGdRE9v7VO3HfNrCMecGBpA8GkbdzGZWp1wj2y+OyPM5Ml4GQjH6xCS2KrtseiaQMolSamMqKXVY3zMiXQ+PPsIPo80ixZtgh3tl363LA/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7896
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDIzMiBTYWx0ZWRfX8wEvcwZ8Tm79
 tG2ERYAApBxiXz8gZSm5Q50/B76jyaOPVHuNH8Bd6j1pVYhFzuugJjzOlxf6FfweXBWdh7TY1ia
 A1R8knJOCt4B89Fq5W/u6n/th5Bh2eC8QAZ5W12qbcPD1bLu/Oua
X-Proofpoint-GUID: teqQlI4JVgsqTRRKFDe6wxU2U3HcDxSp
X-Authority-Analysis: v=2.4 cv=Zsjd7d7G c=1 sm=1 tr=0 ts=6a3867a0 cx=c_pps
 a=OANxLEngf0bc/nxW+UjZ1w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=IpJZQVW2AAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=yY4dgPeNq_cl95U1MAQA:9 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: teqQlI4JVgsqTRRKFDe6wxU2U3HcDxSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDIzMiBTYWx0ZWRfXzsyd25aTch1V
 P2kigK7osbmmXubftBDU3DbVGQOCAPJdbH2BwLNlUEfM5E5HHFI3uTXwf8cVdP5Ro/+MedQB2ig
 liMCAbh6RSwZgSK84JmgYxpkN91oOfRNIIQWsh2rygK2sN17ArU8oT7aSHkEeZ2Cs+LSgmjwER3
 x3XwFfAmY8//3fZqyHopcHR3mTezWg/0EuC0I3x9ZwiQwN3yHj74SsakO32KlKDKXZmaP7ZO+iU
 a/vu3qYPLJRUAZeDO0OPEwRtxHuveGl79k6xul8lx+0B7+1E10027EK0xqum0X8+pIQ5Vm9LcWj
 eeW8udGx3M9xAJtGmjNu8gE/W2UTx34p+OGSJAHS2/YYhhAy4ljvtOjl+o8kExaIYPBkCEvR/3X
 /6vcheSGtnanIJuJk5rzjECYZf3JsywKHtsxVsZigRJb0ujc5m6AzHoQYarV141/AdvpGUZ+Mth
 eF0YlNTX0y0ALI91pDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210232
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8692-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:email,BN8PR03MB4977.namprd03.prod.outlook.com:mid];
	FORGED_SENDER(0.00)[Jancarlo.Roleda@analog.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jancarlo.Roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13A606ABC3F

Hello Kleine-Konig,

> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Sent: Friday, June 19, 2026 9:49 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay
> LED Driver
>=20
> [External]
>=20
> On Fri, Jun 19, 2026 at 06:45:09AM +0800, Jan Carlo Roleda wrote:
> > [...]
> > +static int ltc3208_probe(struct i2c_client *client) {
> > +	enum ltc3208_aux_channel
> aux_channels[LTC3208_NUM_AUX_LEDS];
> > +	struct ltc3208 *ddata;
> > +	struct regmap *regmap;
> > +	bool disable_rgb_aux4_dropout_signal;
> > +	bool disable_camhl_pin;
> > +	bool set_sub_control_pin;
> > +	int ret;
> > +	u8 reg_val;
> > +
> > +	regmap =3D devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> > +				     "Failed to initialize regmap\n");
> > +
> > +	ddata =3D devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> > +	if (!ddata)
> > +		return -ENOMEM;
> > +
> > +	ddata->regmap =3D regmap;
> > +
> > +	disable_camhl_pin =3D device_property_read_bool(&client->dev,
> > +						      "adi,disable-camhl-pin");
> > +	set_sub_control_pin =3D
> > +		device_property_read_bool(&client->dev, "adi,cfg-enrgbs-
> pin");
> > +	disable_rgb_aux4_dropout_signal =3D device_property_read_bool(
> > +		&client->dev, "adi,disable-rgb-aux4-dropout");
>=20
> Unusual line break. I'd write that as:
>=20
> 	disable_rgb_aux4_dropout_signal =3D
> 		device_property_read_bool(&client->dev,
> 					  "adi,disable-rgb-aux4-dropout");
>=20
>=20

This is noted. I will rewrite this part accordingly.

> > +
> > +	reg_val =3D FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> > +		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO,
> disable_camhl_pin) |
> > +		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> > +			     disable_rgb_aux4_dropout_signal);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "error writing to options register\n");
> > +
> > +	/* Initialize aux channel configurations */
> > +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> > +		ret =3D device_property_match_property_string(
> > +			&client->dev, ltc3208_dt_aux_channels[i],
> > +			ltc3208_aux_opt, LTC3208_NUM_AUX_OPT);
> > +		/* Fallback to default value (AUX) if not found */
> > +		if (ret =3D=3D -EINVAL)
> > +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> > +		else if (ret >=3D 0)
> > +			aux_channels[i] =3D ret;
> > +	}
> > +
> > +	reg_val =3D FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> > +		  FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> > +		  FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> > +		  FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, reg_val);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +			"error writing to aux channel register.\n");
> > +
> > +	i2c_set_clientdata(client, ddata);
>=20
> From a quick glance, this is unused.
>=20

You're right, I'll remove this then.

> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct ltc3208_led *led;
> > +		struct led_init_data init_data =3D {};
> > +		u32 chan;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					    "Failed to get reg value of LED\n");
> > +		else if (chan >=3D LTC3208_NUM_LED_GRPS)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "%d is an invalid LED ID\n", chan);
> > +
> > +		led =3D &ddata->leds[chan];
> > +
> > +		led->rfield =3D
> > +			devm_regmap_field_alloc(&client->dev, ddata-
> >regmap,
> > +						ltc3208_led_reg_field[chan]);
> > +		if (IS_ERR(led->rfield))
> > +			return dev_err_probe(&client->dev, PTR_ERR(led-
> >rfield),
> > +					     "cannot allocate regmap field\n");
> > +		led->client =3D client;
> > +		led->channel =3D chan;
> > +		led->cdev.brightness_set_blocking =3D
> ltc3208_led_set_brightness;
> > +		led->cdev.max_brightness =3D
> LTC3208_MAX_BRIGHTNESS_4BIT;
> > +
> > +		if (chan =3D=3D LTC3208_CHAN_MAIN || chan =3D=3D
> LTC3208_CHAN_SUB)
> > +			led->cdev.max_brightness =3D
> LTC3208_MAX_BRIGHTNESS_8BIT;
> > +
> > +		init_data.fwnode =3D child;
> > +
> > +		ret =3D devm_led_classdev_register_ext(&client->dev, &led-
> >cdev,
> > +						     &init_data);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "LED %u Register failed.\n", chan);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc3208_match_table[] =3D {
> > +	{.compatible =3D "adi,ltc3208"},
> > +	{}
> > +};
>=20
> Please make this:
>=20
> static const struct of_device_id ltc3208_match_table[] =3D {
> 	{ .compatible =3D "adi,ltc3208" },
> 	{ }
> };
>=20
>=20
> > +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> > +
> > +static const struct i2c_device_id ltc3208_idtable[] =3D {
> > +	{ "ltc3208" },
> > +	{}
> > +};
>=20
> Please make this:
>=20
> static const struct i2c_device_id ltc3208_idtable[] =3D {
> 	{ .name =3D "ltc3208" },
> 	{ }
> };
>=20

Noted. Thank you for the clarification on the spacing.


> > +MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);
>=20
> Best regards
> Uwe

I will submit a new patch with these suggestions and those identified by Sa=
shiko by June 24.

Thank you for the review!

Regards,
Carlo


