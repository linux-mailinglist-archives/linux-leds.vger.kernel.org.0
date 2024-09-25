Return-Path: <linux-leds+bounces-2804-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E499855F9
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2024 11:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2470E2850E5
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2024 09:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E183415B0FF;
	Wed, 25 Sep 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b="ePcgV5Wc";
	dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b="ePcgV5Wc";
	dkim=pass (2048-bit key) header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com header.i=@mail-dkim-eu-central-1.prod.hydra.sophos.com header.b="g9yBpcmK"
X-Original-To: linux-leds@vger.kernel.org
Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11012023.outbound.protection.outlook.com [40.107.149.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A213AD26
	for <linux-leds@vger.kernel.org>; Wed, 25 Sep 2024 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727254853; cv=fail; b=ZI6QyHl11o7O8aFttNn51OuR0FOFeSXEdlP4okWGjEnkiewhXdJXEPkwLSJh2kgLCGdeU94s5Xh8K6oUgwcql+eIR0ztOoT4z7Gdu+Dz6Gis+wVJK9TToIJmO2eGdmld1IgnwFo3pwRbvN3EuGeJyukOWpz7w8kpRMkzQRMxbEw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727254853; c=relaxed/simple;
	bh=BpfLIrIx3/mVj9/xfFR8m0ZZOv8jxy40lZ45kJBL9TI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XgU1GHSKWL1DaVdkI8I+ZqD4lmCKcAOA2ZK/1f7LXHDxSsVizgcmnPj80OmbR1nYQGxO7UOEs4XEbU0YLbFzTnt8ZPO3OMrMmGIbe+VVx5npBPftPGd8JWg6PRjYfcaLAW1rb8Tv6fYAvnmoXblxgjS1lVsmSvdEdTM6mcNnU8s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=corscience.com; spf=pass smtp.mailfrom=corscience.com; dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b=ePcgV5Wc; dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b=ePcgV5Wc; dkim=pass (2048-bit key) header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com header.i=@mail-dkim-eu-central-1.prod.hydra.sophos.com header.b=g9yBpcmK; arc=fail smtp.client-ip=40.107.149.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=corscience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corscience.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jC/6VvGrSf1hAOlTbdjiDX9MLg37Sid7swIqr3jXzJeBKsMy4qrOAdzBKfLPFJPJuQUNW5WV0Li286BYimN7S1nBrOxVJrwd2kVraW/JJeQlzHyH59JRXyFwKqycmJOuFnd0n/CEGGITdudCSL9e8oyRxhTeR+QYo9Uqr1beLFTTFXiSGgxhgyt1APRL70t2up4CGV2caQoeXWpbtvSC/iz0rmobWvyTkW0cDBIWIelDijS6Dg6eaQhxca4nP8EdXUtIpfg0NMdCTIYBri/eYuZaKhr3+OxsuXM/+EIlOLXRiwK8oM9aGvNwN7elKekFhFhM1W7Cakf9qgwoh93VrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpfLIrIx3/mVj9/xfFR8m0ZZOv8jxy40lZ45kJBL9TI=;
 b=v6W3RQ7zWSKxCRWCeg7dGLLJy5QyXhV2B7/8GVH+WZ2ZOIflG/yt5mjo+W0XSqmIKHTRQPOoVECx+QSlnxnvFe3VBB8o9h/novFKdN3md7UbOTo1Y8RC9YS0lJg+izLglFtyAHHFYOQTVjSVouXwrqKwa4IzVvmOrbUdOQr60KsxzOUZAkfIQFE3JJcM5WSxtKSuVsHJFOPD6eOcAh/2LLhk1GQUZIBgIFqmUshz4U+Nz7U86Hgg7sA+3lSAMox3QoMG0TbYHXQV5TFwJvnux36OhDawemOWFxcE1PFMzCZ4qi0c8Yik/nWg9cyFBh4YRSDUnmBRfJv7tF7dNloySg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 94.140.18.226) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=corscience.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=corscience.com; dkim=pass (signature was verified)
 header.d=corscience.com; dkim=pass (signature was verified)
 header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=corscience.com]
 dkim=[1,1,header.d=corscience.com] dmarc=[1,1,header.from=corscience.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corscience.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpfLIrIx3/mVj9/xfFR8m0ZZOv8jxy40lZ45kJBL9TI=;
 b=ePcgV5WclF6w1MChmG3V9r1RbD2vGVTP2pMWnXB27rP7fs2II9YxaRXq+QcKIiSYyrVr56Tgq7yJyi7CnN5cbW9ljvGHurboIecbv6qWTQNXdjBaYVIMFRiqYeEMs1BlnsXXOZAv8iS05bi7xsP6zG1h+t4t2hIHtY3PlRQwd89Sl5gLNXg88J9qAKVEH6EmzT0zs87xiHa2yqJvN+D+7WdaCF05+3VTsaP2h9kXBHJQSpqmp5IzvUy0RJMRWccA/B/zkgefliinGXt4KkOb462/+WMfGpgYgC0t+tdwHwnwsjjw3QecaBu0L5vA36glMMKQHNalfaeSm7MsjqNuQw==
Received: from DB7PR03CA0108.eurprd03.prod.outlook.com (2603:10a6:10:72::49)
 by FR5P281MB4661.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 09:00:45 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::a7) by DB7PR03CA0108.outlook.office365.com
 (2603:10a6:10:72::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Wed, 25 Sep 2024 09:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 94.140.18.226)
 smtp.mailfrom=corscience.com; dkim=pass (signature was verified)
 header.d=corscience.com;dkim=pass (signature was verified)
 header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com;dmarc=pass action=none
 header.from=corscience.com;
