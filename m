Return-Path: <linux-leds+bounces-6565-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFA0D012DB
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 07:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75BC33014AFD
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 06:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22063223DE9;
	Thu,  8 Jan 2026 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BqdbYaZf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE23A0B1A;
	Thu,  8 Jan 2026 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852181; cv=fail; b=Mh5+FWmqtVyKfVbdits+8FJqBQvaYCeuLno/0g4BV73bIF9qvsNbrWIZ+eGzr71EDtpJmCzZnSC1hbm3AbZvRoWq2OuE3PhdAf2WqXl6FVqc+u1T3PQH2JBCME/XogAjSNWbVMVLFqSOffewNAmhPiueoq/O5QKL/m5yQ4Gvoyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852181; c=relaxed/simple;
	bh=SbeBwS6/2nCy8ZCQzt45Rj4T49uMxT3U3H4UkNN3+Wo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSnaVtLke+ywe4bVJDeuZ1s+ML942iGDnTEE9zdZh11HlA35T5AvQ96w2GvkoMKICg+3dmHbOhZjLwm3wqlwuuvdTmKlcGNHXhYeHPlMJob2ed53fSxXcQaWD8sWNruxf8rCxnwpf2/saikOPKK3JwFhGSNj/oZEAxGuWVwhwN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BqdbYaZf; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6082J5Mu476269;
	Thu, 8 Jan 2026 01:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SbeBw
	S6/2nCy8ZCQzt45Rj4T49uMxT3U3H4UkNN3+Wo=; b=BqdbYaZfZYDfRhXEFRfgv
	0KY2L6C3jaMM3TII5cpwkCHy0R+cVgpwxJlbNSeYuQs060fiiKmA6HmWxu6WbIoo
	dBRoO2/T5zT/MIkpbk1wYgqr1FBWzFMwDf3bmN3+A0njVcN4tHZUUB6f6EVwPGwj
	yAc0W1ya7YJ7/RHZ75Ng5MgPFT3nLdvozwqZlHUIQOPUXFP2u6eGR/4+SOhTDnSq
	PzcGT6CLTp97Lx8qpkgxZH3XHK3r0uT++ojwt+Z1M0BHuHtyovhK9oVCB68STwfT
	A88TnmqHkM8XMMyubOJgcCNpjh02zz4lxZqCDMwA0vS/n/My785epMtX1iCbLy0d
	g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bhu1mbc7x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 01:02:55 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yETisavBDTvSGZkOzXqG7PokCGcLNrfnet6hCSQyFdUR7r0mM6WNlZxjPx9YkEIcsGx+jgDyRjW5pSQUr25/56uGILOrRQjP0/kM/gyWfD6kT2jvO7P8CwGzVB3rR6dLGryLHABGEHRDazUVs7RxWn4188vCh8lUBYkmEhvcaGl7rQMLpjacWivUFnEFEpUJn/VeUQJ0Owk3/B1Qli2E0OcX9Mk/GKqHTEDrIS2ROBzRF6QbuFVBFXYcQ5VxoILyRzcDtbfaV+LfGOWY3HGWuulclJXTvykOTUfVXd2J5KOwiONLveXY9QKoPcIIhQNERmHoUYYC+uYX1O9/6araXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbeBwS6/2nCy8ZCQzt45Rj4T49uMxT3U3H4UkNN3+Wo=;
 b=FIr3sJapIh0nKw5wQmjxb8ugtigeWPBZP6sTAg8hBAvAuCD2F8dWnPUzozVyCnSLX80dUF30xb+xbhQ7Gs7N+3I1GFl8FDCD3OS27cUJ7+ZAqkY/nZymQaPsDMxaxJzvPlxQ8qe1gfioc7P2/vXj4aU/WGbYj+2GmCz6atvTpltQ+r5CTVZPWO3FVj5WmdI9xT+A6UKQqu9sEzMXeLdXiPA9PnsjTpIv46VAs9KcsGTm2144cv9fGtqZ9yY+2G01feraacgVR9nS1UfRiaNmEkZNB21sEo6mBN7hfdZjjym3ZJclqWHroKewRwUMYmmu+HSX+l4guaZbOqtYf5ENIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by SJ0PR03MB6630.namprd03.prod.outlook.com (2603:10b6:a03:38a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.15; Thu, 8 Jan
 2026 06:02:53 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:02:53 +0000
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
Subject: RE: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
Thread-Index: AQHcfs0qNXq3xtvWU0SseDoZIUly8LVEyrUAgAGc2KCAACO5gIABPvDQ
Date: Thu, 8 Jan 2026 06:02:53 +0000
Message-ID:
 <PH0PR03MB6525EA380BFDCB228C2A30C3ED85A@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-1-73601d6f1649@analog.com>
 <20260106-crystal-ambrosial-wildebeest-0e35d6@quoll>
 <PH0PR03MB6525F2AB63E24564356ADE51ED84A@PH0PR03MB6525.namprd03.prod.outlook.com>
 <2d1893a8-81eb-4d7e-81df-060722c10c7d@kernel.org>
In-Reply-To: <2d1893a8-81eb-4d7e-81df-060722c10c7d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|SJ0PR03MB6630:EE_
x-ms-office365-filtering-correlation-id: f39e4b89-ffcf-4b6a-d324-08de4e7b8fd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?THROQ3kweWd1YytDMjhsK21CRTdRcFprUnpheHBCM2hKNS9BTm8zTUFuNWR5?=
 =?utf-8?B?MW1YZGRLRmFneXBlaVo5Rmh3b1pJbXlYQ2NKTU54WXZ2czRqMFhxSHpGOUtu?=
 =?utf-8?B?ejFjbUhGYzFGZGJtTFRSbnU1TytOVmU1akNzWmE2UHpubzJER3NCSW9YdU5i?=
 =?utf-8?B?TE5Uamp0L1ZSNjkwZTlTZ1ZiNUNHa0JURjZoNkRBeVZxZXE3ZlpHOW5CMjN3?=
 =?utf-8?B?b09UUlRJOXJsS1IxRUdDb2N0SGtpdXRrb2J3L1hWbmJsdlphRzBXcEZlNlQv?=
 =?utf-8?B?a2hUNGozVVB3T0N6V21vUHoxMGNGZ0lLWDRYVDQrUlJQZXhaM0VERzBONjJu?=
 =?utf-8?B?aTlzeTNYWE1YamJsTGhQbWEzSnpUUy95N1ZCd2pibEFHdDJhcktuQnIzdS9R?=
 =?utf-8?B?WjVxUlNLcXkrKzRqNmMzbmdaNldFOFVZSHBoZENsdWpPWVR4cmtTUTZjUGI3?=
 =?utf-8?B?S1F4K2ZQa1pSNWdHekRwNnYwSUxMcG1qR1FqZ0pxZHdoQktPL0p1OHRBZ2Rx?=
 =?utf-8?B?Q2JFQTFNelJHTlo0dGtvUG5VeG9kbEVOUHkxdEcwanN0RHZZV1BzVFpRZzhN?=
 =?utf-8?B?ZVB5c1JUczdhWFk3RzZ4aFlMTkxRVEc0TndrOU5rL2Ruc0ZRZkc5dnB3bnpL?=
 =?utf-8?B?eHNSemFQZEFKZWZyUnBSQnBuR1JqYmJzcGFQVFpOSmNTQWhpV01TNVRteTAr?=
 =?utf-8?B?MUdXWXM5c1hLY3lPaUZvVVBXODMrRnRxa083TUZaOFFrejNNTkd5YitHRith?=
 =?utf-8?B?MEFlU2Nna1VCY1NrTjJHdE54THpZSVU5dWsrWm5HRFNtMmd2d2U0eDdKQk5C?=
 =?utf-8?B?akR3bG9pLzZybEVXRUF2WFZOOXkzclp3UXlQTWovNzVrVzJmMlRFVnNBZDdx?=
 =?utf-8?B?cWtPZ1JtczByVnpHWFVqTEVNRDhQZi9TU0hqWkRDZmFPUUNzWmhGSnk4Y1pI?=
 =?utf-8?B?S3EyTkozbGpCSTVJS01sa3ZvVVZYN3JERTJPd0xtcWJYSnZwRmtPaHVLa1Zy?=
 =?utf-8?B?ekZscC9pWnNXTUt0MDcyWE1xdDFSaWQyYThBVWY3UXVZdmVLRS9wcmFSaklQ?=
 =?utf-8?B?ejNlZVcwbzJxeXhOc2t5R2liZ0R2WkhDSlUzSXdLTWx4Kzk1UFBwQVhZazRn?=
 =?utf-8?B?NkdRWmJYWjJ2Vk9jY3FpbjFOTTNpNXQzclY0dGFhRXowbGRLNE91dG03ajRE?=
 =?utf-8?B?NlZKR0xVTHBiWXdnSmQvMzhzbnVHdzdiYkR1dWFxd2s5TmV0RFpOWThvek9B?=
 =?utf-8?B?N1lxcHVZTXZWdU1ReVdaMEtiZmM2R3ZXMzJJcnRVaWFEemhQbWFENUdTWnVK?=
 =?utf-8?B?dnIyY1NRWXByMUplT0Y3SllBekVPM1JnMDBTVTl4UWdBUlRqRVY5ZUJQNjlE?=
 =?utf-8?B?UGVnbXZaUncvcnp6eVJZTy8vK04rUDhhc05kalNWTGVLQnBVczMzTDF0L2JR?=
 =?utf-8?B?N3FGN011N1JkNTVVN2IvMWxQTXd1WEVCOUhoVGF2RnVsVUEvbGR0cURLVjFy?=
 =?utf-8?B?amE2V2F5Tng0ak45Vk1CVWFLTHd5aW5hL1BaMlNRcmlXYTFKbGJPRVZjbkkw?=
 =?utf-8?B?ak5WWVRDNndNbGdUKzhmeFFVSWhQb200VG52YWJ5VW1ZYXpLc09qbGlyNElr?=
 =?utf-8?B?dHRXVUNNV25VRHhLRTdqd2pJMWlqUFM5TFNTZmFuRWV2d21kamJZQU1OR0g0?=
 =?utf-8?B?UE5RQkt3MmhEekx4cVd3UU0zQk1EVy9VTFJ1SXQ0UlpEUXNDUG1OT3JycjNN?=
 =?utf-8?B?ZnNRRE4rZENad0J2SVcxNHk0bXFyd25lWE9UVWhBaXlqN0xDbjhuaTlRRC9w?=
 =?utf-8?B?bXRsbG96ZUdKSnRFTlBxRFcrTmNhZTNmTGtSRDgrNWsxYnVIYUFzMVlkNEYr?=
 =?utf-8?B?SzlUbWFYMmVmSkNHZlRONGhnSThFcjZuNHo5NWx1b0N5R3JRaHlTaFBwUGcv?=
 =?utf-8?B?VFJwMUFmbGpCcndaREY3Q0tuKzdMVWYrdE9HaWtRcHcwWGJzOUdIY3dGTXRx?=
 =?utf-8?B?UTRpK2NnNzZDQXNpb01tYlRTS2tleFFyeHhKRnd5SjJkS3o4YVkzb3B1S1A2?=
 =?utf-8?Q?eQwQfI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzA5Zit6R3I0UC9XRGF6QUZrOWdZWm0rVTFRdE96RzJRWkpHNFpBZU5yUUl3?=
 =?utf-8?B?NXpQQWEwaDFQTTZYSHh5VWdSbnI5d3lsMVdtMVVXeG1PME1PMUVqM0NXbHc5?=
 =?utf-8?B?SFY3OHVRaTVia2MyN0RaVEtRbnlsUlZBQzJ1WGVSbHJtVVJSMGtYTUtrT2Np?=
 =?utf-8?B?Z2FTaThtMHZCcytJa3hvOXlBTVc1eUd4UjNGaVBDUjlTVGFjZW04QXlpSzJu?=
 =?utf-8?B?N3FFUDdhTHVwSDF0dTFnMmZrTW1mMkMrUGdmWmd3Nm9teG42RUNXOGJOcEdw?=
 =?utf-8?B?clVEeWJXYkEySk9FYmtjZnJkNXh1V1lsQlhZdXdFWnErY0xEaXdybWZ4czRD?=
 =?utf-8?B?aEY1aTlKMlpHYWpnZHNPSHZaZ3ZacTJSMlQydVJtS2lJMlRsRDhvZ3AzUUN2?=
 =?utf-8?B?NmNWTnVCSitmeG1WMDk0WVMxRFFmaFV4VUZaTTNIS0lFSThiaUxOKzhacVJP?=
 =?utf-8?B?TTVnSUkrcmtoanY1dXNMNHhtT3lTaFdGQzRwN2UyaWI0eEtGeW8yM1pENEds?=
 =?utf-8?B?NEx3R3k1NFZrVFBPdnlmQVN4bzFPY0NHbDBwS0xVTnB2MldZYkFzaHVIeC9r?=
 =?utf-8?B?cjNidHl3eWlhMzkxWFVvNkk0d2lUUHNDUlY2RmhTWjR3WkNqWWdyTTYxeFFv?=
 =?utf-8?B?eFNtQUIwdnFGU3RFQ1IvTEFwQlpQMUNDYVB1dGhPZ2NHdjVmNFVmTU9sL1Fl?=
 =?utf-8?B?Q2kxS3Y4Q1dyYnJJaXlzOFVMd1AyMEYwRmxLZHJwMUQwVmtOMEI1ZzcxTGZX?=
 =?utf-8?B?N0ZVdSszTU5xbWtEMm5oQnd0STczSnpnTHhndC9URTMwdDc5Ty9aZkpTTGRo?=
 =?utf-8?B?NEQwRFNqd0pGaFM1MXZ5Z25OV2o0TmxaVkJIMlc4bXY0Tm5vbnlZdGV0QjFh?=
 =?utf-8?B?SWtITHY4SDIrdzRBYjR4SHl0TXY1WmlzeEtqZjIyU0tZR3loZ0d4ODR3azU5?=
 =?utf-8?B?N3J2S3RpdVBJZy83WVlYemFvSTREZ2F1bjdvT0xsMk1saVRWZlhaQVhURjh6?=
 =?utf-8?B?TFMzL1k3YWR1bEd1dkd4QmVyaElDTkcyeGVlMVNRK2lJeHY1T1RoL1NOYTJw?=
 =?utf-8?B?U0JYWTQ2V1FqdGI2MFlhd3drbFdLNnRrTzVrYWU0a3V1R01kWVRvdms1cFNz?=
 =?utf-8?B?a0xSUnJveEhpam1VUm5lN0RBaThlalExMnFKNDA0c3FLSnJYT01OL0JySjZj?=
 =?utf-8?B?TTZndlQvUkdlRjNvd1J3SXVWU2dXOXluNERGNTNJV0g4WE90Qk5MZ2VZQW5l?=
 =?utf-8?B?K3lmM3poZm9MMU53b2M4WXd5WENyZDlIbFFBYk51eTFEa3dUQlEybW9peUhs?=
 =?utf-8?B?VFVhZ2xhVVdac3NacHJQQlRsWG1TN1FvajZLYkxjNDdmYmJEZjdBNWRyeWhw?=
 =?utf-8?B?YStpK2lMTkluUHBIb0hRVm5jNjhhM3FpcnpML0J0T1RjZU92dGRhMVEzZmlp?=
 =?utf-8?B?bXQwVUduZ1ZkQ01zUGZpTXllMFB6bXhoSU1OMmRNenk1dFdWREd1NFo0QVMv?=
 =?utf-8?B?OTFVVkh2MmhYZStoSHF5aXNMdkY1ejlUL2xBdXRXVUU4RllGSzBCdTY2WkVt?=
 =?utf-8?B?eXYrTWpick9IazdHb2JJUmhvT0JVY3lBdk5ucGE3YklIR2hDZmZOWTBTaEZT?=
 =?utf-8?B?RW5ES3JTZ0dKamlreGVxU0lUOHNiVEkyMFNMNWNYQkwrUDlUY1FjNU00NWkz?=
 =?utf-8?B?OHNiT0daNVJrL3VLYlRCbE54ZitSeThrU2dRRy9lZGJ3bTROV0FUeVFKODNK?=
 =?utf-8?B?b3ZXeHJQQTFWYStOZnpxc1llamdSNkVaekdnTC9JRHZ0ejhEWTc3SjZiM09M?=
 =?utf-8?B?UDBsOVJyT3VOZ0E1U0dERStlM1ZlQVR2Vm1Rc3lscXJJZFZQN2h6SjV5ZlNT?=
 =?utf-8?B?cW5jRWFNZjR5emFGb0lBclhaM1RLRm91ajNLV0JBS3J4VkdNbzFOUHd4VHJy?=
 =?utf-8?B?SDdoZjY0RmU2ZzBYQ2NiT0x6NlhaQmJSRTdzY0l6MkRkQm53aXhOQ1JCNStM?=
 =?utf-8?B?OGdjUjBKSVA4RXAwTUdSbm9MZnozMXU5eXhWS3hYR1d1M05vRFRBNDZMVUdX?=
 =?utf-8?B?ejQxbXpxWHJ0ak5uRTB4WmpMa2drellhOEZKSzV1cUFMQVo4Y1ppSGlBSnI2?=
 =?utf-8?B?OVBTaWV1b0RSNC9JczVwVXRWWG02N3hyZjQ5QkFrR2l4NkpWT1dkaGlxUGJk?=
 =?utf-8?B?TlJCWlp5eEF1S25VeE5EVlVoellWNkxERmdKblhlVjFESzZjSnVyeUNmd0ZJ?=
 =?utf-8?B?c3NUaVZDL0lOVm9yajlsSHRrcVkzVXJBY283bEtxaThGZHVxVnVMWlFSZXYy?=
 =?utf-8?B?Sm9sMXZmaGljL01Fd3RuUmFPMjYyMCs4UG5sL2x0SVg1RDZIVVA1Zz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6525.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e4b89-ffcf-4b6a-d324-08de4e7b8fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 06:02:53.4157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SY+ncSy8Emn5A+kd8AtmuWA5PU2DiiVAcick31u8Q5oZ01F2j4kt5PuQ/CdCUqlEEOr218OTMeOANCn9GdUrLKRwdlZmjHbLHpaKDRzuVp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6630
X-Proofpoint-ORIG-GUID: qyhIMnGgb9Oa53NkEQ3EWR2bMPnChT5Z
X-Proofpoint-GUID: qyhIMnGgb9Oa53NkEQ3EWR2bMPnChT5Z
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=695f488f cx=c_pps
 a=KOHnGYwbv2QpRqiwWHMRyQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=uhCjb--prZvgiNEHn3UA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzNSBTYWx0ZWRfX/tQ2+6CeNWaU
 KrjBiRYXWo5xOU9srCaXSSVkCo8m4IS8IORKw2njoc7ngmlYkebi+8iKPJNbsXEud2yDFBiKIga
 49sphX/pKREjGheSl8dlRh9wiRUIlZWidoRQ2NHRnPb0jOndnRr6O1A+LdaeneKyOwI46fel6uV
 ewdj90nza2ZKA8bZTuq6qqEXs0jrNa8ZJDi97wcYXh63ruu1CgmTYvwmSZYQi85B7p9VXp4/EKO
 oiC9xv3CSg88s+QVZDs1jgie1H5S8kmBMNOK1pjt2H2UFjeVBSnaA0B6cyfTOOIC6K0jSHwKfdH
 DVsYgtK9k/vMO+qLL+G3T0ikKEKuHpbuTJoVm99OwCy41ekCYhc3AnmWvbzf33RhruwRliY32kn
 uFs7zdwYTMNveP0cOvuuHMU0ofUqsu9bpS6FRA3/Ocj6QlOWdeOUh7r9fMMaUwo2QC6BM/I44tI
 /no0BeDHk3L9+B9eHGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080035

PiA+Pj4gKyAgYWRpLGZvcmNlLWNwby1sZXZlbDoNCj4gPj4+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nDQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiBG
b3JjZXMgdGhlIENoYXJnZSBQdW1wIE91dHB1dCB0byBhIHNwZWNpZmllZCBtdWx0aXBsaWVyLg0K
PiA+Pj4gKyAgICBlbnVtOg0KPiA+Pj4gKyAgICAgIC0gIjAiICMgQXV0byhkZWZhdWx0KSAtIEF1
dG9tYXRpY2FsbHkgc2VsZWN0cyBvcHRpbWFsIGNoYXJnZSBwdW1wDQo+IG1vZGUNCj4gPj4+ICsg
ICAgICAtICIxLjUiDQo+ID4+PiArICAgICAgLSAiMiINCj4gPj4+ICsgICAgICAtICIxIg0KPiA+
Pg0KPiA+PiBOdW1iZXJzIGFyZSBub3QgYSBzdHJpbmcsIHNvIGNob29zZSBhcHByb3ByaWF0ZSBu
dW1iZXIgZm9ybWF0LiBBbHNvLA0KPiA+PiBvZGRseSBzb3J0ZWQuIEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aGF0IHRoaXMgcHJvcGVydHkgaXMgZm9yIHNvIG5vdA0KPiA+PiBzdXJlIHdoYXQgdG8gcmVj
b21tZW5kLg0KPiA+DQo+ID4gSXQgaXMgYXJyYW5nZWQgdGhpcyB3YXkgdG8gbWF0Y2ggdGhlIHZh
bHVlIGZvciB0aGUgcmVnaXN0ZXIuDQo+IA0KPiBNYWtlcyBubyBzZW5zZS4gVGhlIG9yZGVyIGhl
cmUgZG9lcyBub3QgbWF0dGVyIGZvciBkcml2ZXIgYW5kIHJlZ2lzdGVycyBhdA0KPiBhbGwuDQo+
IA0KPiA+IEkgcGxhbiB0byBrZWVwIGl0IGFzIHN0cmluZyBhbmQganVzdCBkbw0KPiA+IGVudW06
DQo+ID4gLSBhdXRvDQo+ID4gLSAxLjV4DQo+ID4gLSAyeA0KPiA+IC0gMXgNCj4gDQo+IFN0aWxs
IHdyb25nbHkgb3JkZXJlZCBhbmQgc3RpbGwgSSBkbyBub3QgdW5kZXJzdGFuZCB0aGUgcHVycG9z
ZSBvZiB0aGlzDQo+IHByb3BlcnR5Lg0KPiANCj4gRGF0YXNoZWV0IG1lbnRpb25zIHNvbWUgc29y
dCBvZiBpbXBlZGFuY2UuIEltcGVkYW5jZSBoYXMgdW5pdHMgKHNlZQ0KPiBwcm9wZXJ0eSB1bml0
cyBpbiBkdHNjaGVtYSksIGJ1dCB5b3UgY2FsbCBpdCAibGV2ZWwiLiBNYXliZSB5b3Ugd2FudCB0
bw0KPiBhY2hpZXZlIHNvbWUgc3BlY2lmaWMgY3VycmVudCBvbiBvdXRwdXQ/IEJ1dCBmb3IgY3Vy
cmVudCB3ZSBhbHJlYWR5IGhhdmUgTEVEDQo+IHJlbGF0ZWQgcHJvcGVydGllcy4NCj4gDQo+IEFs
c28sICJhdXRvIiBpcyByZWR1bmRhbnQgdW5sZXNzIGxhY2sgb2YgdGhlIHByb3BlcnR5IGhhcyBh
IG1lYW5pbmc/DQo+IA0KPiBXaHkgZXhhY3RseSB0aGlzIHZhcmllcyBiZXR3ZWVuIGJvYXJkcz8N
Cg0KQWZ0ZXIgcmVjaGVja2luZyB0aGUgZGF0YXNoZWV0IEkgdGhpbmssIGl0IHNob3VsZCBiZSBk
cm9wcGVkLiANCkl0IHNob3VsZCBiZSBhdXRvbWF0aWMgc28gaXQgY2FuIGNoYW5nZSB0aGUgc3Ry
ZW5ndGggb2YgdGhlIGNoYXJnZSBwdW1wDQp0byBtYXRjaCB0aGUgcmVxdWlyZWQgY3VycmVudC4N
Cg0KPiA+DQo+ID4+DQo+ID4+PiArICAgIGRlZmF1bHQ6ICIwIg0KPiA+Pj4gKw0KPiA+Pj4gKyAg
YWRpLHF1aWNrLXdyaXRlOg0KPiA+Pj4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4+PiArICAgIGRl
c2NyaXB0aW9uOiBJZiBwcmVzZW50LCBMRUQgMSBvdXRwdXQgYmVjb21lcyBhIG1hc3RlciBjb250
cm9sIHRoYXQNCj4gPj4+ICsgICAgICBzaW11bHRhbmVvdXNseSB1cGRhdGVzIGFsbCAxOCBMRUQg
b3V0cHV0cyB1c2luZyB0aGUNCj4gPj4+ICsgaGFyZHdhcmUncyBxdWljay0NCj4gPj4gd3JpdGUN
Cj4gPj4+ICsgICAgICBtb2RlLiBXaGVuIGVuYWJsZWQsIGxlZEAxIG11c3QgYmUgZGVmaW5lZCBp
biB0aGUgZGV2aWNlIHRyZWUNCj4gPj4+ICsgdG8NCj4gPj4gcHJvdmlkZQ0KPiA+Pj4gKyAgICAg
IHRoZSBjb250cm9sIGludGVyZmFjZSwgZXZlbiBpZiBubyBwaHlzaWNhbCBMRUQgaXMgY29ubmVj
dGVkIHRvIHRoZSBEMQ0KPiA+Pj4gKyAgICAgIG91dHB1dCBwaW4uIFdoZW4gZGlzYWJsZWQgb3Ig
bm90IHByZXNlbnQsIExFRCAxIG9wZXJhdGVzIGFzIGENCj4gbm9ybWFsDQo+ID4+PiArICAgICAg
aW5kZXBlbmRlbnQgTEVEIG91dHB1dC4NCj4gPj4NCj4gPj4gSWYgdGhlcmUgaXMgbm8gbGVkQDEg
cGh5c2ljYWxseSwgeW91IGNhbm5vdCBhZGQgaXQgdG8gdGhlIERULiBJdA0KPiA+PiBzZWVtcyB5
b3UgZGVzY3JpYmVkIHNvbWUgc29ydCBvZiBkcml2ZXIgYmVoYXZpb3IsIGluc3RlYWQgb2YgaGFy
ZHdhcmUuDQo+ID4+DQo+ID4NCj4gPiBUaGlzIGlzIGFsc28gYSBoYXJkd2FyZSBmZWF0dXJlLCB3
aGVuIGVuYWJsZWQgYSB3cml0ZSB0byB0aGUgTEVEIDENCj4gPiBvdXRwdXQgcmVnaXN0ZXIgc2lt
dWx0YW5lb3VzbHkgdXBkYXRlcyBhbGwgMTggTEVEIG91dHB1dCByZWdpc3RlcnMgdG8NCj4gPiB0
aGUgc2FtZSB2YWx1ZS4NCj4gDQo+IFlvdSBzdGlsbCBjYW5ub3QgYWRkIGZha2Ugbm9kZXMgdG8g
RFQuIEZha2UgbWVhbnMgdGhlcmUgaXMgbm8gYWN0dWFsIExFRC4NCj4gDQpJIHdpbGwgYWRkIGlu
IHRoZSBkZXNjcmlwdGlvbiB0aGF0IHRoaXMgc2hvdWxkIG9ubHkgYmUgdXNlZCB3aGVuIExFRCAx
IGlzIHByZXNlbnQNCg0KVGhhbmsgWW91IQ0KDQpCZXN0IFJlZ2FyZHMsDQpFZGVsd2Vpc2UgRXNj
YWxhDQo=

