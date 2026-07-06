Return-Path: <linux-leds+bounces-8931-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qJ3uFqkxS2qDNQEAu9opvQ
	(envelope-from <linux-leds+bounces-8931-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 06:40:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E870C75A
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 06:40:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=08gUQn5T;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8931-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8931-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F40B7300D1E1
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 04:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C42D3A641F;
	Mon,  6 Jul 2026 04:40:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9FB253B73;
	Mon,  6 Jul 2026 04:40:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783312806; cv=fail; b=jDFaCVCbtaczKF6ZvnPQyH9WMfDee0fkXY7HpZEs4rsARuMAialxvYLZ2m5gBg0PGBJl75WwGWlW0ICyPf7t3r9d9q6/2NE1NgkW7kKjR4YziVbBN2E8YGLkmC263BmnQ+JQDw45udTKmpzkGykii5xGLs8jpOj6yE4/0O6UfTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783312806; c=relaxed/simple;
	bh=DXLY++ce3TbB0zZiC3Oali4hg+Yz8AcY6IxcasWKpu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C3gEAFOhwVuAL3p8nRsFQvTQ7aR5w1++/nuvYycLA+ZduxYGJbEgoKZvrzj0XBrkve8yrrphFhQxMR1P+vTRrvxcoH+JU1Em2cWs/Xfb1XawY7CneBFv9VCpqTH/RvxoQ8oO8okJFf4jWuzXmfoK+nJTLN2VkTgrrqNK60e2af0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=08gUQn5T; arc=fail smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664dhi83100907;
	Mon, 6 Jul 2026 00:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0O9L3
	ZLOB7zpa/cjFAEnIpcllHN55qLexdgIkQ5L5ks=; b=08gUQn5TX95MlncxGMFh8
	XTxYZFlWYQ+xS9C0udSCe1Pb8OIuhyOmwU2pPzGaB3Bamt7N9z6+QNjRiDXhNSuN
	6GJ8mPnunmLv1tBKYTDyW0q9ojtkXv6XnOCS0V5KCQc4bmKMxBLnS4uZhJLhr6pc
	rj2anRj05XucU02RLuHiSBoDrvUQZdvVxe4jPTbfbjVHefl7CUJvWaywjsNIfOga
	frn86qyuFEWvZEXEFYW9ykfoFOudg3Lzxu66PRrHceIIZZ1lxmVwJynNDLR9XVha
	3vqi9Y2PT0FKJGoIo8JlmeB5Mei2wyb1U+6gFxw6tNogEn/q3nSLxCP7voVyMBhm
	A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f7ggbtkpe-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 00:40:00 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PADFMM1YNvWY/Z4D2xlplY7umx3PVHPuh9mTG+zCAz9CskBQqdiXBZmxbw/7ig6TS2gfeWDH/5aKYVse9CD+z6f0q8u8/Azy4qGjRT7BLSLGlUGzCz9faxA4vwmqzDqj9uwjskXZ4Ub03Y5BdjL+CAiOLBDcctoXsWNmdrzzy3cLubd1G4esTsqKuAEBUS9eShWEyQRaqucDTdDK/LvoElwWHygk2YgqYxhhg2YS7j6Qmf57kIzNk+lpYMn7SWnsbAoaaZB8f8CKigJWzZWFZ8suyXoy/nDCjCQt6CkkSY+//PUQWXFUtR+7NJ+SmxvucC8AZVOiRbHwUziSQWn/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O9L3ZLOB7zpa/cjFAEnIpcllHN55qLexdgIkQ5L5ks=;
 b=VqyUkupIP3XbCvoXo2oveBO6/XZobXe0PZn8zrb7nESkfJFTNlibhxWVvLca/a3NYh6OLLU7r5PM6ZJ07UFpwVxyYUP6W/T9eGpDT6MA0mByUQFzK0xgjbJfQPgEYDGlcDzrGDqSSM/71XqPmV06hYsYDmmy87mfEomcCloTqXZFMILYvH07TI+xyT9JsNd71y0h7JBRYPFiY22MydZgbYFI7lyaJ5k/cOMdNkVn9MNOus7NVGW54qRwyaAoXOfIEavGiAjrLXg23dlrmMjV5Sbi533IuTRtaPFoX+W21saqaPFaeXeQLpDPQpY1ERkRKelvt8MBI0Yi3JifQ78beA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by DS7PR03MB8033.namprd03.prod.outlook.com (2603:10b6:8:250::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 04:39:57 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%5]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 04:39:57 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: Lee Jones <lee@kernel.org>
CC: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Uwe_Kleine_K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: RE: [PATCH v6 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v6 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdAuMiNFqpLY5cBkq6ZR4cWfjPJbZabzqAgACuJFA=
Date: Mon, 6 Jul 2026 04:39:56 +0000
Message-ID:
 <BN8PR03MB49772F51024DCFE3725E45E896F12@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com>
 <20260623-upstream-ltc3208-v6-2-fc6bd9749166@analog.com>
 <20260702155027.GV2108533@google.com>
In-Reply-To: <20260702155027.GV2108533@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|DS7PR03MB8033:EE_
x-ms-office365-filtering-correlation-id: e212a10a-d1b9-4424-b66d-08dedb18a194
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|38070700021|4143699003|6133799003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 9ETkRrkzL5pUFrOdzoG/aE9/piODACuj1MJwwmUf6i5U+24JRK9hJHLlQTfCcesIMXX31dDySYwupCrBlULTemvbkGv4jgX1p1rmV5F7CEszl8uefh0LyOl0wsx1uqjc71eaUBRZnDGduJq+1iZXKqlbDdKZp1fOCyaVg7iHc/SiAEi0ni9pzlgNkLy9ZvJHzod+weyVXKEq7pvzcOWSmUPZvzw2YOJC98EJSd64hdy/B4D+U0vqOC1M/BO4QQCgdU2Okt9bArNDNxHttv3nL7vfRPiLiYWyIMYoFi97liRo6ZDoQZrItTkgVd3qHZiNXydg6j8fSvz/tPyA7MCYjGL2zG4WwG963hlQPDJ3QEMto4z4K45MGKSkIQ8lDCSXduwBd2CGqEUPc0HAhotMAlPSh4lBxVQV9nvedlzRaZ1eysPas7apFKlNFKHiZ1nypO1sc6YpI6KOOPD8KfD7haKdKbWR6t0X7tdyvg/M3V/bd3FNZGY/IJ0VwEMCqG6h678EaWx+jq5S3nWDdvTxWe3G8ytULOICOBa9nxCYh6xXF3KzQCNqbpR4vDfWQl7zbL4Nkx7KpSY8H7SndDOGcKd+W6nuy5Vc0B9yEsAiELxyl0EOCL/gBUJSK0Jd+oGqjRm8LiV+7Cty6XSj4hOvFxTkrhJWcIC0c9wQ1qK0ILIqo/eciHLNQqt4hD29aBN5qYDK6FwMEeHqj5sCLvPPa/Q+2NBdxBHItO4vMEwfMnc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(38070700021)(4143699003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WHExgIQx2twrD8bzk3Y4tgsBW0c9z2/HEDze6uVRIoc3gnRl9TgCT4LxEj?=
 =?iso-8859-1?Q?/dT9YVEQFfEXKpWPjPnYb3N93p6DYM+X+rrqDJqk70FqwZtwQb1VPDKHWE?=
 =?iso-8859-1?Q?y2TItdEas3U0JXuMCnLfL9yZLZGS0oALyTNzPBYOwpZh880zdx3TD13c5V?=
 =?iso-8859-1?Q?eVkoGlLnkWPCGiHnkf3m0Y9gK2xIqdUwGfUmlXZJZlgIS2hmuHmltfg//J?=
 =?iso-8859-1?Q?iPnF+x3h4eELV+PyNUVhcyveZlWGDJMpqYBhEVhbweCxrK/aSzQMZMvkHu?=
 =?iso-8859-1?Q?wjiM3D6Rh6ZC0zYjGK8QaCv+XVfC/45+HDMSXjHuHhOgS22uo9uqFNmmME?=
 =?iso-8859-1?Q?eiMC5Y2Ye8PtJYV6EHJdANF0VMlIbMuOKfkFxoAG5Z/LRibs4PAnQixdS5?=
 =?iso-8859-1?Q?ltWsqwoAnlnAEK3ttYLr/zQcIVNLlKtm9SQJUQt8GAyzayng43lMNp8Mq4?=
 =?iso-8859-1?Q?W+RitVf2sxfYJTFYSDJj1dfOg7I5ZwvbIC0Sw3+O2TyY/NjNMZeu+6KVN1?=
 =?iso-8859-1?Q?1Vx3pcU1nQc6EmwCVBybt4poRqaWyjrFPB89gEZOYedXhyQPpr30rtB0+x?=
 =?iso-8859-1?Q?KpAhc8VcMtQ8/dpaN7GMjiX7IE1CvReyezfzZ7F6mJPZ2vvF1rxm4QqM3R?=
 =?iso-8859-1?Q?t+FdZ/G23nP6jaWdJyCnvd8lJMuEJPi7jjvYfB8ZAOWoKF5LETfsMPiIH8?=
 =?iso-8859-1?Q?f9Rvr8r5rzGMpBIt/i4B/Vn9rfO4nTv2g66JoSKDA8kA8G7dBNrEnnxXbt?=
 =?iso-8859-1?Q?XcjeoTLl0AAEqp6lh0r1Mjaq4eH2zqzG9kmz2fg6nsPzMujg7B/FR61R+Q?=
 =?iso-8859-1?Q?dbG/seAWTTvVlKksaRFk22yovJABVCZeMzznDrvixkxqzJj5uCTNyvaJAV?=
 =?iso-8859-1?Q?7LgerenWOgdGZ3udn4k2WTGFAUN9+RI8YXKROHUnFCz8puh8BhcQ9MxwUO?=
 =?iso-8859-1?Q?SgxiJ1k8XzSQQu2zBdkVWz5TEsvTMwF8KSDt4KBHCvvhFqV28tRRscg6+o?=
 =?iso-8859-1?Q?wkcImsUC0lVgRsiqILjXw9aq7L5t8KLQVG34VNZ3Z9u7WpjLk/TjSxmDiX?=
 =?iso-8859-1?Q?4TH6ox0Lv/BrnVfw/vMk/NT2WV4GDx8XBjtryAHHue/HP/nf5AgQyh5w1M?=
 =?iso-8859-1?Q?zWfvz15nGNHdI7xmqCfcXdiyyK0KL/3qf0Lol28L6O6xbWfgHkhYs17VD6?=
 =?iso-8859-1?Q?x3yB6PmsXm4VwMEusmxt7Ahi8c9r7zTdAnGtfQ53jPXVEe8sbuQiWz5ATk?=
 =?iso-8859-1?Q?KpkfqRKGtOvLSSE4ld25drcnBVQ46NYKeLiuSELZJSikon7v22t/x6hlgE?=
 =?iso-8859-1?Q?7En30o75dDiaIa79QkqUJ4J60Kj6usgMrg4/rTgG1X4fgtTg1EMV+FaWyn?=
 =?iso-8859-1?Q?c2FqXQ7PLllLflg2FKUPJehZMwDOq99erQg86nP3tozDBRyMMiU/5BlRH3?=
 =?iso-8859-1?Q?M8WqSCdgOWCb/Itpzq99SxuBjz6DNyAYONpUDxXrOrNocyNPyJBzwteIAi?=
 =?iso-8859-1?Q?V/asc3E1eMV/d814OJTn+vRm7MAXmTFrvIxGp9qPVOhYWnQeoo3hpiNVTZ?=
 =?iso-8859-1?Q?+NxaEtT7TvJUpTV73bB7fgLOUP0WZMyAjcjy3tU7GvwmxLd9MDV0ZjTgE1?=
 =?iso-8859-1?Q?rk3LAxZAHxZ/jHHJTJVk4q9idjxdLdLCSZwgFenZWfmEtISVEJpDMDMpW9?=
 =?iso-8859-1?Q?ZiP8sp98MpzLI2XlaM5D0xRXUJGBeSz4+iaKnVyA9xEaXlKOX5nSqTbTlo?=
 =?iso-8859-1?Q?9QMb3qebT01QF6WpJsg9Z58+KCiVng+r8okYfsfhkEHI5sRDricr6eAXwb?=
 =?iso-8859-1?Q?+LFEIkP/Dw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	OcjKkPgNUKSayqZjd0yj5fsltuqgVGHKS4mpJO5IN02skQEjVudf84iqSFy9nQUzlHRugzT08kroflG/Vdg8aSfr9GcLj256vSmS4PQmkRBuza3hz+o9+XFd/HO/OB9Qiox5eVWwcFNYssrlwFkhp7hVSkmRCkUaUlg+Osrt0iT5T78NE5EKTKRbh7ffK8RCBH9v7S01r6Ngn/S/kDJp//A4UxRN7K11hcdvxRD90/yfTZbCGKVSS7yIaXPpTk2BB1eTsuhzn6zwtex/tkljSb/z/1Gzh/uURp7rhzkFBTc/+vEJYWYm9MRzRD2wkHsvoIFWgOgtEGjMEkxCMB4iaA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e212a10a-d1b9-4424-b66d-08dedb18a194
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 04:39:56.9182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhZyjx/sHq3mLrwVF5VyNxUf87VegMBjyl+JO9A4tvT2WlHN04C6IWjAylG0X6S0ZVjSC57SA8k+avk5v4/J88CCRQ9/KHqRmbZHtgVXgR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8033
X-Proofpoint-GUID: scZPKACbfpDWEBt_XfyRHiaRxyC8ccMh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0MyBTYWx0ZWRfXy7Ol1tvkZl/5
 4nlIJ3BaOVXVevlNLhmRfjni+O0q03VeCZpQK5AQucaiVD0pNSzt6R/LEtHFE+mLNN9h6mU1GYe
 BKxKHHLww7qimUxcwpYGn46+J4Sr7fecO019bWlRK/2lOkyaJk3p
X-Authority-Analysis: v=2.4 cv=TPx1jVla c=1 sm=1 tr=0 ts=6a4b31a0 cx=c_pps
 a=fyslLl4jtBSJ9QFfScbUNQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=y7P3pPyfaI7Tb_U7fLQA:9 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: scZPKACbfpDWEBt_XfyRHiaRxyC8ccMh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0MyBTYWx0ZWRfX735ANiDushIl
 JEgADlJ6yHUBbtqav7Uc/T52/CnUnlBBW5uAU2Hk8xDNX19+y9YerFLeA7JMbgDQjt/c0m2Hz5W
 cT+qy3hO6Bj4AC3Q62Mna6Eb+ybO/phFxEba1WQrdIoJi75aa+ZHx0af5Q28UHDk5Xf6WVqqvLD
 PdmdGiV+MfXXaA2L7ei42tLsZkUUyKUFCmLo4zGn8Gb55S87XcSpvhJKZUnBJZPQCfWe0xr7V0o
 /1UQx9nG8x0LCy9Bm5uE6uZdQiaBv9hdlUL7boZtUwJimcuvkicTSvSbyo1FKx6cAB1kulkQPlA
 hxIIUc5OrzYiJHABT3z9raRalwHL3jCVrIRo1Hb8ZM/GOkoBCeDDuQdSlM+TAURIafSdHhWtdIA
 f05WcATgKkD9e2I1XVGZaD4kpdAe/IaqJAdeSkLzWnQZ8DijUW/lchhYbCA/BstTSlE9HQ3ouk5
 0No9DRSvMvDWkX3mi5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8931-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B80E870C75A

Hello Jones,

Thank you for bringing these up.

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, July 2, 2026 11:50 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Pavel Machek <pavel@kernel.org>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org; Uwe Kleine K=F6nig
> <u.kleine-koenig@baylibre.com>
> Subject: Re: [PATCH v6 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay
> LED Driver
>=20
> [External]
>=20
> Few things for you to chew on.
>=20
> /* Sashiko Automation: Issues Found (6 Findings) */
>=20
> On Tue, 23 Jun 2026, Jan Carlo Roleda wrote:
>=20
> > Kernel driver implementation for LTC3208 Multidisplay LED Driver.
> >
> > The LTC3208 is a Multi-display LED driver, designed to control up to
> > 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN,
> > BLUE), each configurable with its own current level that is equally
> > set to its respective output current source pins for external LEDs.
> >
> > It is programmed via the I2C serial interface.
> > MAIN and SUB support 8-bit current level resolution, while AUX,
> > CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
> >
> > The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> > channel current levels, or as its own independent AUX channel.
> >
> > The CAM LED channel is configured as 2 separate CAMHI and CAMLO
> > register sub-channels, which currnet is selected via the CAMHL pin, or
> > set to CAMHI register only via setting the S_CAMHILO bit high in regist=
er G
> (0x7).
>=20
> [Severity: Low]
> This isn't a bug, but there's a typo in the commit message: 'currnet' ins=
tead of
> 'current'.
>=20

Will fix this comment

> >
> > Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  drivers/leds/Kconfig        |  12 +++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-ltc3208.c | 244
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 258 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 2fd6ffdaaf04..e3b59485ecb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
> >  S:	Maintained
> >  W:	https://ez.analog.com/linux-software-drivers
> >  F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> > +F:	drivers/leds/leds-ltc3208.c
> >
> >  LTC4282 HARDWARE MONITOR DRIVER
> >  M:	Nuno Sa <nuno.sa@analog.com>
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > f4a0a3c8c870..d917ce3b72f4 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -1028,6 +1028,18 @@ config LEDS_ACER_A500
> >  	  This option enables support for the Power Button LED of
> >  	  Acer Iconia Tab A500.
> >
> > +config LEDS_LTC3208
> > +	tristate "LED Driver for Analog Devices LTC3208"
> > +	depends on LEDS_CLASS && I2C
> > +	select REGMAP_I2C
> > +	help
> > +	  Say Y to enable the LTC3208 LED driver.
> > +	  This enables the LED device LTC3208, a 7-channel, 17-current source
> > +	  multidisplay high-current LED driver, configured via I2C.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called ltc3208.
> > +
> >  source "drivers/leds/blink/Kconfig"
> >
> >  comment "Flash and Torch LED drivers"
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile index
> > 7db3768912ca..0148b87e16ba 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+=3D leds-
> lp8788.o
> >  obj-$(CONFIG_LEDS_LP8860)		+=3D leds-lp8860.o
> >  obj-$(CONFIG_LEDS_LP8864)		+=3D leds-lp8864.o
> >  obj-$(CONFIG_LEDS_LT3593)		+=3D leds-lt3593.o
> > +obj-$(CONFIG_LEDS_LTC3208)		+=3D leds-ltc3208.o
> >  obj-$(CONFIG_LEDS_MAX5970)		+=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)		+=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)		+=3D leds-max77705.o
> > diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> > new file mode 100644 index 000000000000..3d6bec99e9ea
> > --- /dev/null
> > +++ b/drivers/leds/leds-ltc3208.c
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LED driver for Analog Devices LTC3208 Multi-Display Driver
> > + *
> > + * Copyright 2026 Analog Devices Inc.
> > + *
> > + * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>  */ #include
> > +<linux/bitfield.h> #include <linux/errno.h> #include <linux/i2c.h>
> > +#include <linux/leds.h> #include <linux/mod_devicetable.h> #include
> > +<linux/module.h> #include <linux/property.h> #include
> > +<linux/regmap.h> #include <linux/types.h>
> > +
> > +/* Registers */
> > +#define LTC3208_REG_A_GRNRED 0x1 /* Green and Red current DAC*/
> > +#define LTC3208_REG_B_AUXBLU 0x2 /* AUX and Blue current DAC*/
> > +#define LTC3208_REG_C_MAIN 0x3 /* Main current DAC */ #define
> > +LTC3208_REG_D_SUB 0x4 /* Sub current DAC */ #define
> > +LTC3208_REG_E_AUX_SELECT 0x5 /* AUX DAC Select */ #define
> > +LTC3208_AUX1_MASK GENMASK(1, 0) #define  LTC3208_AUX2_MASK
> GENMASK(3,
> > +2) #define  LTC3208_AUX3_MASK GENMASK(5, 4) #define
> > +LTC3208_AUX4_MASK GENMASK(7, 6) #define LTC3208_REG_F_CAM 0x6 /*
> CAM
> > +(High and Low) current DAC*/ #define LTC3208_REG_G_OPT 0x7 /* Device
> > +Options */ #define  LTC3208_OPT_CPO_MASK GENMASK(7, 6)
>=20
> [Severity: Low]
> Is this macro needed? It appears to be defined but never used in the driv=
er.
> The same applies to LTC3208_MAX_CPO_OPT defined later.
>=20

Ah yes, this was from a previously removed feature.
(CPO is no longer configurable and always set to auto by default [=3D=3D 0]=
)

> > +#define  LTC3208_OPT_DIS_RGBDROP BIT(3) #define
> > +LTC3208_OPT_DIS_CAMHILO BIT(2) #define  LTC3208_OPT_EN_RGBS
> BIT(1)
> > +
> > +#define LTC3208_MAX_BRIGHTNESS_4BIT 0xF #define
> > +LTC3208_MAX_BRIGHTNESS_8BIT 0xFF
> > +
> > +#define LTC3208_NUM_LED_GRPS 8
> > +#define LTC3208_NUM_AUX_LEDS 4
> > +
> > +#define LTC3208_NUM_AUX_OPT 4
> > +#define LTC3208_MAX_CPO_OPT 3
> > +
> > +enum ltc3208_aux_channel {
> > +	LTC3208_AUX_CHAN_AUX =3D 0,
> > +	LTC3208_AUX_CHAN_MAIN,
> > +	LTC3208_AUX_CHAN_SUB,
> > +	LTC3208_AUX_CHAN_CAM
> > +};
> > +
> > +enum ltc3208_channel {
> > +	LTC3208_CHAN_MAIN =3D 0,
> > +	LTC3208_CHAN_SUB,
> > +	LTC3208_CHAN_AUX,
> > +	LTC3208_CHAN_CAML,
> > +	LTC3208_CHAN_CAMH,
> > +	LTC3208_CHAN_RED,
> > +	LTC3208_CHAN_BLUE,
> > +	LTC3208_CHAN_GREEN,
> > +	LTC3208_CHAN_N_COUNT,
> > +};
> > +
> > +static const char *const ltc3208_dt_aux_channels[] =3D { "adi,aux1-cha=
nnel",
> > +						       "adi,aux2-channel",
> > +						       "adi,aux3-channel",
> > +						       "adi,aux4-channel" };
> > +
> > +static const char *const ltc3208_aux_opt[] =3D { "aux", "main", "sub",
> > +"cam" };
> > +
> > +struct ltc3208_led {
> > +	struct led_classdev cdev;
> > +	struct i2c_client *client;
> > +	struct regmap_field *rfield;
> > +	enum ltc3208_channel channel;
> > +};
> > +
> > +struct ltc3208 {
> > +	struct ltc3208_led leds[LTC3208_NUM_LED_GRPS];
> > +	struct regmap *regmap;
> > +};
>=20
> [Severity: Low]
> Is the channel member in struct ltc3208_led used anywhere? It gets assign=
ed
> during probe but doesn't seem to be read later.
>=20
> Similarly, the regmap pointer in struct ltc3208 appears to only be used l=
ocally
> in ltc3208_probe() and isn't needed in the struct.
>=20
>=20

Will remove the channel and the regmap pointer members then,
as only the LED needs the regmap after initialization.

> > +
> > +static const struct regmap_config ltc3208_regmap_cfg =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D LTC3208_REG_G_OPT,
> > +	.cache_type =3D REGCACHE_FLAT_S,
> > +};
>=20
> [Severity: High]
> Does this regmap configuration need a .reg_defaults array to seed the cac=
he?
>=20
> Since .reg_defaults is missing, the cache won't be seeded. Later, when
> ltc3208_led_set_brightness() calls regmap_field_write() for shared regist=
ers
> (like LTC3208_REG_A_GRNRED), it will trigger a read-modify-write operatio=
n
> that issues an I2C read.
>=20
> If the hardware is write-only, the read will fail and break LED functiona=
lity.
> If it supports reads, this still introduces unnecessary I2C read latency =
on a fast
> path.
>=20
>=20

