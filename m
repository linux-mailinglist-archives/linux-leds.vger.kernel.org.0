Return-Path: <linux-leds+bounces-3393-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C20EC9C5107
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 09:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9EA1F231F7
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 08:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158AC20C481;
	Tue, 12 Nov 2024 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="S3CjzTrB";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="PNbHJ/vS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93C020B7FC;
	Tue, 12 Nov 2024 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400960; cv=fail; b=O5xYLhQbuZ7syzKxBSs9optAJGo8DIg2srEhjAC5cBDUonzUe7v2GoyM1jRWL1ARING6z8wW3QdFSRkzIHmOhdQ4EEDaPEAXxRAx0IsIZNo0BKTpzM8jPXD8P7/O172YPEoi+4i1VVAXB9S8IRbFkqmppsfNOFzs8E1zMsuITj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400960; c=relaxed/simple;
	bh=E+fsh19djYtvlIcZTssXpz+D+l7GFhJ8Yv5OcVbT+cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d75GiVwAF09gdvJBXDvWOHdbkVPZmJxzwIEHqPV8wp04PIOfphHtMfnWUh9hKNRAMqB7oSTs8rko8dzX15abs+VHOJ/r7nk8MY3yCrjDVEKiBSetWkChwLXP91oTgn7yaXizOARo26eDsGsj7SUIHCc6rckfb3+lnCCYKLTU+jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=S3CjzTrB; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=PNbHJ/vS; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC7PwjH017344;
	Tue, 12 Nov 2024 09:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=I0SkNo9EM2IuIu5ItFzjRCo+
	GCauTPqQDCwrw0NioiI=; b=S3CjzTrBZM26hB4lD+4rD8z8Gdh/6o+eDyNsSNbj
	qLjONavQwkEuEQIwGtfcj47qPhklaf3smo3PO7E9hAQfz1ux37MIJfD2ZmnIqDXf
	jlRaf4JAEtsWtyGFOSk+7SqCPzXZOzuch7QEiNsC6arYakQd2ZR508eJwu5VFZDy
	80QsJKgwo0dzV/sZ0sFVgnKTeSkQY0G/uHqRHU9BA1bzwSaz4KOsgH4Dnpd0EIKM
	pPtUxNZ3HygLx2ucEL1Yc9fOH3vcMvYDst+cBTTyf2O0K3jJDRt7YVuw56CsnqrC
	bu1EtJxBQUdxWBJ5xeZb/5e+xH/11mOqSyK+4nxpaxyslw==
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 42uws7ra04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:20:08 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0vAB/XzlJVRd2E/8aKN9jsYdBzEfxkjD57Qdr8IxyPMQL1SveSQb+eWN2qsSoLtsXwFIpmxCog0cvtoZ7t34UKpc9G2Jd3MxaWaVfFFM2tLuN8Ivd/y2Pn1yjAgA5XJ08/WHM3p2jlZCh8fg8CJAsvSaBS6eSP56H5QYo5WFJMxSAnefUiSrzqhwAsPh6mrozH+BEasuyrLBqAMkOZ0YPGeUbs3dwZ1Q3QbAD98H9DlwhO+ge8UYgyw+P2cvVbcqQy9up+Jo9Ozim5sByKv9o89mzKfElEu19nUx7/mnJEFiPGNLPoPQiqXy5XJh2GE4sAeKcwo/25ZgP6/NdaXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0SkNo9EM2IuIu5ItFzjRCo+GCauTPqQDCwrw0NioiI=;
 b=MnEG1ieRkEuj4qO1sE5gAhtwIy5OQG4xgv48k3fzGXk59R/wh3NQAoOHLmncfP5bwhNfmaXOeVaAcme2sGGzWgzGLJvMrljTq4xAOFCOFR1jtT5XS4Ka7YHtzE06Ys97a0QHZs88lIpDiL51F/QBo47V1Ep/2pU2zh8RaLj9lyi1FzgGzArqekd/c3BhuxUXzMNsKUHOe+fYNc7ATCKa4++cybKaG239dCqZCbNDh/oQw1yHR1ZyDbH391xFFD0mQzN4m/xvxE1uVwy1U8Z/0Xs8i8EGxyRetek1fZcUfnvwcimPRjD4+f6nozKCOhbV9DYB2gG8C4CVMCEyjynUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0SkNo9EM2IuIu5ItFzjRCo+GCauTPqQDCwrw0NioiI=;
 b=PNbHJ/vSSkpOYImk33SVFAwd4qlkpCJXWYijt2zR0OEJbDgquKYbBQMj5SVIARnl2SdkyBhW3Wh6RVuOApTLQm0YI6IdqLPnDE5HG2IICCKvR1P2T7JkO4yQuX+NEIoZjjGCfYzwYklzaAgVwwgXLP5TVliUZex76zjxFqGVgV8=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by AS8P192MB2022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:56c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 08:20:03 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 08:20:03 +0000
