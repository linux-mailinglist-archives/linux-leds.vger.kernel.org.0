Return-Path: <linux-leds+bounces-6639-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32DD1B3A8
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 21:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CC1030127B5
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 20:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C972FCC0E;
	Tue, 13 Jan 2026 20:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="SMlmnXJx"
X-Original-To: linux-leds@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010019.outbound.protection.outlook.com [52.103.2.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318AB2BCF6C;
	Tue, 13 Jan 2026 20:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336553; cv=fail; b=Cmz6TN4RMUL3jJgpUAuDGPrgFG45Gl2hbMNtmyZArx+Tn8TyYy/PWrMY2KCbWepwtGyNMkZ/WPAjPtalfFvakMJ+APUFreuZbVN0TBnh/hiC0iUFfsFhTKp/adibUCCaN+0UczuEnSZhKvBtXQ+MZ7Jqa/hfXLTFeWMhzXr4Ryk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336553; c=relaxed/simple;
	bh=7BpLb9DEenRymPttJtByCfVWCGHN67DvqQIMCuNN/Xw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WjVFA9o19c7VtGHKnVGmkluVQ57K6ioN49174sI1fCsDE0k2mV50FchhGoNwhnVKI+nkCL99BZR8KI2JdceRjj56pmbKgXDPCh3uAXvTzsBZCVh3I+BiaBVenp0p48q2G6e5JSQCKlW8sFRYceCnOPlq/OOb+/NNyqzDMQ9HQTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=SMlmnXJx; arc=fail smtp.client-ip=52.103.2.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYmr1cTv9j/fLxeLC7lUU6SS937Irf1iCGn1QUz/s6w0i5CPdOi2v2hy5AUbWTnUrp0riGEcJxf6hoFKcz8/w1qJd7s38GP4T/54+rNsHrY2vGTw2gsxGS4I4aQcfXUyGN5tw/YR6OObjR84PSScphQ0WfRtpw8D3HTK8cgv3/Ow2aKk0PqpOWB3DJrX0rwIDCaCkgno8cR637vityLaoiyQmW010BKU3UpCOOpkjS9T2n7N7IEpOYg/sLu/zcVpT80MMbZyBIoKgxStDtX7fBvfrbz8GWZO6S5ZKZb5mT/1AA0PYzLWgf6xW/pxGJ4NDpdC5iFYE33Gp7B65FzzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BpLb9DEenRymPttJtByCfVWCGHN67DvqQIMCuNN/Xw=;
 b=vkGQ5XbriuudidnqYYthhwDMlBF+1p3nJqjiN6IB2E9/Pytqksrd9D7wJK3CwuKhWhLPXenWLXoypZhIjyUSO0g/V8HDWq1OYBCOiD9AgeGoxvxLYqXVIc8zx8PNhHZd8wYN9WWRhN2f4bGVazzdpisIGTTv3f1c7OGxUpNB7mV/6rt0ZDEYVSvmX2SzYxsfyPUKU6zuAjsWWzjJ1yb3Qg+XLqvsE9JmVSmCxes18QpnFLVjIFPmX0KumXF+NZHvQuMIe9oLpN/mreZ99jrJMr+xzMf51tucWWMbOjBtzqhpDkZOHvkEjgy3y46x6uaO14VkniFGkM3w3FZCj393dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BpLb9DEenRymPttJtByCfVWCGHN67DvqQIMCuNN/Xw=;
 b=SMlmnXJxXKkWHQLg5R/UHjdJNrDweF3WOdHTSVplQfFHfQSGIXEniEORFwLwT6HZFbX70lkTSpprbhJ7Fd16fDCIPfGgxW8CvvvBOtSPNZzjjfACT3xRTBJQ+JC4lBnniOxf8w/kzJE07sRif9aNhszromkQbOxsLHfdYnNiLzp9d+9q3Y1Z7KDWuuEIyk9VkyQyWyeAUXt3QOOpJTgMbqhbeqKWy5/6FoOmXhYBrvn705AG1kWVSqEzacZJlec5WTHPv3Of1oB3jm4ee8qYKDzKkfzXY9LhJspIhunKqmXMoUx5832k+wKSdmaWaOSMlvlHRDhZSBNaQy7OW4Tfpw==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by DS7PR84MB3064.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:35:50 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ae73:f74e:c8a2:cbd9]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ae73:f74e:c8a2:cbd9%5]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 20:35:50 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Lee Jones <lee@kernel.org>, Jonathan Brophy <professorjonny98@gmail.com>
CC: Pavel Machek <pavel@kernel.org>, Andriy Shevencho
	<andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Radoslav
 Tsvetkov <rtsvetkov@gradotech.eu>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: RE: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Thread-Topic: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Thread-Index: AQHceWWl9+FsODD+c0W1OCLRhzwBM7VQFKiAgACLvJA=
