Return-Path: <linux-leds+bounces-3392-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6A9C509B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 09:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C0B28288B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 08:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A6520D4F4;
	Tue, 12 Nov 2024 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="exfn3Cfn";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="Xxbofmy1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73A20ADE4;
	Tue, 12 Nov 2024 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400079; cv=fail; b=nsS6ID1P4TCs4VvisGmRmEjUPXr0vflWCXSOBdl9k8eHAXtqcIR8JyaLbx+kcUSDl//hpXHRDjATkEegMj3fAvfMqFDzb4VjuGjKHsRD2yfop2W2s9Xge+mTJRP+Amv0DH0rua668g0lC37W1gR7ulgloO7J3vQ5MvGzJe2/DMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400079; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=stbuWbf5NuPamIbyUqPQ8OX79BBRfh1/8kA3zC+SQfITYUdwRWwsbKOMz0afTRc+cJBNq1bPkVoCvsXhZGCKXDic3FCSJf99Rg+7OVKn9TVMMBUdstyLU8y+4hqVkGEQrcPBpoVAdqpd77vztEMgqa+gSGBmQfb/CrnRUqOUppg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=exfn3Cfn; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=Xxbofmy1; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC603x0018328;
	Tue, 12 Nov 2024 09:11:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:subject:to; s=270620241; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJW
	ZG3hSuFU=; b=exfn3CfnyIu+YcY74W7ewuNQBLyzLOnavu18NGmVQ2SqHOz8t3V
	62nx/vmpeNnNXL4BAHmDTAXUlbqXuJaqPfUsMmGKAMq6DvbwUI/wkkZ3CyU49N33
	fXEB1LS2gXy9BQIkQF/pU7dBlqz5PPkc1dLBApOQ1BvBPWiTEK8g/clLRYbxHKC1
	KWi1tRKETwruvoaAm9Jte0/4f4ORQqKnMxGIW+0uF8Bdz5ZcVwjd4Yc3mgd/h5R4
	XXPeVc2St7VzuHQ/TVeU9nhlNMQWC9XJh/QdFg2URCwX3F7RrNlKhh4FzL1DGjd+
	zZ6KpqpQrCoLAA27sXklsyKVqGB1LgmJBPw==
Received: from eur02-db5-obe.outbound.protection.outlook.com (mail-db5eur02lp2110.outbound.protection.outlook.com [104.47.11.110])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 42uwxjr8vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:11:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U47rWPpaXZh81MCsYCPNLf7M6Y6td0VGje7xM9uTgbvZqVwYjIbWdVwLcHvXlvqZqlqjGK4s/bdCOOJ274q746e1WBqAZ4thW+T0XynkeZYkN20zL2KXlMW9Msc6KTHXwDpxOV82Raco+oSRm7F9LEwTXORONSEr90fOciwFF+wcbSCJvKdL7ztJfLi4KHW+baX9u/JDLNqQNC9Xpx0B+oS6n7WNfctQK1nU4pd97aHeevFU2LTxfVQQqhIR0o6F8bcBtVd7bwUBKJgkBeQodwcXkxVE6v8hQSQmpuQNGMm6X4tdY2/pPD8F1esRMdhH+uuP+sUUDiQMAyJxPgT4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=IEEstNu06VtwYr9iX69VTh2e4JGzAwFiqRk4rrz2erCFhA/rfCwl2mMWTKRXRPg3LsNZkVLzR3odH5m/Rd3shQb3vilhf+vPTyYQ8FdDYUoWgONqUJbv82JrB5UQmvAJUWHIrE7GtY/jlMlPJKMEA7Y8W67t+qdQkmIy7iShXWS/vnvwXoLi59hjqS0cPWr/LSU+OG40idRx2Cdjf5hr3Rx1lIWNeSYYxLhNHJkPIiENOKqiVB1yj9+hC2wMGaN2XEv7tTkyEuvvZ63HtIRM+GL+K8mqy1mVhUOmJvc+bug/xvZq/WHEziS/+Yrcz5mUZUdcH2LyPhZIAO8+3lM8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Xxbofmy1m5EFKaMH+ZON5aYPmM2QYeje585P+r7jMyAbnqBifRuX068Wx0F87+vcNv7xmZuq8LUp1SjyNuPPqul4fjpo3V0RchL0gfRvPmXRB+vUJ62lCAn7LbnNCQDqLXdM/c+JalUHFQ78FtHs9tfY+zlQvkkXF/qfsGaadB4=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by AM7P192MB0788.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:175::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 08:10:58 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 08:10:58 +0000
Date: Tue, 12 Nov 2024 09:10:46 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: pavel@ucw.cz
Cc: andrew@lunn.ch, davem@davemloft.net, devicetree@vger.kernel.org,
        f.fainelli@gmail.com, hkallweit1@gmail.com, i.mikhaylov@yadro.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux@armlinux.org.uk, marek.behun@nic.cz,
        netdev@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 0/2] Add LED mode behavior/select properties and handle