Date: Tue, 12 Nov 2024 09:19:59 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, marek.behun@nic.cz,
        linux-leds@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add LED mode behavior/select properties and handle
Message-ID: <ZzMPr3TlEErExRqr@FUE-ALEWI-WINX>
References: <20201209140501.17415-1-i.mikhaylov@yadro.com>
 <20201216224118.GA31740@amd>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216224118.GA31740@amd>
X-ClientProxiedBy: GVYP280CA0010.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::25) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|AS8P192MB2022:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d5cca6-2e64-4463-7ec8-08dd02f2cecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QwCi9LTtVInC9sw+/JCSE3Db2raNM55Tw+yD8iY3+7fyWAbuM4BFXGvVpdSq?=
 =?us-ascii?Q?dEn7SlJGNhajMp+slusYh4L20q4ekp8qEWIJGrPJ8KbK/RPqAPFWZNavlnsB?=
 =?us-ascii?Q?4xMtaAhQlKdb6ZfHJwUpMl9f+DOM97fcMxX5Zvryg/rB8J56JgDCm/IS9xaj?=
 =?us-ascii?Q?HNWirpcDykdxmXy1Tv73lwkqBvajL30b7nQZUU0PtzESwKpEeDI59y/GJxbe?=
 =?us-ascii?Q?hzFSFmYA6llIXBcMLNJcGRAeN9CAZJx6LXSRz+Qgn/ceJBQI73PofcdJJOVG?=
 =?us-ascii?Q?mqNQ5JEKrlronHNFAVC9r37aKKYVY7gUEJYhKbOFVGtA80kuo2AjPt9Jnzim?=
 =?us-ascii?Q?r11gudO00U2WCjo+M+1+gSgCkUFtoSMHrp978cGyeu0HH1r2NPfeeCFCsXaq?=
 =?us-ascii?Q?8CHLrJC64aOmtkVCU0GfaLov5eUlxRbSlE9kY5gCpQxpuENN+8CWEwtTBHrt?=
 =?us-ascii?Q?fOa4wNeAZs6Dy2dekYXyJvTnO52WM+LoCwxpAn5YSbvqckanxZxIUop2BMfv?=
 =?us-ascii?Q?WnXti7321Up91bMVxr4osGReAK2WeKKxkQkhkaD8P7nLw2w7HfFED80wvryU?=
 =?us-ascii?Q?rulw0fKRIUfcWNKwyR/tavh0Shhso2o5AsBr+n+AxbwRfg/bULlGpiOifLmB?=
 =?us-ascii?Q?MmY04Qt56LwfotE98oKZu86aAnZdl9K/qVbieoK9mDBaO8Q08qw4RLEe2H0H?=
 =?us-ascii?Q?wE+HbouriFTvriWzC7KQ3Xdnlru0RBC2Ulh9LrhUm5ERXSJAMm6eNvTJtE63?=
 =?us-ascii?Q?PGvFDmukdA8IVkhx9vByY/DjrQQ9RJFN6r086lgEMq5EgyAO/Bdxkr1OYV93?=
 =?us-ascii?Q?0hTuQuvHqJY6fYoWs/r9EFGo9XXlzYaifUUw+9wtASKaNdbmBpO20Xz090sg?=
 =?us-ascii?Q?fFeKq/WdvO0oOrcLNDLz4xgx/3m27AzEv9UQEQGiSCQWK7jiJXkQQfUFODYl?=
 =?us-ascii?Q?dQr7TUIGlMGTxA3tsAu+2VKuOQPsAyDjZBikMhqtHI8AHJNFQobUJw8inLRD?=
 =?us-ascii?Q?yFpBoxIe4WnBldFtWiGe0yMcGxypMtR5sYWZ+cX04PB+SqACpDycrkwhl8fI?=
 =?us-ascii?Q?zTm+cV/MSV1JkZMbMIaZs/MlZ4g8CyMJkFbAD/Kr5sjyE+//xzSRz+v9hr7y?=
 =?us-ascii?Q?fVizApKtL5sxpj+Nwhr790QgaFiNq+l0tTTjeEki+2UyO+Ppze/zvXV4dCP+?=
 =?us-ascii?Q?jsr28TJBy5oAr3XI+pwZsn3mgx5F3GqSI1OMCpQ50CKIONayBxr6ETirvo87?=
 =?us-ascii?Q?/3xw2CfIelMxhkh9fLNV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvWn6aavyJ1nW01o/fnTl17Bem21grEpM3FkwQQE/34MInU5U/DWiw33juIm?=
 =?us-ascii?Q?YTWXHjyEOP/X4N9IHH2osITy2x0BK65scJ/K0Ki8+WQdxTmULiQOUNiu4jm5?=
 =?us-ascii?Q?vK0dd2KhBBLJic5jw7EWz49ZtxzrmM4uEb0WHLZvTsbmqGT3jMPijgUrvX4g?=
 =?us-ascii?Q?7AsMBktW5S2ynDRjm/vMiw/pnEaUm4GjiPU+sswjSLvErElzMuAmOPINAqqm?=
 =?us-ascii?Q?kH+0XCafgCusJHd4ojgpXcFDrwrpCrF96BzY4ydqkuymWHVN7Xah0364A0WD?=
 =?us-ascii?Q?gCxE3LnbbHlIhLSC6ijUP4RWpHoyEuYhIk+PK+ki9Wp3ICfmYDf9gqgwJexw?=
 =?us-ascii?Q?fJGd/+FTwbRXWQN00zRopWHud6EaNWmW1s/Q5nwXWlJIQzytJwQ0ByoHYJ1T?=
 =?us-ascii?Q?6VvRSm0HHRMAFvx0BTJxqjZ5T1B9G3qf+YcJ240gP4eakH6kO7gxUoL9f9uJ?=
 =?us-ascii?Q?GKdjll76gfnqKm+9q4s80n/OMOxJr0AuVbJM0rsQcdvEfzunICvkjfytH11B?=
 =?us-ascii?Q?tIk9uarW3IikHYry++SmVww/O1IRblqwpc2qV4YSYMVbVKOc/xa3uVGq26BO?=
 =?us-ascii?Q?cUyxvqCofVVp8ErngPPy0ABVwDbrO5IdTzFu9RBY5SVHmZm7jhrmqm4mLdxt?=
 =?us-ascii?Q?2cFv3W97VjpEnO4S7FuuKOqmM5EvhN8QRNy2v5JYXMWZIemeGrk0NJM8Ki8S?=
 =?us-ascii?Q?wE5f4pir/Q5pYdJiKOCRPklxNrXWo5lf/X1yiytwLAxbaDp9G5LNJ94Jc5f5?=
 =?us-ascii?Q?StISXBtTiCNjL6eORpCvKou+YJd3IdooN5048VTEOQelzt/WizhWsnjvkYbO?=
 =?us-ascii?Q?ZjyXMeFheTATfcuJFBZKGKCNzHJMCRU85w9McGZ31nWcQoUaLegbY6+rEDjs?=
 =?us-ascii?Q?XwRPFqQFFbpucSMFsa2hECoq3zIJYW1YkSXZ4RKUsYVf1v8B2quzT89xIxqo?=
 =?us-ascii?Q?8fJFVyfASblxlGHqMTysrR/mlhXK5jfA69WdRr4Toqd1Y2PQ7WpeNDyvJ15u?=
 =?us-ascii?Q?v9ZwwOMN5Pad4upM7fNsXlLtorkzPLwJbTUZlBEoQHWbGGpcRf/ODJDCgxrO?=
 =?us-ascii?Q?PcfSP2jPO+nXggL3KaYKr/LK8193j/vv+f+MoTGd5sqB+FABgk1pTjTttCv1?=
 =?us-ascii?Q?KlNz8NPT+DpE4kwVHHNWbaA1CCal34IT/0qw/uvzF7d8mf/o9cg3o9yluIlS?=
 =?us-ascii?Q?NXtKj+c/elS39Va8DFfmpBtEI3Ig/f2+HE5kOYRmdaFTCYNTaBN6D3e9MytT?=
 =?us-ascii?Q?xX+U7vPfvGR52sJ2MhO07NgXAj1aiY2RwDpkY1vkacMJlzxEf7RQutfnARrL?=
 =?us-ascii?Q?TH9vd/sSv1u1ilsjXVPvDqRNQURZ6nOTPytm2v3dR980FL9Ckq++Li3HFBAM?=
 =?us-ascii?Q?3AAyz8a6ljThT22wGqd8D0aSqm8jeqpPkTHh7A7jS2zK4IEZDlbOAmlb9iSx?=
 =?us-ascii?Q?btgvNwxEHhzdzO9ZHlcMRpQ1bpmzCTJQLKaeypCM8xhqvRa71zUHf3FQOf9T?=
 =?us-ascii?Q?fI2kMTzpZHuIr7k+4/Y3L7rrd+Wsymxvp4mwMMxqaM86Rk2kG0S0REJuxget?=
 =?us-ascii?Q?m4g0N8omF5znjNV6gwYdWiOAJ+qUA9c2r5zuAawr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rQ4SEvyyRkEp0IRuB2rkNGHMvtY7g3OyAMifKJvsl5iP/EybQHwohkOJ2Dwt1nXMs8HGI/iyCrFMcaS7ernWE2qa8SpyPk+1VbwQkh85kvxpQMN1c11LMJ7xMozvfc2lAt1vGzJuFVolXPHLHWmcF/80a/6IGE/yZBkF26wStjkZu0hvt7G6o4+A0DGhaTFfMcIk36OswmTvhsJAsREnvi0pVZwXhWgZ9Gb9zOyNwoo0qTdJRzd8lzfcfDF2wFbYjd9pZ7aYALISjC9RQTjfTjUecGTOP+UcuFPfPwMWF6NGprgf3bHVZoTLwGoQH1nQYZiTvBqhofNkuyVdLv9AyxBO3rORLE6iTZHrosbwWGooy9raHdy51X44MY2AZoau5CvD1pAwkYDj6ySl39M+9xvV5EdQv6z+DetzWmYKm2xveLxL0+E+0aWo9JdP4NYPWO6uELD294sbULvRYqPBxPbI4tL7YiqeIQSXfszHQXMMbdV5Dlsty9STcuUV6eBgc87Dl64Psz5lEP9VA0LcBWb1s0+JU5e1lzILICF00GagLaup6+IVGQxZQQb3CePp/DYWpWPAjaZOwyluMKJmXBtZ2TzPrhTTfDsZ5ErjEb18xdesJHiCaA8iayXrIksn
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d5cca6-2e64-4463-7ec8-08dd02f2cecf
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 08:20:03.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwlR1GytJkLlTqIv0bEPfdgNd6O8pdG3hhlh5y9JsC2qKo3FqVZGaBkv5GN3mvkuY5aN2c3PwSimGLJ5dtGs1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB2022
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
X-OrganizationHeadersPreserved: AS8P192MB2022.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=HOCRFZtv c=1 sm=1 tr=0 ts=67330fb8 cx=c_pps a=6Hn8pli4REgfWvaJFfKueQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VlfZXiiP6vEA:10 a=0HJ-WiGSmKEA:10
 a=8gLI3H-aZtYA:10 a=M8rcC2nyAAAA:8 a=MkjGuBPHr50Uk-pHE_gA:9 a=CjuIK1q_8ugA:10 a=K9tzwgKBnWaK51F8Cre1:22
