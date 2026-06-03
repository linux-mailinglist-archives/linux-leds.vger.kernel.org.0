Return-Path: <linux-leds+bounces-8466-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o/QRJZ8vIGpJyQAAu9opvQ
	(envelope-from <linux-leds+bounces-8466-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 15:43:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED2638302
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 15:43:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b="WS/XfeJo";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8466-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8466-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB0A231287C2
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DB42F7AD2;
	Wed,  3 Jun 2026 13:28:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C13148B4;
	Wed,  3 Jun 2026 13:28:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493299; cv=fail; b=bvLvahdMpZuC/hjuND3g0WolBAjAQ9Sg2kQPfVm6RdDatSFgqo37OQ70eW/FeoyhM6k6uyXGTfgsZKNtip1Jtk8YoK+Oh6vxhSM5bffzNToAw18Gatj8P+YHX2TXp0N5IqxW6D+Y5eGTXkTtimyVhB2lMyGC65GptGeAini2+n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493299; c=relaxed/simple;
	bh=YlQK3umC2q09zMsxiMDqMQNYfpkauk3q7fhsm246CMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UOZssAvHmcjr7aFhGDkXN5VJ/VIzspxyDhmKTPj8DdC5OLBHJhMHNanWwKwFRPUEFeTgCupaAJs/uM1CnHqa86fg6sY6y1bcN2YAwiarPlZBPZBUqgX+xK8Vz4bEe7xmhQFR70kcw8Ms/TBe3tnq/+klBGzt5Uaad6wmhAKWeNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WS/XfeJo; arc=fail smtp.client-ip=40.107.209.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lt3zpvE1xBgqI+W5iszMooafE+EWAe9ouxKjGD8ho2n4BXCdQ5EhdA2AJA7GykOyEX2guQBYy09XlsNBCOEDjSPt2xiBBK+KUkica5Hra/FjLzinytnHwPGtDKmGvw2AgMRilTyWtOmkhTGDZeS26go8BhrEqpchAsmkjc2Qz5/fooDzH5d7DzbsRS5va9Kx7Ao8oXFQAGatInuW3JC5QAXkYoeGfWI21vmvfSSXwKVx0Cb/tiVchiLJQ0S16gg2qZkC2/CbP4rHCDCGAEn+xck9cXF29hLOrfiJKH0U5eU7XVfhaOzupYXpCEp0DtrTmvwzeV6mChPpb2SoTSwl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ7LfxDQ0WGkiIJSHkcU4OzzmPAfohqYai7PRg94Srg=;
 b=TMGLxe0F6LP+9y0m1XQ8Mje6cTPPggV0c3V4lFOV6ZT8WRt2sRw5F73sm5vRNXJOSZ0A6U2hCMHL0S5mziLvUBwyBMKL7n1huvhPC2XYySOXeY9+LanA2dfnE8aeKQRBzGGP4HeHsXtBEPhxs1ggYNdVEF9OpelJvEjaiJYJ8zboXxW5rZ0FXKdKgc9u9arSLIXX7kNjXGhriuSm5RI2SnB+AKOw1nbxRpp2hSQkUkaZsqqoOe00Khh0ely3idJ9GkWtQWbEVwy9HnA9IobjnR6CBERw+BIrgmoQqdtbASW3d+I8Yf0BVFks7enZjV/xeYKzEZsmA5eHp/IZx09mUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ7LfxDQ0WGkiIJSHkcU4OzzmPAfohqYai7PRg94Srg=;
 b=WS/XfeJolSj5k34NJXcDWiv4e6EenlzQiF+YWiwljSjZ18VogCoTzmM2bciJzHV6zVWeyYZv72SfiJ/gm2/51q5dXGgWUB6lZSM746HMPyEzqb0ttF/8L7c11PYp/wRT9njPrh0zyVildsQcn6GZfaaX1x1YpWXrA0Gw55KuoC/sAUPprq3o6MUM0IZ7jRfHLx9kETlMqDuK6uPmiDGoCdxtyQPbGOr4tpyPtne6M8UyePXy5xzZTl1uAW3t9/j/ZLWPuV5pqW8xYZ5ofkT3BNgJDkeqgEK8kAHj0umCBMCKjn2F40+os2QYXM/AUp+9WPfqP1fD59a7S1jur8gFgg==
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:28:13 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:28:13 +0000
Date: Wed, 3 Jun 2026 16:28:03 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	jakub@cloudflare.com, maxime.chevallier@bootlin.com, nb@tipi-net.de,
	lee@kernel.org, linux-leds@vger.kernel.org, pavel@kernel.org,
	jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com,
	vinicius.gomes@intel.com, razor@blackwall.org, hare@suse.de,
	jhasan@marvell.com, danieller@nvidia.com
Subject: Re: [PATCH net-next v2 07/11] net: bridge: don't recurse on the
 port's netdev ops lock
Message-ID: <20260603132803.GA645269@shredder>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-8-kuba@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603012840.2254293-8-kuba@kernel.org>
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: a5db6abc-8ed1-4962-bd07-08dec173f62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	I1Sz3otxclV8JQDIil5+sJEkbZGoeW2lLt+pYGc6kEPVOVITGiRENmdiC87msNGs2iyNk/N/CbCv6p2keuq6kELbsTNag9M2ulN4VD/xoorgHEo8fKawuwHRVuR7XAqLIZcT99vzDSZinYSg4wkkI6QJI5ILSDbHXJYUzYM33jPZADhjEwSE53AGeiFO1RVk+5XuJpE4aaHZogH9V32lQV4JCIrapaZhQKt/U+fKie5E97wVqC76r7Xx963q2L69ekVsWqM3XQQFY/tnfxiTalvuemBr6QgoSOLpXm6unnmMwMGq+pipezVUasY7IeFLmnsj/UPBIv4VNHlYBa6LV3IoO1HLN71b0UKAd1hJDz/suFX4hxXbN8pxinDBI59I0EsvO9Od1Zh3SKw9uWdXVI7XuFTNFAEM2rYmvvviw1SAenVWcnuwLdNuE9AvDqL5lZi4SHe4aKXiJqmGAP/CDIc9+Bnu/sBgA0Vb+bsf1yVIiMHDa191he55uV771BUOquEb71QiaJWJ7cdDc3FpQuy4k0XrQhw26yhnh8wrV1DmoIFBH9Dca/CWCiR2CSLYzAmrCHia1STdeWpDZbmsXMu66QzN95GmVS1y3WQRT+nHWArujdkxFRAKJh7NZ/9YBYGwA8Ezyb8+MEyB04e5zQ5LJiHOtVdPQDWI1blyUDY6TqRfIA7PzgJGSZ6OxuTU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vSVnSMWy5C7zoOSk8A6QnWyPJ03ubpUs9o2G+H8Dgwt9xWXeLshOwzIThnuH?=
 =?us-ascii?Q?eDXtn8hs5FeSo+j3kcOWZ+y2x8wxM9mQEQ9NZoVFslbMtiaTs2icSygzyVE2?=
 =?us-ascii?Q?cPnwDnseVA3W0/3bKW4Hav4oNoV9ckcs6oJWLD4C2CMNIjkqXgqruAZqR1Eo?=
 =?us-ascii?Q?qTxI8Hr22AxSNr/PBlmpDOfTDdOl5pF5PFQ4oNaZZwOPMOKGkSKs+zoFwx05?=
 =?us-ascii?Q?SxH25CaZcX4XiYFQRvRj0tvV+lQzaE3TV3Cw3NUZ2m4ub/7gw/RNnWXoDUig?=
 =?us-ascii?Q?GwuLLa+P73a2+9EP7vuPnjzeUoZVzNrTGXOJPJDwqG1oYm3pBf1bal8JQxQF?=
 =?us-ascii?Q?xiHkFCvdtAtHsmDhavPZe75vYKRm7Zc0ZJSgo8brFtPZ9gbtiAowPw1gy8Br?=
 =?us-ascii?Q?X+O//RdzXA9go2Jf4nyn68vcKTNz/9MqRiPR4ww8SedQI2m+7qfldfjR2QNW?=
 =?us-ascii?Q?MoOqjLNlVhFB0WMUVpD8WncZYqRz3kN64hHUvQ55J+bXlhhIAeTSbb/OnCqg?=
 =?us-ascii?Q?yvQrjwSMDLsSCH34tMseEgf8kBgdAj9XftgpOiHiYhwFtWYX2ZeOkOy6P1p4?=
 =?us-ascii?Q?fY+mv0yyhtFvXB5Qu6Eaq09RpVtKrrPJ/exAfgCTCTO+MzrqFWH5+/PiqMYk?=
 =?us-ascii?Q?KbNb+YZTUb9fSk4qsylHuirZV6SWKPgl5fVFhqUCyCu8yxN2rKf0YSOXEGcM?=
 =?us-ascii?Q?5eHYz3Vg4NBCPeKcrJ/ocFhZMb4mq07Fqlw7O0fWgtQKqFiBZFcyiH2zqH/l?=
 =?us-ascii?Q?AagSlN7cOwQ1v6h49ptlUSml7winEkmP/XcFDk8ZgAH7taYpF8qzvjXUORwg?=
 =?us-ascii?Q?rihZtkuOmkbIdh4UKxyPfhl/27NOlQKdUDKncusN+nF+tFp8d7GgrIAGFb7n?=
 =?us-ascii?Q?G0dJQKXYUwrVpUG5MbmXMkCgO/9W5qNUKjq7AQKzEMI4CpAsliI/dMWJQHhg?=
 =?us-ascii?Q?qBaqxoT2EOnx7zzzQBWBQSny2Zrxcufv6WodAt1xNctUrm7lFyFvWfvUNAbu?=
 =?us-ascii?Q?ScaYdqXD/vfXrkkmqgwH9u7Q7RtgStP8YEP0ufQvxjj8dFgVd0E6C8ovpJms?=
 =?us-ascii?Q?2MIj8TJMIqjkNmJfcXBeZIZJzAt6RDjbMyAbsO9Jgv7zVWDUXXkXbAcvUASw?=
 =?us-ascii?Q?dMk09/HWXD9RNQRu6O7e3QUPsM/N4yS+4N6rqzIvipgJaG+KuTZ1JbpQt+cn?=
 =?us-ascii?Q?OQ1pmPsQ3yg1QKDocvFJ5OwKw1iW6xcXAA3YEUeRTxr4jSGhusDHuDpmTZiT?=
 =?us-ascii?Q?B9O1YifgKEvZQsVMNdD0Tl5KtQKrlS2n+J87wKEy0/W3aQR1cDbKw7MLSWaZ?=
 =?us-ascii?Q?Q95bRyDfHumTQsddp9bdo+bQSU32Ji52+78hxajhE3GAa2DSelCVjFYM+5SC?=
 =?us-ascii?Q?Iy+fV4CtbImVICx+jXfDbO1VFhCbyg5wBheSp+pIRNMuCNRvPLgeJPmv98TA?=
 =?us-ascii?Q?SE+cpPkZ4LQz1Wt2uCqCcV2wV5W90CSvPeWy2pIxXeIgPB7EN/BAJYPtoR5C?=
 =?us-ascii?Q?j/Cm7vBXNIcSZ4WbGpukBMpQ4TZQA00G86sChdr4wDgAX/6Sh8E3ujVVoFo6?=
 =?us-ascii?Q?OuJdGzCbo55y0oApKGn3pwj+l+NavPu/p9StkiNLyCq90ELZQX0qZFInCJhK?=
 =?us-ascii?Q?4F+Jxwn+bqL6lPCT13hoM5Gkt94j9G+PoMXDyalQZgPSYlFUhB4u1tNNChag?=
 =?us-ascii?Q?3SLgb1nVm7LM38aBO1iRXQizoD56kSEu8aopKqUWr+DWjwvA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5db6abc-8ed1-4962-bd07-08dec173f62c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:28:13.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3MkmD2YFSw25pVCrkozZHCGqCrrlcZ35bBSo3GdL6v3OLj6kfdUlOGPveotU4z6f9heO94mXxKZGOVZvZmGLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8466-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[idosch@nvidia.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[idosch@nvidia.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim,vger.kernel.org:from_smtp,nvidia.com:from_mime,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2ED2638302

On Tue, Jun 02, 2026 at 06:28:36PM -0700, Jakub Kicinski wrote:
> port_cost() calls __ethtool_get_link_ksettings() on the port device,
> which will soon take the port's ops lock. br_port_carrier_check()
> is reached via the NETDEV_CHANGE notifier from linkwatch, which
> already holds the port's ops lock, so the call would deadlock.
> 
> Make port_cost() expect the port's ops lock held and switch to
> netif_get_link_ksettings(). The only other caller is new_nbp(),
> make sure it takes the lock explicitly.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