I was not aware of this detail!=20
Will include this default configuration in the next patch.

> > +
> > +static const struct reg_field
> ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] =3D {
> > +	[LTC3208_CHAN_MAIN] =3D  REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
> > +	[LTC3208_CHAN_SUB] =3D   REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
> > +	[LTC3208_CHAN_BLUE] =3D  REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
> > +	[LTC3208_CHAN_AUX] =3D   REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
> > +	[LTC3208_CHAN_CAML] =3D  REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
> > +	[LTC3208_CHAN_CAMH] =3D  REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
> > +	[LTC3208_CHAN_RED] =3D   REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
> > +	[LTC3208_CHAN_GREEN] =3D REG_FIELD(LTC3208_REG_A_GRNRED, 4,
> 7), };
> > +
> > +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
> > +				      enum led_brightness brightness) {
> > +	struct ltc3208_led *led =3D
> > +		container_of(led_cdev, struct ltc3208_led, cdev);
> > +	u8 current_level =3D brightness;
> > +
> > +	return regmap_field_write(led->rfield, current_level); }
> > +
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
> > +	disable_rgb_aux4_dropout_signal =3D
> > +				device_property_read_bool(&client->dev,
> > +						"adi,disable-rgb-aux4-
> dropout");
> > +
> > +	reg_val =3D FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> > +		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO,
> disable_camhl_pin) |
> > +		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> > +			     disable_rgb_aux4_dropout_signal);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);
>=20
> [Severity: Medium]
> Does this unconditional write wipe out the existing CPO bits (bits 7:6)?
>=20
> By using regmap_write() here, any initial hardware configuration done by =
the
> bootloader or hardware defaults (like Charge Pump mode) might be
> permanently erased. Would regmap_update_bits() be safer here to apply
> only the explicitly configured fields?
>=20
>=20