Date: Tue, 13 Jan 2026 20:35:50 +0000
Message-ID:
 <DS0PR84MB3746D50A75BCB4DB053E008E9F8EA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20260113115701.GG1902656@google.com>
In-Reply-To: <20260113115701.GG1902656@google.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|DS7PR84MB3064:EE_
x-ms-office365-filtering-correlation-id: 47c336a3-9bd1-4c13-1dfe-08de52e356f8
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15080799012|461199028|13091999003|8060799015|8062599012|51005399006|19110799012|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?Uk9KcEJQK0dUNEJ0bHJ1ZHBoSXBmdGZyS25TRGF4ZTZER0h5bk5tL2lUYXBn?=
 =?utf-8?B?MyszRGJWYnhCR2hucVZPU2Qyb0FoUnJVUllWR3J4VkFVbEltNEpxQ1Y0ak9h?=
 =?utf-8?B?TDRIV21PTDBpcmdaNkp6R1IrS2NZZ3VkZkdESXVnNkZkaWREaG9ET3BDLzFM?=
 =?utf-8?B?L1ZZbDBPZGJieGVCdUV6eVVvaGtOZllSdVd2TTZIM1huN3FheHJMdU9sUUtV?=
 =?utf-8?B?SGlEK0tTVnREUk1LbEkzY29yKytnQ1RBK2Q3SEZuS2tUU3d2dXpTeHRrWE0x?=
 =?utf-8?B?WjhPYnhkMmw0WDc5bW90TkRsdjQ4Z002MG1sRDJ6U2FRSmtGRFR5dVZYZFVJ?=
 =?utf-8?B?RTN4MTBaelIxamVtQkZlQ0NuT2lnV2s4TWNrNVRWRUw1czRERzlkSHRCODBE?=
 =?utf-8?B?aThOSVUwaGplWndsZ0ZadUZqcUY5L3I1WGZrMjBBdFFTQzVSMTJKdytwbmRn?=
 =?utf-8?B?YnZtUjJiZ29FWjcyU0c4R3JFR282cGMzZTh4dHk5ODRpcFdaS09QTzJyNURq?=
 =?utf-8?B?Uk5lZXZtYmp6L1dudUJkYkRMcTYwNGhsZnRpc3JSNEk3UjNNd1VCZUVtMDZR?=
 =?utf-8?B?eE9OOFphZ3pwSTVGQzVNdEtVNlNrT1BoWWExYTdNeWxqTUhLTDEwcFZYeUZY?=
 =?utf-8?B?RXlaRDJGQkNWZ0FVdEUrdC9RNXBsMENNeGVTeFhyaDJRbWdzMEV1d3dGUGdv?=
 =?utf-8?B?OU12Yk5mR005SXZIZS8vV1BVM1hueUFGa2E3bmJjRmt6LzlaUE1MazV3b1ND?=
 =?utf-8?B?eFJ6YnJkSExYc0NvZE5aQWtaUzRTc2toOFBJRFd0R3dybjJvbFRuTEdySjdC?=
 =?utf-8?B?ZzZJTFNMTlEwTHc1MFFvM1BNcnN0ek5VL25mQ2E3VmhRZWVXdjRVbk5XZ1Jn?=
 =?utf-8?B?cWpHSkRwNkFNMWVha28xUFdwejlWVmd1eFVlQ2hCckZhbW44Z1B6WXpiQmR2?=
 =?utf-8?B?ZDBjWklZOGs1QmZWcUFJRVRrKzN6Ny9ZQ3g4K1o1aHBWQWVZL2pkM1REOTUw?=
 =?utf-8?B?eFVkL1g4TVJqbmNidy80bHhoUTN0N2syR1llRTFzNUpTNVNIaTVRUjd0eHlH?=
 =?utf-8?B?SjFkU2ZRMDhZeWF5eU9NengrYlJTd2RPSHA5UHJqQUczRjF3Mjc0Zlk0MHVx?=
 =?utf-8?B?RkRMcHR0RnMrZ2J3MnE5ZW5xRTFKeGdOMENLaFZvVnd6ZExBam5vOWJOK2Zv?=
 =?utf-8?B?RHlGMm9ULys1RGg3Z0MwcU1Ya05qZkNiTGo5QnF6RHNHeXlNcHdCMDhiTk1V?=
 =?utf-8?B?dnhlVTM2MjJLVTJad0phQWo5ZWRtQmxjazYzMEtVVHA0NzR5MDRrZ1BRZHFD?=
 =?utf-8?B?TmMwbHozWlN4WDdzbUR6VFc4YzErTTA1akZadFVkVEVrcHJXdXJ4elJPdVpW?=
 =?utf-8?B?TDIvQkxaSlk4QlVIOWl2QW9yelU2c0VPNC9TcVlzS05Xbm1tNTdINjRzbWRK?=
 =?utf-8?B?eWMzbUU5S0N5WlFGdmNpaHZPbmw0dnNsMDBRdGlMTkNDRHpDOHorbms4aUNa?=
 =?utf-8?B?U2xGc3h2cWVKdDdXTlhVUGw2YVZiWEVURS9QOWRUbnJCSG5pZ2xrVGI5YlZH?=
 =?utf-8?B?UXc1MGROdWp4Q3gyckhjNWFXU1ZhR1ZIWkxpdFlrSWoxa0FrVWhvM1hVUTFF?=
 =?utf-8?B?ZW1YanhBU2JIV2dpbGJDTjNYZ2VVRUE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlpZd0E1dHA0TnFlb25oZGxyRHg5dkdVYjJFRFN2MXM4YjF2TmhWWGhuK2tM?=
 =?utf-8?B?VXBadTg5cnhsY0o2eTVOQTQ4eEdlbThoQzIzSkcwb2FjdUsvVE9iaEwzS1Uw?=
 =?utf-8?B?MTV3SFMvTFdJaXd6bkZuTkpXdFQyUzEwa3F0QVNVOVU0dldURjUySW9yZEFS?=
 =?utf-8?B?T3dwUnA3eEkxUVVJMGg5c213WXI1WWExR2RORW9ValQ5NHJrTlp5dE1YS0FT?=
 =?utf-8?B?eHNqbTQ5U0JUNmc5SU1ia0xQT3JnblJnRDRYbGd0V1BEbERxMjZRUkxTNDZ6?=
 =?utf-8?B?SlVGVExZVTh6THlNVEQxenRDTmJ3U3ZjNTNQWEFvK3preFo4Q3dJVUlZUmJh?=
 =?utf-8?B?blVCR3lkenJvQ3AxTWpYU3FXRk9MeE82K0ZMTWJxZzNrSU5SR3ZiTklCSnBq?=
 =?utf-8?B?VUVMemxDa2tDYldzbnd5SG01WS9iY2p5dWlFa1JkekQycGVHR1IyWW9EYys0?=
 =?utf-8?B?Y1l1LzhCSFVqZnZ1RjlMcTFyOWI2K1dEUE1uM3JwbEtmUHNiYmsxUUJtbUlP?=
 =?utf-8?B?NE1zY2xONU5HazFNRFpFSEx5Mk56bXlEQXFYaTNXVmNLYWhBZm1qb3FNZHda?=
 =?utf-8?B?SW14Vi9DNFJibk15dFRUZ3VtZS9Pc1FQYThKTFpTbzB3bWpTNURneThRL2Z1?=
 =?utf-8?B?RTNleGpYeTcraG5mUHVvNVJnUm5RUXZXUnNzWUMzMmVUb1FFa1RWTlptZTlZ?=
 =?utf-8?B?Zk1JTkVSUkl6azA5WC9FZVVwWUI3U2plV3IxdDhzU0pQbGxFMGZYL2RFVTRm?=
 =?utf-8?B?RFRqcmFZYm9mMVZqOWx6NmZOUU5nZlNMZGRIUVFIWGxYMjY5V3hmd1Bqa0Vp?=
 =?utf-8?B?Nzk0Q0FSeE5qc0FwdW5RSTdhVlZkc0QwUFRDZlo1SXVyZ01qM2M1eFVHRldU?=
 =?utf-8?B?T0IrQkdpNGxFQlh5T3pKK0Zzci9hbE9abW5iWC82QXh5YmU4OE5HcndYcDNT?=
 =?utf-8?B?KzZQNFcvZ2pQZElUU2pVMVF5TExteWUrUFluSlhQQk5CdnpyMEJ5R2duL0Fm?=
 =?utf-8?B?aHJzeFpiOHE5SWVlUnpTa2pzTW5CQUhoWjl6TXV3OWxxNEx0TDFqdmlRRzNV?=
 =?utf-8?B?VWJ0d0hXb1F1Y1lhUzV0UWNuREk4T1FYOVRtaUR3SW1Bd2c4TVhIMjVZRDlu?=
 =?utf-8?B?Zm1EVU9ZSmh4ZWhGcGV1d3ZkaWRBVS9wKzZsU0cvSGVVUFU1d052NjNkb29n?=
 =?utf-8?B?YVVmcUY2aXphc3N2b1RQeUZXS3ByVVlsVCtqQ3pKMFdPT1VZQXJhcTNjZGZk?=
 =?utf-8?B?eDhZQ0s2YUdvb1FPWVRRdXk3UlhQKzY5Vmczc0dOc0JjRXlIMlIzWjJEQjZ2?=
 =?utf-8?B?SFFyNWdvNVpPMXM5WDZhanNaUXAwNU9tcFFOVnFnOVNTS3o3SWE2enVqTzNV?=
 =?utf-8?B?U0tjeCs3ZDBsZ1pld0R6L2xtQkpFb0NwQ2tPM2hjRVhUOFhZemlsVitKWENR?=
 =?utf-8?B?K3F2MmduR1RTQkNwM00vdC9IVjg5dERoWHVOZUhKTjVKVHRDQzhFcXVZbjhW?=
 =?utf-8?B?b1prNmZSRVJBb1hPRjBKVjFNTnRrT0pia0Z5dGdzTXR3eHNaQ0FKZXNYUUha?=
 =?utf-8?B?T01td244Ny9JOEhEYUVjVVhWVlg4Z3lTa0QvOUN5YWUzZlQ3Nms4dkl3Wkti?=
 =?utf-8?B?cDJnSzFrRGZ1SlVMcUh6NGRSSENPREJLRFNQMk1jVVVUNVRyVTFQVUZ3Uno2?=
 =?utf-8?B?ajFsa1IwaVZpYWV0SGhTY2hxaERjVVBqUUY3WjhRYUFpTEc1ZHFxWHc2WG1J?=
 =?utf-8?B?dDhjQVV4TkFzUjlzb3RjZTdIZHoxYzJ4Rkk5Wi82WDg3dEhieU5BSmpRMG1G?=
 =?utf-8?B?K29SZmh6U1NBTG1OVmRzWEYxVUFEZjlyWDNpaWE1TWc5UGxuZSswUXlVMDdI?=
 =?utf-8?Q?D2GVowC2XO9ve?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a21eb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c336a3-9bd1-4c13-1dfe-08de52e356f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 20:35:50.3031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR84MB3064

