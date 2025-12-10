Return-Path: <linux-leds+bounces-6400-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32ACB2BA5
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 11:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3902300A850
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 10:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F153164DE;
	Wed, 10 Dec 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=corkillsystems.onmicrosoft.com header.i=@corkillsystems.onmicrosoft.com header.b="tFk4Eg7W"
X-Original-To: linux-leds@vger.kernel.org
Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazon11020099.outbound.protection.outlook.com [52.101.152.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D93191D6;
	Wed, 10 Dec 2025 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.152.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765363431; cv=fail; b=PhA5CmSM3JmYOBSQYoksRaEp80WGU/rzfo6Dne0A2rmot0lsLe+czruInDy1Vgcnyx1EVxXujeSWh/0BimoNb/anbyfzVs+uL7PZsxmCQkSXHNAFrzNhMa+eS6bQMJ1Rca3AZE9TSc/wPMrHSbsh+V3az7etvKMJKiDJjMsaPjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765363431; c=relaxed/simple;
	bh=SB8v6ehQwEoMjQFUJjsWw0ctFsZsG75XC1HJxPsLBqk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o9pnhoRCSALimoOhuwpzCmyb8zlJC67MvFMmOV+aTi3OTImS5LmtpShjLi6xEwKAkrSaZa2t8HK6DpJXwzdL2FWnCBT09rVrLHW0w1osgYboYdKlr4etBQ5BaIWGdgjv125j9ppD5LaW81ORx4HJQs0L21mRFS3HDJmhgI8AZc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=corkillsystems.co.nz; spf=pass smtp.mailfrom=corkillsystems.co.nz; dkim=pass (1024-bit key) header.d=corkillsystems.onmicrosoft.com header.i=@corkillsystems.onmicrosoft.com header.b=tFk4Eg7W; arc=fail smtp.client-ip=52.101.152.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=corkillsystems.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corkillsystems.co.nz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWRykPKKiKqq33urxtKVEeQF+HMDkNN4cmhZzehtmZlmD7goJBrTt0DDMQLCk/FIkOg6XnjD5xiIzdo+UACs4Pxm7mQkQbfybR5fi9SkYSqHtRYTGjW8tEl+q+dM780xDxHPKPAB7qioZE7NNH2WUlKMyUU6aqNd32vtSCPDcH6BNQKQm+1JxgozoNdXmDfV1Iv3tLfofz9SnvzPyUBI39BeusbL1n1mBpYIqwqckeOU8c01QMeF82JNL1PuaNvpL1slYQl/UO0WXujw3NynhWp9tm3HHfdCVe5cNDyO5/Jd7qcoUB0abc9Dv9eFBD4Rr8EuljxUxmc3GR7B1BVegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB8v6ehQwEoMjQFUJjsWw0ctFsZsG75XC1HJxPsLBqk=;
 b=pdOpjcH2q06k9H1fxVwLiVq89EiRGohB1+4SYHWhAT7L8xMIRCquOez/KhHDoVQbLpQoEVlmGP6wAD02kSqiopsRKBHluat9lodYOtfaKOqXj8OajzDcIq1rTzLIhFR1lpsmijsE6DFPgt+TLaGOjq1PQnGKcMOFtbmG5Swi/sDgiD4rtBw0itlTVTz6YLrB1KaG1WtE4qDUA84TUCL8Kpuc4ZyupbXWPYMtGJTX7M+kkzJ2QWQsyDCFLX89lEnXEY3klIh4UHtJnYfL63isETe3tSJrDPXW5wTO5F4Cibbc3jULPSEIAC2VF5V8Ioc1Qd93gPu6eTQrmEi3VHcQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corkillsystems.co.nz; dmarc=pass action=none
 header.from=corkillsystems.co.nz; dkim=pass header.d=corkillsystems.co.nz;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corkillsystems.onmicrosoft.com; s=selector2-corkillsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB8v6ehQwEoMjQFUJjsWw0ctFsZsG75XC1HJxPsLBqk=;
 b=tFk4Eg7W8/dtg1efcU9Iogkntn0BrAXm9vluUUvFsmNzOMFmDH7bXxtHe6ziuj+yVPvFrOU++Hu8S2CgmptyoV+wMoB8eo7z6+DHxY/0mjb4xmMPY+k6cdVDf6XrEN6+9y94Q4CBgNy09OOgGtdGH3kuGBnq4D9tBN3WKLW+tTs=
Received: from SYAPR01MB2863.ausprd01.prod.outlook.com (2603:10c6:1:8::22) by
 SY4PR01MB5595.ausprd01.prod.outlook.com (2603:10c6:10:fd::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.7; Wed, 10 Dec 2025 10:43:38 +0000
Received: from SYAPR01MB2863.ausprd01.prod.outlook.com
 ([fe80::8aca:baef:c648:612]) by SYAPR01MB2863.ausprd01.prod.outlook.com
 ([fe80::8aca:baef:c648:612%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 10:43:38 +0000
From: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "lee@kernel.org" <lee@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Thread-Topic: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Thread-Index: AdxpwAWCxDY/TmkrQueAwbMHqG9ulA==
Date: Wed, 10 Dec 2025 10:43:38 +0000
Message-ID:
 <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corkillsystems.co.nz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYAPR01MB2863:EE_|SY4PR01MB5595:EE_
x-ms-office365-filtering-correlation-id: 953dbc62-332e-44b5-3652-08de37d8fa63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ekxlXnDUCXiQm/+8Qtda3nd94Fx9rJnJER/gAy4g83Orykp1fnxNXo4ezfNQ?=
 =?us-ascii?Q?PRM0iXe/yoyo9UWf0/1K7WSA9kDyzRAACJjhaPmXyGXu8US+z6vz9pIcCWD/?=
 =?us-ascii?Q?AtNWK1DtP92VxtAneXVr5wXSzmEV2oaLF5DLUkrdNmJGd7jNsIzHJ3ELCp2j?=
 =?us-ascii?Q?uhghybPsQgFHF0/qbE8yx4N800bUDz1o65lnvEwbpkA1CT+doGog3gPtcGp/?=
 =?us-ascii?Q?3itq4/wvF+JuULdoklii2m/TynGeE9YLafkKw7I4pcO+l9z30JtFofvfd+zA?=
 =?us-ascii?Q?V1ss4ZzZnoDEUJGawlhYhP4doiZMN4vJqDEM0xP8oLS8moCS22KTfw+70wvg?=
 =?us-ascii?Q?/Tb/AXP7alHuRLVdvHVN7wDp40AaDLq2rxyVro+KQUxrmsracpv9tQU9+3TE?=
 =?us-ascii?Q?Vu0ELjr8txiA0rximPnzJjGtZmTpk7+uzaIm8BXGCxGXKOHSEbUCqa/SbR/G?=
 =?us-ascii?Q?bqiKSao5MSPvcsK3mPzn0/oHqTUo82Jg3Rnt10LMkvQXnmTGlZ90mBRl7BqV?=
 =?us-ascii?Q?D1YknfaSCUZHCsphlj71zPtrY/cKaRA9RV7FDHM6cHxx5sESxP1C9tycrAHR?=
 =?us-ascii?Q?NbFHHlWXw0kHA+P3I9+tO4pMnlJbHe6GQrA3e0ntyxD3WKjtwQlUd/jSmDyY?=
 =?us-ascii?Q?TqvSNfDu7JMaIcJjVbFndcoObKb2oZzijNw9M9l8Ad8Q1cv21RRXwj57k9Kn?=
 =?us-ascii?Q?wfoEOVgjWa4D9R3i5dk9nEVqFcciTqYz1hyXUlHdjUT2pdANAvHA2LeFgC7N?=
 =?us-ascii?Q?Zq/wioGEXD3DXWNz1tPXXlDJZr4qS1gw1FOfyMeBvSQ52SxxV5rvRnzxZb0F?=
 =?us-ascii?Q?8uLq1qc4LEp+/TdZUJsegqB6g0KKnGWIliOND6bWKf68zfkyKvXi1YG+EMFw?=
 =?us-ascii?Q?Dsu9jBgKC7caXjtkx5Bpn00NSg8+YKxkXV/Bz/eSJrmQadZaKeEsyBt8QeXY?=
 =?us-ascii?Q?xjLDJMLMmLcrTDN4ZfLLm7oHcypt+xiyQE9pMBFcVj/h7qZ1V5dyKneZ48lM?=
 =?us-ascii?Q?hwGVK8pIaphHa9HNLjOIj5iLthiT/G4rjI7OLfBPZANYKm7n+GSSTm1ii2+W?=
 =?us-ascii?Q?1clckekzu4vJQZy77wDDNbd5RWcEw/+8KlwFWKNx3GglivXucF55Hdbb6o4Y?=
 =?us-ascii?Q?kvJzhNGeH8e+dV9Yc4M/RwpROjLKTrPbAdxn2EOL7R+Bx347igxEKjBecd2u?=
 =?us-ascii?Q?m+PX+iy/LxwH+NP6Dj0/W42wE7mgnkPlTpCnnNB+zO+cNGanxVJ0i8bw3sst?=
 =?us-ascii?Q?vLNwEnIs5WR/WBaKigh2JDkaIXRot/DKCFAo3e+lM2+d2s/aQoltC7gVgjum?=
 =?us-ascii?Q?5k+8sSdw5+5+iXUiPskhyRKNW+8vHxKUeic3q+xmP8369u/vhtI6Y+psXvKV?=
 =?us-ascii?Q?0K8XkXMo7Ft7Acaoos7p+5dHQoY1fy6ZhiqwcVdZGph/kCmGMVEMuk0kE28F?=
 =?us-ascii?Q?TEYnhMURkuc9EXyQgUnHR32nsuA1NvbSn4yrjEs+VviS8bU6zKIurBAEzwB0?=
 =?us-ascii?Q?INcAaTHsgNAS5MFswsvC10jLPkZpQXEX5Yls?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYAPR01MB2863.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kW/Z8TXNPnMI7I0NWJBzt32TcoH1uMdb4tLgeSv9xKhW2dcFntAtOIBKYkhL?=
 =?us-ascii?Q?f/6AqsMVx0G6PYv9aAHHQaaTyryWT87KdtXoBwfLgMrwZLcQxpcZzVeAkvwy?=
 =?us-ascii?Q?Hyy6iHJgppARxP51wpuGQPUoEAdgDbHu8EdaVOdGF5SidsmsYnzdO/YDEP8u?=
 =?us-ascii?Q?e5vKLLlicnduJo8TrtIqIfCVdbZMvIONtAro2OK0arkoUGjKJl/3vbHxEsD2?=
 =?us-ascii?Q?pTARVZKZm/pFtrMzoo1sH+x76m9nvg/71BqvpttceHJccd0rqW56GrEEEkCm?=
 =?us-ascii?Q?G0vwuf4W1abpn0yhULXaFE0+Mb+FAWxI5dn5J9T6lPP5MaVzSzVFrCerN91v?=
 =?us-ascii?Q?7WW3THKxs5q7GegCj+gxh5m9vlub//+JHheVmxNr2PMHykkgzKC14me2nXIu?=
 =?us-ascii?Q?v9x0YKZ0GdKyJ2TTwOJ16/QvoIA0s+cnYLIURoW2xByvLCZevBt19jvQOP1y?=
 =?us-ascii?Q?kOQLvwFAFzAhGHHROOf2fMbmsJqYdfDLt3+VPwTDJXuYFMd1es4fJT+/PVdo?=
 =?us-ascii?Q?HKMTiLUkviY0CTqRNzkEjgXqx9lejRLgaK6qUQKwiZGtdHhuDJCCpKKHo4Cp?=
 =?us-ascii?Q?SwX26stgB/EMxXw6uzGU9eV7QwSvk/ivUjnYUAVAQN1s8JzgbqycGJ7z4exd?=
 =?us-ascii?Q?oP4pSZTsKuXSzg8dO7qaq3ad3ERnOftlD9lo23A3Nx5J2PxLTMVEnpV3EBRa?=
 =?us-ascii?Q?Jwx+0KhWX+Drl1lkYc9I2ipPM5L1IqX2/VGoVqarlN4G7Apn6eDtlwFdm7xa?=
 =?us-ascii?Q?rt/Ij6EGcvsQ61chQGIwpTLFiztZoQ33BriuxNHYtg5oU/ze8NMRs+CwlOe9?=
 =?us-ascii?Q?E28DEDJ2mBCtdhZdstfPCvBBCDCqcxik2HZp/AtyAHeWDrfZ1yHUpZ/iIFQI?=
 =?us-ascii?Q?2wjm2cJofAhkR/scwOfdMAATYIgUJ22lHREssYFGwDYgZQ3KocID2Y/TsZC7?=
 =?us-ascii?Q?mCRudALDenihOyWStW87MSVhdpVCsE6VuTOVXreO5Gb86FFIDE8/3MhM1Z1+?=
 =?us-ascii?Q?ncpXHGYJ2XiEf7qRNniRHm3FxAO+t8D7iutvSsWX+Mq1K+7jPbWvweOG5r37?=
 =?us-ascii?Q?6bsLV9a9FoGkAr0Retdznr9z/XEOWJC++7L55w7K+AShKq2LnayBaGFTM1o1?=
 =?us-ascii?Q?w1mBB70vofFaYPThU5V8svfUQt3SCcjoW275ILYE6sd2VJdSTA5QLGJxvQN9?=
 =?us-ascii?Q?WBF6yN1er0+/v1xqNlMusEJdStRZlBhwKzxKFJ3qqpPWd1C6HbSoy0fTwGHU?=
 =?us-ascii?Q?ekVU165utzYhWSW9IGsfrNA5sz52+HbJikYipV/SmeYlycd2dt/+A3a8j22x?=
 =?us-ascii?Q?LeBTsxBpB2+EjESiBWeTC8AQQwV8FkCPeLyFS1NgvBeZTGq+IuRHL4ECT0WB?=
 =?us-ascii?Q?Eot6etBQ/L/j51DT0I15obNXEsnrzk3/l6nkJeeoo1dxaD0MxayzpQY2G/TR?=
 =?us-ascii?Q?yYQvT6WDLc7mI7/P4TGahk2P3TGAI1NHi0PvGvwam84/sDbNlWBYNQEwvx4Y?=
 =?us-ascii?Q?Gvf8cHaMgyrCHWLVGdTHWYpIIYag4Xpcnuv4dQgdensPK0muE3xKiUjdyjDA?=
 =?us-ascii?Q?YP7/g054ZVoTdGHev2dF0o9xe00PMD9UFYChp4SHSKebuIwV69OYx7M3RWVU?=
 =?us-ascii?Q?mA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: corkillsystems.co.nz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYAPR01MB2863.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953dbc62-332e-44b5-3652-08de37d8fa63
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 10:43:38.6358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 29480a39-0abb-4113-b3de-0e01bec9b1e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFeqVQ5oU49dFO73q5ztSS+734etPZ6sAbWbFkAes/i8V9NYn6GACDwd/hDiQnPjvvQAAAQX974lV03orVMi5ZTxsyURxPcSwYCftaL2sms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB5595

 [PATCH v1 1/1] leds: Unexport of_led_get()

it would seem the removal of this function has removed the only way to sear=
ch led phandles the device tree.

The devm version works functionally different and is not a replacement.

virtual led grouping drivers are unable to match phandles.

is there plans to create a fwnode_led_get() replacment for of_led_get ?

The problem is gpio leds don't have fwnode properties so searching by platf=
orm does not work.

Reguards jonathan



