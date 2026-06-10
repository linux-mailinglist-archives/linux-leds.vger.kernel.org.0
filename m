Return-Path: <linux-leds+bounces-8552-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XBDyBZpwKWrBWwMAu9opvQ
	(envelope-from <linux-leds+bounces-8552-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:11:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F243366A213
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:11:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=CvWsojkL;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8552-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8552-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECA0A302219F
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0258408020;
	Wed, 10 Jun 2026 14:09:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99BC40BCD8;
	Wed, 10 Jun 2026 14:09:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100550; cv=fail; b=ucSg+c4DsVHoyaQwH8DUk+/w9oGTK2B2h4TjV5gm5yyPRI/omNjtVsQ+LRlambA0gkxOQ0OhZm6r1c6P8uHpY1rrCeA7nJ+I0aqtqiGFf/uw95/hTvN9Na2x0WiuDYnRSbrhoyDgccZLLVtgMjqX7PiS1asWC/e3GoCieW2NbZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100550; c=relaxed/simple;
	bh=Pt9HZuDB2525FGDLZL96YJYFr8/m73CoifONl9uVqWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jfzMTEnZhHaf4r4NHK9dZLR0UE8PRj1srGVZYiEQC8C00GC+Q5LBwZg/6HorE2/MImI59xFidNLlxyNbuO4Q9lM/TRl7HIRnto92gkBDbIpVcq73mxFhcR+JXvr2ZhXmDtYNKf4UQG1qxUvoKZceW4kGxgBpWjBPZWX5OW8/wfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CvWsojkL; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDy7da4ZV/nAB8tC6djBluQ7Em4YHIC1AICgB0s7n3nRFboN7cfo0N2RvcqUKILyQHwfaGuCD4712Hh8qRbVejh/Dqbz7ccgPud9JSjUKzJD5BBaquINUR+HOzT6EtSFa3tkCMOGnKhJPxr5LJTYy4XTSCl43FgPv+2qnvZnEkeT9KbrZ3NsqvwrKD9AvULXrW/oERliZzTLcjmLR4Zo368yboH3J6a2JPAoDqoBDosbgoj8JJ0UI4QqrDc2nL163c4NiNdvFC1585XP6IUyk/DNBjhaMz/yNIBsgr+ORLyOdzxQ/c3OINgIuSjCo5a0hlY2XoDDd+ts+Bk+CpuwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPv8tGf2CzDKvwiuLfn8l8qcXXIX0jK5NSdezOxz8VE=;
 b=lHyy42QpP+0Vuw3MEqTP0Xw9Rl2hTltnyHIjdE8x6muYEug0Tzru26AMKR+YwYQ6tPgmcy38KDyULdecWh2ccLJk4Akx2LJc4oPW95T719QPCzVtPcEIgRU1T+ncYvbAMnRCRnAMAl4kXDaHBpBNMl6tCyWLO5VRoSxDey8yoCTTUYr86UzHNzxHqsUZJCRGbKYqWvHiMSIuzcPs+KgWSEZIyNuirz7PC0h63tV9jR8bi7wDuOcoOvqjNtWI0NhI7ehpeE8PQGSL9YjV9G9VvaUI+hZiJ9J0tm6pLDQITLeQ7glbcc6HVI59XCspqxxJ40OhWulDZ6i+OGhijBTIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPv8tGf2CzDKvwiuLfn8l8qcXXIX0jK5NSdezOxz8VE=;
 b=CvWsojkLijo2CQXpjd/+kOeW9j5MqV5u4paetyGOsWw/UMzra6yGaXDx/7gUZ7L665QEPxm4pd6UGDBghDABGKQMulZ65K8VCbc5rm+zz6ACSVTojU3EUtjyod7Ywqku8h3KVZf8t3Y4yyceOsqxIA8G1crO8wVm8G2kgi8SJ7I=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8702.jpnprd01.prod.outlook.com (2603:1096:604:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 14:09:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 14:09:05 +0000
Date: Wed, 10 Jun 2026 16:08:49 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: class: Use firmware nodes for device lookup
Message-ID: <ailv8Yry41NYu54e@tom-desktop>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
 <20260520152225.GH2767592@google.com>
 <aignTNlK5kCLmQ2A@tom-desktop>
 <20260609185132.1fcdab00@omt-cwnxr4tfw5-lht.ads.dlh.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609185132.1fcdab00@omt-cwnxr4tfw5-lht.ads.dlh.de>
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: a2947f83-b870-4479-21c0-08dec6f9d4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|22082099003|18002099003|56012099006|11063799006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ta6lBol1grkwEt4xLjc+heyFNdHc5K8PI0M2Yyig+1AmZMt7lw9fcEA0q9QS7H36l9KXfUiVQ7iVsR8ixHF3oEXcelyW9ZWCvAkUtMbn2jRw9Miq/Xw05vviLgLr/8vjjd2tSyQaqLy2ehBk2nI8h++bZXIBDdHHygjiPsBxiUuoGw7s3//0qWO4xujrGJKWO6Agu5O/c8GMV+40egqcNbbLr/C/JpNsuH2d62lszVq5xBa/+KkP7hVicrty40eKeJmX6OFrmubSw3WMW8uIv2QxUnIZ35RkiXnf9Yf8Gz7gRVM7ij40KzUbFeR/RLSwQtIpdQhqkbaWw+5TLPCxJYkOErei8KZN2XFhm0eu07BrIMXbdyQs8ZxG9+OA2ilPcgvqIlI0YGxqq/RGVKTXqJwXIab2vrI9vdHQrub7wvxFxz3uoGe4RqnOhofZcAqqG/StZIZ0HVkKBpE6bVK7LpHkYng56QMurGJo3IqOwhWai18nULQ+32GdJ9GC2UkPOMqLaPprylmzx8B7Ronuj2jbEB/AoVatGLrmpURsNk4K476wHfFCx3OpUXaDi9evclDl5GRFbOev0aA7KbDDR0PevQYy/4Y6MRX5x/ASA+4FckPoRBdFlel1VjExAg1nlw1I6KUC1HOXUMLY0B/0gjk0aAVk3m3r+cjJ7o4knfZcm1T3slB5RDF2mRNSHklDB02uvLmM4P33xh9BzlPrvTVw+Vdm9T4QpMbYsdzqSDbhIfxVBmi8Ls5O8rfEYVl/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oR778htMkVXjY3Pu8u3zYpEV4i3mWgofEFUvq4swY78cl3X1jKkp5UOIh2Ny?=
 =?us-ascii?Q?6v0yLj/kuNTav7GO8HOWUtuhHHI7g0KZS6eydaiIyc7pru5FfkxKec0PidUW?=
 =?us-ascii?Q?jtxBg1Em0BkG0OzBzdiSiONBKfIcmaTHbIe8IGGPst+WCl0p+pR29zYjtEn8?=
 =?us-ascii?Q?22VeWyQq2ixwJEb0pOgiInYs0MqnHdWKvt1utmmyM+d3u+BIUZGUemQlD/hT?=
 =?us-ascii?Q?USLCOQycsx2GfQFW7ETYe03zg+kH12marFv2LCYLpN68Tqt2QW+D2VGcHa3T?=
 =?us-ascii?Q?fF0RhRVN3qYiRVRtZRqURg85fht5gIb8Y0cjBxZenw6LfOzbhdaxW6fbR9ww?=
 =?us-ascii?Q?VgELxu7a2szvR8QdpW53p8rjjroRa2rCi+N66XW8se1DHMi8Ud5SPTIyZTgd?=
 =?us-ascii?Q?VWKpB3u40W0pZLESXazdiF80fBjEdr1gVAjFUbLJ3lH12nAdDOj1sWU0DQPa?=
 =?us-ascii?Q?m9dRnNp6ZPKzzI8c9S/EHVqF/vBTA+PvOHpxek3bq8nh5gowi9EQUWz58y/h?=
 =?us-ascii?Q?QfSmQMt33f205CF0aLi9OTyeqazMlrlJSgAAaJ9juw5SkGX0pnRxmQAvTsK0?=
 =?us-ascii?Q?yxmAlFQZEQMclckiHLp/+SQsFgQWjqr0umjZ+stDctjmpmYzwlnHeJC3sHOw?=
 =?us-ascii?Q?YU0A2ubmrYAX8uWPotdksRZZ2QRt0FrJkAFBdJF+53g07nDwbTi20uc5Z/af?=
 =?us-ascii?Q?S2osIJS3YFnmGlQfuW16qxdQe85ZYkVeMrIIpsp1iEGRrkoQzWJAs1oUs/Z9?=
 =?us-ascii?Q?AUJcoYqhkVfFAELOWhXLQaJOqPuAhlf+Fj8PUEGHdweAgqVNI1kEa7RRgYDU?=
 =?us-ascii?Q?6zDS3+9U93ZlZF3Kz1HdTlb3omyjUc//pBSTcN2N5twVdKYePRt3ZhRGZPBv?=
 =?us-ascii?Q?7Bo6p+4NIBssz4Pq19Uk7bY4v/hy9uAlo4RTISDrPLOS57bLakYo0JoOW7ym?=
 =?us-ascii?Q?Z4EcdEN9snzYZx8e/lBSLV1d+AeB4jWRflS+/bOTyqqVvPZMtsU4x6h4dJ1M?=
 =?us-ascii?Q?tLbwdcR4ivYVEtm6bILEljIYoURLCvj655xQKHKNd/TUQUSGSgumrhkgq267?=
 =?us-ascii?Q?WdGeXuk8AT3n0fHDSrb5QXRQocY8IoOsWFE4oRrh+o5t+hdfMATgXTUTJlpM?=
 =?us-ascii?Q?H+xRwfIc7UDKXtpcLeiNTWc4egI7AbTVeJY85Pqg7le9OZzdN0kUMFUSl5cq?=
 =?us-ascii?Q?oRsf0z9vu8cX6v6sWgYZ3puI2pjvYXnjyreVXI3XuXZt6ISl28qtsqTLnIPi?=
 =?us-ascii?Q?XhNbNjkWLgKH82pJHf3hUl6rJJDixndK/a4Oi8xzgZGnmWNar/pE6tnGSlKp?=
 =?us-ascii?Q?Jl8aDyuPr7nKrSgi4PYxWVuNGAi7qDXqjJo9FXDNCeSEfr/mqj40V/A7kY6E?=
 =?us-ascii?Q?jD21SUpEN5xT8QNa/GPRqj+w1HQkW4FmeNmNScCkQPNz7rZadDGMInbrE3C0?=
 =?us-ascii?Q?J+bMEbAgUP+/bKu/FVSr9TgqJR06wjXXxf71ujz0UF9H3nExL1xO48CU5toy?=
 =?us-ascii?Q?IkR377k1vKBdZDT8DwQxwrruo6Pkhz3ddX0Q0BsPPo2srjsSVfyYUZ1fldEs?=
 =?us-ascii?Q?oRSxBRxfFX1Yz/lhCen8ZJE2c3PmLoCN/g1bcZEakIaT44Lwswa+5ExOorOA?=
 =?us-ascii?Q?x0yNEeMYXyUPr1Zda9YWRwSmG6TUY5D3rz4hqAzfa/pBwjllQFiWXRXbiRvj?=
 =?us-ascii?Q?L1yDfsa/Vw8VZdktC5P9qscANdYQKHwH9EskwrXG+BTTZPWXN5ed1Pvpuv3H?=
 =?us-ascii?Q?8Razjn451R07nhxS7QKLWKPwaqSKmRhJ7iCoCv7XPHa2O7BsVRqE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2947f83-b870-4479-21c0-08dec6f9d4a9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 14:09:05.3726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ar3St8jZ7tQb8EgBPaF3bAZ1KJ+k4lfyQdu0LtoIQ/BmnvDe2+W2/yTTjP6S8fq09jEyx2oxAMmtrF7ZyfTEwQyfvB71gofQEnFk3nSCB629b6QXvR6mH+/HAiKTpLz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8702
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8552-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alban.bedel@lht.dlh.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F243366A213

Hi Alban,
Thanks for your comments.

On Tue, Jun 09, 2026 at 06:54:29PM +0200, Alban Bedel wrote:
> On Tue, 9 Jun 2026 16:46:36 +0200
> Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> 
> > Hi Lee,
> > Thanks for your patch.
> > 
> > On Wed, May 20, 2026 at 04:22:25PM +0100, Lee Jones wrote:
> > [...]
> > > What happens if fwnode_property_match_string() returns an error?  
> > 
> > Agree.
> > 
> > I think we need to check index:
> > 		if (index < 0)
> > 			return ERR_PTR(-ENOENT);
> 
> I don't think that's the right solution. The documentation of
> fwnode_property_get_reference_args() says that it return -ENOENT
> when the index is out range. So it looks like the OF implementation
> has a bug.
> 
> Looking at of_fwnode_get_reference_args() it directly pass the return
> value of __of_parse_phandle_with_args(), which return -EINVAL when the
> index is out of range. We should rather fix the OF implementation of
> fwnode_property_get_reference_args() to respect the documented
> interface.

Maybe into of_fwnode_get_reference_args() first thing to do is to check
index with:

	if (index > INT_MAX)
		return -ENOENT;

fwnode_led_get()
    fwnode_property_match_string() -> "led-names" not exist -> index = -EINVAL (-22, int)
    fwnode_find_reference(fwnode, "leds", index)
        /* int(-22) -> unsigned int( index > INT_MAX), fwnode_find_reference takes unsigned int */
        fwnode_property_get_reference_args(fwnode, name, NULL, 0, index, &args)
            of_fwnode_get_reference_args()
                /* index is already unsigned int( index > INT_MAX) */
                of_parse_phandle_with_fixed_args(, index,)
                    /* unsigned int(index > INT_MAX) -> int(-22), takes int */
                    __of_parse_phandle_with_args()
                        if (index < 0)
                            return -EINVAL;


Not sure. What do you think?

Thanks, Tommaso

> 
> Alban
> 