As the CPO is no longer configurable, being overwritten to 0 has the same e=
ffect.
To avoid treating it like an accepted side-effect I'll include an explicit =
set to these bits.

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
> > +		if (ret =3D=3D -ENODATA || ret =3D=3D -EINVAL)
> > +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> > +		else if (ret < 0)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Error reading AUX Channel %d", i);
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
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "%d is an invalid LED ID\n", chan);
>=20
> [Severity: Low]
> Could this dev_err_probe() use %u instead of %d?
>=20
> The chan variable is an unsigned u32, so %d produces a format string
> mismatch.
>=20
>=20

Noted. Will replace this (and other similar comments) to use the correct fo=
rmatting.

> > +		else if (ddata->leds[chan].client)
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					"%d is already registered\n", chan);
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
> > +	{ .compatible =3D "adi,ltc3208" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> > +
> > +static const struct i2c_device_id ltc3208_idtable[] =3D {
> > +	{ .name =3D "ltc3208" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);
> > +
> > +static struct i2c_driver ltc3208_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc3208",
> > +		.of_match_table =3D ltc3208_match_table,
> > +	},
> > +	.id_table =3D ltc3208_idtable,
> > +	.probe =3D ltc3208_probe,
> > +};
> > +module_i2c_driver(ltc3208_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
> > +MODULE_DESCRIPTION("LTC3208 LED Driver");
> >
> > --
> > 2.43.0
> >
>=20
> --
> Lee Jones

I will submit another patch by July 8, Wednesday, with all these suggestion=
s included.

Regards,
Carlo