Received-SPF: Pass (protection.outlook.com: domain of corscience.com
 designates 94.140.18.226 as permitted sender)
 receiver=protection.outlook.com; client-ip=94.140.18.226;
 helo=mfod-euc1.prod.hydra.sophos.com; pr=C
Received: from mfod-euc1.prod.hydra.sophos.com (94.140.18.226) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 09:00:43 +0000
Received: from ip-172-20-0-186.eu-central-1.compute.internal (ip-172-20-0-186.eu-central-1.compute.internal [127.0.0.1])
	by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4XD9gG6kf5z7vxq
	for <linux-leds@vger.kernel.org>; Wed, 25 Sep 2024 09:00:42 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: 0f87358e486141fda794741580cad85f
Received: from FR6P281CU001.outbound.protection.outlook.com
 (mail-germanywestcentralazlp17010002.outbound.protection.outlook.com
 [40.93.78.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4XD9gF4QKCz1xmw; Wed, 25 Sep 2024 09:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWquwM8qxNwlNJIw3Nyt/1x+9C7y+3ANmCI0ZEbNM2dS/TBNge3wZGLJ+5Em27dvhBZxqjxxe+NFah3+FV+rf40/+KwyOJ+ak1QmWKWbEaickDoPYL3xMCaFLFTJZYn3DOmzI5sHDkNT5bUFCh5GLpWiwFY0yQvvaoSw08mhRto+ZGdX2vCWaRVp86msBYWiFPsMK+8rG+aGjNb8jVWwALHfyiYWhJO56QMrVucIKsalVQTJu//ELEXfh4EV3Fcu/ryhpvoN6VapU40q7m7lAtyRFZAA1EKFKy9Ga81gMZRCpaCbP1vaBqQSTeRYSRLWaIIuDgI2QK6xtVMsLyuSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpfLIrIx3/mVj9/xfFR8m0ZZOv8jxy40lZ45kJBL9TI=;
 b=WCKYPKY0ZX1sexNcTJ5sqIniZvoxYcRv3acF4yWrQd0XQWblyjOGZEjraypVNyRo8FOeC0nx9+w3SZsrNurJCpq+Beu7piNQuLRwwg+bbXDxjvoZwisT9AMvzEmexUP+0kyAAa842HgRi/Hj59JqckuaYjp3S9R7N0ZTdGFBC15tpYzP52zre1ALj71VcWVI1wjH0dDNisvQJI5PDVPiKTbQ3RlHF2z6qAv/+7fFgFF8+p2xkrDGiP4NE9ZSFz7DTPw2PYFoZ1gDYL8sBTrobYZfC1mZ4bEXZGRXeYEuLm+v2LUFaUfUha3w1yM0JMik8wck8lM29VUQaRDai8/I9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corscience.com; dmarc=pass action=none
 header.from=corscience.com; dkim=pass header.d=corscience.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corscience.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpfLIrIx3/mVj9/xfFR8m0ZZOv8jxy40lZ45kJBL9TI=;
 b=ePcgV5WclF6w1MChmG3V9r1RbD2vGVTP2pMWnXB27rP7fs2II9YxaRXq+QcKIiSYyrVr56Tgq7yJyi7CnN5cbW9ljvGHurboIecbv6qWTQNXdjBaYVIMFRiqYeEMs1BlnsXXOZAv8iS05bi7xsP6zG1h+t4t2hIHtY3PlRQwd89Sl5gLNXg88J9qAKVEH6EmzT0zs87xiHa2yqJvN+D+7WdaCF05+3VTsaP2h9kXBHJQSpqmp5IzvUy0RJMRWccA/B/zkgefliinGXt4KkOb462/+WMfGpgYgC0t+tdwHwnwsjjw3QecaBu0L5vA36glMMKQHNalfaeSm7MsjqNuQw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727254839; 
 s=v1; d=mail-dkim-eu-central-1.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=BpfLIrIx3/mVj9/xfFR8m0ZZOv8jxy40lZ45kJBL9TI=;
 b=g9yBpcmK6bR3tom5YOfGwBHq0um8s3WuwWs2NnYbIlVrIdYCPx1nmX/VCWi4oVzQ
 ZhCNoC3SYS17J6onnhPCaNWR0qX3lFlPXkkLbpgjAE+hVrTvlBYCHjmEJY/6vB/M64D
 DFr5hzyy9IZUZ35jFdRuJOpwSPMe+KdGbhfu9Nlx1LRl7lQLs6hYQy5UWQgFUXZqTAq
 198TbtMJYkTRj2QjxqYH7VA1kTR+NpaChXdighdLeI9ZIeGLGXJVv/1BXdKh/+KQokP
 FdMAK9e42+MKAoqpN7RYBNg8yzhkGBZtT/hDslAthXt5ewgqehnW41LqJDvQ29o4nwu
 CnTUyHdNEA==
Received: from BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:4d::9) by
 FR5P281MB4386.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:11f::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.27; Wed, 25 Sep 2024 09:00:39 +0000
Received: from BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4f14:70e3:8315:3601]) by BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4f14:70e3:8315:3601%7]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 09:00:39 +0000
From: "Weber, Thomas" <Thomas.Weber@corscience.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
CC: "andrey_utkin@fastmail.com" <andrey_utkin@fastmail.com>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "Weber, Thomas"
 <Thomas.Weber@corscience.com>
