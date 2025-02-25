Return-Path: <linux-leds+bounces-4079-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38740A44F59
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 22:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBAAA16A59C
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 21:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A1E212D8D;
	Tue, 25 Feb 2025 21:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CyJ170Hm"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazolkn19011037.outbound.protection.outlook.com [52.103.38.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D296421171A;
	Tue, 25 Feb 2025 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520709; cv=fail; b=DD2G8qtnQmgOWDb6DeBvLIzo6H0ATyOWjYL9R0Y8Ya16k5hBikeX5tu94z5SlBoKPtLomwCvQsQNQXR3lCzzSTVmu5KATSP5Z85pITtMq/xKgZ6L9sNHbWWEP2HHHhE96691WeuUyG+2WuSKuGKPOiMJ8QIxAUNjL4EngVKhlkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520709; c=relaxed/simple;
	bh=bgtq2M33COXSpYKjr+DHDqCaGiATQph6DR9U3mpGgsk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qhdQBpuhHVnTJgzFdK/DvMyL4gMdZ10J7AzY5e+1bFPHCcvtAKIvbYS4LBu+KvBmVSEVXievxSfH5ByUNXK+/OJZr+2TLJkcmt1LRC5nmqCQZjr/BWzfnmenE+yKgDvTNp3Gmds8+CeAvg+yXqe4+lvKKMNvBcx4r7Sa4bZIhjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CyJ170Hm; arc=fail smtp.client-ip=52.103.38.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kc/pecJc+aMiPPehiNMb7RDYQ3U+bQf3MX+SdxlbhKcRx3udmqSmLInLPo3tCrIk3M+0gtQGvHMyigGq6WX//fhMtI4/n1rte70ga/ABwnHnnrRyjHLYMdCksdJf9qXnPFPWh4ZZDLAQtPTJDsaONtzjlnggQieIT6YNGl10GJw/28kC+N6+HNjlG+OHqlLSrhiMSXQtW91EGKAUTgsobt8F4U2dMXoeqGqCrRIA1n4A7sYn9D4R/Zv7CiA8nl3DdGCanDHFJBOujL/VLyjcApOpHFetsOlx4GtTuuIp1Vau8j1GgznUuF0iQmjU/AtYBPv5Tm4KjtxICj4oFm+iGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTfvrr36cQabz96oejXGzzbQOlchJZhIPAQeFIWXj/U=;
 b=dhYoARfYOxhfx+dD+RNVLKTgfI17jciXIKOJNEVXLvZTKzRU4+BIcyo6Ok7ZQZsZme6yiTF00wSnYeH1MGR32YCBgWizRdAtDVtIbQ+32CHWf3Dyh7s5kLpQvXHAS5coi/R6LJDj0Q/NRbqP12IYC8xLp900hUATQ6ld2hxpvP2pfz6oyFbCRea9mEsPGikgBPjRV/ET8AZbZvGjEz2ANyYRiF56A4ZQu3A4DkcxbA9ygxmC90fi5zjScGN0Q6TuyODIDuMFxJiPHt28l4ED40XvK5sbp1XnL5Y/HxAdxEerz3zjz69bOMmxgYzjvkIn01xjAZETSrP9e4DN5mG16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTfvrr36cQabz96oejXGzzbQOlchJZhIPAQeFIWXj/U=;
 b=CyJ170HmBYLqlPv0REbbc81pDf1e6wmdow20HRwsVOOlfeQG30ssdbdMpZdhLgPu09OeZtry1BKWdeV96B8M/y3Pe3/7kL8Gdjg1o+qY2c6F5V0KrgiCDOZAgLPgyQP6TXL8EJatnuijGWY2p1FxsN8444JuVBaxLCbNPmzCZM+mrzn7nxBizZ6vcZI7kOULtldKWa3HNBolG7RXHwLv/h08U43OocsJPIj4UuqCoz++bHDGRkyLnlJEPt1K8p+eSKaB/P3jEUmennlPjOrLG1LoWNiaaLm+agIUDILUmuMOM0H7VDAqTEkH/lGwWj1yLZsLQGWpdN/u2zdJWMwhGw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LOYP123MB3280.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 21:58:25 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 21:58:25 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] leds-st1202 patches for -rc release of 6.14
Date: Tue, 25 Feb 2025 21:58:09 +0000
Message-ID:
 <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::23) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250225215809.1643576-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LOYP123MB3280:EE_
