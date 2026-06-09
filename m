Return-Path: <linux-leds+bounces-8539-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3zcpLporKGrw/QIAu9opvQ
	(envelope-from <linux-leds+bounces-8539-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 17:04:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FA66180E
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 17:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="Fn1/bJO/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8539-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8539-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 977603047BEB
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 14:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6BB3CF206;
	Tue,  9 Jun 2026 14:47:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D91B2D5408;
	Tue,  9 Jun 2026 14:47:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016422; cv=fail; b=GmPW272UHz1o0FPcoKhvkq/vzPovHnzRdjxV6tnn7mvsVvz2+ur5A0U837Q7IYRr2CKDdWOsq0tMNdRWM+Ip20AuN7MLiFlR9FzYnXkwtYK+mt/lrjSNnUI5f05FAqafcI2JXKuUPKgg9/wc+vbHNaa/38/u7DG2XPD1SMGUNJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016422; c=relaxed/simple;
	bh=hIv1/zmxxV5C9Lac2IEUHWjQhoVJZhsCM0QHkdf4GOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iy4fWoN8MFAZoIYsyG3lqneUrUx/zj2nt5LdxVKI4bVH3IwkNr6B/PxuJDxhnW80c1OgzULY8CPjkKixEsrXHnZiIP3JWq6Tg3RimZR9dRipBFPHpyUWcdqZI6TCyBX/FXpKsCjAkiZZ5t6hJmBKBANCFYkI5GjnbphdbOr5hiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Fn1/bJO/; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHqA5wMB1cyZ4tVlLEXhB4LjMk5uKfzEFQ1hrlED8uZP6X4I5b7UiVi8+DEDSxbZRm0uoCKt6y+hMjqgzcbL7noVIs2TnoPqYgyiymY9K5PumOMe2Hv+5OUFMt1O6ak4TxjdF5KUtXy3xEl6F6fhg/bz77815LB5BmVH5XCLI726i8Mwtt9C18WWUq71U1gicaok2vmb3iCI9AQiUqaW02d0lTaAc/W2kzifo5p5UzAn2jjU15vIkiOoXaYxzu/x617BzXUks45oWv+tyiK+sE3DLT8AyHoLSiIh7InRzUUbSuigDq9/ikF9NHJzjdCphd/glRM/L+j+JwRfAp5qRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yedCPGNk3PIa/IGlbz6GG/Y2cIWl9ZerAOQjLAD+X8o=;
 b=qdFNIfgi66SnYYC9uPvQH5W3u8nMJIXOJQm+5TtQ82hPZuRlKzfoOkqyQrpbLOCE13hGVQrbsHWXNjg0eLL/7pQLo54kj3dasP4Zk5eNKs3j0LROhv7qF31EXjzz44v16Agi/tAVFDjk5yvo5/vd5ipXHEftAXbbx6ZFAiT+EycILyaOVi5Tt3ga5VReq437oNhBF1fqXAuA7Xc8eu32AhPGf9xA5UGWNwsVH0lJmKtmoN7yg86T0zpOkN0GZs8vgpDu1GoqPN465upKL590PjKlGS8OHzZLcCUYZ3CuOwsLpjZBz62jwv2QqTpN0/ZizEcC1VflKu8MdKK6RR/dfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yedCPGNk3PIa/IGlbz6GG/Y2cIWl9ZerAOQjLAD+X8o=;
 b=Fn1/bJO/Ufhqr0PNiBDWoR07/MCEfjWlXTXDJCcklhzUIilYCzDmguRPhDoSsRbuuTW8iMh1UrgcmfteyyQ8UfYDSabMtPZpMg9AnVQMJMsnTexs2Bf67RkH9freBbig5l6tS66CH8tminc+KJP7GYu6w3Ipz6ZJb8L7K0nwtqQ=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB17841.jpnprd01.prod.outlook.com (2603:1096:405:34a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 9 Jun 2026
 14:46:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 14:46:50 +0000
Date: Tue, 9 Jun 2026 16:46:36 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: Alban Bedel <alban.bedel@lht.dlh.de>, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: class: Use firmware nodes for device lookup
Message-ID: <aignTNlK5kCLmQ2A@tom-desktop>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
 <20260520152225.GH2767592@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520152225.GH2767592@google.com>
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To TY3PR01MB11948.jpnprd01.prod.outlook.com
 (2603:1096:400:409::5)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB17841:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe71076-df09-4aea-8b81-08dec635f06b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|4143699003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	ACNt/W3PRafyGhH8N/OCnIYvfZfUNTxzzBHq5zITcP8BSWuaWnCDyDsTPGNnLcX2z2b1YPwDaEEt3Vz3YwpnfInUZY78ha07tTS+YrMLJ63hSqRtCcq2gEyRu6nYrvSPC56uBpzl/GzXUAGPOZe5ZtQOF5LjNHExX9o5/h1b27rggwm3r8ByplFvXCJ7C8a/fPHJ1bSNjC9NEHAudtpkZdkAlY2hn+xqodVdfWYtuHm+yEdqpYDqH5yIuxfFZC+PaC42Hd8Fe+fBNHInnAMMd28rs3JXNQUZnXCaTICC56jS0D3KYZCGQ/p/R6ekGDoW5c5hX8lRptId4/CB9YJYVbtTDsr75OCwUNtqDBrRcQNWM26WN8yAxzSDfzL2vqH2Vlla/rHGYZ0j2ILoMLhp3RMP5BEWylaYMfiMkdIG7+ezzaXFvhLiaRgiGbD6s0IGBDBMUimIliN35ZH4lV1h3s+DIVUFT0vYfEejQzwvxRC2khMLfhw7QxC6Cxh4mSCxrXXzPVNp6IZKY2kpDpd2XLkAXDYDqUXQ95VaWDZv4eBX1fQobsicXtm9qFrw62xkmLJyAYew4Wo7h4A4z+1g2wjl3JZYY3JMsX7ZGDN1xgCdSpXryQYNwLrYUb1zkkHuHWlhuH5ou3nsfIlUCH5c/h9p9DuauZkxkjf1wrzhtxJRu3avTi5E5EPWOkPmL2Rb0fJ6lyAHbUQufX83tJXRQZzBTVY0Q/BB2rH3NrzlNn5uVERwYOV9MlC0isVQKm+8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(4143699003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n6vOz/3clPZ3W+Bewp4e9wJdXr8mkZCYyo80Ue12ux3q7J7fBZNfQOSvaCMI?=
 =?us-ascii?Q?7CtyHvmml4tcf1JTyu4HXqOolY4gb28ROr0L8soR9QwUYyqVg+B+1GhOjIV0?=
 =?us-ascii?Q?S+HqBhD8iSj8sMAzXAYS+Lt4M8HbcYbzb5P7LGZJ0pKK6xoonO/E7VKfBq67?=
 =?us-ascii?Q?fn5wjqVUCvnw3ePx49pAfkLRa1kCgb6NRTQV0GQPgyffVM9hclaK/tmaQJe1?=
 =?us-ascii?Q?UEqRK8nvHsg1DxaDvB3C5vxAoXZc5aXbAkywaQNz6xvU6jafXIkWdgOmmT4z?=
 =?us-ascii?Q?EW945k6H6JhQ1AzRDvl/FKW68/zC87s5xjtwHNBH9peCvPDXEtPGXKPFRfve?=
 =?us-ascii?Q?LMvSSuh5aBUdrKObDlaoKbvVo73JudbCJQsKw/Uow3J28lSaacy0fd0GG/QT?=
 =?us-ascii?Q?AKuiF20Aj59LvGNWCG2uetpH+nYv7dDhfcuGON5wtCFPz4S2d31SZfcGr0JE?=
 =?us-ascii?Q?vAqUSZVlscdn08hsjQPhQX/vm181wJi4ARHxy0N+S9zBD0FiPACq59WScMrk?=
 =?us-ascii?Q?6Qtj80uE6HJ+xl65LgDdI2m/Fx7BQxou+pzIJ3aqHhlO6pQiNqqNoAFffGYh?=
 =?us-ascii?Q?HECBm5pmRpluNiXIix5ReU2HC2yTDX9qtag/Yj4ljuSuk3x7AGDMn6Hgbafy?=
 =?us-ascii?Q?z3AVlF5NsN8BNrhIrvc9qWn38zyrMsFuAx+56CAmF/C0owhEXFANT1VwcmwY?=
 =?us-ascii?Q?2XEWqG7K47wFqcOUJGdhjbHQzdV+dVgCgmNSNb3H0HFZkJJ+n7z8FYhBFIfU?=
 =?us-ascii?Q?47pSs3aCtIOqaJlLfj72VOb2mvft8HtOOjry/aVQba3byMKPEvzyHlkx2iBO?=
 =?us-ascii?Q?vyEQyfJmMYs/YjTmKvd1/r7AHTvE3W87cHfRvsRqeZguNDT04ipUqQhBrn+h?=
 =?us-ascii?Q?Bkl5Mh5UYa7uDh7QZhjVCJ3bcuxGLzSPoqZVlwAkEbGOE5Ijj9FqIAnelNP7?=
 =?us-ascii?Q?K1pUohpl/X4Va1KBF2hvZqfA6Pu51x6yUy4t7pSaOBRImB8Bio+xNbrNEnPw?=
 =?us-ascii?Q?R3rUpsOsc2nADTtE0W0H4rAyXHbr42lGYNU3GPg/6aRL0Bpchf0T0wyWwUtr?=
 =?us-ascii?Q?mRDKpDblCb/PC4fBtFkeHIDKGYXLO6MuNT/N4tejB//JlP8rG17Jz1VKKbXH?=
 =?us-ascii?Q?q63hYTzPLi6GPAceVROq+VS5A6FsVlGFQG0+h1s7OAYnYf5QX6f5TdXXz4Qu?=
 =?us-ascii?Q?R0OvATL83RKnRt1//RxGBpuGeLFuQEEmBrS5HeYt4SfFdJZbu4UyZK/ZctN7?=
 =?us-ascii?Q?7pSLN7C+kLAzoYYT/hnUT5mgzbUopX0tZ5G9gwUQZivbCRjhOZeK0lVl3n3u?=
 =?us-ascii?Q?TVjm6omcgRLyClmmribYntyBAsLVRN+l/7vnmRclEbQwJgvvZkbiYdccA1x2?=
 =?us-ascii?Q?b1ZSOkl3emEdJlPTTmOvHBwV4xf5cpHwGU4Z8EsG8Lkr4rwBX1mDnqiMWyu8?=
 =?us-ascii?Q?HtB/23RDPQi5yyVQYs0pTrA+jEYus71tFAoZ2bTDxgRIgf6zbGo6CTomZhu0?=
 =?us-ascii?Q?6heGdGRphMJO+blgCHgzdbEeNQAnD3ITVv7dphqpTkxkzN+e/gqGNK3XWPcH?=
 =?us-ascii?Q?DwWwAiHZ5+7DD2iqldhtAtat3BuhVN71nuqeokxwc5tpOJGy0JKmrSf+o1qt?=
 =?us-ascii?Q?ngvfSXj3glkHICSl5mkdAzh98qWlAycrET9xmqUnWMNq+xJOcKjoT7T3n8Qm?=
 =?us-ascii?Q?AqBb9ilVzcd8X/I+FOZMi+CEBt7MK3A714JDZ03hUpGKoiANOeWdKngweX5b?=
 =?us-ascii?Q?N3YqPwMzJMznqsYFBqK1nk5QiYpideYV9sYQMO4jLBEp+FkCSS23?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe71076-df09-4aea-8b81-08dec635f06b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11948.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:46:50.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1sXcQ4gkmUY3bDBdRmKNdVeocay71F5AFDxbnQ6ah2CHgDZ2HzaYMcqxgUpd7YatZgHUpllUydhwmufS172M/rH2yEw7/T69zzEaKoXP8WL9uaPdwuaiepFL3+nE9f8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17841
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8539-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:alban.bedel@lht.dlh.de,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,dlh.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C5FA66180E

Hi Lee,
Thanks for your patch.

On Wed, May 20, 2026 at 04:22:25PM +0100, Lee Jones wrote:
> On Wed, 13 May 2026, Alban Bedel wrote:
> 
> > Replace the OF based lookup with the fwnode equivalent to get support
> > for ACPI and software nodes.
> > 
> > Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> > ---
> > v2: * Keep the doc string
> >     * Update comment to reference the function now used
> > ---
> >  drivers/leds/led-class.c | 30 ++++++++++++++++--------------
> >  1 file changed, 16 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 9e14ae588f78..a17db3d6644f 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -249,32 +249,34 @@ static const struct class leds_class = {
> >  };
> >  
> >  /**
> > - * of_led_get() - request a LED device via the LED framework
> > - * @np: device node to get the LED device from
> > + * fwnode_led_get() - request a LED device via the LED framework
> > + * @fwnode: firmware node to get the LED device from
> >   * @index: the index of the LED
> >   * @name: the name of the LED used to map it to its function, if present
> >   *
> >   * Returns the LED device parsed from the phandle specified in the "leds"
> >   * property of a device tree node or a negative error-code on failure.
> >   */
> > -static struct led_classdev *of_led_get(struct device_node *np, int index,
> > -				       const char *name)
> > +static struct led_classdev *fwnode_led_get(struct fwnode_handle *fwnode,
> > +					   int index, const char *name)
> >  {
> > +	struct fwnode_handle *led_node;
> >  	struct device *led_dev;
> > -	struct device_node *led_node;
> >  
> >  	/*
> >  	 * For named LEDs, first look up the name in the "led-names" property.
> > -	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> > +	 * If it cannot be found, then fwnode_find_reference() will propagate
> > +	 * the error.
> >  	 */
> >  	if (name)
> > -		index = of_property_match_string(np, "led-names", name);
> > -	led_node = of_parse_phandle(np, "leds", index);
> > -	if (!led_node)
> > -		return ERR_PTR(-ENOENT);
> > +		index = fwnode_property_match_string(fwnode, "led-names",
> > +						     name);
> > +	led_node = fwnode_find_reference(fwnode, "leds", index);
> 
> What happens if fwnode_property_match_string() returns an error?

Agree.

I think we need to check index:
		if (index < 0)
			return ERR_PTR(-ENOENT);

If not I'm getting:

	[   19.008923] ov5645 0-003c: OV5645 detected at address 0x3c
	[   19.014903] ov5645 0-003c: error -EINVAL: getting privacy LED
	[   19.020725] ov5645 0-003c: error -EINVAL: could not register v4l2 device
	[   19.028611] ov5645 0-003c: probe with driver ov5645 failed with error -22

While testing:

OV5645 image sensor with Renesas RZ/G3E:

	- arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso

Kind Regards,
Tommaso

> 
> > +	if (IS_ERR(led_node))
> > +		return ERR_CAST(led_node);
> >  
> > -	led_dev = class_find_device_by_fwnode(&leds_class, of_fwnode_handle(led_node));
> > -	of_node_put(led_node);
> > +	led_dev = class_find_device_by_fwnode(&leds_class, led_node);
> > +	fwnode_handle_put(led_node);
> >  
> >  	return led_module_get(led_dev);
> >  }
> > @@ -332,7 +334,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
> >  	if (!dev)
> >  		return ERR_PTR(-EINVAL);
> >  
> > -	led = of_led_get(dev->of_node, index, NULL);
> > +	led = fwnode_led_get(dev_fwnode(dev), index, NULL);
> >  	if (IS_ERR(led))
> >  		return led;
> >  
> > @@ -354,7 +356,7 @@ struct led_classdev *led_get(struct device *dev, char *con_id)
> >  	const char *provider = NULL;
> >  	struct device *led_dev;
> >  
> > -	led_cdev = of_led_get(dev->of_node, -1, con_id);
> > +	led_cdev = fwnode_led_get(dev_fwnode(dev), -1, con_id);
> >  	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> >  		return led_cdev;
> >  
> > -- 
> > 2.39.5
> > 
> 
> -- 
> Lee Jones