X-Proofpoint-GUID: f_WrNRaJI-0n8H-7D-J2levrt7ln-FY2
X-Proofpoint-ORIG-GUID: f_WrNRaJI-0n8H-7D-J2levrt7ln-FY2

Am Wed, Dec 16, 2020 at 11:41:19PM +0100 schrieb Pavel Machek:
> Hi!
> 
> > In KSZ9131 PHY it is possible to control LEDs blink behavior via
> > LED mode behavior and select registers. Add DTS properties plus handles
> > of them inside micrel PHY driver.
> > 
> > I've some concerns about passing raw register values into LED mode
> > select and behavior. It can be passed via array like in microchip
> > driver(Documentation/devicetree/bindings/net/microchip,lan78xx.txt).
> > There is the problem in this particular driver - there is a lot of other PHYs
> > and led mode behavior/select states may intersect, that's the reason why
> > I did it this way. Is there any good ways to make it look more
> > properly?
> 
> Lets... not do this?
> 
> We have a LED subsystem which should probably control the LEDs... so
> user can specify behaviours at run-time, instead of them being
> hard-coded in the device tree.
> 
> Plus, LED subsystem will use same interface for networks LEDs as for
> ... other LEDs.

Hi Pavel,

I would also like to control the LEDs via subsystem interface, but how I can
configure those to be visible in 'sys/class/leds'? My LEDs are connected
directly to KSZ9131RNX phy device and not to any of GPIO available on the CPU.
Am I missing some DTS entries therefore?


Best regards
Alexander Wilhelm

> 
> Best regards,
> 									Pavel
> -- 
> http://www.livejournal.com/~pavelmachek