X-MS-Office365-Filtering-Correlation-Id: 453518a3-f0dd-4174-86d1-08dd55e78740
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|12121999004|15080799006|8060799006|19110799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ogJP35J0KWisMD0NZem4dgD1iEGNAqJ3TUJdpZXkNn2ramXwF3+IAiqtzwWC?=
 =?us-ascii?Q?3YeuySdUNYJ9xeiMwfpEsJbSUOeidUgQxkR3oWZSHb6gyHTH39F7iApDp1+D?=
 =?us-ascii?Q?CxnJLGOQ2KmD675EV+BX1yyx//Sk23Fz9NVb5PbvTzHWhUQWipKirFvAPuI+?=
 =?us-ascii?Q?NQzXjeEB24V3wknK06VrhGMzPnusBq2mnEbXpf4NpgWLBjlXapn8udAiBUDY?=
 =?us-ascii?Q?B/oEo1FoQh5UQn3KbeJM1tZOKmMHIYZKeshiIu88CojCUzXo+wbHRwtSenNm?=
 =?us-ascii?Q?uzhJTmxTOdZn1DkWRdRvMgFTp0Vz9mZvR+7nF11ZyrKSBtz1pdZV2T1AGpZW?=
 =?us-ascii?Q?73K6vU7H8raTEZROUeciAPP6rCNtelFqG7a1eWS6aNHYRkNjisiDixGC6uy4?=
 =?us-ascii?Q?4bvg/XFPqF4OazRSs8IkHplXSAl13mprxNhWgdkd4hP/gbZi8s0N+dB7FGRP?=
 =?us-ascii?Q?h71p0eGDvL1Sa4YCzA6YJWdhtHMZqLuMGeg0UopLcf1UhCurXZvO+WwXGr9M?=
 =?us-ascii?Q?WUlrBkugRhO3aapqyt4C+rAmQ/HOBUhtRBZ3xIQdEWolQ4PQyFGmAyrayCVq?=
 =?us-ascii?Q?CQ4LuzSA4UG7W4JyrsZ1fOTJlAIzwef9aq4QbPCBqLosMnEIhj6pf1G8DSN8?=
 =?us-ascii?Q?gMsQTj4r4VHuKvNlg249u4+d/YkgfksJ2HDKOM3yGYH8BtRmGWLIGFKLBSfj?=
 =?us-ascii?Q?ajXLzNsdgfhZ/oOqnIQaLIwLmvjDUIsPxo3lzH0dJWbcKlBhnNttigDnsNW+?=
 =?us-ascii?Q?XhsT0s5yiOZeYWxdvEHImTz500uoF0nDKbqplwoHkmm+DizYajNNHKmDJXAa?=
 =?us-ascii?Q?5Jp7f5RjcmBEP8bMdcJfwSiCp5Q4ucTDFhQpomXGDMt3y3dJa0HI8e2njFG6?=
 =?us-ascii?Q?zq/ACMCk2nETdPPc5nHIE3Yt9ckOSTokcppMWuoA/FJ2nihU0QIzJ7A+m4Zf?=
 =?us-ascii?Q?L5Q5ewpLjHWrvdmqRtBAQiWzLxcdWOBIZosm2TK3FC1ogKssGY2IBKvg5PUZ?=
 =?us-ascii?Q?8h0hcvKMbwB/Q8UFQFkcQGBqkEBX99KyKVpFOGg891529bU2+M2fUDPs9HB+?=
 =?us-ascii?Q?8jA1gqKnxQgMhoak2LjV6ueq2i52/bjlgaa15RKs/UGDMS5pHKw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eQXHTGSZQinoMPkQWTvnwE/kwwv5ukHiKmZGv2K7Hn29RtBxw/z2xS05C2vr?=
 =?us-ascii?Q?9cxSuKLYftLLFHVQX/ncJqyoUog7HYLeFkrG4t86foOLIOlaH7Qx5U2CkvSA?=
 =?us-ascii?Q?i9z2YOWA3FPzumbwx9yYKl269Hm8hyqLT/9peHxvjKP3zjz2Ga5ELBjG/UxY?=
 =?us-ascii?Q?wQ264K54SsEkV8/3JXdT2uW1ELiCIXKCbodpE0eys7EmuLAHql9XCgtoxox1?=
 =?us-ascii?Q?eUm3/1cUzRda4lXgbbp8NLCnP0F7+i6NwHhiLU9k64r4pyuFdtGtUrwi7p/M?=
 =?us-ascii?Q?wJnNcg43XugXkfFbTFpOBte7Xzt5OOkD+0L7Z8GeAaFrb+tE354c6qTVdO8w?=
 =?us-ascii?Q?NZdaokRqaCWF+wEFED6OdlpSfZycJbQMO81gWAOg9ayrOTOtYshR/NPrZ0N+?=
 =?us-ascii?Q?hZJSzYZU3Nc3dPe/6lA3D+Pdulj1OCXLMm+hWgzK9d8/6jThGR3frU75XrNO?=
 =?us-ascii?Q?JYGn3PxUE8Unm2hkVUc4oV3r3Don0dSdmIIhg6l2k7UtZBbVL1W/wxIUXsZL?=
 =?us-ascii?Q?r/mCuJ1cw/hDitl3UkFTNF761/QKM6/hTbVxs1eFzNU4+pH4zoPn+/H69Fj0?=
 =?us-ascii?Q?4IaOCMdwrrJbWx3ul9ogsRbyF9/O98lVh8DryyEOgHBCpDZhgAsGbqYe8+Iv?=
 =?us-ascii?Q?fc6YAOgAVIuo5Zg72HCeVy3O9hQf3pbVzCcHCSPEGr+uyumdqgqsC9tF0xD4?=
 =?us-ascii?Q?96Aw+MWnVGwDsOA+/yI3uKFQJDHUjJ80hBJqVyu6No2p3gq5I9w+qPTkO6yV?=
 =?us-ascii?Q?/8xgrgy6SAOLJ8HyOE5DaPdrlYlYzp4in1kR9acUnc7tIichTzraZ432evgq?=
 =?us-ascii?Q?bp9gu+VwZrAuJX+xzxhOrbuc6SENC1PzFpwppujkmQm44GOFck+wcRjVJa9G?=
 =?us-ascii?Q?7wugZr7o2c87XWK8TyYhAx/EEEMuuPf0cVM3PhlRo6RrABFMCwjnMVKb9FbZ?=
 =?us-ascii?Q?Yvz/7FheufphvwdZCzeOsJHGsPvs9GefMu9LYjXx+Kn4WreV9FDj+WBhd+m0?=
 =?us-ascii?Q?vawu8iA+INYWEiWf6OLq0PSf65kIUqVzS33YPum6qPv7HVX+W1VrND/GBdfA?=
 =?us-ascii?Q?Vr6zg898KBx1OFST74v5AnvdHC27p6ZjfIjcnyOL2XiLeIAW6BCDBWmiE+sC?=
 =?us-ascii?Q?YKB/lLIDy/cidncNPjwMWaB4Pp/ba45Zt8dN8FcYYq4R4PE4f+5b0VmdApN2?=
 =?us-ascii?Q?kOOxRLv3ZPm5piypHEv6wyGXGqtaYuiV9eEU+vQmUZE2JF5o6RZH6IimlbHj?=
 =?us-ascii?Q?HLAn55NsKfubddC5fS6RI8yBou2kHjUrudNj8aedqg9uiOGkEqXFq3KY1JFo?=
 =?us-ascii?Q?kUU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453518a3-f0dd-4174-86d1-08dd55e78740
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:58:25.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3280

