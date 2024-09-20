Return-Path: <linux-leds+bounces-2781-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE997D710
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 16:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7FB61F2510D
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 14:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4238F17BEB3;
	Fri, 20 Sep 2024 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b="R1yx/hBh";
	dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b="R1yx/hBh";
	dkim=pass (2048-bit key) header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com header.i=@mail-dkim-eu-central-1.prod.hydra.sophos.com header.b="l6+kRIBH"
X-Original-To: linux-leds@vger.kernel.org
Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010035.outbound.protection.outlook.com [52.101.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F014D6E9
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.35
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726843716; cv=fail; b=dCS6F93kKwRfdjtK/TNQA0+xihv24IKqmdGMadw/aCtjTdiRnioWmv0L1qbc1ja+Il6rEJB3HDznHgAAbFi/v0anyXVW/nPgZOcTYkesJfVuz6NmTLIfLWtacHGhSV9iD+2QhYitqWJYulKUPiXvsDQ4jY9LEJmC5QD3ohYetyg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726843716; c=relaxed/simple;
	bh=tI70uPC83E6ws6WZKxo3tExv30jml3c21icmnPaUAgo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D/uORVm/ybhEGE2HEJF61HTzoC7Q6lbniTLcb6Bfxpoz2RAsageUCnGHi/hBT8rFTJZGV9LCvsz3ZEKzhQ+klxRcdORODHN4qqETIkpCcfp4/CxFSY5Bp0M5Yxm6okzwNORvm1lrpSWziPyDf57TFFWJCPtlB39YAY+Xvin+Wjc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=corscience.com; spf=pass smtp.mailfrom=corscience.com; dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b=R1yx/hBh; dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b=R1yx/hBh; dkim=pass (2048-bit key) header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com header.i=@mail-dkim-eu-central-1.prod.hydra.sophos.com header.b=l6+kRIBH; arc=fail smtp.client-ip=52.101.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=corscience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corscience.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AQL26Qq/91671HNaDWAoMIXjJnTFi4ugQy0m6W/iScyPdvXNCi3pJH2HPJ9VTcgF7oPjhuX1NSknjJQP0elgITYDhdy+joog90Zw05L8iFxrBfhry2IOE7nRf8Yx6ZTdY1RvurDoOMbnRlOSRqeENYllEB0wzs9Yl8YZOIm4M4DwAN1wiu6m9pio/lHYrDl/UdynoifV4HnMELiWSXGSWoWj5NIQenDBbQ3iXkBICB/XCdZoHZdPoQ07W3QQ6e/GP/gG8su0P5NOBVGGrGgBb5ITAz1uvFRX4j/HIrs6qXhOcaWVn4OA83XSnMS3KYselTk3HLOnj4hDs4pBeP1LFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqOysm8vLyDnWcSAHHNjxW5lpmkU3940a65buwoEjs0=;
 b=wNyoc+dugZjboo6idLXZP9UOqBP/ZlkqEVOTzogPEYU+uts0XPhMnFhKH4HxzxwQ3+LtetOpMHE2aOdYiVK6dqnBAvacHqoIucgNxWn+jr643GNXe8b7+i+dk5ZT5DD7mhdtDnNFJ/qLY8A2F/J8Qyfr7Xj+NlYzi/e0Uw1TpBx7YaPcqg82fEIkZKW8j8g0fp0RarbtA8mOwPlcb2dMdg8jjwmOA4PuU90UbYFJjIp0rEg7J+2xa2WPUstxLdgYFDQE68/LxRCCLY6Fb7ZQHITRVH+1c1YkPFvfo3HXVcuwpqjwhfZtbZ81LGFvgOxZgCQjTaY47W4XlhGAk9v22A==
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
 bh=vqOysm8vLyDnWcSAHHNjxW5lpmkU3940a65buwoEjs0=;
 b=R1yx/hBhN5L2JQvIFLuCUyb5RF0IUhwCM8j2M+jwyjJ8ZSdUM6+rEW4ID2JJqpPs/jztDGNMUpS5bm4+svPQix5GhbAY3ciR/Rb3CRs5xx3f4FGH4IDikAeHlev+1+EjuNoz2drkqBCm64gB06li1Pn5ztFDg/trYyoVEJ2NoXN9ZCIsiXHbrFoCU/vqRnr4ihaNIWInQsxsdoVVLNQltB+dONtQSrA8XSOVAaVGQHlK+V9YfxvjdjLRI7e38+Gkb2lUME0CKHW5Nefux3hn+cpvhiVhS92OWzy5oQNRi5VYoFzu4+UuVJ3Boe9iofGNMSxCzJ2O7w0gUtzmemtEbg==
Received: from AM9P193CA0017.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::22)
 by BE2P281MB4591.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 14:48:26 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::9c) by AM9P193CA0017.outlook.office365.com
 (2603:10a6:20b:21e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Fri, 20 Sep 2024 14:48:26 +0000
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
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 14:48:25 +0000
Received: from ip-172-20-0-186.eu-central-1.compute.internal (ip-172-20-0-186.eu-central-1.compute.internal [127.0.0.1])
	by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4X9Fcn39SDz7vvc
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 14:48:25 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: bb5f00203f874b398ce8b444d11ef540
Received: from FR6P281CU001.outbound.protection.outlook.com
 (mail-germanywestcentralazlp17010005.outbound.protection.outlook.com
 [40.93.78.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4X9Fcm0XGvzlVjQ; Fri, 20 Sep 2024 14:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkuW73Z04ZYi0l2tAY7Lrvsn7L0NLvCfIAmV8A3+YkaoNS87ODurlTsi9RNR76rxV5zY2hlweFOWol/uxTuG3zNZTpZtSQLx5JMteM8a5XAHdqJC/K41eJ1zDEpg7gKEhIhJJdGOHTvK7INfwIZo1UhdtVcK9n8i84XMJXpwDI0GQggaGOHZXI0WChtUyVN7USvvGxxckbSEhSVM8UKtZiZxIN/r4wzri+e91Ipi5nyS9Jdihjx4xLgPn0Vrhf3EuHxcI/ZPeyZNpSx8LB5eFvjapiR+1xVuXv4S3z/hg65wzga24FltUc+cpLyFTcT5Zdqh/cHLzJz8rym99DzBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqOysm8vLyDnWcSAHHNjxW5lpmkU3940a65buwoEjs0=;
 b=MmxpTHoWRXTIBYErSSqFuLyPIPpnvyEl1GUzCNrW0LHcisojSyc1bET1CqyHhaPm6xbC9XRLYqEOaEFZ+mZUBTj3f8krl0ZDx/eJZLfL+OdJKLMvftXbnIznvI9VBNAfQywGxKDbAficI8R1iSgHUkTnk8MIG6171ZDeZAXPZdyTz71BmqCuUNxT5F9Jbr1vQVd+oixght3h38rsd5vj2gvERpNQmm1hq1+6gvviA4YEAJCRsWLpVeN6VOdo/5JGU1ymyDGEvq+n8fdu91l7PIVRnB1Zi3ePy1EApbbCv8dhnjV3Mevqqg/2ZRx+C8ZIHTem8pLvLrwHnSDhepK3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corscience.com; dmarc=pass action=none
 header.from=corscience.com; dkim=pass header.d=corscience.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corscience.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqOysm8vLyDnWcSAHHNjxW5lpmkU3940a65buwoEjs0=;
 b=R1yx/hBhN5L2JQvIFLuCUyb5RF0IUhwCM8j2M+jwyjJ8ZSdUM6+rEW4ID2JJqpPs/jztDGNMUpS5bm4+svPQix5GhbAY3ciR/Rb3CRs5xx3f4FGH4IDikAeHlev+1+EjuNoz2drkqBCm64gB06li1Pn5ztFDg/trYyoVEJ2NoXN9ZCIsiXHbrFoCU/vqRnr4ihaNIWInQsxsdoVVLNQltB+dONtQSrA8XSOVAaVGQHlK+V9YfxvjdjLRI7e38+Gkb2lUME0CKHW5Nefux3hn+cpvhiVhS92OWzy5oQNRi5VYoFzu4+UuVJ3Boe9iofGNMSxCzJ2O7w0gUtzmemtEbg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726843691; 
 s=v1; d=mail-dkim-eu-central-1.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=vqOysm8vLyDnWcSAHHNjxW5lpmkU3940a65buwoEjs0=;
 b=l6+kRIBHzErW1sO5xY0dZyxYIrqa9gM2uLS3LgI6p8B8dGdxejrFZSl8BfjoeD2s
 Uy4ueCFfNpdVq6hKTSl3kcJWZF7R32f2ws/7WD1bhq4smjSvba4ZAMQrurAh/QnWCgi
 gXJIvUb+GhkVUKmqWUO+un/YDyOdbc+1RlfS7RyS/EZqrUOoiVxPfPk/YFHoCXKBRMr
 z9w7vZRVBSvohpPPyDtJk83Xc+IVrjfELhC/czE6C8pzT7RmwCNJorkb0234Qbgi8++
 shw+opMxMDshrpL4PIaCYryla8j+d9tU01ZGnQ+kdHKMSpbLCk5Yr92CITXXPCNfu5v
 Ko+tAphFFA==
Received: from BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:4d::9) by
 FR3P281MB2542.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:5e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.22; Fri, 20 Sep 2024 14:48:14 +0000
Received: from BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4f14:70e3:8315:3601]) by BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4f14:70e3:8315:3601%7]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 14:48:11 +0000
From: "Weber, Thomas" <Thomas.Weber@corscience.com>
To: "hns@goldelico.com" <hns@goldelico.com>, "andrey_utkin@fastmail.com"
 <andrey_utkin@fastmail.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "Weber, Thomas"
 <Thomas.Weber@corscience.com>