Message-ID: <ZzMNhpzA0Qbymcas@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216224118.GA31740@amd>
X-ClientProxiedBy: GVX0EPF00011B53.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:d) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|AM7P192MB0788:EE_
X-MS-Office365-Filtering-Correlation-Id: ff843174-b7db-4a6c-ff86-08dd02f189e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3AR15xt4V78TGfepmViRrpvVZuRayB76oTkooKnGhhONWLfPXawdZYoDY6x?=
 =?us-ascii?Q?S+4EnXA9f0lu9YuLXe0DgwAQh4n1ux4TYRM4i8KuK40qqfAArMvmfT6eIkPY?=
 =?us-ascii?Q?2rt583nx3fxAruFkQ3f5ZK4jEo/BGHd1I+pWhm/kuChcEbbkdqfN7f6Ak/4r?=
 =?us-ascii?Q?0DqDepomlphpOH141pm2ZmmAQlxDXF4cD4TMNtSFva8rYyuKk0flUKpBpuzY?=
 =?us-ascii?Q?lU5tNSXufrsohf1BQ63q2KFORlEBdvzccpHwgRfLhLw3OhJlZS79KbXwoKOE?=
 =?us-ascii?Q?XU+O2K+yIWw/wG1OAH7BmYeRQfTmZsxSwL2tQfBOpnojdhA9oyKHN8tqxeSY?=
 =?us-ascii?Q?96MroMWwe7dt4tXWjSB5jvwcP2zlvre1ZCH2iMu90aMUs7/j0gb8D/Qca/JS?=
 =?us-ascii?Q?h3qIAt8Ju2wRTmQD689aKeFkHj6uFTSLJ3LQRI2D/0PDEnR7u4O+3FA5OuCL?=
 =?us-ascii?Q?VEUuLGFav3rRND8fqZeFRl+mA6kRFfqMC5ZPDJnPvmzQbu4X/5xZ+2YCy90d?=
 =?us-ascii?Q?XDmLDIkekN7mbSPYz5Zl1WkM1WfiDEyrJG3axk/hm5CQq581H55Dukp+kDgL?=
 =?us-ascii?Q?le6hoUTfOB7+fwuaiJMH05EREf3PQAxBgTYy6cRN7Wd6xAaYZRCwQCGdL6W0?=
 =?us-ascii?Q?J7EWNXpUgyouORPen7HOq1T5OHBbSytohDjkFZaRlGlqFcuHdJU/slMOY3tH?=
 =?us-ascii?Q?gF0NTr3MxKp2KY+gosPoTEDZ+XCxAvvy8S3mD91ar0LZOmUmQzvfZ71dQRG/?=
 =?us-ascii?Q?DOZzHY/iQUIDnKkzREzxaEDhhLe/xZ2ngfi/0ExctudCvqIvW1pvpvjD3rly?=
 =?us-ascii?Q?/HQAQY5PVnbBsXGtLrF3N9dWDMRApdQ4p8YV4kv6agXCbUMOCrVgjGuufqVD?=
 =?us-ascii?Q?wzQT2eurhnkfm7lgbQ7lLCww4aTxaeZWl38Br4uCDG9/jW8TWrKRHC60V5PO?=
 =?us-ascii?Q?zQgSAmbWk4So9KMBQSJNe4NPwzr2/gSdb3catJvBlDsQQx2eFoG89TVm9Opi?=
 =?us-ascii?Q?Iua/brbwI13L7hnH79oWKqXC61ceao4k6VRgGejWwo8Q40o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?INvq4cttyUsO2Sm1FDQVJNY7I1Y4OMyvv7C2c4G6ytKQFzPl8JbxyviChKRx?=
 =?us-ascii?Q?a9AcuZ9WU7jrN2iF6dov58WEPG3FxZ91OKldAX7EV8dgBpXVLE+1ss3IwXSW?=
 =?us-ascii?Q?XmtvX1s8xRtiXEstvUKa1yiAGohnxmyM+on79mTc7l6StkTT77W/k4pJ+QXD?=
 =?us-ascii?Q?DVOcuzZukCGbby5BWyLb75jC++3HzK5m5J5fWl+rWLpKeSUDKwPKEhl4pGln?=
 =?us-ascii?Q?VfCEHwv5aCczkQMwK6XLymtTOQnKUGWaIerw3CQz0LeAWcj85IaLrC0VESAE?=
 =?us-ascii?Q?tpuWpSt8syVQEUylFVgp+rkNDMMqGN6aFT1xOPf39/kKl/UjPLZ5zD9a8b3A?=
 =?us-ascii?Q?EyEnduaOdEOsEe6G8ufiNoEw8677n2d4JZvDT+TDJ7k45WHGT5/HgqpgUOrr?=
 =?us-ascii?Q?J8a1gv1lS+HS2x0yGBGAk+lSLtn+vDLh3fADUd5x1lk0hz95i4FxwIVsbD3i?=
 =?us-ascii?Q?CdHzTtGXDGyK8b8wXSszDFgXAdYqx1cM7l4pgbkfuBpmrvd4cNkkl04AxqmF?=
 =?us-ascii?Q?C99nOnPnq5gnVtm/B8BdfojFZ8fvOHv2mzr8gBSIsRk+4B08p1Ks85xWM/aI?=
 =?us-ascii?Q?ZBI+SsX3n182ybYx1cNJHtaFOY1I41mkDL9njL7Wwo8J1ctbcnFuZMxMQ7EG?=
 =?us-ascii?Q?hnjSlshnK2do1qpawc9pQ/TzwzVsdi9fB80kVSME3M/ST7YIB8Xbyy9VVzPS?=
 =?us-ascii?Q?Hq3TJdoDHwQ4G2quE23tHv5/dKinb8Ha4VOB8kqx4XEYBrswK4Db28DqDyfy?=
 =?us-ascii?Q?S7Wg6GFmjb2SE+0yNL9yh5BThN5LPcbdqX64yE27HeORZfCjOpd3y1dOQ7/j?=
 =?us-ascii?Q?+dyxCP43vwEGoEAFj0sRIVWwfQ3rq0R7nCo+tHf6ixd3lapflxkYhBrgzMoz?=
 =?us-ascii?Q?4XJpMC2XQgLUSEzsLetQn4Drjk8TBYOQJjHvGgc9mt9ggJNrtY23SlsE9sPX?=
 =?us-ascii?Q?SmYxq/LPYOdYbbks0tpnsnMGZwO6/J0WjoE06csehnj2mVEKVBUQYYlIKMHd?=
 =?us-ascii?Q?8PN1HEPofm+ns9FLnPQnSRjmgSrTsSklGYk71C/Cer9TLPkXv4NjCn3GK8CH?=
 =?us-ascii?Q?U9GDvJSN1tggAFKDPzENy3MPoHmSQm0e3E4fCc7cSBmx/2DpegxKj/K47S0z?=
 =?us-ascii?Q?kEuMRzjsX3/foI0Z5bz9Rz1BVRpI3tBDt/MTBcqIs4KIZBdVhdoywfJaIWar?=
 =?us-ascii?Q?sIqqOwcnJ3wzbVOJF3U+EvXczvyIRuyRIp6Z3uYWRm4FiIFBf9DFqMM0tA20?=
 =?us-ascii?Q?iFWe8HM4oOuEf4ylJzOsoxhvZeAmwzsBKVRB0RySVj90lbIXja/44a0sniyp?=
 =?us-ascii?Q?EOvdI6/UA/GBGo/zpc78KqLc3gfUIMgTiKqqZBYukYQUC2ThWa/8rKJLOCz+?=
 =?us-ascii?Q?KC5TS/MuOydcg7GboMzjx29WbF0bWKACHGQ/eI5Hh4XghLi+oMS+rLipcBgD?=
 =?us-ascii?Q?ZyQlaNq7/8bCB1j/Qwy67HJwj8FxfPRM87Fgl9QZsuXvwlHN7WQ1QFR2Or5X?=
 =?us-ascii?Q?V+svm2b5RQJqF2T651oNGmN55yTMoqb5+lQNfoZsEY+s03eoG0IO7oe47hPB?=
 =?us-ascii?Q?uolGRSkmC6WeNkzCx9Rp4eUUZuSJ6uDuB1W7oDdA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QNml1EOt7XLLgqZtb9dKcDSkYrrzkkAojzt8kEM12t0kss8ApWfYxrVVeXOu/wbil2NQZsgTRFDCbeSiEVp7IVFuR7bvz9ePqb+6ejci4u1blZILW6S2IyGT7OT5Qh/O9EeuIWAHjz8IREFQC2B2D1I58JjQjNHBJcAeMqHkrrVyJ2soziQVuKpQ5mqr67W/5MlaPAFOhrReRTsJ5S+uon8DNml1WDjlv4moo97AoXU6P8ukRoZK8wdQndCHG3zZNPlojWgon6A2nmjDCOamP7G72LEGUpozMZdWxbbQS6f27/sXk7XbRgHsV3TlBLRia2NX2JYYpi6MSn6xJMbawlANxpyYdE/S6ETbZYKRfGI4FBJ54qCiBYVsGLs+lY/wDbqid7yVWXkoNIaokrQ+w42SD9yOHKT44uubOVBI8Jltin/Pbe5AP+YOKfh4PRYGXxfYSNfy//h48jrSSp8t5g8WCm7pRpW7oga2TMCcXlCMnKlscqfTKqzk83c5FfZHL36RPwzEOqLjNBc45PKO9l6tMrros5ae+S1Bzp7b0fBoXpeEjwv9nO3Zug2UYUrih5rkm1ThfIhBcZzsyjV1+T7h+7YBMhtT0xQzxMeAxR/i0C8aWt88pUXPlOQaJuSp
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff843174-b7db-4a6c-ff86-08dd02f189e7
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 08:10:58.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Or9TzdXAoK9QCx7gBXEAFCV61Cy/l6tcogyGCVXpah35AaR5Iziq9I2ShDPI4c0CayDTHXup2oY5VUXrxIDEyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P192MB0788
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: AM7P192MB0788.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: na64SPP0exTmplciduZG709yE4iFfXeW
X-Proofpoint-GUID: na64SPP0exTmplciduZG709yE4iFfXeW
X-Authority-Analysis: v=2.4 cv=U47ADvru c=1 sm=1 tr=0 ts=67330d94 cx=c_pps a=wxlUMtDeZyZ1nyw9NdtxuA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VlfZXiiP6vEA:10 a=0HJ-WiGSmKEA:10
 a=8gLI3H-aZtYA:10 a=tclcd6dtLQvEqt9_mmAA:9 a=CjuIK1q_8ugA:10