Following the feedback received on the set of patches for leds-st1202 that
I sent previously, I am sending separately for your consideration those
that I would like to propose for an upcoming -rc release of 6.14.

Since leds-st1202 was added on 6.14-rc1, this would avoid having to send
[PATCH 1/2] to -stable after 6.14 is released.

[PATCH 1/2] leds: leds-st1202: fix NULL pointer access on race condition

leds-st1202 calls devm_led_classdev_register_ext early in its 
initialization, even before it has filled the led_classdev struct.
Afterwards, it initializes the hardware that, additional to its normal
operations, requires a delay for it to initialize itself. Finally,
the probe function activates the channels on the devicetree, and clears
any existing pattern. 

The issue is that, with such delay between the LEDs being available on
user space after calling devm_led_classdev_register_ext and the internal
data structures being set up, there is a time in which accessing them
causes a NULL pointer access.

This predominantly manifests on systems in which leds-st1202 is loaded as
a module during the boot up process, while other processes are also
starting and interact with the LEDs while doing so. For example, routers.

While the window in which the NULL pointer access can occur is small and
some other circumstances have to concur, it is preventable with not
compromises observed.

Looking at a number of other LED drivers in the linux kernel, it is
seemingly commonplace to call devm_led_classdev_register_ext at the end of
probing which makes sense as all drivers should try to avoid a situation
similar to the one described.

If the patch is not applied, downstream projects using leds-st1202 will
need to take this issue into account if they want to avoid the possibility
of it happening, or apply the patch themselves. However, the drive will
work just the same if left alone just enough time to complete its
initialization.

[PATCH 2/2] Documentation: leds: remove .rst extension for leds-st1202 on
index

The only driver listed with the .rst extension on 
Documentation/leds/index.rst is leds-st1202. Moreover, I haven't been able
to find other entries with the extension on other index.rst files.

While this is more of a cosmetic issue, once it has been spotted I believe
it would be better to fix it before the driver is included on a final
release for the first time.

In practical terms, not applying the patch now won't have any impact so it
could be deferred as well.

Manuel Fombuena (2):
  leds: leds-st1202: fix NULL pointer access on race condition
  Documentation: leds: remove .rst extension for leds-st1202 on index

 Documentation/leds/index.rst |  2 +-
 drivers/leds/leds-st1202.c   | 21 ++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.48.1


