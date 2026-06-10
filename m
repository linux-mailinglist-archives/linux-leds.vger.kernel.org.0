Return-Path: <linux-leds+bounces-8560-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TttJOt6WKWreaAMAu9opvQ
	(envelope-from <linux-leds+bounces-8560-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 18:54:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04266BB8B
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 18:54:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="n/Tadox9";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8560-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8560-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD30304BCFB
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED5C31D72E;
	Wed, 10 Jun 2026 16:48:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47DA2D877A;
	Wed, 10 Jun 2026 16:48:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110107; cv=fail; b=MrvzjaBFWpRbIihCkuJkgNJa3BGd0xL3AvR4rvI1RtJSyrwK69NtsLTDh2dXnUnVl3XT/ZOgBByXVTsMfRfMP2nbrrW7wD8N02ZkLiq9b3lrVfe0VID0pexbbBmGFb/KD2+yifPK475twzHIek8enc0vpxEg+YupWyRwqzsYFmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110107; c=relaxed/simple;
	bh=eBqOdGMf6ofcYzsVMwah3wCuQCmbA9Iy7GLaCAM+IRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uMDhBoqh3LoNi7g8jjIALGEwmi5d44UEb4rmlrkEtSMhBe1vcGz4BJwuJuqXXi76gLMlueSB85s/ugSQIPQmkqxC8xUVSjKqUZhKJdnza9w7HehBCO7cHw2rFqkpssfE8EdR1XIR+ZGN/GRRqFTIMZm50XZtYmLtxoWxuIztuzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n/Tadox9; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYKhbluxNIzG9cZNPbsW1CsxoR086vYqd0J0dS3yGwjcDIz+6VAB81yqxQ9+23z2XOkoHylxQGVQZkvQJ4TNF1M8sYgp9awfVYgceiUXo63LWDuCChWSiLNS6m+Xxr95vr2IfA1YsHY2oHawHLbW3T7jaXJt4ERmLUZxIWH+D+fGrBBNsRbMmQu19l5mvmfNBV0ACV/CipcX3VfK/hc1HoonHWNwA1x7Ogn8yI2L1jKeO1oOVvF3MjTOKwAJ50APkuFSBd7prj8MYMJA9t4i9wsd5+0vw/vZ3O3vT3cskVq4d1iF3wHqm4N9hx+KV/Y2TOjH3hpkPmaGER53uZ8yiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFLwuZF8WjfXowRgjR3KATdABXuys1fXY8pRxMmoZus=;
 b=jUfP98L34AhjOgP1vTZUM+rRa6v4G3Q4C+zplmzY+Iwk/+bXV9egURXLTGrQcD9ZE6fyomJtc6bNo9EvxOVcCIs4I/vRgWnHmgiSxgQo+ntnEl1apwVUFyIIA91CQrHwX+lVODFKgT18cDsBJxIMENUazDBxfd7iT+bZn9etePr6xTpA6oefZ8reWgGw/78Vd7KItTgB1S0LdAWzrYqdXgtirhpssAkCyYGCCUVD5YYyaOQG4Bc4iMbUFKUnhIodM2rOaTRDGPW5tz28zQtZI721XuN69KKZI25ddZris+Y0Udf71mNo3H+yJoMw3qCiVKBT01ntMWK88mC0jNFxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFLwuZF8WjfXowRgjR3KATdABXuys1fXY8pRxMmoZus=;
 b=n/Tadox9Q9jgvlCScx3nsnAvpurHTDKI2jq7WpO/F42EEUUsEJAulosrBpdQben4N96fj8gGq5+q68cntVj7qpNKCLogc7cFwTb+Y9MFiFWuZL40smreeUbhWVn3fYyQY1IVkjFOqwzxRZgyvG2h5BYrAlgPxcVBLh493lWjsk0=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB11674.jpnprd01.prod.outlook.com (2603:1096:400:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 16:48:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 16:48:22 +0000
Date: Wed, 10 Jun 2026 18:48:07 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: class: Use firmware nodes for device lookup
Message-ID: <aimVRwJPhlGxsIUj@tom-desktop>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
 <20260520152225.GH2767592@google.com>
 <aignTNlK5kCLmQ2A@tom-desktop>
 <20260609185132.1fcdab00@omt-cwnxr4tfw5-lht.ads.dlh.de>
 <ailv8Yry41NYu54e@tom-desktop>
 <20260610170541.5d3b20d3@OMT-CWNXR4TFW5-LHT>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610170541.5d3b20d3@OMT-CWNXR4TFW5-LHT>
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB11674:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2b6f0a-fb76-4d4e-a88b-08dec710155d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|18002099003|22082099003|38350700014|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	qgFa/mH0MVSzvo86fNhfK15+W1PaYRiYAkVukAbWJEWXeSr+FB1qJ06+PxSqL86B4iLxt8R828Wmef00E+OY2g09nYroSKmSePLc6/cPmxecQnP0saTIemO1susz0qS84EVyLWCHpVGzLVYLvw7FPVD4hhO4VK2YuTnWY+IC0xyJsYUoOggkNtoqJ7QszsQHQJFhWfE7gCVrua6ji/xFU6OhJH7jTNEaZsixnZ5SqL3QGRqVrT04wDfFxU2GfNRPNJtlT4yOAQbhXKbqLkQBmMSDjI8NWTYQJ8pW3oMg1CC6DJSdSnEN17HwiSYJCqKItGvi/2XYt/YxIxwkr05DgSIGRB2ms1k8/c/oUDIq4fq1PL01FNlMOcxzeoHeWMFBbAuOpdz6Vnp07RcRruzyxXXaOXZZEPZjs92SSKHFsmyj41Ms2ObE3MZSuWgM/xTy2VufVHK9Sx/RBAmdUWcQjgvSN3QWhqBqG+1wqenG+TxNZNB/mGVMDi+3A69vyv9tkCYmjYQI0t13TmoRuwzVXNaMSZCvHVo0mNiPdIHy6nHagNrXMvsV1foUnFg5N294uv8PGpsw8NYPltrLdEjzaceJERWBbait7eoULzMoE/HBfasg70lzFYZ9tNq+D2OzON0782Ri+gnaE4uPFzDUF6dQhCyeEVkqtrnhkl8AIm6KMkTuqdNS/CvgnPT+UQy7BmISDQlAm7Fz7trnKmqZOWO2Jk3QSXKMYBFocucygdZCpvk3v5BRJ/zu8afyvA2U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(18002099003)(22082099003)(38350700014)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rQ9Gk4LCJdKJzmLitShnPQ759KFOTBvtIvRu1nTMbgfNAbrsONH6q043sn0b?=
 =?us-ascii?Q?UkN/DWTEQ3SylAi41MkRQytOrfAeDhf9cs5UZxY1cG1fGOB0Apgx8uT9ZqVl?=
 =?us-ascii?Q?zhlue2wKTfNjB66YXsKKdnYGCZrPd2rhlFG2/ilGdr8X3byrSeL0CdSiIwyZ?=
 =?us-ascii?Q?jZMmrgTDPHMtmb+INWxpNBO+06LSzNi1g4ycF7cVTVSmxEfc0nGVUT4zJIaB?=
 =?us-ascii?Q?DVO/Gg85EEw4J+huVD1z3/WgqmJZTIib4Rs+qvIawryaCmumZFtq2nnLvJJM?=
 =?us-ascii?Q?CT+NUpnHBqZ69Nw9aL1WihDrdtY6cvRI9jUNS6b2jq42Azb/8f9cAIExiUNZ?=
 =?us-ascii?Q?fdHxVIrBsjM55Wf4sx2sU+xJeahA9ctvuhjCh63rsLdmAFVNJepDMQMP9bh9?=
 =?us-ascii?Q?o3SDANgi6PdNQj9xcEZuzZfl7uH62mknxRpQXgBY52FhrZCkzrZuL3SogYWw?=
 =?us-ascii?Q?iBARUOD2xJarh0dRC0h9QMRsrKZ7gkuAlnzGDMZKqD+yISeQpmVNEFdEtxdU?=
 =?us-ascii?Q?ApYBFRBm3/r4L8tQUo48K5UnZY9rj5R9v1rko5lAhkvegx0lio6979f6uaof?=
 =?us-ascii?Q?7mGKynfJQ+fYM430C5z9MuaUQJwkUoPp/NMZXmkvrl6WyPyXjA0x1Pw/LdxP?=
 =?us-ascii?Q?Iq6l1TxPzAOMPH9a7BPemydtPmO2qiF/dwAAABGtaSn/ExKJSMin2UX5avxA?=
 =?us-ascii?Q?jPdTXE8s/pScfRtyjn62t1aq8JmSpHrB7kLlVSFU7uTpZaGFROABcRZNK8+g?=
 =?us-ascii?Q?UN3l1IxK4QGMDgMOLPmNBZBbX+9cv1YyGM+3JAFrnP3icvyA3hQBtX1AVpZv?=
 =?us-ascii?Q?qWgGQqP43fiHUu+sH98W+5rpQ/gfm0+B5rvSUkdY2o8o988XRSsLT0Zp+6Y8?=
 =?us-ascii?Q?V/y+dfSbHDszbh4pM+Jac3BcXiI2FA0fmJk4pnc3vFn140QdQoJX070vb6iI?=
 =?us-ascii?Q?zce4GBtliKhOsgq0gz9528ExbD6qUFOgBXrtZBAkvQ3DAYzTZ1PswBOD6ybP?=
 =?us-ascii?Q?Q9FRzTTnmgMnMc5Pzq1X25lIHZOkqH4Z1pmGwiAe/wIAsu0+iC+05z+A3m0t?=
 =?us-ascii?Q?FvJKYw0wYoGPwbV7lHCA7kRIdexgCNgtO69OYZWe9vMqVnjo4BbFYmfpHBxi?=
 =?us-ascii?Q?SgKU1EkD5p4eokg2zXaVkrknY3cMIQaAIRJ4/uqlmYrcJH8wy5x0vfH2Sv3o?=
 =?us-ascii?Q?7A8qN363XfBwB9iv3p7VtrGNVN71KxPKPh5xO61YCxXQ9kibhBtdQ9MkaVTc?=
 =?us-ascii?Q?J1TA4nKnN48B2B+t3N5nHjphbJ6poBMXrMtcqjhlt8NuEQLCPZZo3jhkfI2n?=
 =?us-ascii?Q?PhlLRa+uTujwWp1H/c6HZC4flwVBJVoX2YnjJchRYfE9K0UJDa7Vpk7gVwCn?=
 =?us-ascii?Q?OvbMS+UTPTV0FKrzJvafG7DfvzHyN2S498VylTdCT5zUxfuiyWyeLfLUp9gA?=
 =?us-ascii?Q?KUwLw45WAYk1TZK7EY5gXu8L2TBLeUWsxF3gMtTnhAtfOJInGq5jrD0BXJTf?=
 =?us-ascii?Q?xfwTs/aV2lcz6NW4g2yhuWBRrY6WYzr1OyIzHzgHFs/RXBto0w3qVBSMwkNA?=
 =?us-ascii?Q?1PgYR2ppWcZV9MRAXZ8Hctnb/LxkYpko9ZDRjJxdeNBfApZSVvjoI1K/Fwkg?=
 =?us-ascii?Q?EuN3GEnsVlBfij48t7hDZx3sRMWJxURbeGWJ4oldopajH6RyxOUHRTMNi6BP?=
 =?us-ascii?Q?ROSAdLQzjhLN3Iauq7qSvDdGUskFZM3SQGNaTEVqLv6OQKnHokRjIgb9HHK5?=
 =?us-ascii?Q?phstNT5d+P5LDkzeLmJt2iCWg5QE+KnIVddkYX4C10EqYDkgvAb4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2b6f0a-fb76-4d4e-a88b-08dec710155d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:48:22.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdY6L+oyfNtJVSRD1oBrGKLj8f/ZZkKFLsPxIGBdCanOQ/f4ktW7UF+upC7caTwkhxiM6ru/ecbb1wTMisk6HxKKiTYv2SZSzskHC95taXeq1oZlMawE0/NaCfdVK5wx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11674
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8560-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tom-desktop:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C04266BB8B

On Wed, Jun 10, 2026 at 05:05:41PM +0200, Alban Bedel wrote:
> On Wed, 10 Jun 2026 16:08:49 +0200
> Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> 
> > Hi Alban,
> > Thanks for your comments.
> > 
> > On Tue, Jun 09, 2026 at 06:54:29PM +0200, Alban Bedel wrote:
> > > On Tue, 9 Jun 2026 16:46:36 +0200
> > > Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > >   
> > > > Hi Lee,
> > > > Thanks for your patch.
> > > > 
> > > > On Wed, May 20, 2026 at 04:22:25PM +0100, Lee Jones wrote:
> > > > [...]  
> > > > > What happens if fwnode_property_match_string() returns an
> > > > > error?    
> > > > 
> > > > Agree.
> > > > 
> > > > I think we need to check index:
> > > > 		if (index < 0)
> > > > 			return ERR_PTR(-ENOENT);  
> > > 
> > > I don't think that's the right solution. The documentation of
> > > fwnode_property_get_reference_args() says that it return -ENOENT
> > > when the index is out range. So it looks like the OF implementation
> > > has a bug.

On second thought, given the following call stack:

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

The caller shouldn't pass a signed error as an unsigned int.
I think index should be check into fwnode_led_get().

Thanks, Tommaso

> > > 
> > > Looking at of_fwnode_get_reference_args() it directly pass the
> > > return value of __of_parse_phandle_with_args(), which return
> > > -EINVAL when the index is out of range. We should rather fix the OF
> > > implementation of fwnode_property_get_reference_args() to respect
> > > the documented interface.  
> > 
> > Maybe into of_fwnode_get_reference_args() first thing to do is to
> > check index with:
> > 
> > 	if (index > INT_MAX)
> > 		return -ENOENT;
> 
> Either that or fix it in __of_parse_phandle_with_args() which currently
> return -EINVAL for negative indexes. It is used for all variations of
> of_parse_phandle_with[_fixed|_optional|]_args() but none of these
> documented their error values.
> 
> A quick search showed that the vast majority of users either pass a
> constant index or a value from a loop under their control, so those
> would not be affected by such a change. From the one left all the one I
> checked overwrote the returned value with either -ENODEV or -ENOENT,
> but I haven't checked them all.
> 
> I would tend to do the fix in __of_parse_phandle_with_args() as I don't
> really see the value in differentiating negative index from too large
> ones in this API.
> 
> Alban
> 