Subject: leds-is31fl319x
Thread-Topic: leds-is31fl319x
Thread-Index: AdsLaWOYHdlINgqUQVGCd0sdSFEq2Q==
Date: Fri, 20 Sep 2024 14:48:11 +0000
Message-ID: <BE1P281MB266384F3566241E8B6B5D048FA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corscience.com;
x-ms-traffictypediagnostic:
	BE1P281MB2663:EE_|FR3P281MB2542:EE_|AM4PEPF00027A60:EE_|BE2P281MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e7a785-b0d7-4a1a-ed90-08dcd983485c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8HQIGk+ZZeuaJC6pbsM9Vo1m+BxmO8Hh2WtbYyuBTqVG6le7Di86dx/8x74O?=
 =?us-ascii?Q?xcxEoqHl/M1V38bUXvjZvESjltjLaPBs4GBTsYoC2sZCK8qw8JllOhe/Txc2?=
 =?us-ascii?Q?uWB5aRD9So8GQ0UOnocWvuJw6omQiDOh85NAmYW5Yj4VDcg0NpRd0TThRp8l?=
 =?us-ascii?Q?wooGE6FAJZR9Efglf0sosk9+v4q9L3+cGmLRVYYpKhijtgGS/lR/QwRG3y2A?=
 =?us-ascii?Q?mwVjUi5p3mkAOYQnFcYX3rNOoQTYIvIeWL20+vMJkWLNbOoRUaNDDYM7CufN?=
 =?us-ascii?Q?Wz3d+ZNnM6yTb/9fssIGiiNXDYUvk9RN7cJpt/IoJNWxaC+hGn+zT7bFVF/k?=
 =?us-ascii?Q?GIz0de/+mJcVyMm/zu/rX2IHI1Cd0CsURcYsrVz5RMuzFz18F3pvw5TY5ubF?=
 =?us-ascii?Q?EGTSpImAncnBcLS5zBbpY6wKF3EHi3jjWUlUdAZ+bUoMyk6ONYJeWI2kJhOx?=
 =?us-ascii?Q?i7H5zKLq97U1S7Hv0QrN1pEx8yD/fZsgFozeHkPey8EujU7QcFP3jrQ6aGtG?=
 =?us-ascii?Q?9mxl81qu3Wo2HQQCViVEKXBZP7vToGc7THof7AZAdGsSXFYie+sLDkiJJjIy?=
 =?us-ascii?Q?txwTYINeiB3BeF5e62RPjqGUvtafmhTTOkTcboII0nC4z0Sdfc+k4LQ8M1Nv?=
 =?us-ascii?Q?+XryRv1vHl8bfmTAjSBBn/VS9wwnqgdPnrol27ZBeC4I+cCye3hC4iF4CES7?=
 =?us-ascii?Q?mjn9QPP3HekV9oOUJF7r4Jt3Fdxp2k7SKnylvCUhvU4s32r1t3raAYOe/2tD?=
 =?us-ascii?Q?ZkwiIL6aosO19ZehnuoV3IEGLmacXm2uPKeQD7BvO6jzOI6CHY5q4FMabZSC?=
 =?us-ascii?Q?ERo5Sv2eoi7K6aEpPDs1mk6f0CJ3xUh6igIgWnaxetMBv6LggXUehgAPbcJ9?=
 =?us-ascii?Q?ZKCW5J4Cv4QjNE6IGQQF6v1mARRR2ejuJ+PN9aZpAAlO026wD1njXFj1nJiP?=
 =?us-ascii?Q?GjVQXpyvM3nR5QYeqWbpaKdJa6StI8Ka87tFxViXPIPl7RHbuRjMdx+rF5ay?=
 =?us-ascii?Q?/5watUmJ2u/U5Zv9D8vL8kC91PUE6BNqZwCUOnmWLroqn9H5p6b3xzUukL09?=
 =?us-ascii?Q?h9j1U5ZIgz/B0ByGacn2LFC0wMqGNb15N+e6oHta/KKZBX6b2Hjphi3EsLSf?=
 =?us-ascii?Q?VXeaDD4HinTdb95I+RHM/9cY0gn55mKufhhEWzW4andRlOoJotz9lvb2puWs?=
 =?us-ascii?Q?uNlPIqQTFHNVeAnB+mg5SB5mj1qVchBr8QLpXW4FzNLYoZDj2Q78AdZIlNBl?=
 =?us-ascii?Q?LbIM2yD41S0Yj6KvasMVlwQQefNNxXEVi92pIo8Y4e1nrrSzNYjwXA0CNzPh?=
 =?us-ascii?Q?ZwMU5qADFm/u9XtgqNGHJFMkJjOqE121eJ2nBMVW3NXXQg=3D=3D?=
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
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2542
X-Sophos-Email: [eu-central-1] Antispam-Engine: 6.0.0,
 AntispamData: 2024.9.20.141216
