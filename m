Return-Path: <linux-leds+bounces-8084-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ5iCT5hBGq6HgIAu9opvQ
	(envelope-from <linux-leds+bounces-8084-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 13:32:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE664532538
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 13:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B141A30A0449
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1A83A759E;
	Wed, 13 May 2026 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BNnrpeaj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B737DAA8;
	Wed, 13 May 2026 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671545; cv=fail; b=qXinSJf9XGh+YmJIoFKhuFd7WXdnMfCUZSXlKhzv5izkZ3OF0Q/kkkMX0ztUQl8WORIyLOeOpC2WYGeDEhrKZep7TlPX9POhDjsGl2AzNOozVrxXpredlCGdrLkZddC12MbgjZqkGUiA1xTdPXaSDtoz4WDinDarlaovKpUyM8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671545; c=relaxed/simple;
	bh=2l2a8NexW9yVyE61eRvKLy3obQrmgSXQ6chLbWHZUmg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rX6hVps1TTTduito8lGzo0/8ttAd0GovpA4tYbNFhhj3/fAuTkM1eJ76pAmhSoPUVQ4lTHhf1gZ93WQ/PKgdCx9h7rdV+6i0RCN0/iXeGJ8nJPUgNLy5qOq4vO1VNOgh6u8n+ux5c3IfDceSoBsdto6FyP1+38GOOalhs2SfMcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BNnrpeaj; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rIXb1933637;
	Wed, 13 May 2026 07:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=2l2a8
	NexW9yVyE61eRvKLy3obQrmgSXQ6chLbWHZUmg=; b=BNnrpeajl3dn2odSP8qAl
	4G1PmfUkmJjdlGPNwwOODOiZ7m2Apt/tgEJIxIQwfwVm2lEA3pSznpmhX/pGCWzZ
	R+dqzK0UUJTasapyme6VAvxUBMmhz9D13ldwq8oR54C4/hKO7LYwQ90zQZTIP3OW
	EAeXPnSHDDoaQFhBxJ2dJBTprhEp1FjL7d3tjBb9ddngLfYZgrMhATyh1Qus8R5J
	ob3J4ZtCN4MGyKnxCMDME4ITzeA2ttxNAUoU80h6mo+EIa80LbQ2uaq3FnhXVpTK
	4MJxuTjvy3exqzvE70mW+f6mon9pTDFi+E4w0Q5k55FQyKAGoXcZUxvzOWGKMPhX
	A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4e3nw5q5va-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 07:25:26 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upcUelNhzJEZcVYE1UA+NQhPuNn2L0liF+zr8jVmrUiyLzFqpGKkaZoyG9oWMHLBi0zp6LO+aAN/6ap68IMBz5ZuI86DdBZRZz3W90VVKVMBrb4CZFNn/eUgl0VyS4IJ5GyKpdT7BJo4p2U4t6TPdZRECH5/J4OKf9StCPuAGZyR6Bci1iXzGOE7IH+SMJZVxdLJZ27VU9sYz+Xp2lkJPdXeQcUpCxEysAAwDkZkbasZoLkUwlAOMN9RBeqCVrRrk2O5l3ADRMbmHcP8s5jlusp5pascUtExgg4N2C3uY4IJrb7hlp83LQrXon42ZkEYopxaSajrphpQ2IHLgbUivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l2a8NexW9yVyE61eRvKLy3obQrmgSXQ6chLbWHZUmg=;
 b=Rhde3kr1EM0pHHPzc4EZCoKQX/gL75UfVn2yFVJA/yP51VNgKQJJ0OdzvUuFLLZIciz89hNwZtkSvgV8qUNL1c+qIdDRnwLPLLQsnWksnQI/d6Uy3Npvn4Vlxe596qRj9+eBph1yURiY0j+NaS14MSgWx9jhQNaeZ8Naqt0iAlyefZS/N/Vk3EkITKKwcVD75CybeaIPYXoKSciMEjrRQAOMPYswYZV4+K3AjVD9ucQrolKLEX+rTh7fXvwcETIsM56QGo+r8jzKM1ta3AG6oUJiBe1MuaRESHloNnAdGgAazT1+lXbPQQgq0ysw5QDDCdJxHQpjzwSr7l+AxkNFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by LV5PR03MB8458.namprd03.prod.outlook.com (2603:10b6:408:360::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 11:25:24 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:25:24 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Sander Vanheule <sander@svanheule.net>, Lee Jones <lee@kernel.org>,
        Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Topic: [PATCH v7 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Index: AQHc3qCecWxcNOjBu0uZT74o63m2JbYG+7AAgATahjA=
Date: Wed, 13 May 2026 11:25:23 +0000
Message-ID:
 <DS0PR03MB722878551FEED39276921D1DED062@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
	 <20260508-ltc3220-driver-v7-2-0f092ba54f23@analog.com>
 <32d4a57c074c766c8ad83e4b220e44b1df9ae485.camel@svanheule.net>
In-Reply-To: <32d4a57c074c766c8ad83e4b220e44b1df9ae485.camel@svanheule.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|LV5PR03MB8458:EE_
x-ms-office365-filtering-correlation-id: 737c9638-2675-49d0-d4e3-08deb0e25368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|18002099003|56012099003|22082099003|38070700021|11063799003;
x-microsoft-antispam-message-info:
 Fv+lPER07NSxMSNBq4duuNbgHGGWTbXC5nWIPcQPOMoQXEx9kcEvN+Quks+tFNyGcQmMwkifiWWofozFACNtQht06n+fM7zBLOzZtydiwkHw34COMrJ/vDxTlUIYJf6mqYIjRJEWWFsJ1+yQqZM4UoHFltU08vBUnmrHxv/BszWkKEQGCrZNMlnZu80tRZUn/fPpO2QHIDAxHOagRJGWmk8lQJxcpiNHIFcp5kuxal2i5Qz/f/jP3+h9Kn1pGmzwhZ9yemjNX7Qzh2Eviy1ZzrsyM3ovQVhqsegmH9P8KXFfR1aYM6O1jrtpLfocT5P2BtwmYC7CnXVmsCmd72qYyXq7kWQyXx3YezrO3YF7rqkXMQsd4bu4dKu8PQRlb35Ku0n7BU0H8LliiG4xzxLBAjYte4FoVmpmaQVRHbB8pZIEMylYnObghlgFgKPtzAO9Yb9thCp9M8ViW/rgZzkgGHyRUDvNIC77yZfiMvSCWVYibathiFqVlyEzVyOCyYbQvRoHNyAzxuXBJwSOxvmNZraWcgNR24jUq/DiqZPvFSJwishyYRjBMEk7jL/fvAcnQyA2+H2217bz9niF9EK7NxSG/ZEWpq1Z8rZKRaVo4eTfqsSg7Oj8jAOAFvxt2Hpl7+NTlhii9tchnIufFm1/B3eUVw27/QqvayPk8SBoBGv+NQgcpzvjyfgm7h9OlUDgm9tt0jBlh8DwCBQnBsUwfCwyAG6egtKGflX3Bwx0Mle6f53nSEXs/FF9JRor8hQ3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(18002099003)(56012099003)(22082099003)(38070700021)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vy80a0gwTklzbFV5dEVHUXZkQTlmdGF3Ynk4dUVzQWNBNXJVN2FuRWVpa1Fm?=
 =?utf-8?B?MEhzQjl4eVVCenRSempMY3BvWnJMU29IRWJ5OFNlOTdjclhNdkRwYkNuYkox?=
 =?utf-8?B?RUFUQVMyZmhNRXFFSUpWdFRLVWlzTWNSeUVIczBiNEVwWVdlK2xXeU1KMzV3?=
 =?utf-8?B?a1dsdU82YlNhVk80bjNTalZpdlREZVdOaENFM2VOWFJ0RzI2clh1cXpWSVYr?=
 =?utf-8?B?RnJMeWJkYWdNNVcvVDdIVGYrR1pobkdOMUd5SWJPZTRmRkJSeXBTMmFkNzZR?=
 =?utf-8?B?eE5xRWxqNjNTMWtjV3ZWT0FtTXBSbU5CZFAvT0ZxOFhXSU0vSnFvWitXL0E4?=
 =?utf-8?B?UXVvWTdjcGtXU1dabml0eFpQUEJ2cm1NeEZCZXdLREMzWTliMmVNVEs3WVht?=
 =?utf-8?B?SHc4V1dOcG5ZSXBuMHF1d2RXTG5lbEUydjlOTTNLTHlkNlNvQ08wTXVpaVRm?=
 =?utf-8?B?MnFTU205NlQxTWtSTXFnZ1d4NjNxZEpNSnErdFNScmdGWkdHTnNOM1Rzblhy?=
 =?utf-8?B?eGlGaTFnZjVtMnhCMTI0MjZ1OHkxQWU5L05WNUR6dmQ0SlBST21TdXo4WXBS?=
 =?utf-8?B?TVBXVW9SbGN4d2ZZdHkxREJlaVIza1Y1ZW1WZHREVDB5dkVOM1gvd3VFd0Yy?=
 =?utf-8?B?azl0OFNGbXRXcjgweHpLMHRUN3pxZ1VqaThlZVh2NHViaTQ3c3VSYU9PU0tD?=
 =?utf-8?B?TExrUndaNUIrRlpYNWl1NjRtRElja0RZdi8zZFVGNHIyOTEzdFFyZ0s0UnhG?=
 =?utf-8?B?aUpWRjNoRnJOMklZU0JML0FiOFBzLzVpR24vNDcvMDBzS0NvdUlkNC9sdlFr?=
 =?utf-8?B?M0N0Z2U1VzZ4ZXppeTJ2ZGMrYmIxbGpCQkJ6OEV2THJkeHF6M290bGk0eXpD?=
 =?utf-8?B?bkE3WU90eDNMVHdPS0YzUUpLNW9hU2YyV0FxZmRXWTdzWFVhMFY4b1A2b203?=
 =?utf-8?B?Uy9GaE9sRGFuSW1wQk9INytucXdjSDV0MnNoTXJ6VkwwbHZOcStqc2VydVJK?=
 =?utf-8?B?WmRHaFdLZkJob3ZXcmpicXB0RTE3Y2d0L0cyMVBPckdicHplQnlLRjhwVjNI?=
 =?utf-8?B?ZUhQY25yT2hOdzhtME55THkzRTQyNThwNWt4aFM1L1NaTlg2b1BPMk9STFV5?=
 =?utf-8?B?TUZvUytaSjU5Z2xUQ2tOQlcvM0lmVkZVR1lvZUd3RUpXSGhaRkNXK1dsMjVU?=
 =?utf-8?B?SkRxbWF0VzJISTFTUmNpRFA2ZGtvZ2hsM01BSzFwQ2JhTlBZWXoyOGphTVhF?=
 =?utf-8?B?MnNWYU83bmUyT2IvNGtnSHI2K1A0QU5VWXRwS0wrVFhJZ3VUVlBxSVFyeG8v?=
 =?utf-8?B?UExROFEyYTFnaU9lT3VENDkwRUNmQTZ4MjA4dFZDWlNFTkMrZlNqVHFrdE5l?=
 =?utf-8?B?djN1ejVDNWU2WlM3YWJxVjR3eURCcEo5ejl1WG5BbllBQ3grTGJBVmlkMzU2?=
 =?utf-8?B?THl0M1E4cmFMOGNYN1poZEIvZ3pVbVB1WTNhRXkyc280WnRZVTBLNTRIajJ2?=
 =?utf-8?B?ZG93Mk42dkVNMENiWmd1Sk9nQlI2Q1VLUFVTVlI3K0JDRkN1WXNrTkpwLzl2?=
 =?utf-8?B?b3B3cTl6OVpwUDN0aHJXSUQ4QXQvcXFGTXZuWVpCL00wWEtOS3lnenJaNTRm?=
 =?utf-8?B?b3I5OFdVOG50Z3g4S2VvanV1Y0xRZjZpK09Bd2ZTMjViQVVTUjBhVmlOZWRi?=
 =?utf-8?B?YXlBQzd3LzZTNXpKTkFORkxPd0RJcXhidjBndEtNKzB4eWhqMTdNNTlkcnFW?=
 =?utf-8?B?RGhxcG1ra2xLVGdhV3IwOGZlOExlYWZ3N0NaY3ZYTEozTDh4eUFLOTd3YVZy?=
 =?utf-8?B?c1c3K0w3TmpBSGtDdEd3T0VNNWs2YlZIblZiV3BrY2s1aGUzem5RUzJ1VVR6?=
 =?utf-8?B?SDhVbExzZUVGSzdoYnBIbVFCSGJ5VmNMV0FzYXhsVWhLcnFQK0RGZ0oyclFy?=
 =?utf-8?B?S3pvQnBNSjFSUmVKWWxGS2lrVGxXcjlRTDJSYlVRb0hHMXQrM25KWkFIYzdp?=
 =?utf-8?B?S3hYbjVyaThrTVdZZy9MdjZRL0JxWEgrcm45aWVGUzNrc0hlT2NrMHdXOERr?=
 =?utf-8?B?S2NSaUtDZzlWS1hiSERCQ1lJQWpFeFZ3QzhXQUdraFpBdU8raEJQNVk2eDl6?=
 =?utf-8?B?R0hTbmJHdW1IUXp1L2JEVTlJblV5RlJGNDRPU2dwTGhiamtGNWVVaUgzVUNN?=
 =?utf-8?B?VUliT0JDb3BvUHBkZVVuakVZQ2dJWEJYNnlLMWpBYmJIQUtES3p6Zi9LcVps?=
 =?utf-8?B?L2RHZnNHdUl4b3dKRkZaRnBKR2pZdVRUUDVLU3VVczZaTG5FTDhuT0tIOTNv?=
 =?utf-8?B?T0dlN0ZDYUZoRmlSUXppSDB1WWVLQzgxVzB5SzJERGZ4Tms0c2U5MUFVYWM4?=
 =?utf-8?Q?DayzXF3ZMwDPh1SghEiDVadJZDwDnanbnv1IdS9rDWva5?=
x-ms-exchange-antispam-messagedata-1: +LV6IgYK4Xof0g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Z7xHZ3LWAkQJpYrKNVWTnQEz/6DDzizacOaJu5BYJ9Jvd5uBIDOE66ImT+LQpkIrslxegyRwidfL/TPBXddu8suW5xWKcQa2VILxcfMg//5CT0qHRA26eEw9isN1I/V2QiXmUjngCl0dOVY4ShtHZTEk1nJtaNYqBin7VHH1xebCZBFtQG7c186MjQZD7JPxbCF6+XWyhvRVekRDxjYE3sGdksqLiSAlL6cFvQmwJKf3ECuCU/+O7NaJZtXvwCm0ZPPoSTb6jsxjV90lgMYZ9lzjJ8tVLsYYCnTI9By7NwQd1jdQpia3k1ukLz5Sl6LwOVJUC34j24uc1QKutY67+A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737c9638-2675-49d0-d4e3-08deb0e25368
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 11:25:23.9025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CA58nn/jVDN0Go8jn1IFs++4GN82i98HRch2feSF9MyCBcbEB6EbtqVQOuaHyLhq6jC6N1+YbVuZbiBoK1TKnAy5f6nWWEiExDWfogD8Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8458
X-Proofpoint-ORIG-GUID: 8EzbreSOBiXpjZh6sBP69A61l6jC3RCW
X-Proofpoint-GUID: 8EzbreSOBiXpjZh6sBP69A61l6jC3RCW
X-Authority-Analysis: v=2.4 cv=GdgnWwXL c=1 sm=1 tr=0 ts=6a045fa6 cx=c_pps
 a=cEhcA1GRg4KA0mca7hj4fQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=FDHR6ZlXVJZ7v1gAPPEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExOSBTYWx0ZWRfX8/TtHrvvFqn+
 Xi83t5CAt2w6My0C3GGG4XkKTYmKJysaSAd2lypx9gFT7eRBWa31/g0F4/vrWtVPNDqF6GN1VP9
 GUdXjedunpSVCqb4YclRmut4bOnP4SpYhkrKz0A+ARLV0pLhdnejWMEVg2bpZzy7Q+Gx5s+BmBg
 BAWh7AhK8YDxJOY2iBscR1FAeBgwGhBO3KkpDM3/ynGSS5afiEO3Ws3ijP+CFiVD6/kFa8b/INp
 3XuJaLfdpVZ+XLVwErJvax/ar+k+zwMUn2DkNz2Uf3bQXAy/C7M34+GfgVyOxT3sxcPKqt3Xf56
 hZmWKbSxyvyZFkRg/zdeYS13yLE1PCrTxg7pUlu06eCj/j8CiZbhccROgfUuEH+lXsL85p0X+PW
 QmDpX4T2JGInK2OMzAVkQDaAYzd4wz4zOa03w2N3n7y9WTRa2PGHoKdGiwOQZjaKhSqfu0S8ZPZ
 1j13ErF+9jeL85+VqDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130119
X-Rspamd-Queue-Id: BE664532538
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8084-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,DS0PR03MB7228.namprd03.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

SGkgU2FuZGVyLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXchDQoNCj4gSGkgRWRlbHdlaXNl
LA0KPiANCj4gT24gRnJpLCAyMDI2LTA1LTA4IGF0IDEyOjA5ICswODAwLCBFZGVsd2Vpc2UgRXNj
YWxhIHdyb3RlOg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgbHRjMzIy
MF9yZWdtYXBfY29uZmlnID0gew0KPiA+ICsJLnJlZ19iaXRzID0gOCwNCj4gPiArCS52YWxfYml0
cyA9IDgsDQo+ID4gKwkubWF4X3JlZ2lzdGVyID0gTFRDMzIyMF9HUkFEX0JMSU5LX1JFRywNCj4g
PiArCS5jYWNoZV90eXBlID0gUkVHQ0FDSEVfRkxBVCwNCj4gPiArCS52b2xhdGlsZV9yZWcgPSBs
dGMzMjIwX3ZvbGF0aWxlX3JlZywgfTsNCj4gDQo+IFdpdGggdGhpcyBjb25maWcsIHlvdSBhcmUg
YXNzdW1pbmcgdGhhdCBhbGwgcmVnaXN0ZXIgdmFsdWVzIHdpbGwgZGVmYXVsdCB0byAwLA0KPiBv
dGhlcndpc2UgdGhlIGNhY2hlIHdpbGwgbm90IHdvcmsgcHJvcGVybHkuIFdoaWxlIHRoZSBkYXRh
c2hlZXQgc2VlbXMgdG8NCj4gaW5kaWNhdGUgdGhpcyBpcyB0aGUgY2FzZSwgSSBhbHNvIHN1c3Bl
Y3QgeW91IGFyZSBub3cgc2VlaW5nIHRoZSB3YXJuaW5nDQo+IA0KPiAgICAgInVzaW5nIHplcm8t
aW5pdGlhbGl6ZWQgZmxhdCBjYWNoZSwgdGhpcyBtYXkgY2F1c2UgdW5leHBlY3RlZCBiZWhhdmlv
ciINCj4gDQo+IEkgd291bGQgc3VnZ2VzdCB0byB1c2UgUkVHQ0FDSEVfRkxBVF9TIGluc3RlYWQu
DQo+IA0KDQpJIHdpbGwgY2hhbmdlIGNhY2hlX3R5cGUgZnJvbSBSRUdDQUNIRV9GTEFUIHRvIFJF
R0NBQ0hFX0ZMQVRfUyB0byBwcm9wZXJseSANCmhhbmRsZSB6ZXJvLWluaXRpYWxpemVkIGNhY2hl
IHdpdGhvdXQgd2FybmluZ3MuDQoNCj4gDQo+ID4gK3N0YXRpYyBpbnQgbHRjMzIyMF9yZXNldChz
dHJ1Y3QgbHRjMzIyMCAqbHRjMzIyMCwgc3RydWN0IGkyY19jbGllbnQNCj4gPiArKmNsaWVudCkg
ew0KPiA+ICsJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCZjbGllbnQt
PmRldiwgInJlc2V0IiwNCj4gPiBHUElPRF9PVVRfSElHSCk7DQo+ID4gKwlpZiAoSVNfRVJSKHJl
c2V0X2dwaW8pKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZjbGllbnQtPmRldiwgUFRS
X0VSUihyZXNldF9ncGlvKSwNCj4gPiAiRmFpbGVkIG9uIHJlc2V0IEdQSU9cbiIpOw0KPiA+ICsN
Cj4gPiArCWlmIChyZXNldF9ncGlvKSB7DQo+ID4gKwkJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVw
KHJlc2V0X2dwaW8sIDApOw0KPiA+ICsNCj4gPiArCQlyZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCZjbGllbnQtPmRldiwNCj4gPiBsdGMzMjIwX3Jlc2V0X2dwaW9fYWN0aW9uLA0KPiA+
ICsJCQkJCQlyZXNldF9ncGlvKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQgPSByZWdtYXBf
d3JpdGUobHRjMzIyMC0+cmVnbWFwLCBMVEMzMjIwX0NPTU1BTkRfUkVHLCAwKTsNCj4gPiArCWlm
IChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlmb3IgKGludCBpID0gMDsg
aSA8IExUQzMyMjBfTlVNX0xFRFM7IGkrKykgew0KPiA+ICsJCXJldCA9IHJlZ21hcF93cml0ZShs
dGMzMjIwLT5yZWdtYXAsIExUQzMyMjBfVUxFRF9SRUcoaSksIDApOw0KPiA+ICsJCWlmIChyZXQp
DQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJlZ21h
cF93cml0ZShsdGMzMjIwLT5yZWdtYXAsIExUQzMyMjBfR1JBRF9CTElOS19SRUcsIDApOyB9DQo+
IA0KPiByZWdtYXBfd3JpdGUoKSB3aWxsIGFsd2F5cyBnbyB0byBoYXJkd2FyZSwgc28gdGhpcyBm
ZWVscyBhIGJpdCBsaWtlIHlvdSdyZSBtYW51YWxseQ0KPiBmb3JjaW5nIHRoZSBoYXJkd2FyZSB0
byBtYXRjaCB0aGUgY2FjaGUgc3RhdGUuIFRoZSBpbXBsaWVkIGFsbC0wIGNhY2hlIGNvdWxkDQo+
IG90aGVyd2lzZSBwcmV2ZW50IGxhdGVyIHJlZ21hcF91cGRhdGVfYml0cygpIGNhbGxzIGZyb20g
YWN0dWFsbHkgcGVyZm9ybWluZyBhDQo+IHdyaXRlLg0KPiANCj4gPiArc3RhdGljIERFRklORV9T
SU1QTEVfREVWX1BNX09QUyhsdGMzMjIwX3BtX29wcywgbHRjMzIyMF9zdXNwZW5kLA0KPiA+IGx0
YzMyMjBfcmVzdW1lKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgbHRjMzIyMF9wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50KSB7DQo+ID4gKwlzdHJ1Y3QgbHRjMzIyMCAqbHRjMzIyMDsN
Cj4gPiArCWJvb2wgYWdncmVnYXRlZF9sZWRfZm91bmQgPSBmYWxzZTsNCj4gPiArCWludCBudW1f
bGVkcyA9IDA7DQo+ID4gKwl1OCBsZWRfaW5kZXggPSAwOw0KPiA+ICsJaW50IHJldDsNCj4gPiAr
DQo+ID4gKwlsdGMzMjIwID0gZGV2bV9remFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCpsdGMz
MjIwKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIWx0YzMyMjApDQo+ID4gKwkJcmV0dXJuIC1F
Tk9NRU07DQo+ID4gKw0KPiA+ICsJbHRjMzIyMC0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9p
MmMoY2xpZW50LA0KPiA+ICZsdGMzMjIwX3JlZ21hcF9jb25maWcpOw0KPiA+ICsJaWYgKElTX0VS
UihsdGMzMjIwLT5yZWdtYXApKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZjbGllbnQt
PmRldiwgUFRSX0VSUihsdGMzMjIwLT5yZWdtYXApLA0KPiA+ICsJCQkJwqDCoMKgwqAgIkZhaWxl
ZCB0byBpbml0aWFsaXplIHJlZ21hcFxuIik7DQo+ID4gKw0KPiA+ICsJaTJjX3NldF9jbGllbnRk
YXRhKGNsaWVudCwgbHRjMzIyMCk7DQo+ID4gKw0KPiA+ICsJcmV0ID0gbHRjMzIyMF9yZXNldChs
dGMzMjIwLCBjbGllbnQpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZSgmY2xpZW50LT5kZXYsIHJldCwgIkZhaWxlZCB0byByZXNldA0KPiA+IGRldmljZVxuIik7
DQo+IA0KPiBVcCB0byB5b3UgaWYgeW91IHdhbnQgdG8gY2xlYXIgdGhlIGRldmljZSBjb25maWd1
cmF0aW9uIChtYXliZSB0aGlzIGNhdXNlcyBMRUQNCj4gZmxpY2tlcmluZz8pLCBidXQgd2l0aCBS
RUdDQUNIRV9GTEFUX1MsIHlvdSBzaG91bGQgYmUgYWJsZSB0byBtYWludGFpbiB0aGUgYm9vdA0K
PiBzdGF0ZSBvZiB0aGUgZGV2aWNlLg0KPiANCj4gQmVzdCwNCj4gU2FuZGVyDQoNCkZvciB0aGUg
cmVzZXQgYmVoYXZpb3IsIEknbSBrZWVwaW5nIHRoZSBjdXJyZW50IGFwcHJvYWNoIChjbGVhcmlu
ZyBhbGwgDQpyZWdpc3RlcnMgb24gcHJvYmUpIHNpbmNlIEkgaGF2ZW4ndCBvYnNlcnZlZCBhbnkg
ZmxpY2tlcmluZywgYW5kIGl0IGVuc3VyZXMgYSANCmtub3duIGNsZWFuIHN0YXRlLiBMZXQgbWUg
a25vdyBpZiB5b3UgaGF2ZSBjb25jZXJucyB3aXRoIHRoaXMgYXBwcm9hY2guDQoNCkJlc3QgcmVn
YXJkcywNCkVkZWx3ZWlzZQ0K