Pj4gIGRyaXZlcnMvbGVkcy9yZ2IvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgMTcg
Kw0KPj4gIGRyaXZlcnMvbGVkcy9yZ2IvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAg
IDEgKw0KPj4gIGRyaXZlcnMvbGVkcy9yZ2IvbGVkcy1ncm91cC12aXJ0dWFsY29sb3IuYyAgICB8
IDMzNjAgKysrKysrKysrKysrKysrKysNCg0KPlRoaXMgaXMgYW4gdW5yZWFzb25hYmxlIHJlcXVl
c3QgdG8gYXNrIG9mIGFueSByZXZpZXdlci4gIEkgY2VydGFpbmx5IGRvbid0IGhhdmUgdGhlIHRp
bWUgdG8gZ28gdGhyb3VnaCB0aGlzIGluIGFueSBsZXZlbCBvZiBkZXRhaWwuDQoNCj4tLQ0KPkxl
ZSBKb25lcyBb5p2O55C85pavXQ0KDQpIaSBZZXMgaXQgSXMgYSBiaWcgbHVtcCBvZiBjb2RlDQpJ
IHdpbGwgYnJlYWsgdGhpcyBkb3duIGludG8gZmVhdHVyZXMgYW5kIHNlcGFyYXRlIHRoZSBkcml2
ZXIgaW4gdG8gc3ViIDYwMCBsaW5lcyBvZiBjb2RlIGluIGEgZnV0dXJlIHBhdGNoLg0KDQpJJ20g
YSBqdW5pb3IgY29kZXIgSXQgaXMgZWFzaWVyIGZvciBtZSB0byBjb21wdXRlIGFzIGEgc2luZ2xl
IGZpbGUgYnV0IHllcyB5b3UgYXJlIGNvcnJlY3QgaXQgaXMgZGF1bnRpbmcuDQoNCklsbCBmaW5p
c2ggYWRkaXRpb25zIGFuZCBmZWF0dXJlcyBmaXJzdCB0aGVuIHNlbmQgYW4gdXBkYXRlIHBhdGNo
IHdpdGggdGhlIGRyaXZlciBzZXBhcmF0ZWQgZm9yIGVhc2Ugb2YgcmV2aWV3IGluIHRoZSBmdXR1
cmUuDQpJIGV4cGVjdCB0aGUgY29kZSB0byBzcGxpdCBuaWNlbHkgaW50byBzZXBhcmF0ZSBzZWN0
aW9ucyBhcyB0aGUgYmVsb3cgbGF5b3V0OiANCmNvcmUuYw0KYXJiaXRyYXRpb24uYw0KcGh5cy5j
DQp2bGVkLmMNCmRlYnVnZnMuYw0KdmlydHVhbGNvbG9yLmgNCg0KV291bGQgdGhpcyBiZSBhIGJl
dHRlciBhcnJhbmdlbWVudCA/DQoNClRoYW5rcyBKb25vDQoNCg0K