X-LASED-From-ReplyTo-Diff: From:<corscience.com>:0
X-LASED-SpamProbability: 0.085099
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODY_SIZE_1100_1199 0.000000, BODY_SIZE_2000_LESS 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IMP_FROM_NOTSELF 0.000000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, SUPERLONG_LINE 0.050000,
 SUSP_DH_NEG 0.000000, TO_NAME_IS_ADDY 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __BODY_NO_MAILTO 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000, __CT 0.000000,
 __CTE 0.000000, __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000, __FRAUD_MONEY_BIG_COIN 0.000000,
 __FRAUD_MONEY_BIG_COIN_DIG 0.000000, __FROM_DOMAIN_IN_ANY_CC1 0.000000,
 __FROM_DOMAIN_IN_RCPT 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
 __FROM_NAME_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
 __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __IMP_FROM_MY_ORG 0.000000,
 __IMP_FROM_NOTSELF_MULTI 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_BOUND_CHARSET 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MSGID_32_64_CAPS 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __MULTIPLE_RCPTS_TO_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_START 0.000000, __SUBJ_SHORT 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000, __TO_NO_NAME 0.000000,
 __URI_NO_MAILTO 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-Mailflow-Processing-Id: 423e8918c999448caaf6621647e3c3fb
X-Sophos-MH-Mail-Info-Key: NFg5RmNuMzlTRHo3dnZjLTE3Mi4yMC4wLjE4Ng==
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab25b4f3-174c-4bbe-8300-08dcd9834005
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ARfIFXV/Yb1yfviffAFUoi75b0i9DTG2iF2OPLRdc8tLfHrxsAWwVrG30oFG?=
 =?us-ascii?Q?aW9c1uSpW7PbR4jPoXeTjf4ZFFF1PQJJspaJkmjJdX/pdHDZleHMZttf8KAC?=
 =?us-ascii?Q?6gWhpXL9CujsO11i8VaF9YP2hNCXk/oFNky9No3oQ0Uua16lPTxRJm3fnh5m?=
 =?us-ascii?Q?SUYxGM5/vD0beqf63vznxUpAYbSO+dV4jFnssJLK7ncTGbKSPfTk7ZulnsSj?=
 =?us-ascii?Q?xHEvvCa6IWaOqlyPBcmvHjMCjrIHhah4BecZEvT1PMkt97KAMfQlhHMmhmi3?=
 =?us-ascii?Q?v26BlKCZ0MHfX+ZfhqcTb+3AnwPhd6R8VvVpcO1DcpmdGrWce7d7bxGQrd0x?=
 =?us-ascii?Q?3SWnzeMQdRY3s9+YNp53yebvWyWBBk66PzoFtsrPP5oWmcgBfMsdNUcXLZ0C?=
 =?us-ascii?Q?Tc6ejapeRiXPoPz9cX6yFaf2s+rSlPf5t4tBbJWaJShPu/pdcWnuEsb6vFUT?=
 =?us-ascii?Q?O2i3x0iRM7g9bmGZUBSHqc9tn+N2qJoijtrXNyd8DWabHd1aG1+Gr03aJSUu?=
 =?us-ascii?Q?IrWKZnU8n0Nb4LTfS+dCCyVO3HezyWLwD3oa84o4Ezq9dS68+kL43vm9iNZX?=
 =?us-ascii?Q?Qp7fDB4b8sNy2U1Wf95IpRvxyx6asZk1XZSjvyl7Bg1QVor8Xoias57KVQoT?=
 =?us-ascii?Q?pEv0VhR12F8vokJsLyLPqka83H8fJQgtWC4JD2OcMLYYlf4wwF+i39OvZOGU?=
 =?us-ascii?Q?DzpR0uyGOafwIBnZlg23xz3+tcZUZ4hbpfhTq8rjCG/wcyKSvy0hh1xUOsUp?=
 =?us-ascii?Q?HWoiLJqRqceSUWHuMUbYVq2w3pQ1Twsv1h41VM5a2xyY/Qqr58JFIRc/eLS9?=
 =?us-ascii?Q?ijWqZKVsoVRuCbshNyzYl2U/yjRz034JomTRXcsM/oYt5gCK3qzPFr0GWgDp?=
 =?us-ascii?Q?WYscSp2JhnmVCUGIr4Rq+W7Gtbrrpxfad45OGZWDqjIHxIvaqL1qcyOtha9n?=
 =?us-ascii?Q?pLa/4Q+7aACWbf8SqrrB/SCMSGp8r8PlwD9azUF5FlZ3bQXMEGdPngj6t5IY?=
 =?us-ascii?Q?r2fG1JmAVXA19tfmqObWxqZ2wPeNOG4NMY5ihpIOSAUgGYt9ITNm/b+FLnMq?=
 =?us-ascii?Q?RaHP7KguuPiT/Ed1YapXErOczwb53uQDm222O1fh+oCNaIPKjsQVaA47bBTf?=
 =?us-ascii?Q?UAjmNCWERW8Gm4UvbGL8tR2kvvyKPTGsdYJprsk1vHFTvp99rZdN8jEybTzP?=
 =?us-ascii?Q?1d+5DbXd7ENf4mzrvG/I6/WUXMlD/YhLW3o8ws1/j7LX187OBpNnDf/162GY?=
 =?us-ascii?Q?awy0GjwzRJjvlhM58h0G9cJlTNHnhx1A2PMBy/skP1/qTahZXsZYGzJbLNsD?=
 =?us-ascii?Q?hNEvvq5to7vDvdxg9anPlFgRndd3dO2vPxd4XWlSD6YclBVGMMvUMi4UGnYi?=
 =?us-ascii?Q?IBL2f/KASGnMG5OHr5yqAjEEtz+f?=
