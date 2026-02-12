Return-Path: <linux-leds+bounces-6933-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gspBD7cijWnUzQAAu9opvQ
	(envelope-from <linux-leds+bounces-6933-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 01:45:43 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 888AA128B8C
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 01:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 652B13053B9E
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 00:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DC41DD889;
	Thu, 12 Feb 2026 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Ax3GKG4P"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455B1AC44D;
	Thu, 12 Feb 2026 00:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770857139; cv=fail; b=VrhN+9C73lShEuLQBj/pE2HFfWBwlG6bm+NBnmG02i1Ws8DWtM808bldgrsm1VUDwXIo5RSE+CAE66ANatWygmx7lW5Rma7gV5s3tqiXvPf+IWyvWnennGahJX2ZwL3lX+/QvDGHlyslJfyrNRXWpSakMsgrwD10LMO7+/H37Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770857139; c=relaxed/simple;
	bh=yoN18Q7WZWCvxoMP4bFb0RCOEJkK4KrUoGERdK02JMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PHGry2oH6sVyZgUuS27dfAAz2MR+DNNG/xihha8BzRV4o21Tnlcfax6r9Ug7/FvYNzfUDNc9QyKuxd9wcTTObKUEw6+x8WshhLdcAbg2g+tTyfDyvvQgUojtslx9XS7zhWx+c9V7Ul7FmKC5WQ9NDmBce1CFJzSZ1jjDEOxtSws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Ax3GKG4P; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BNkFV33223438;
	Wed, 11 Feb 2026 19:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=yoN18
	Q7WZWCvxoMP4bFb0RCOEJkK4KrUoGERdK02JMw=; b=Ax3GKG4PeeVtFIRCp9dah
	JD34qI5yf/wD+wM1IhzKEZai4fKHqHG7NEu+CVJPGKGfjejR7NFUbnFMoSjBRT8R
	LvtEmDE739hF1ZsnckO6SAW9NBpn8c8943laDM66cE2mnaIInOt59/WF+VtnyWYP
	oUSbwo072yd84YU6uo1/4IulfXKIZnu+qjx4tHkAe8qxQthM7bOddpXOQPeKzJyt
	5vfnCGQ7DLD5aRMqQLPtB52tPJ9pvQqNMwrAUS6dFPd6E3kHWPtPtasqqP/12Hjk
	1BtzKgPx/3T8gmWP4bkJy49q8sF6RX/VkQef3Ow5goAvEPQpDP/YfooteC8iP72d
	A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4c8crwd1wd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 19:45:35 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7yqtKsnkfPUGfKurPtzx681njr8WSjGCoi1L0V2gby4af3kyq38AGb4XSiMuBUc9PmREOYqvUmaSD285YCkd53nRZuaFeusI8EMrwJ1wUfKQIS5OSQN0KrOr9NSRlcqcL9fxjMYOwTFoePnkdLWjNEKKAbh6UorMDXxbwmqq4/m5VWO/ikWGAyW2oBZpYdMx/9sJJbw7FiSA3DrVtsd0wS65LHMuP9ESD3Mtos6IH5E7C2rcOuqJ9IyFHH5I+nmLbSTJYqht5QLoubsp0dSuovmfmkrc4V4w7JLftV/z5jL59GhzjDbQ3TaZyoAXvTKCfum21ejQbxsW5ifaEZ7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoN18Q7WZWCvxoMP4bFb0RCOEJkK4KrUoGERdK02JMw=;
 b=DwRrofpsAxawMdbMxjlQQlOvx6HMhZpSb8VKlc/wjGib67K5sIJDL6CwuKgR73mokc+OHYHv9OM3bSjNkCl2gMSKCfVAO3fpONRpzP3oUrP7a1AxjJsRth1ZxeBxeCDuAyO3AFkdK5GtSu2ulmR7gRX/jRCQpg7a4Bpy+DHlWtQthcB/V7JalOjPurWmRLujsRiTiwGv9TPPduKLKJcwnD01BQTvLNA6MF8hz3zJedXAQfOVvpevY2ciTyAr7ODgHrAFWmjPqYIE+0Z6r8coHRyviDE2wyndmr4rPtPVtEefxy12bwbEbrPTtZRLUqnSbpSNEDi8V8v+NHpIZBCGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by BN8PR03MB4929.namprd03.prod.outlook.com (2603:10b6:408:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 00:45:33 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 00:45:33 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>,
        Lee Jones
	<lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Thread-Topic: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Thread-Index: AQHcjoyvxwWCT/ZTRUKFUhxGPAybcLV+VGpQ
Date: Thu, 12 Feb 2026 00:45:32 +0000
Message-ID:
 <DS0PR03MB72285F5F9526B1020188CE3FED60A@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com>
In-Reply-To: <20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|BN8PR03MB4929:EE_
x-ms-office365-filtering-correlation-id: 9e4bc586-27c7-4e36-e17e-08de69d0076d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WW0wNnBRbGRNQU5pRnphV1dlcGtHYlEvV2xFTkxPOHRWOG5oR0xBSE9xNVBJ?=
 =?utf-8?B?L05DM21iN1E4V3U5RUJ5dUwzYW9OSTd1VXViUDdVMWxkUnBabVBwNmtLVGpT?=
 =?utf-8?B?V1dLYkxLcW0vODY5QXlzbDFITWVxZ1VIcVBiY01oSWJjTURXdXY4eWI5YXht?=
 =?utf-8?B?Ylg5QWo2TGhmdXRyZ21GUDlFZG1EdkJDdlpocVk5Z1d2ckVzSUdEcU9JOWJx?=
 =?utf-8?B?aXY1MFQrOWtrTElPZzFIQmNYcjlQWmJsVmtBL0hqdE1peGswVHkwV0FRbTFZ?=
 =?utf-8?B?MEtsQVl0WWZkKzh3RXV3M2tLdi9xWUdEcXJJZTlBc0tBR1N2cm5nZkpxeTJJ?=
 =?utf-8?B?WFRSSWxwdjI4dXQ2LzFVNDlMUTVJVm03Q0dpc0VDRVFlWEx6aCtmK2FqTWRt?=
 =?utf-8?B?cWh0eW1zV1ZQUjNYTzBLZ2V2Wk12dW5Ea05RSkZSRjNZdm5GZWEyaGtMOXhG?=
 =?utf-8?B?WFl2OWVRS2U0WDJSeEtCczVnMHBGQjZRM0JJY1ZubDJXalJJbWhBekIyLzZX?=
 =?utf-8?B?MjNFbjFISm0xZXNIOUx0NmFMNldrSWFzUHhuV2dJemJuRnFsN1ZoOTd2bUNV?=
 =?utf-8?B?bmNoUERpVmJMZS9tTSt2RzMwT3prTkYrbzVrNDJXbkYxSUtFRmFkUENaMVc1?=
 =?utf-8?B?MnJJVXNOT3NvU2VGZ2xCclR0amlZQ0tWSFFsZlYwNk5DcmJiR0tvUVFpRVRG?=
 =?utf-8?B?anhyelVhU3o3UGpjVHdUc1FxWjlpRklVM2tseFhWbU8zeFB6Rk84M0d2OUlI?=
 =?utf-8?B?SGduYlJJZVB2QlRNL0pkeHRlb2hCcGRjUUtzOC92U2xuRW9wVnEvR3E3bXZ0?=
 =?utf-8?B?L05QWU5nNjhYS3M1MUxiTUFmVUQ2K0JUeXViVVhlcDZoY2UzQnVQNmM0Z2M0?=
 =?utf-8?B?b2ZIWi9xUkozS0RabTQyd05kQm5qS3ptbzFqY1NGd0FKZms4c01lQ0ExWHBC?=
 =?utf-8?B?VXdOemtmVkRGNWVFenl0N0pBK2p6QjZjN09zcFo0dFpScmcwY1NVNnBvMEdD?=
 =?utf-8?B?by9DMmFzMWJXRjU1NUppaFIwRkk5ZmphSldGRWFOMy9BbDY4andveW5iN3Bq?=
 =?utf-8?B?RVlyajJGdFRDc2tURDduTFRSRHJibVc3bTcwelFTMVoxd2VDWjdMTW93aUds?=
 =?utf-8?B?V2dadllwdVF3TW1BYlJOcHBCK2xZNWVuUktiZ09WT3liV0h6NGZRQk40a2Q2?=
 =?utf-8?B?SEpGRFhaWWtqcDRhdVMvazJYd2Y4M3p5Qk44STArZytWWHozSWRSTHl2c3FV?=
 =?utf-8?B?VVRGaHYxajhXZS9RVGtzL3pPNnVBY1Z5TzI4OW8zMnZaM2FJR3JndVd0Qlda?=
 =?utf-8?B?U1owWGxzbzdGNFNZbDk1WEhjcnFHWWFGdjMyOS9qb2EvOUVtNTU4UWVyMHZU?=
 =?utf-8?B?YTJyNGp1cmVQSmI5N2ZodjExVmhEU1k5NU53aC9tUi9qWm5GVTRkWlQ5Si9Q?=
 =?utf-8?B?MStpdEJ5blo0eFJhc1RFZnc0VTJadVAxY3pCY1d0TGVKU2crM0twMk9PcWJh?=
 =?utf-8?B?dG9kdzhvM3N6NXMvZmRjU3VKcWR0UUJPOGFwaGhmRzRFOXN3UmJkYVRpWk9z?=
 =?utf-8?B?T0pub1JvamxEdGhNZStZbXp6M010MlpwVVgvWXV4enJ0ZjFvUzRrZXEzQUhL?=
 =?utf-8?B?cTQ0Tm41ZWh4RWpFNXRrR0crT1F0ajNFeXEzaVVteGdsNkJXVXFpN2lxVjFq?=
 =?utf-8?B?MDRjekh2NEJKVGQvYllDR0E5WTBlNEdHQU8rQVFuOEJoSlVpV2J1S1pVSGVK?=
 =?utf-8?B?aUphVmJNSzV1MitKL1MzT0FQbmxYeWxTd09SMzZIOXdRdjFwQUtFTGpOL3kz?=
 =?utf-8?B?bnFFM1VoMHpZZHZpSWJxdXFZS055OFVORlduWWM3WUxKR1hncTRoWWlBNUZT?=
 =?utf-8?B?ZkhuVkVlSDNNMkREbkV2ZGV5VU5iUHoyRHBrVWlGMndEN2xjV0RjK214V3BL?=
 =?utf-8?B?ZGNhamd3RXBFc1pKdm1yTm5CSXRVMWZWNk5mY3hlNldwQjlNY0hxMGZUL3JQ?=
 =?utf-8?B?dmd6ZkZIcEpiQkJmMUoza3lZSFErT1crMkJ0Sm1DaVdkOW1sRkdLM2JLYm5m?=
 =?utf-8?B?bVlST0RHa1hKNXVsK1c0bjhsV09PRU01QUs1eEhSSUlVNkR4dXlKZjNSalhH?=
 =?utf-8?B?RytYZ1h4K1Fub1RsTzd0aUFOQjFOa0lldlNPTktsZWRYMHh0ckloamhOVXBW?=
 =?utf-8?Q?bn1eq+9p5CcafrHFpFfkcPQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTZnYWl2bjZsM3paSU1WTi9POWh4S1pxQ1EzR3QybU1xRG14ZjE0aXkwcjNS?=
 =?utf-8?B?R0FhL0lublpuSGZXM2lsN2Y1QzMzRXB2bExUdVZRS2ZkYmt1OGs2dHBBL0J0?=
 =?utf-8?B?SXppT1Q2TnRxaDBoUGdORGNKNS9xVEFnNmJ6OFM4QUlZTkVwOUtuSHNtekZm?=
 =?utf-8?B?SWhlR21aakswV0tCbndJTjR2bml6WkdHZTFBcXMzNWpPb1o0YWxTSkdRT2J0?=
 =?utf-8?B?cWRXRDIxdXFwR3FLQzBILzlyNGJmQmZPS3A0YVdNaHo3VFRCL0V3U01jY2Va?=
 =?utf-8?B?SUdTeXFMUERaOHZLYS9oUHNWcWp5ZXlkSUdUYVB5L09EOG9YejJnbmovL0RS?=
 =?utf-8?B?NlIybHFLTENCaTNzaTBjWDVVdlQxRXlrb3M0L3d1dDZyMFY2MTlQM25ISk1v?=
 =?utf-8?B?U3o3OW84NWpSU0RVckY0ZHhJanp5WHpkUGp3TlFBTlY4dE5hbU44Vk5RYzI4?=
 =?utf-8?B?empJOHZsdFdtLy9QaWNNc05vQ3VCdXJSeWNNOEhzRmFRT1M2R0Znd3N6WGJi?=
 =?utf-8?B?RzNUOEl3c1dHK0FsNzZ0bkxJZ3VzQmNFR2J5aXpQY2QwUTJWYi9JZ09YUG5L?=
 =?utf-8?B?YlpNOTdGQTgvc2gvU2N1ampzMVAwaUR4bkxJcG1uS25sVjRtWmdVeUFPbEtF?=
 =?utf-8?B?MlVMZk1SNWpFcDBHVitwMWhrdU9weTBtS3VmS3RDVVRISGp3TnAyQjNiaHBC?=
 =?utf-8?B?cWxMNWhtOWQ5Uy9POWRZcHN1empIUTMwMXQwdTlJRGJ6U2JPNkt0TDNUOHo0?=
 =?utf-8?B?NTBlV0MvcXUvblU3RXV5TFJLMVJZbWYrTGNKUHZTbDJ3RkhnMk5GR0Rmbytw?=
 =?utf-8?B?bUZyd3RrWmMzaldsUi9HeEdjbzJMSldvdWtWME5KSEg1WWgrYzl5eFZmUGxO?=
 =?utf-8?B?Wm4xemhxcVpOQXl3Z0g1bmFtZmU0MzZpc3hoUVhvRHhyNWFGaWw0NjhyTHZp?=
 =?utf-8?B?bEhzQVZKeHpBNzg2R0gvZ0pscmc4aHFmVzVqMlArQ091RGthaHY5YXB4Y1d6?=
 =?utf-8?B?OW02aFZ5RldyK0txOXoyQXZlUmZqb2NpNlJXUWd6SHArWHZIa1pBN0xqQ1pl?=
 =?utf-8?B?WVNHczhqOGVKNmRjTFIrVUdrekRwVHBjbDNOaWJRMzdpYzlFTzNQbkJFSnhD?=
 =?utf-8?B?WGl6SDRudkJYUzFpSG5RRWM1Mnc2cGs4dDZJaGx5MjQwdHZhWG1FL1doMWV6?=
 =?utf-8?B?bm1yV2dlYWtJZU91emtodGk0WnNQQ2NUYnZ2SU5JZ2V2emV6dEdzQkxJQ1pZ?=
 =?utf-8?B?TENuMjNrTGNFTjBxcExBU0RsazRORnVCWXFuMnMvc2tIYW56Vk9tZFZQS2xP?=
 =?utf-8?B?SFJWb3NMOFdMWVdQSEJVUnpSWC92aytTYlZGaExWQVVycHhTdE1saHZxUzkr?=
 =?utf-8?B?ZjhMRkdxWEJ5TVh0YmQzOVA1SUQ1eVE3bEVRd1M3bE5WeUFSRVQzR3QxNHQw?=
 =?utf-8?B?MVZ3WHVJbC9QY2xFaGtuTElRc2RDdy94ejNOeC93TjdCQUZDVm4zdGhha2M3?=
 =?utf-8?B?Uk5SUlFBejVSS0VxQTBuNXdSUkF5M2huOC9OdTBWVFQ2QXhKUXdrc1I5d3U3?=
 =?utf-8?B?b3ovZmJNL1c0aERLY3NNSWkyNmMrY2xhRk4rd20vcUZ6WHUvVVhlRyt2dlNL?=
 =?utf-8?B?OEN2MEU2U3Q1VC90MFpPb2ZyY3FKZmpoOVlnVm5MMzJkaktwbURLL0FBV1k5?=
 =?utf-8?B?SWRNaFRnbW93QU5IV1VIUU5xdUpHa2N3b1M5R3kwSHo3ek1wNzYzcDVQSnlB?=
 =?utf-8?B?REF5TndIN0pDMDFYUERWSEg3NFlCeVIzOW9hTnpXblZqR2hYa0J5eTM3dUk0?=
 =?utf-8?B?T0xhYnd0SDQ0UHpQUVRiYlorKzEzNFdJUk5RQThSWk1NVkJDZmZobGpNeEM5?=
 =?utf-8?B?eGpmUk4yM0doenpkQXNndG1rV1gzYSsyTDVqQnJUWFVzNkRxcXlGVTlLQUxm?=
 =?utf-8?B?cDNQVW90Q2dvTklqRStBOE1Ec0NiVnRCRmFTem55aG16NCthV1V6ejBiY09G?=
 =?utf-8?B?UzRhQkh5MnNVdXJaMnVmNlF6Vm5yVFRwWnhFWmNob0wwaTJxUFpBQmpzUzMr?=
 =?utf-8?B?MW5OUTVXemRDazdYTzFaS0ZGekpSeWJYOVoxVXpxRmd5WUMzaHVsZldBMjlD?=
 =?utf-8?B?VWt4QUVEdkw0UURIbzMrOUdCSWpKMEtBQ0wrRDJZZ2FCZlBQWmxhQkVad1FJ?=
 =?utf-8?B?S3pUUzJadis4TnRJNU1JdDJnS3JPOWp4YWd1U2dOSFl4T1BBL0ZLR011cHNU?=
 =?utf-8?B?bCtudWQvcG5XY0ZhQ3lad2FJWVdzbHRON2lTa1RUbVJBYTdaaDAwQVREQVV6?=
 =?utf-8?B?REdPSVZRZDdVaU5SMHQ4WmZYRHo4M0VDOWZWd0NDeEJRL2F3UWpndz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4bc586-27c7-4e36-e17e-08de69d0076d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 00:45:33.1275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6S/JIc189pphPdjIqGbCmGIISw2YV3s3dK4w7PrA6G2SVZA4joVp1+hl8UWIDz2E7W11rvPFxRKC7MOQlqGh4rdqRipBpAOzdomJqkCFW/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4929
X-Proofpoint-GUID: 8QwlxOzUbg6B38RuhfxLnI4GUAb-byu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAwMyBTYWx0ZWRfXwP2sCZ9hYM/k
 fbaMPvDqEq8bGhfrL8gl6rJhGl8hRku7bgBkvzhYGwKmz8H22GUetczeY63ZVcB3kVfdfjfPYPt
 uevMDVFK3iz4oMbN6xurTt4Dalx+v+8PaVWwo2GarO5tXglyBjLAKhBmJ7qKwbnEENfoDhJeeS8
 bRtZbSO8HjMBviYItyJWklHf38R6RprIUI6YFyzaYdWLw/k/IbKjM6B03wRcRfjmJiaJ9pkgghe
 1pzMcoat5+PlUWHWfRP9EPHZsW8H9KdJSFPCxgfyqDswDonhcQSjLCedik/udiy8xaltJD8cr+4
 TOHB6/nStMwNvN0N5yPmESMjIiNbgUe658w0x5IJIBFc3u3svAgBewfOxFpvQE6i6FjtIBIaLHI
 bOCd08vo6XFJXywt61DvwubYobIpRYgchajRVo1v4B2Loz+ySpGHF3XVUBw2LUPMm87PFetcB79
 Or90tVOG/nldw9S//Hw==
X-Authority-Analysis: v=2.4 cv=fPo0HJae c=1 sm=1 tr=0 ts=698d22af cx=c_pps
 a=mU5w9pKRZvfSuQy63jiYzQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=gbs5B-vJgv1hCiTPeVAA:9 a=QEXdDO2ut3YA:10
 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: 8QwlxOzUbg6B38RuhfxLnI4GUAb-byu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6933-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:dkim,DS0PR03MB7228.namprd03.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 888AA128B8C
X-Rspamd-Action: no action

SGkgYWxsLA0KDQpJ4oCZZCBsaWtlIHRvIGtpbmRseSBmb2xsb3cgdXAgb24gdGhpcyBwYXRjaCBz
ZXJpZXMuDQpJcyB0aGVyZSBhbnkgYWRkaXRpb25hbCBmZWVkYmFjayBvciBhY3Rpb24gbmVlZGVk
IGZyb20gbXkgc2lkZSB0byBoZWxwIG1vdmUgaXQgZm9yd2FyZCB1cHN0cmVhbT8NCg0KVGhhbmsg
eW91IGZvciB5b3VyIHRpbWUgYW5kIGNvbnNpZGVyYXRpb24uDQoNCkJlc3QgcmVnYXJkcywNCkVk
ZWx3ZWlzZSBFc2NhbGENCg==