Subject: AW: leds-is31fl319x
Thread-Topic: leds-is31fl319x
Thread-Index: AdsLaWOYHdlINgqUQVGCd0sdSFEq2QAC7UKAAO0G4cA=
Date: Wed, 25 Sep 2024 09:00:39 +0000
Message-ID: <BE1P281MB266351627E9771C66A7E4182FA692@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
References: <BE1P281MB266384F3566241E8B6B5D048FA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
 <B5403FA8-33A9-4554-92A0-42E471DA3629@goldelico.com>
In-Reply-To: <B5403FA8-33A9-4554-92A0-42E471DA3629@goldelico.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corscience.com;
x-ms-traffictypediagnostic:
	BE1P281MB2663:EE_|FR5P281MB4386:EE_|DU6PEPF0000A7E3:EE_|FR5P281MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd4199e-b77b-4f94-05a4-08dcdd4089de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?qlGSQRGFBZ9aOI3wpfiRUh8xh9VI7bXwSgzmEUtxzKTDKGC0IL86sEN6WZIh?=
 =?us-ascii?Q?b4GsvGNevVU6qVqn4MNI5UJVhF7aVcG5TKOIBGJU21D8GEFy5cnGLEMo1vE8?=
 =?us-ascii?Q?JEmF8w8gNpFFoTAl+30oeMu2oALpMYnJH6u9ChB5oey4DesE8sKbRQqLQGe1?=
 =?us-ascii?Q?7cUVAUg30JdcAKxKrT8/PRcr3UmiW/AARdt2sqPhj2yDdqWAhelp9PgnXLEV?=
 =?us-ascii?Q?7DsYOLKFI5QxmiqE5FOhct7/B+x7HAm2bM3osWDi8HZGVgeBcRQ560M/NDhZ?=
 =?us-ascii?Q?ADqxehdi2AGxLL3ZHK8kpRPQ0HenWlRdvrWn7oO03kzTtHjRyuyWQ+nM6WvR?=
 =?us-ascii?Q?F2ki/VxSpY/0JxYNCu92MCN5sH00R0BT21XIE+koxYDdAaREHglGqNVBhHVw?=
 =?us-ascii?Q?U1OKz1hdFMue+khI1SyHpPInirGazdVdw4gDpxtIQ7Za6RmXp0MCdpzeCc/a?=
 =?us-ascii?Q?3saY7BE5KPz6FgAE9lj4PJzxAZNfFI4YaookhaY1rQuy1d8ALeGoXkKZjCny?=
 =?us-ascii?Q?x5TqudtjHcChvaBf/PhoPKAhPl24UQ5/GcUJMIXDBgw0EtpiKhwPqAiQwFtD?=
 =?us-ascii?Q?X9AqVvBe8x7VPMLxehAOe6hqBuWgLMbyV2AJSI26keOqZrnoigdq9rO4Pt0f?=
 =?us-ascii?Q?WuHjcAO/P86/zq411b4AUTSUP9EBxSbtHQNQVU8mlsFwO17AGkchY77v2wjg?=
 =?us-ascii?Q?3JVEPYdfcPB30KwRhFPUqRq42Q1k5Eq8lWZIjh3X1nST2ob2noU19vEdTNEL?=
 =?us-ascii?Q?pr01E9U2waBEzS5x/HCKiY/lHkfie9lhI+6Uh6aWXfMSTTKY3nFCLnIJyN2+?=
 =?us-ascii?Q?kT97K/DDJQQW/NCwlB4O147fTW0VSCXm1goWQNumOe5CRmq9K3dwkRrhnACw?=
 =?us-ascii?Q?WVFXquaeWXlNkn5oTFpjHN0gfLMQtjMdpNMAd/RTs/DehBxrW9DZnDLlzNVh?=
 =?us-ascii?Q?sQL6CK13v2rc/CU/SE4vaKmxQoDCK3JED/JE4+M8ZpCtXt8tPtHPzA9lJwq7?=
 =?us-ascii?Q?DcXsl87NqqDq+qP0IRWT6nEQi0v0YJWn1Sq8kR24nH0iRsceJNaiQG3Je4G8?=
 =?us-ascii?Q?3WN+5evlfJzjArQsi7EYbH5huUnyQ7wNHWx3arqjgDm26oGUnlJrOxNQsnct?=
 =?us-ascii?Q?2aYJ6fpNAi8hzNAR6chwppB+afNUxkxLqdbhGt6ieYjtp2Wms0i2Z7qULwos?=
 =?us-ascii?Q?KhARH5PxgF2n9N9qRdin802RoE0kEm6TyGV0C26nTjfX92skLE9PDZ0Kmxe7?=
 =?us-ascii?Q?mT8JvliYHJpztFhwMOz01/7IRjwwdgw14A0fnvJHJWL50Ms9nFCpAS2QVJ/7?=
 =?us-ascii?Q?UKnOpdl98RtM9MWtuYNc3pNlj70TgmS1AxW47vRy7jBw3A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(38070700018);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4386