X-Forefront-Antispam-Report:
	CIP:94.140.18.226;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mfod-euc1.prod.hydra.sophos.com;PTR:mfod-euc1.prod.hydra.sophos.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: corscience.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 14:48:25.6979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e7a785-b0d7-4a1a-ed90-08dcd983485c
X-MS-Exchange-CrossTenant-Id: 6fa424d4-13d6-40c4-a9ea-681919dc6b2f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6fa424d4-13d6-40c4-a9ea-681919dc6b2f;Ip=[94.140.18.226];Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE2P281MB4591

Hello,
you are listed as module authors for the leds-is31fl319x driver.

Should the color property and the pattern property be functional in this mo=
dule?

I added this to my device tree

is31fl@64 {
    compatible =3D "issi,is31fl3199";
    reg =3D <0x64>;
    #address-cells =3D <1>;
    #size-cells =3D <0>;
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&pinctrl_is31_sdb>;
    shutdown-gpios =3D <&gpio5 6 GPIO_ACTIVE_HIGH>;

    led@1 {
      reg =3D <1>;
      label =3D "IND_LED_WH_1";
      color =3D <LED_COLOR_ID_WHITE>;
      linux,default-trigger =3D "pattern";
      led-pattern =3D <0 1000 255 2000>;
    };

    led@2 {
      reg =3D <2>;
      label =3D "IND_LED_BU_1";
      color =3D <LED_COLOR_ID_BLUE>;
    };

But in the rootfs I get this:

root@vsm:/sys/class/leds/IND_LED_BU_1 cat color
white

root@vsm:/sys/class/leds/IND_LED_WH_1 cat trigger
[none] timer heartbeat cpu cpu0 cpu1 cpu2 cpu3 default-on panic mmc2 sbs-2-=
000b-charging-or-full sbs-2-000b-charging sbs-2-000b-full sbs-2-000b-chargi=
ng-blink-full-solid rfkill-any rfkill-none bluetooth-power


What am I doing wrong?

Best regards
Thomas

