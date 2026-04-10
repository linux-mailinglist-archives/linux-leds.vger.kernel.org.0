Return-Path: <linux-leds+bounces-7676-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENRLB/HC2Gk4hwgAu9opvQ
	(envelope-from <linux-leds+bounces-7676-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 11:29:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FB3D4C0C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 11:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722AA305BABF
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 09:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5032933689A;
	Fri, 10 Apr 2026 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="CU7NmbA9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD782C11CF;
	Fri, 10 Apr 2026 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812647; cv=fail; b=mQdOg+A2eIIPu2HSxgDe4s9Ns+aQFotQTlQw4BN76sV49wByZrpYTW3pEP8WG6/49rNkthxBxKP8mbUxaBNVVJk4WFZhO3ERA9fRTpFJxuX24f9OroHLAUzchSHn4fVaVS/+ajFXzfa5vzqjAuZ8h8Tkgv+BNkeXmuincIa3fdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812647; c=relaxed/simple;
	bh=zlT3aTiwUVOPLz/Rbh06V2tPhdDZ//G/QzLIluXZxO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bKRnk/h009SBkVLTV5ZeS/htvWw54tmxOiJ9nlvgjmeWSH74IgqQdFbr+keXG+hty532smSoQQYyqJUKhv9c18U4xDuLdoi/D7Op0ye0NtI/TyOsN9FYCXTyBhdeK+8j8qFZvEDBNXUZGrZFpW4HoV6WBsWNTvOVCft+r+oCqhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=CU7NmbA9; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8QqZr1757554;
	Fri, 10 Apr 2026 05:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=zlT3a
	TiwUVOPLz/Rbh06V2tPhdDZ//G/QzLIluXZxO8=; b=CU7NmbA9rtqnvKpY7QdZW
	kZoDx+QGfFq3p2MLkp0w265QFamde+uwWQBPQ4hRREwlV4ga3ttnxjylKZs2nEz+
	DmSHPnWnf6a/PAgG/EOetATqVLG63S+n3c85kfzH+R7GQ9VcbtdzW1/tXGiLwriU
	yPiK+4ZK/tOH7ai2ua6G79nTrtvBAqZauHsh9qvhxjnOxEf3YFaksi3XKL2+yfGF
	nBqn9LbYYpecr14rpuLF0uPZttPBR4N0vNWNZx5iP1SVloWry46M1+WE92m+qqHs
	Wvxh9hMyY9/JhRXpSupYNwWF0XeXRSMC8zbhZVsU8e7Ii/EApmegIsCPQUCglhP0
	Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4de7r4vs16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 05:17:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn7+JUSgnZSjItn6D9Meoo4IK1tcj5/gof1IjGGbGRQ2GdEhO8G6HbKRMbxcgtawgMuowKfztr+CgyCkzZqPGLRleO7oI+O/DL5mrURJ73WW3urEegqseCYVe06q9PE3r/Mbrxcf7Q993RP+2o+B7B+27klpQezdmjv8hlMR95xiHi1NLi8xUPMXk9BBuRmnz85V7p4HvR+yUGMLzVNvlL93gJOyGSqfuOye0uqswtaH4euLr5LdI4h6IKV6E94G4/Q+T/oNhPOI3/LSFErcv/lNSyJJUAr46FiUYaCuZqnmr0eGH0XNva/GO6XOMVVC/Mgm66msVjr2sHfvwvpF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlT3aTiwUVOPLz/Rbh06V2tPhdDZ//G/QzLIluXZxO8=;
 b=YpYk6EmzduCecUrf/klzEUdf9z1fP/fahW7hn2r2UKNaLMu84wHohe6eqsKyF/GwmtOwyiWqlhYb8SevojHFpFtgV+DiqNG68W9t9wnqj7Zml2nnESDrRztjt8CYCU0PopFEQjAUcR5Vr4mJB4UKvE7oQxYxX1tznv++0mMSeN3DRIIsL8B8p8gS10qh/3n2MtIZEBfeZeGe41O4DhxoHUPEBkAXTmtNsU5yve8p3O8dmZw/UdKJGtP+QjuLGsM4VxyAOTJEOjc+WBK8sn9aT9AGsPYBVamANXfvxT0246H3pmRS23KIwR8K+Xs5wboypTPdfTenXvcOUVW3fTrIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by MN2PR03MB5310.namprd03.prod.outlook.com (2603:10b6:208:1f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:17:20 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%4]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 09:17:19 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Lee Jones <lee@kernel.org>
CC: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Topic: [PATCH v5 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Index: AQHcjoy2pr3n0SPxdE60bKw76s4K1LWhmAcAgAEnvUCANbdHEA==
Date: Fri, 10 Apr 2026 09:17:19 +0000
Message-ID:
 <DS0PR03MB72288A9B229516F57761BE0BED592@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com>
 <20260126-ltc3220-driver-v5-2-152a30e98ab7@analog.com>
 <20260306111540.GF183676@google.com>
 <DS0PR03MB72281D6EEF372B2E5C73533EED7BA@DS0PR03MB7228.namprd03.prod.outlook.com>
In-Reply-To:
 <DS0PR03MB72281D6EEF372B2E5C73533EED7BA@DS0PR03MB7228.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|MN2PR03MB5310:EE_
x-ms-office365-filtering-correlation-id: a8906dd6-212f-432e-382f-08de96e1f78e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 W/5FIHExcVTgoKgiHAYpHACJNPMtQ8+XDDvvyYEDUxWaSbaA3TfQ6HmsPzNo1U0AUSGjesshbIzvS+zn1wqZ5Prh+LIaZnTgjjYscKWvW9o5oyLZGcfYrXqaKBDOtyPCWqww7pcXbOFuGQVblSmpx7hhTkePYxQXOiygmqEjYC4QiwLD/PmBsYX855/ZjyXl78DuOCXbr8aiBHbidkYCIcQKlcy2tvWtBohFs6BJxVQ5xnF2GiOXQA7zyv7MpdOuOfjJBldZQetVuMTszBR234Yy4H65XiaT8QOLIUbGFIO0v54zc8PZ4xNuFv0Zzn5715HwXAdTv4i03c4VMNz1c0sqGHscKLJjM+kR3BzOwxpd5vGKiQcnnW62MwLw+pU8BdsUAcvEwerpvlvJcfm2706ewDAg8rcJ7QQX9MXAtcoyCNjt6P2N6kqnkMiEHCks3xwzQKJFbBqtdGaiX360UNqF1Lnvb2AGgr/bBRoQMaQZfpz+HpxSS7LFYs8nMmd9Oo0uev7YTLDxGOsz8J3dwJHB/FIVbwwgTXdIETJkuYnHvb39o6Ibt9TIS/cOg7Q1h+PHGqifIE4g9pFKue89B8rfZuZ5Oa5q4pxvxBiUIahGPmsyE8Phf4I4vX/GzZQ6/AWuGigugYExe8uZGudvYJpmz7xHdskNsxR2Gh48/cw9ArI+gqgCZxzJFPbVYIylJg2kb8W7sTowL39mHQXutzFWu4BBLLAOyjT2E04uId8kYBNL2GvU/jPtqS9Iuzg9iJvKe1sE7Jl8DG8VpI1XMe4ERzCzkwjFxEqfeKprP54=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3pPb2twZktoNEdDeUY5Y0NsTGQxSUZOODZCNGZHeDBOR0FxSTFOREJ6VFNG?=
 =?utf-8?B?Y1ZEY2VZN3NlWjAvOG8rTlhpK2lLQU1wdWxFUHRQdm43ZTJ0ekpiY2RTcDdw?=
 =?utf-8?B?dEhsVkNsc2JReXZ1Q3lCN0IyNWJMTHA3ZExYQzRWbXB4QlRDZ0xNVmptb1FY?=
 =?utf-8?B?dDRJVkNJSGs3dkszRndwdEFUeXNpL1g1d1VKTXYrUEUwWjBhcFRsaWZ5eTlr?=
 =?utf-8?B?QUd0dndSMWxLdnZTQUQ3bmw3WkFoTmxzcS9iMUJLQjFCdFBKek9yZ1N3VDNv?=
 =?utf-8?B?YThKSU5VVEcrc0JqQ3Y0dkpxNDM0VnZXNE9PSVB2T1BxdmRWZWxUamYxc21r?=
 =?utf-8?B?ZTFvN1d4QTFCLzJPUmhEWTdkZmhaTWpKeUcraFQ0RWFKeS92UTJyc013TnN4?=
 =?utf-8?B?UDV4S3QyWFVEMUVYdXBRNHJ6WGVkZXdzd2x3NUF1Zld2cDV0Q2t0d0p0WExV?=
 =?utf-8?B?VVpuN0pXUHh6eTRWZkRWTGo0R29JbWEycHNXS3N6ZDl6bStld3BEQ0xwOThN?=
 =?utf-8?B?ZmxLa2lsSVowTDVDRUdJOTYwSHdIT01VU1JFQTVLVXhEcENuK0I1aFhaWEFp?=
 =?utf-8?B?d1JYVmk4ZGhMNFhkczdxUnd3dmc3YktjSGVEMDZvZ1JRd2FOeE4rcVBlejlN?=
 =?utf-8?B?MlhDY3ZVd3VmV25LUTlOdlNIbndRSzhTWm5BZTczR0xxb3hLRmwrSmozb1RW?=
 =?utf-8?B?VWN5YWtSMS83aFR2YXRXeDB5MmxKNXNCYVdMZ3J4aUtPMjFmaWFEb3liZTJu?=
 =?utf-8?B?L1VrOUlHUk1mYnA1MTduSXV4NUMzSnRhU1U2WG9rTlVVeStpdVR3aVYrLy83?=
 =?utf-8?B?cWF1S2NqSUhZdEsxcTdIdHNqa0ROZFQxOWpzQktqZDVaREI3SDlvWUxiUXFH?=
 =?utf-8?B?SmhVK1dpUG9VdHR5Y2lSbHZOa3BGZjlJc21FRHN0RnJoNWxGRDQxTktTZVlV?=
 =?utf-8?B?NndXbzRmVVNJaVpRZURlaVpwRGhaM3NYV2lYYlMwbFExa1psaStuenZnc1kx?=
 =?utf-8?B?MTlNKzJJMWtLQlNyMXBpb1E3TWxDQkFCaGhNd0VIQmZveWI5ZFR4a2U4SURH?=
 =?utf-8?B?SVQrdGdrSnJibDdGOXBzbkdoUkRqbGRVYXV6TXBrNGpkVnoyb1VHOU5uVWZz?=
 =?utf-8?B?UmUwS1orRnFrL04ySmFHRlZXK2x4YTR2cGJMZUhMNGJxQnF2V3VUNnlxbTZ4?=
 =?utf-8?B?c3hRSGNuVWppVlI4TGRTSUlJU2dsU2Fjd1NobmFDZ2RVYllzc1lpd1dPeVBl?=
 =?utf-8?B?T3Z0LzdnK1FBUVJxMlpGVWx0MkQvRnBUT1dubWZTdzFsUmE0ak9kQkUzclZs?=
 =?utf-8?B?K0dwMmNPdEdyUlpDMkg0Vmh5ZThyVjNUNmQrZ2h2U2tqejllL010ZjdaWXdn?=
 =?utf-8?B?d3VraFR0ZDQ2SE1iMjJPSHNFUkdyamRObHhOczl5L0JON0l2d2MxWk5NUFEx?=
 =?utf-8?B?ek9pSm1UcStmeERRYkJyaGdhK2tpQ3Y5ZzlCWE1BMWw0alZ1b0VMbWpGVUlu?=
 =?utf-8?B?d0Y2bnNqbEVYOUN5Q29YVWN2K0c1emx6YlRoeXoxb09BenBkc2FWTlZGRDc3?=
 =?utf-8?B?cHdsMm50cHFnWXpvVm9qeXlmTWlUeU40WGlRMWFKenVidk1KK1dpenhncDgz?=
 =?utf-8?B?a1ZrNmhZRkx0UzdsYmZWS3pTSUQ5Y0duQlNBVEV6V2ZvTUMyVWs2K0ZCZ01l?=
 =?utf-8?B?WnRmWlRHcTRPL25wZDBQTDdtaEdURm10ZzlORTNodnlkd0tnNFk5NTFsYUNj?=
 =?utf-8?B?VDVMeTJBTU8weTNoQUxNRnAvczZpZ3kyQUd1RzNPeGpMSllZVnpTZlE4L3R4?=
 =?utf-8?B?VXUzN1BvVFcrbEZMUkF2NzdsdlRQaEFUVnB2SkxVWk1sRkVybDVqNWsyZ0Z2?=
 =?utf-8?B?QWYxK25aSVEybWVuR0VjL3FqZkVxVU1YMVJDelhNVzJhVHkrTXlPSnFBSEJs?=
 =?utf-8?B?NnVrMWY4VVZGbWtXb3ZwTDIxcHdBdlRlcVV5d0xhUlFmRW9kNVdFYWdHdGFS?=
 =?utf-8?B?WjVudDZxUjBjSUZXbnNKZ3VVZURCVWZmTEJGVmd3TkZZRW5SZ0hhUFdVcVNX?=
 =?utf-8?B?MVZKNEhKK28rS1JtRWNWdUJsWGhvL1FwQUtUTTFVQTJrUll6N1NSOWdPVVl3?=
 =?utf-8?B?STBQVVdnSDBFb2UzNTVIczhOVFlmelpqcmJJeUlPT1pqa3g5T1JIMjhtZmhR?=
 =?utf-8?B?K3lSQ3I2NWhvY21aMEZQcmRCb3VEeXplTk5pays0Qjl4WW9GUXcwZEZqL3dP?=
 =?utf-8?B?T0RvekZoVThSR3ZDNDRtRUZRM2JFWHVFMTJjd3BTazhaVUdJZCtxa2w0YVR5?=
 =?utf-8?B?enk4RFpSZVpJTDkyeXBBYWpQVUR5VGxJRjhpS095VzBNSUVpdHBjMzc5OVdZ?=
 =?utf-8?Q?45yAfX8bAft8z97V8F4y308MrU3sEVnsc/FDXF0UdTJO+?=
x-ms-exchange-antispam-messagedata-1: /S23uSA+wtmMgQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cQrTcA7X32OLQLksHT6uk/2+PNc7ULnCMrV6t2jE4yZSbeL9tn0XseDXwEOYmKtJWLqEkY7D4PEeyFI0vxjwEqIktAjtW0i6AxXyuOheNY0ui98FljFEMkJc2USorwyzao23V+zDoSK5S69uZIsaOa05kAoKMwOU1lxD4GPVrS/hdEg741/9JXFSk6fvvV97WXmbma77VTfFw3whAq4/J/6UEF8ec7EIwJTFhyiBUpc3AJNIzoUdLfr/G/Yi6o3pImtem+XaCWk6n6amJxYw5ymmzXYhSPwzbl4M1prdXetdYKIfN6rsW9wpMgRM6bBGnfN08hVju03ao65+SyPxgQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8906dd6-212f-432e-382f-08de96e1f78e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 09:17:19.7849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlC/aReY1SFQ6KqLcYwOD/6mnqJisxTQB5dB5S/90Zd3XRWFpu+uSodXcrFOo17nMPVlbRgBwG3RpVplTViHNX/I0sgG2/4ZxuPMIbeSQ0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5310
X-Proofpoint-GUID: QeOSyxZCa6QF9t7D6jm9oXu_kxmFO4XP
X-Proofpoint-ORIG-GUID: QeOSyxZCa6QF9t7D6jm9oXu_kxmFO4XP
X-Authority-Analysis: v=2.4 cv=Kv99H2WN c=1 sm=1 tr=0 ts=69d8c022 cx=c_pps
 a=KOMCkPMYLpCa0saNKAKAdQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=ikhz4r0UC1OHn4Va3PUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4NSBTYWx0ZWRfX0l+GN1IERDTq
 06K4jEu95Jw1z8XhpXfcLKx0Hd5R2vEVibbxXwjoUkLRjzSID46htMwrt+tTJOocb1xC/dFhU2X
 5Ar/uaPfh7vJkMVPkptf+oNb/QBcD73lVIQEUncVqLHtRFRDdXLHOmQqS7v5PjyAiwrdr9Q+j7V
 ijn8JGikkF1Rx75IgdQx2/owpfQtjlsTNM71/31anpeFxlmEbC+ZHfhdb9pgqUYVxmr7OZt0l7v
 acuC/NFIWepIrVpk9AjRC2GncBReoWVb5kpwtbZa66klloiQgO9cVDaXiu20CyWt6LBkiCYWHuf
 nLCEiNL1AqBPfWh5RuZST/CLH95ow6+T9ElBfY8z6Bzppc3BdYR1Jxly46XmM6keGo133uvqH04
 nUMYLlN//7IojJegChB2XBUFgqm17U9RpbN8cmu1atXHDZJaQMCAx6sR2HbWeTCogQtJz4B1cFy
 LfKFkm28awvVAyXz6ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100085
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7676-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,DS0PR03MB7228.namprd03.prod.outlook.com:mid,analog.com:dkim,analog.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 881FB3D4C0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gTGVlLA0KDQpJIHdvdWxkIGxpa2UgdG8ga25vdyB5b3VyIHJlY29tbWVuZGF0aW9uIHJl
Z2FyZGluZyB0aGlzIHF1ZXJ5IGJlZm9yZSBzZW5kaW5nIGluIGEgbmV3IHZlcnNpb24uDQpSaWdo
dCBub3cgd2hhdCBJJ3ZlIGRvbmUgaXMgYWRkIGNvbW1lbnQgd2hpY2ggcmVmZXJlbmNlcyB0aGUg
YmluZGluZyBmaWxlLg0KDQo+ID4gPiArCWlmIChhZ2dyZWdhdGVkX2xlZF9mb3VuZCAmJiBudW1f
bGVkcyA+IDEpDQo+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmY2xpZW50LT5kZXYsIC1F
SU5WQUwsDQo+ID4gPiArCQkJCQkiQWdncmVnYXRlZCBMRUQgbXVzdCBiZSB0aGUgb25seSBMRUQN
Cj4gPiBub2RlXG4iKTsNCj4gPg0KPiA+IE11c3QgaXQ/ICBXaHk/ICBXaGVyZSBkb2VzIGl0IHNh
eSB0aGF0Pw0KPiANCj4gQWdncmVnYXRlZCBMRUQgbW9kZSB1c2VzIHRoZSBoYXJkd2FyZSdzICJx
dWljay13cml0ZSIgZmVhdHVyZSB3aGljaA0KPiBicm9hZGNhc3RzIHdyaXRlcyB0byBhbGwgMTgg
Y2hhbm5lbHMgc2ltdWx0YW5lb3VzbHkuIFRoaXMgaXMgYSBoYXJkd2FyZSBsaW1pdGF0aW9uDQo+
IC0gd2hlbiBxdWljay13cml0ZSBtb2RlIGlzIGVuYWJsZWQsIHdyaXRpbmcgdG8gTEVEIGNoYW5u
ZWwgMSBhdXRvbWF0aWNhbGx5DQo+IHVwZGF0ZXMgQUxMIGNoYW5uZWxzLiBDb250cm9sbGluZyBM
RUQgaW5kaXZpZHVhbGx5IGlzIHN0aWxsIHBvc3NpYmxlIGhvd2V2ZXIgaWYgTEVEDQo+IDEgaXMg
Y2hhbmdlZCBhbGwgTEVEIHZhbHVlIHdpbGwgY2hhbmdlLg0KPiANCj4gVGhlIGRldmljZSB0cmVl
IGJpbmRpbmcgY3VycmVudGx5IHN1cHBvcnRzIHR3byBtdXR1YWxseSBleGNsdXNpdmUgbW9kZXM6
DQo+IC0gTXVsdGlwbGUgaW5kZXBlbmRlbnQgTEVEIG5vZGVzIChxdWljay13cml0ZSBkaXNhYmxl
ZCksIE9SDQo+IC0gU2luZ2xlIGFnZ3JlZ2F0ZWQgTEVEIG5vZGUgd2l0aCBsZWQtc291cmNlcyAo
cXVpY2std3JpdGUgZW5hYmxlZCkNCj4gDQo+IFRoaXMgYWdncmVnYXRlZCBMRUQgYXBwcm9hY2gg
d2FzIHN1Z2dlc3RlZCBpbiB2MiByZXZpZXc6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI2MDExMi1sdGMzMjIwLWRyaXZlci12Mi0wLQ0KPiBkMDQzMDU4ZmM0ZGZAYW5hbG9nLmNv
bS8NCj4gDQo+IEhvd2V2ZXIsIHdlJ2QgbGlrZSB5b3VyIHJlY29tbWVuZGF0aW9uIG9uIHRoaXMg
ZGVzaWduLiBXb3VsZCBpdCBiZSBiZXR0ZXIgdG86DQo+IDEuIEtlZXAgdGhlIGFnZ3JlZ2F0ZWQg
TEVEIG1vZGUgd2l0aCBoYXJkd2FyZSBxdWljay13cml0ZTIuIERyb3AgYWdncmVnYXRlZA0KPiBt
b2RlIGFuZCBsZXQgdXNlcnNwYWNlIGNvbnRyb2wgYWxsIDE4IExFRHMgaW5kaXZpZHVhbGx5DQo+
ICAgICh1c2Vyc3BhY2UgY2FuIGxvb3AgdG8gc2V0IGJyaWdodG5lc3MgaWYgc3luY2hyb25pemVk
IGNvbnRyb2wgaXMgbmVlZGVkKQ0KPg0KDQpUaGFuayB5b3UsDQpFZGVsd2Vpc2UgRXNjYWxhDQo=

