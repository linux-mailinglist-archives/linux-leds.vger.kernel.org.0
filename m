Return-Path: <linux-leds+bounces-4618-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7EFAB3583
	for <lists+linux-leds@lfdr.de>; Mon, 12 May 2025 13:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47738642AC
	for <lists+linux-leds@lfdr.de>; Mon, 12 May 2025 10:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A04826868E;
	Mon, 12 May 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="IqP2gIck"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013045.outbound.protection.outlook.com [52.101.67.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF5267F70;
	Mon, 12 May 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047563; cv=fail; b=TQozWwtcHuFG6rtE2zODAp7ehR3D5UWgtZyqeKtM/LvndqMGw7h793+toypN/Z9LJb18MHqkndFcG5C6CozGPBytwNhsTOgYotXSoWspe/zWUXjv8jWtw2qrqk6igWDGRA8L0kAxk/VW84RBCF4qW1ZGJk57aitmOwtR3KxfHPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047563; c=relaxed/simple;
	bh=X8qIleXhBQ1KUgr1XacQeAPjdSL7YNukie7yCob3W2Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GjkXqXFZPs13653MSPkKMsPJw6vfGTvuy4G4ltpn+JGsCRY0taYhrkB5UwVZFzvWW76a5CwDgyvtK4ZX+wuFLI30mg8RzFKOb6zIvz2pJzyUGM8o+wlcx8ufdM5oI8W7XLH9++STHVH0zlUTxK0wwBe/cWmJ4FxoN6gPp2osUbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=IqP2gIck; arc=fail smtp.client-ip=52.101.67.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3ck79/+k9M9Ezp9uQNR0vLsmT3QYo+cDDCLeDs8Z3I0hj8EvmSfgXIq19HLci99tMM18z6eonlbQgqAgrG7MRiaAO3ShphRVRf9tV+8IWiBtMaNpYD5icraaW86a/v/HD4HjTmCMU3kf3ocrurjeSGJDNCcDQ/guIkb14MERsQ2XlEtaXn8oZ5tVn9HO8o+LCJsxo1JNNJoIRxNwgI8WF6F43qQF1wXsI+wlqTVApc64Yjej3Y2a9MhU7A+Wjp+a7jTWBjEeRzd0uxsLZyPoSZeoz7UMkNgrIVh/snZHKp0USJgZOEpZ2eIFhlwermSUmvyorl/oA3Wrt0MfztzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8qIleXhBQ1KUgr1XacQeAPjdSL7YNukie7yCob3W2Q=;
 b=pQ/E4AxykCqknZw3oSlvAWpCHOmjL4niLfKkfKysFkRe5yWrvhLtHI648uBW1XArH8DDz2Qb/x2dgiLOQOV3Hx9VgmNLehW7w7XVs757GjSq0e75eO/PPg/usanlSOBbdfOCBwvfDwEf+sNz2ksFO6mW5oCdxiyCa90lsWHRx9T5txg3QN7A7Hj+JtFAUzkfLeNzQneX6MFB4S/O72OBEUgCK6vPSppxGx44w9q4q3aVTXOcp7hr/UWJp/40OR7KZ2Azwt2mjqAmvUi1KIOxrhdP19KfKMjQD5TrUkdMHZ7VTT2d7a+2EIijs987B4d6ONBnNOaozUM7fmXlzB+CkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8qIleXhBQ1KUgr1XacQeAPjdSL7YNukie7yCob3W2Q=;
 b=IqP2gIckBnzbRywh9HIY7uiGHU/iiggZiETBbGy1ldUfhU/GFqtfaM5gDN8x/YK1FUS3eENr/7m2lsIp+Uqe6pBn49TECrcv+xsKJne8BwliBOjGny0X4naxg6oKBdr/ayf56gFowxEL02TJrgNKEGDS07H/hmNb1Vy3mVqBriw=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by AS8PR02MB8709.eurprd02.prod.outlook.com (2603:10a6:20b:572::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Mon, 12 May
 2025 10:59:17 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:59:17 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel
	<Kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Topic: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Index: AQHbvnMzuEeJRwGRtkiTeZxACDeeErPMBIqAgAKi8eM=
Date: Mon, 12 May 2025 10:59:17 +0000
Message-ID:
 <PAWPR02MB92814A311B18A6FD8A448D249B97A@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
In-Reply-To: <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|AS8PR02MB8709:EE_
x-ms-office365-filtering-correlation-id: 5b50a17e-7450-4eb7-09e4-08dd91440a8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GInERrqtGJF8WrkRvS2F05YvN0sLT3lc73ybliH+/m+kUKjVJ8XnUrup5G?=
 =?iso-8859-1?Q?nH0BQr7our/lduyffTZbZ4Ei7bgcxZARob3b46eXre9LtlQ6vvAtLsnIsa?=
 =?iso-8859-1?Q?BrfmvUo2cxJrgQDw+rYb+PVQh76RXEGxkLM+VQRJ41du7TopKfISq8RMkO?=
 =?iso-8859-1?Q?e+z7/33cHYCLQeJzPzAxw69SaXl3ScP1sLWuSHHy0PSvRxZRstRorfMN5s?=
 =?iso-8859-1?Q?SWGeV+lhCQBouKJ0gO7w5I/Tt3yfszLPHkMI9lLafRin53cXYQ3oX9yVUP?=
 =?iso-8859-1?Q?ox4H1pLfgIMXVGbJJ1ZAJYyLi0zU4auK7qE7quO0eoFlkKSCaKwZpNPbva?=
 =?iso-8859-1?Q?iKXgIU/R+62mE8bWF25QBs4ZrjBXH3XKnOcE3eq3G63+/Rb6g7e4muIHAv?=
 =?iso-8859-1?Q?1xsQNAqujlI40J6Oc56RsvwRqnebFT+s127nJioCcFM3I/fq9bKQLL6GMw?=
 =?iso-8859-1?Q?pfLMsCh03cSMjMHh6cCMs3cLbIE++yghLu3xAmHrF4AqRaAcg2hk1PhhmP?=
 =?iso-8859-1?Q?s8aiBVjDQ6QhrqnTT2pVKHhzVz0HeFT5qNmef+NUq+fyG77ruWMKvnUUK+?=
 =?iso-8859-1?Q?T9oIZ3MtO0uzH11ntiK+YdrMaF3cvcgNIlDc2sWXCRoxC9rAGk6Nzx9c/n?=
 =?iso-8859-1?Q?ptlbvia2NnIobnbmTfU2hcMJHIrCvIJVMSDU2hkaZU4hO1770LI4L52g5F?=
 =?iso-8859-1?Q?LcPMfPYFvJucxxilgLahFlPlHqPO5FvtBPzYuJuZ5F0BHR6Sq6fxVWrBJW?=
 =?iso-8859-1?Q?IRodEGL2BhY4hG94WoWgC7kw9joJNofxw2s+YYpyOca48bvHx9/7EX0wr3?=
 =?iso-8859-1?Q?ahm14PTnkLKTmWfD245rEMM4Y8iSr7CH3227e4ebSx+6TO5dAY3mTIvO8D?=
 =?iso-8859-1?Q?6UGA/WqL542Psy+UQQpvGtTLtvxhITjXnmVtYos0lEx9i2AcnefINqh+Pr?=
 =?iso-8859-1?Q?eOcsydDoZ3rOcE4quKTh50fpaeHEUzCvhTL+u9TzAJ3Xa2lJ1t7CBvIrz5?=
 =?iso-8859-1?Q?LE5hVk9C273+oX+37lVCPlKiurcHiHGSJDU8gyUhMGwilp3DIlKvbw7l9L?=
 =?iso-8859-1?Q?GLKv9Fj7HYucEis/GMcFK7O+dOcFNWn4gGu36rEose+Gu96nBvfcMioJLf?=
 =?iso-8859-1?Q?CipK2eFvTPWirw3+Qby7x4BMQ/bCBO7q0Omk4Cbi49F+UOL6kz/VjXoO0d?=
 =?iso-8859-1?Q?9XzTWv2xkfCwSdwTFxxkEluSFCII42Infi2FMcIWIUkiBYbjEuuzT8NPx0?=
 =?iso-8859-1?Q?BmzKPmQ08uuUWh3PkLbZmMyYsO/L9hllLMztdRF4vYQKXlSSgpEX161ykc?=
 =?iso-8859-1?Q?H0HVUErMJloRf9udfCzz7iBGMsKhwB7uzFE6lvUKRgo1HbN1rhdKVzkzG2?=
 =?iso-8859-1?Q?S01rqDDDYGzdIAxZoDRI8vPHtbbRUNhX+XgHKZNZx2uiM/lWJDHDCiJuvJ?=
 =?iso-8859-1?Q?rvY2WQIobHuHCiATk+0+2tgnC35sQ2wYNbcyFOptJSEMHfzEbgoQQlSvCF?=
 =?iso-8859-1?Q?pDaSuDTov1ig3BRi/NoaGPVSgkArmW1CCn8ptZIhGReXmcVzadiFqJXkpZ?=
 =?iso-8859-1?Q?zk0898s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR02MB9281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?93lHDav8tqtPgAQL9a6ZkM+ItkmVc5vcyq8WazB1Gg+XEwz9Im12x1miIL?=
 =?iso-8859-1?Q?/Csi4jcdKK+4DDZW3LnnzsFo64cClrjqPW+U4iH7XQc8BU98CzZQv5rg8T?=
 =?iso-8859-1?Q?+ImlQH1hAyXfuc/nEvUR6pYPb/mg9w+SDuCBNHLkjI7TAdSitJgESCTXeF?=
 =?iso-8859-1?Q?smEfnLTLETsMbIrYY2KrrlZ2W/eP/7nuV8nGSc+6rqulTjmEy6KnkNxfPu?=
 =?iso-8859-1?Q?cN0WF5L2mfKSHnU3ow7IuzE1ysVIKw5kB+f1brfVaQ9RZedZ6eHK7aUNNk?=
 =?iso-8859-1?Q?s52A4I5oo4vT+XLawP0dqZ13xbpC3aB5UkkyPbIHgzAZqYoB5Vjgwl2F7o?=
 =?iso-8859-1?Q?fElfDglCe3Z0U071MDQ5uk3EUkvYp0NtfeUtfqWdRrdrg7qTKGBtSQyI+8?=
 =?iso-8859-1?Q?XPQXdqQ24oaD3UksozKN4XCS9jN8V0WRUzlL7/Eap54rZGMCFi6n6xx+9X?=
 =?iso-8859-1?Q?Ou70TARhY9Sh/cdnNv4f9MGOftzzbatB/8BM6RU5RQggrTRVJ8yOhY6myv?=
 =?iso-8859-1?Q?baTmbevaU+0cwRPuep7uFFurhVeo/E+LXky9zbZ3PEeLJV0efeQ5JGn7CO?=
 =?iso-8859-1?Q?jp60DAKIVoB2AZ7hBcbHJ93MmxvuD4FRwgTb4YOPkW5Ai8yHOyEsodwdx7?=
 =?iso-8859-1?Q?6v8smMIXuUNhew3+i8Tr6A4NgT3PfLL9EuM6OnDawxJuvhjMHfZ4JsDEBU?=
 =?iso-8859-1?Q?egd55Hau5ZOYerHh5j2Cr8CiEYcCz3xiOJ6Z7Wx9h1Y9Q3NoSt1RReve3K?=
 =?iso-8859-1?Q?9wqaM4MjD1lS2EQBxCTfTuxuUxHYRsdYbNsQC8oBzQYNlu+MDRqJ7hdOm+?=
 =?iso-8859-1?Q?S28JfmqpkPWP19W6z2zFzynV+2YD/p10KL37gy1ejtvP0WgCpe7topoDxK?=
 =?iso-8859-1?Q?D81BpDeuyktODq9gKrqvAk8L73whjecCDMqsnG86MPFq3TfUsyJnae3/tT?=
 =?iso-8859-1?Q?e9Nz4Fn5SmrXOCYo20KhUP11l2bTHSRkCpKt26Vya3onmRe2uNshhHMM7E?=
 =?iso-8859-1?Q?U6OaXB/0f1oJs2cPIR0XxTFatcDhG4l/w4jEEBUi+xN1MyUIk6jpnwHa3d?=
 =?iso-8859-1?Q?jLhZTK47HVNxjjDROCCYSxL77zdb33AuM5PppRTWXHsNXFQGomS7Kra11G?=
 =?iso-8859-1?Q?CJv5bw2BjR2txZ8Ihiry3F2uldGAFZ4P0HUZRvFD5IOw8E2IicE10a/5hU?=
 =?iso-8859-1?Q?PPc4hx8SJG7/BJ9P4VrSjcQRoMEVYWelOs6n32du0FVx8P7BW2lGzvamzA?=
 =?iso-8859-1?Q?JIJHgcb5U5VCbuqWVtBdV0NYNx8+OGPjEo7v1S6WHRibS+Uyvw+g6Obn8K?=
 =?iso-8859-1?Q?5gNkn+fYHyMkFFnpSaduOVt9zVyeAA8pTz/cy7yAc1n5rM+uu3bR0GBTi8?=
 =?iso-8859-1?Q?10NRGVEEGL76IvZZlKX9iUNFiYYTU+AHZv8irPgS9n07gZVRcvfgb2Uu8T?=
 =?iso-8859-1?Q?BedKOD+qXPRMtkwdQ7su0FcGXaQFnOnPabgCfIjdha3fzc55lLOrkSStDH?=
 =?iso-8859-1?Q?NblJCMpKa3Qusdu3QDmA+2VDrrQMbf1mid3yKwtHWuSev/ZywKO4GC0GTT?=
 =?iso-8859-1?Q?ytky1xvwBQDeOLZEFYNh06PxrwfoXPihlqcv7a0eF4NG+Cu/DjsfEx14TY?=
 =?iso-8859-1?Q?OBe3yDQLD5ORI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b50a17e-7450-4eb7-09e4-08dd91440a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 10:59:17.7251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDdzkV81uud1ZnLnZB/IlzcqqkIuXOL7uNmMgCU5QgAmsY402U1MYqHNiOrB63SX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8709

=0A=
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
Sent: Saturday, May 10, 2025 17:32=0A=
To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi=
_index=0A=
=0A=
>Hi Johan,=0A=
>=0A=
>On 5/6/25 12:39, Johan Adolfsson wrote:=0A=
>> mc_subled used for multi_index needs well defined array indexes,=0A=
>> to guarantee the desired result, optionally use reg for that.=0A=
>>=0A=
>> If devicetree child nodes is processed in random or reverse order=0A=
>> you may end up with multi_index "blue green red" instead of the expected=
=0A=
>> "red green blue".=0A=
>> If user space apps uses multi_index to deduce how to control the leds=0A=
>> they would most likely be broken without this patch if devicetree=0A=
>> processing is reversed (which it appears to be).=0A=
>=0A=
>Are you trying to solve some real problem that occurred to you?=0A=
=0A=
Yes! Since the subled is indexed by the processing order, it gets reversed =
if devicetree processing is reversed=0A=
(which I understand is a "feature"), so instead of "red green blue" I would=
 get "blue green red" in the multi_index file without this patch.=0A=
The mapping to the hardware does not match that, so writing "255 0 0" to mu=
lti_intensity will give me red and not blue.=0A=
=0A=
>The order of DT nodes parsing is not a problem here - we save=0A=
>color index in subled_info to be able to figure out which color=0A=
>is on which position. This information can be retrieved in sysfs=0A=
>by reading multi_index file.=0A=
=0A=
Maybe the bug is somewhere else in the leds-lp50xx if that is supposed to w=
ork,=0A=
but I still think it's a good thing to be able to get the expected order in=
 the multi_index file.=0A=
=0A=
>=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
Best regards=0A=
/Johan=