X-Sophos-Email: [eu-central-1] Antispam-Engine: 6.0.0,
 AntispamData: 2024.9.25.83316
X-LASED-From-ReplyTo-Diff: From:<corscience.com>:0
X-LASED-SpamProbability: 0.083173
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODYTEXTP_SIZE_400_LESS 0.000000, BODY_SIZE_1000_LESS 0.000000,
 BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_200_299 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IMP_FROM_NOTSELF 0.000000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000,
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000,
 NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SMALL_BODY 0.000000, SUSP_DH_NEG 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000, __CT 0.000000,
 __CTE 0.000000, __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF_MULTI 0.000000,
 __IN_REP_TO 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_BOUND_CHARSET 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MSGID_32_64_CAPS 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __REFERENCES 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000,
 __SCAN_D_NEG_HEUR 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_REPLY 0.000000, __SUBJ_SHORT 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_NO_MAILTO 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-Mailflow-Processing-Id: d03b159d80bd406794738f5969ae7c08
X-Sophos-MH-Mail-Info-Key: NFhEOWdHNmtmNXo3dnhxLTE3Mi4yMC4wLjE4Ng==
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed6f5e32-7e18-4c5e-9534-08dcdd408747
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ODNJdnujazVpyoVdEHYbX1obtkISbCZMGg9Al4+9CZU5k2jGQxtyKent28N?=
 =?us-ascii?Q?EDQqBf44a/KVWbrP4hen/X//p7rcwSZKZ58gb7bPj3ks5WJPw+7hDV0kL03w?=
 =?us-ascii?Q?KfWCdLY2042Tb+fkQgTagnQF0r2ximshADWT1JHBfayRzFDzxsSWX+MvTrNZ?=
 =?us-ascii?Q?fY23X9Zpk8dXG486DJwMUyc+YkwBxbiZj7OMA3HWQVXlI5Vj/xlzFasRmgxn?=
 =?us-ascii?Q?kcVgLthHz9B2507tF9zmX+C5VvnE533JvR5T2TyswzBZmG1v+zlw3Z77P17p?=
 =?us-ascii?Q?9Yq6kYts/OkpIIeTCeIBVEQXDqFJ45Fk6A5WQjmAkQRYFjK9YvqGiNhgRLCr?=
 =?us-ascii?Q?UF+Xp3/KsFO7hwXAZmICXa8J9hIaIYc8+J7Qu87HHAxRP09DsE5AzAShL+t2?=
 =?us-ascii?Q?qPH/8PghCaXVpGfI2GA5ibH3LX+ebEZWoaBtO2J2zA7RXsk7It/Fv9AI6A35?=
 =?us-ascii?Q?7StgTQByNLkmP8iM6NlqQxmNZshc64X8uZzN+LB69ut+woBbXUZSFn3hKOu9?=
 =?us-ascii?Q?tbKy9wbdUeGCmWnvbxymfj9uGFBWGqHbNtHGewNIc/Jjta+iO1sLYoFMtq4c?=
 =?us-ascii?Q?DUivksbpWaV6R8Sb6w8hPBtvGow5MT4uevWg6crQlXGwAmSVqItispq/RgjB?=
 =?us-ascii?Q?ATkob9G4KAOra5vxG6STB5fqzZMw1PE0abuLdDkteFO5wVqLVm996KAsP4n8?=
 =?us-ascii?Q?1SrM7EG9QygsNqYXGTUq18LeU4CskTnzuRFTAXWSb5JEaNKISUGdfgYZt8dC?=
 =?us-ascii?Q?zH1aq6gyMhhF90hwcUDfOveeShWWTBk7OdM5V5V0/1i6AB18oNPy/MIpdoJq?=
 =?us-ascii?Q?CKU2UiG8j4t+XTNNM1Ow/ci+cvTtgn3jMd0tTyeUR2bE86i+AOa67eY4BWLD?=
 =?us-ascii?Q?rutmkZR46lC5FNiD1NnUTCQY55mttlckZ8p45JMuQd1vWPbNMn9VTTdmwEM9?=
 =?us-ascii?Q?enumQpDMQMJEXYCq+jF3uHwSJBjyARn4fUHSS+uJLvXEk2ozpbZ1gDLHZliQ?=
 =?us-ascii?Q?nhmT9YMp17sMsKI54wX3/mDU8GDKPA5+Mm0mIau1myZ+QMsSFb97m+SbJWEg?=
 =?us-ascii?Q?qBl4rEmjB+A4muZyKALY5Z+rQTOVpYykHLsDaMVZrtbk7qkqzLauu/dhQtpk?=
 =?us-ascii?Q?wdzxOUWEibKt9OO1KrxziU71A3YPLz9gOA40ZqiHXCdLdiU9gwNeSRF9b/xq?=
 =?us-ascii?Q?E4zaMR2vXfO8wE/c341lGmF/M0o7aLKO/E2/JrRcvv4CrcjAASaidD1xtNij?=
 =?us-ascii?Q?aY0TtkQTmyvMGA0aaLukRvMYJiUlpclZR+J3bsIzvxa7IAkeaEFdCNFTEcWN?=
 =?us-ascii?Q?XR0NLCcsk8AQHjzjwo4CVY3KHekDIS5DWeKXu5jBJPeYPuj3KcztCDPIu2HZ?=
 =?us-ascii?Q?AlrmaVoWWmyvUAk/9y1hLHquum26?=
X-Forefront-Antispam-Report:
	CIP:94.140.18.226;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mfod-euc1.prod.hydra.sophos.com;PTR:mfod-euc1.prod.hydra.sophos.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: corscience.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 09:00:43.9348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd4199e-b77b-4f94-05a4-08dcdd4089de
X-MS-Exchange-CrossTenant-Id: 6fa424d4-13d6-40c4-a9ea-681919dc6b2f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6fa424d4-13d6-40c4-a9ea-681919dc6b2f;Ip=[94.140.18.226];Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4661

Hello Nikolaus,

>These features may not be included (e.g. CONFIG_LEDS_TRIGGER_PATTERN)
>or available in your Linux version.
>
>Hope this helps. BR,
>Nikolaus

The CONFIG_LEDS_TRIGGER_PATTERN was off.

Thanks for your help,
Thomas

