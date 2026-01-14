Return-Path: <linux-leds+bounces-6640-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E6AD1BC94
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 01:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FF6130222D3
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 00:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89D9155C87;
	Wed, 14 Jan 2026 00:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="SKhKXU7N"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D73D994;
	Wed, 14 Jan 2026 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768349795; cv=fail; b=mv0OLhO0nHMPYqABrD6jlOkMxfqjrx/l0+UZf2NrtvRHUJlW9aFvDkIEK9Lcoj/oArMwg/SNwjcBMpH2HMFzjT4S4kNvKBMRVfnJDcHiR0LNYqSP0JNJyMn7/c78dI/ti41QlBrANaqsJlOvOEOETlUg6VLqc28XdP2sWRROUjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768349795; c=relaxed/simple;
	bh=PO7VXWB6Q/xYjEV8KswzSErMk6Tx6K6VDdq8ronZmwQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEVQ7szCKjDU0OSvua8HpgX+0eONjlWcYr0mm4B0xAi7JVNMLdcj+zRMmI51RkOJWI9KhWXCAM/ZktmDnlpE5jAUYhoK18KWPWESTjgaBTCevQJcMg3qEEXCcfptyG0GxGR14DPWZWcVbCS2yJw0EftlLtPo8KkQobHSmEBTdUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=SKhKXU7N; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E011f3070736;
	Tue, 13 Jan 2026 19:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Fkdcd
	Q6yhhQ3caF0UEay3+RByUGyQVO/SeT6+zI9YJU=; b=SKhKXU7NLGQkS/8a3PNaj
	aUvlstn/c42Vh5t4J6fTJtc4Oz3IEy15aM6waCXSbCU12wch7Jqs3sA7U9x5N3T0
	qXzt0yfMCyXsA8aphRr6sNwy8xnzRSy2Vo70lWcmLn2xmBv7elJXW9/uawRpYVAc
	XyI/+5ZQG9qfNQOTZNqjSYQou66rkNVsrHRUxgh0qzqAQrwJuDs6XRtH7Uajs+44
	kcvAk3g30pvM/5B/tnqXD+vOs/M+fUNwbD5Fig4EG1Tmiyf3ywQt2E6Kkbno+Jib
	s+Swz+bAd9XMt1EKPilb5qI/Od9b7BrlCv9i7kW7g6qi8Ug7fkfjQDGNZbTofRvj
	w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012069.outbound.protection.outlook.com [40.107.200.69])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bndhext0x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 19:16:19 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swshiywMWSSxy8Upk58JWcAUHzzfrsO9N2QoP6oAjZRgj+mM9YbjrtTyDUUHdASQknyydPy19gnb6CYIsFC6VedzMtthyv225m3smCO+Ny2SCrSmw59/BVKmv5vwzOmdqLKiEF0iweyzk/kLAQmThfiFT4OstYO5jR9BkVAaEc8CrgmItyknA0nN3MxdEybwi/7fSkus+3pyD0M+opwXsAjccKlcCt6xhlVOoObEPlv3uMfSQNEfysiB8lIXvUkY+Zo782taRdMukUJGqHlhuz5sNjENtH+FBGHWhAdAxcGzOvKJ51jDSHrbRt6xNq7uiY2/mVKyoKdEYTGYcphlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkdcdQ6yhhQ3caF0UEay3+RByUGyQVO/SeT6+zI9YJU=;
 b=dWDUn61X2/DAiQNKL0q+viMCJVEZUqZ/q+UV47dUYgws4MMiJAPmz8t0yPLlGffcKi+HkeCXZmvhvPRgxqXNa4Nje4hlp2Fr/eFn9hxfEWSW2XoJWxkfFFeKQ3E8eGMisx3OE76vKPONzrjKM2zkOW676rQbtxBAmoXFliNBQoA3Crky8czwWDgcuNMNok6WG5jkS5vm9WnLlaJ5tmxvTu/cA4CuMqYlVzzreFI2vX+wEiqWf4UNzWYy2nKN55bFR7++Ug+72jzVubR3neFLFyXD3SnVjXFZT/1upff6lz10Ul3jvGC3Xg3LCfk08LfR5JtZEjUW+4ol6X6nNomRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by CH8PR03MB8228.namprd03.prod.outlook.com (2603:10b6:610:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Wed, 14 Jan
 2026 00:16:16 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 00:16:16 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH v2 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Index: AQHcg6HhVGrPbP+epUKtVm3UMVMR97VPv+qAgAEMUGA=
Date: Wed, 14 Jan 2026 00:16:16 +0000
Message-ID:
 <PH0PR03MB6525EF9CDFACF871EF350119ED8FA@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
 <20260112-ltc3220-driver-v2-1-d043058fc4df@analog.com>
 <20260113-wine-kingfisher-of-glee-cdac0c@quoll>
In-Reply-To: <20260113-wine-kingfisher-of-glee-cdac0c@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|CH8PR03MB8228:EE_
x-ms-office365-filtering-correlation-id: a728a8c4-dff3-4f14-98a9-08de5302225f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XmIWLxuR/pXlnlgjsDnvSmmdlS636V8mhnYQ9BEm2JX9V9hcZs8sdpiAet2L?=
 =?us-ascii?Q?MIHA99TfYv3a+YvpfwACNhwdiY0FwAWvHvI5CSpDLckM6+w2S7KphsIZ8JyW?=
 =?us-ascii?Q?3YJ1rNbwVngOHq/xBwOHqF8+BFD2EqyjrQtV6KhLcQSUA3Dge4E6LuSLALfV?=
 =?us-ascii?Q?21NqttHmfS8b7JOtx5rlgvUuuKqX07Wr7Hq28KLL5NJPOEIXqjHlpa9w/mrH?=
 =?us-ascii?Q?2DyzSa4L6nJsD484/R7d7BjuyoA+miwiC1p7HckWzFWFN8oAxuRYd/M9uNNP?=
 =?us-ascii?Q?nKCzVggHwVUDwIxmJ8L+e9IKcQ+mgF8xEdWPlNzbMCOcNWOE+z2Qy/Lj3PWy?=
 =?us-ascii?Q?rWVgvaH1dIp4iTxLzVstk/0dQ6uGwfGxc2ukGGfP7fUAwJCDCKa0MYrE3Qp6?=
 =?us-ascii?Q?Zj5GozYBz2fB7MLv/PcgJq9rDaVQb3jUGA13kRM2DgJEr19QzS0dD6Ri9s+c?=
 =?us-ascii?Q?exZt+8TfITZolOoMhB+P/LMKY22BgK9uLl7QLVSinkiYtDUBKrxfhg8Jj/mn?=
 =?us-ascii?Q?NGJ7CT1ybo9jgk+lt49X3AhpZzw3NRBVwT/8oZsQZdkT5J1HAuz3GXnjxNu1?=
 =?us-ascii?Q?cuof8XpvQ47wshFjJi/EM9N4LW6viVT1L2/MWQHTV/J+wVADl7skbzx8anXS?=
 =?us-ascii?Q?hzJeq+fuh6KPWPOtzGf4aLHioPzmZphWCatbMpqWJmeIw0YCSgpNJIhGfVmn?=
 =?us-ascii?Q?reBEgIKyKweE636F6G9JBcSOQEPbX1a3ad2wA2RGKfjOkhXVW3WiEJc19m0R?=
 =?us-ascii?Q?Q9FlRABioBtDaw+kXwV28QDW0ME3eYznbPTjzn4wzFbHFtvjUzlh32RuFcGE?=
 =?us-ascii?Q?saswj65tIqch8ae6+WSyKOmc5AB5uS9kO4YsD9/dclEnD4Sgy+4jrrYZC8Ni?=
 =?us-ascii?Q?tYrT4JMJIEdhoy5XjgxA9NyrCCWhfTSk9HQHhoaeq9jjxzszFjpLLvddktUm?=
 =?us-ascii?Q?aLbqIOai2q3w8Bp2QCGLNzPsnRPmYt7PKIY8CIGiXa7wlWQzEdgVs8+9Vo9n?=
 =?us-ascii?Q?r+0O6Ro1FJQMQLlZhUa5HGTIevh1p7mCyjd1D1g8NHijZmaX581sOmuRxKtJ?=
 =?us-ascii?Q?Z8AxN1qAKHe2Zs0g4jrN577wCEUs78rvx5+gZuBpnhhTaYpIpT9Fhph0+dyU?=
 =?us-ascii?Q?vKur8do2QhYtUpXjHQVAztwltYbIJQ1lphb/3//czv/yDbYD7HYGSAwMfsb2?=
 =?us-ascii?Q?wXynyC4g2rMpKO0S9Ibpg7jAl+Nao2dTeQV2NxQuDzGWXlsEtyN36piM1cIO?=
 =?us-ascii?Q?gNdHoIKLwue9nmHrc8YupgK5dGdO2SQ2CEolbesIxWKDaji/QGBJQ9ZGyXhJ?=
 =?us-ascii?Q?ASUNXu4f69pMtbJx0F9paaOQaMAnmLXGIfAg7reo9BJiYdpvvrYQXhP0/5Jc?=
 =?us-ascii?Q?F7ds55g6Yij9i0uYQkXSy2ow+IinPot3DaehxrUuOOBN5zttVw3MDYK8ISLS?=
 =?us-ascii?Q?Qa3ocui0xs9Y1VGyc13g4EEA5eKmeOjtbCMGWKHSHhtjbbjYESf4lN1g/vSc?=
 =?us-ascii?Q?LE09M7g9jCp4zftknIeruzNGndUHh6G2+oiJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZkhhUoXsZlQlSNXBlrj5M5flFXoGVlmyo92bBdIfPKSQHSbFHnLDgMhtaVaY?=
 =?us-ascii?Q?xPeMJwSD2Asy75Nnyec9kF3NA8uvouPaEJB5TsSgh77m2EJa4rv33wrVNecF?=
 =?us-ascii?Q?BZricvRmhciEhegBMyEAppjKbhPGohRWKWuSRX5vvfdNJrsDM7y175oUjBdZ?=
 =?us-ascii?Q?etmC3M5DLBqRgLRq888Oy4gXS4dyWx01Rr80JpozNVZSB+MueiGTS9+jdIQ0?=
 =?us-ascii?Q?WCmkCnWEDcKkZpMnRaYr3Qn3jGbPmG8lch6wBP1Kb5YBjmWlFdKjja+n4Dv+?=
 =?us-ascii?Q?S955ZqWoJOK4/EV47lkbhX+a9pkZw8tyxb6Ded+7xhB+tPtHiQDUoRVi+DGm?=
 =?us-ascii?Q?/8JQCUDq8zGqgbOg760PHCNptAMZnu4RjUkJ6joVnUl+Ky2H2i+p6EscWsBS?=
 =?us-ascii?Q?1oK309Z4aXZxbxg51Zxrw2x3aXxKyDa/1fuk92gmsak/Z6s/xWT5Lfk2OHch?=
 =?us-ascii?Q?4QuQS1ZOiEA0/7w67gNzuZ8SabYTVL9214ZSaGM4KYaaRGelhqfzE5nwgdvL?=
 =?us-ascii?Q?nPOdz6/Le20hvjsyDTX0rQ6Kf+nlbQultXbH52JW/N2TW8szcXlS9uWIIU4T?=
 =?us-ascii?Q?7edaTuop2iwYTqZMHEsRBKKwYCDvzQV4cYf4YQsbZP8sMEzPQ8DQLsjqPCkM?=
 =?us-ascii?Q?Q05BCyQ+aggf++phV0lo/d7u8TjpuJ2jW7X1oh401/uLsNUoz6Vq+TWeGEn9?=
 =?us-ascii?Q?TnGM0Z8siCF4QIk0ra918+ZJ2y+iHiyk84z805LRM7CrqCksRz7mHpYpe9Ji?=
 =?us-ascii?Q?OMgi4xk5XtemMDHpUTFls3K36gxTfRRs5A37zwIj7wGuMAYgBUuq/XsAgF5Q?=
 =?us-ascii?Q?RCoWoitQfzOo2oCwMe8R25sueYQfxugxdSW+jsH+F5NKuuwWvuDd1SDQtE1H?=
 =?us-ascii?Q?JgDzHGHR6OLaoEVRDEY2V0gvw0JBVcEYQl1lv2FwaXhKiSKCEpkiuvbfSMdg?=
 =?us-ascii?Q?Z6RjwtdkPId7JZRnL+6OZSQYkKuuMHV7Bp4Auy2vDGH7WYFtTLu9z0WZyPIr?=
 =?us-ascii?Q?/qG3I5ctHwxskWrli601rkRMkOnu/clkMziULhGX2nDUjROmc62wlUMpWS1E?=
 =?us-ascii?Q?/cHoC8E8jnf8TZiC8poTNL9vL/oJMoKT0uZEQ6+iaJ10LkzDNkT3OdxLTy6p?=
 =?us-ascii?Q?Eqk2SGzdpNJMYII1F99Qu53LxuzYnbgBNnpuY3iha5JXDhfFnCcs/vDd2QCq?=
 =?us-ascii?Q?l4QgrMGB1SqKQQBvD8jVrGei5Qh5eEfK1wKVbXWzJUVq+Uq7AUOtdg/D+L6N?=
 =?us-ascii?Q?+/Bw5mYpWmtneZp/GqcOS4Nde/6yU5J6DQi4a3B01XBZQjSaHY9gnLSCTqN2?=
 =?us-ascii?Q?NjEyZvvent+GtakJKjcrZaVevfDPI0uI2f2TzsedgOtbKw2DfTTaoXkp0taO?=
 =?us-ascii?Q?IhS2qwvE+4tynLXBI45uyHOnBxvf9dMyewYZtqdWmrKLOif6uknovlgZzjrE?=
 =?us-ascii?Q?jDkGVQMeTClwDMuGBBI8ii6al7eUgeK5Bv6LiugFGTdfL/MGDFl2oLzPllyo?=
 =?us-ascii?Q?ES9boBCf3oJp964ZIwIJVa9yYzrWYk4g4ZcfcIHd5qJLPirHdAKijL1QHiKG?=
 =?us-ascii?Q?E25IBOgxaba4aU6BuVVLcnZ9PN/1YbbQ/iC7Kgz67e7hDoI4gCstFW6MXfef?=
 =?us-ascii?Q?jeyJbCmkoOkCNI7+dSti3Eq8XnlxGCOGiTv5VsvxNdO0MCQ3ATZOuGg3yPdu?=
 =?us-ascii?Q?vkyBRVULRe8Zm25YdVAgKJscxxKGxs+ZrW4ch1FxNfGtb2NzrHs98ogfljJU?=
 =?us-ascii?Q?rGjZDeVp2g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a728a8c4-dff3-4f14-98a9-08de5302225f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 00:16:16.4350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5lZreV1rqwXftvr9e7ZK1KE3L9g+yzAHONI32JchweqykDiFyAhUpBYACQOz6pHqev8WX0M0CxfH1/VByPVXHijVzAtSrBb8Bjzw/DtJqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8228
X-Authority-Analysis: v=2.4 cv=FvIIPmrq c=1 sm=1 tr=0 ts=6966e053 cx=c_pps
 a=rnKATYkPCuOGZDe3J0X1vA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8
 a=gsbnME7212HnmBgfSPoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: kgXbWZTC9Y208g-6fq2O1W_5Lth5-wib
X-Proofpoint-GUID: kgXbWZTC9Y208g-6fq2O1W_5Lth5-wib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwMCBTYWx0ZWRfX2mfSqrDuK16T
 QffyRZpPHnmrbhiu2t+YluNG49stKgsofJMKX2gNErKBEIjhJ+yWrM311PISOE/gMoE0DnrnkVh
 0z573IRn/l6j6jlzAU4B4aPJWKzzKCxrlYrAdzOn3op6kdpPqE9ZDh7nIRCTD9ANBK/Eoep9v/l
 rWKrlQmCOW+IvMn0nC3/juLaQC/rMPgycfVM854AWhqJS+gHHHxSUXanoUdzilCu2BOtGdww8lB
 AKqc0trCCTcdsIFzDaZeT/JbP7paQdNWFHFHks1ICGaCKfxboZUf7uAaMTzd2vKssMrhKSAYLCm
 39lutqT3fcoFGndyhGDowyZnRULnddAp9toCNpGXxRF/K30BzgbVroMuH3a1V7vn+IYX+yKr+oI
 VdLd8Gm+ULHCCxc+2Dyu9vhZ1QQl1EHx64nMS7cO/V5PYNnEHJa89dffHXSWK3R/ZoOy9N7O/bI
 S0sjXAQ361fKDlOLaTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140000

> On Mon, Jan 12, 2026 at 04:55:54PM +0800, Edelweise Escala wrote:
> > Document device tree bindings for the LTC3220 18-channel LED driver
> > with I2C interface, individual brightness control, and
> > hardware-assisted blink/gradation features.
> >
> > Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> > ---
>=20
> No changelog in the cover letter, no changelog here.

Apologies for my mistake in the changelog in the cover letter. For this fil=
e this should have been the changelog.
V2 Changelog:
leds-ltc3220.yaml changes
-Fix wrapping on description
-Improve description and commit messge to describe hardware
-Drop ltc3220-1
-Drop adi,force-cpo-level property

> >  .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120
> +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 127 insertions(+)
> >
>=20
> > +  adi,quick-write:
> > +    type: boolean
> > +    description:
> > +      Enables the hardware quick-write feature where a write to the LE=
D 1
> > +      output register simultaneously updates all 18 LED output registe=
rs
> > +      to the same value. Only applicable when LED 1 output is physical=
ly
> > +      present and defined in the device tree.
>=20
> I have doubts that this works fine. If you define 18 different LED nodes,=
 each
> can be controlled by user-space or kernel independently, but with this
> property updates to LED 1 would overwrite updates to other LEDs.
>=20
> Isn't this then an aggregated LED, so in such case only one LED can be de=
fined
> in DT (optionally with 18 led-sources)?

Thank you for your feedback. Yes, with quick-write enabled, writing to LED =
1 will overwrite the values of all other LEDs. To address this, the driver =
updates the cached brightness values for all LEDs whenever LED 1 is written=
, so that reading the brightness from any LED will always return the correc=
t (overwritten) value. Having the property allows LED2-17 to still be used =
independently, while LED1 acts as a control for all LEDs.

Based on your comments, it would be better to drop the quick-write property=
 from the device tree and binding:
-For the aggregated LED use case, the driver will automatically enable quic=
k-write internally to efficiently update all outputs together.
-For the independent LED use case, if users want to change all LED values s=
imultaneously, they can simply loop through each LED and set the desired va=
lue. In this scenario, the hardware quick-write feature is not used and bec=
omes unnecessary.

Would it be useful to provide a runtime configuration (e.g., via sysfs) to =
allow switching between independent and quick-write modes? Please let me kn=
ow your thoughts or if you have a preferred approach.

> > +
> > +patternProperties:
> > +  '^led@([1-9]|1[0-8])$':
> > +    type: object
> > +    $ref: /schemas/leds/common.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        description: Output channel for the LED (1-18 maps to LED outp=
uts
> D1-D18).
> > +        minimum: 1
> > +        maximum: 18

Best Regards,
Edelweise Escala

