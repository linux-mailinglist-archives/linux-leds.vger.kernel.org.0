Return-Path: <linux-leds+bounces-8603-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ROtNIYVYMGq4RwUAu9opvQ
	(envelope-from <linux-leds+bounces-8603-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 21:54:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAB6899CE
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 21:54:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b=rBMYUfAd;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8603-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8603-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 753DA300BCA6
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 19:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266193B4EAA;
	Mon, 15 Jun 2026 19:51:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F733ACEEB;
	Mon, 15 Jun 2026 19:51:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781553115; cv=fail; b=lAg+R8hok8da6iUuxPR9OqtPofz3fEEpV90G8eNi0VY8mBpRzoWFWRdP1NHu9rRhhVlCub2aypTU8Ruka48wkWrgyCDlX+Hr4rL7EiJUA6WiuPIiIm4/NwI6s9DVQRlGdjkvP3Wb6YIft8gBdlHOfmGzKxXDaRsrrE7gYa/4oPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781553115; c=relaxed/simple;
	bh=NlnLd+ugnIzJz6azfZaiC/etuLJFSLYHy8hFp5Ixt3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=esmvWmVhbKH/P2rptuURGumQUoTlKb3qGuTqVwGIESroHGUIYuQAYLKB8H5KZo1QS9RTyGXMa3/NPn+qwoaLwYtx7T7Qft2GvDzllQB7ZgcLMraovmiMwE1lVgR2PourgKt9TbmmfpzxLZAs/KiajKybR2a+AbO2u7NM0smhtqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rBMYUfAd; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8nTaPpkC8WzKLI6I1kHVCBGAOSnCNvGWnryB3wfv1BHX6hS+6qoFTM3R7A0ZOvfEzamxcNjZvXeL9Do9PV0YsczGnAWxH93yqNXkfE+C3A36ERRk48zQa821SOExC9BSrnOyCuFRNikv+6wR96DRMijYNBhUDtNfMi7SSwO8tPIzX1jz8FwNRnv3hicrpcLRWQlT5QAWowi3DX0/6eFbDPLAthYJDJfXXWExNPsy8Cnce30oIjHCm+dBaVnschg0UZdBNT+bQHkdVtkyM7X+VGAaO5kB2nQNlQ7IpUKokp2FBv3SYU6gudzfYO2lhj/YyLZ6s3Bqjk2cUDZB+b+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDeOwpAWRdBANqjw6XgMeY5weRjy5M+3KF/WJ6hfr3U=;
 b=Cxi1L4cFMAkdP8Ti6NZV7+SGZcXIOpwtHip6Ebdrzvf+83dTh1DPzmYRQyFfknWW3eEdWmGaiyCgLXM7B+R2y3VqbOJylHbHUZNo3ygXvG3vHbOlk0HkJ6VCbXLnLIzxAqOSlgS1Es6553bs6jXqkN/TifQ+AcO4oGvSEt9ftZSRea89xuFaaI/hvIqXjztogZxJROVFL/cPlStfEJsY6n15ysa+hDquMkZg5zT0c+/l+g40A8h77N/WwvhXIbSOd8/q3i6Jy8Ac7i7S9/z7B6+lMQ52NvjoueLzYzj5VIlwPJ5ecvijsVRBjCLpzeNeMDIWUNUOujxgx8gn8pezRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDeOwpAWRdBANqjw6XgMeY5weRjy5M+3KF/WJ6hfr3U=;
 b=rBMYUfAdBt4V0nTRQ3Ywp7b+s1dVQNELBIbkfs1ZzUASKUnWPLSbXJW/r5+sQRPpIJFFyNLKJl3wANec2lvOMqS1RWXgpBvJ79bwuTyU66jSflbt1c+YGTsYRHWokL32nynQoa69jog/Z4eKukArhnjkxR8XhsoJ3xKI61gVgcI=
Received: from IA1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::15)
 by PH5PR10MB997711.namprd10.prod.outlook.com (2603:10b6:510:39d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 15 Jun
 2026 19:51:50 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::2e) by IA1P220CA0001.outlook.office365.com
 (2603:10b6:208:461::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 19:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 19:51:48 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:51:35 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:51:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 14:51:35 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FJpYBv2610506;
	Mon, 15 Jun 2026 14:51:34 -0500
Message-ID: <0b39450b-559b-43d4-a1e9-bb6684691cb5@ti.com>
Date: Mon, 15 Jun 2026 14:51:33 -0500
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight
 class driver
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
	<linux-leds@vger.kernel.org>
CC: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, "Jingoo
 Han" <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-fbdev@vger.kernel.org>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
 <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|PH5PR10MB997711:EE_
X-MS-Office365-Filtering-Correlation-Id: f3259372-dbad-4573-5594-08decb1789cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|4143699003|56012099006|3023799007|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XXHIB/caL/fq+5c9Ih3Ee5uJNiJq4RN1zpmuFptpKCQ9pYjU37JsCuPKmSOFb6zlQOnk37oG6P5wvNhwA5praXeVkNo/UXDUKRQSwIVqveKRqiA+rBm66bmJoFr/JWt8SqYl2h0PB4Wj8h8VhAODbEJii99gV5Rxpr0OIEh54duqHVmekhudvdjBwIuhQNXyh2augcqfe+WZ5cIUXp6dyRBryqPUeooSSVd4RnH6ixBGEHghpAdU64TBkFeITPLXAhNcoZwx4BCD1Nx4s2z8Tg82BbDRCie7sEwRVjogB/lnLTIntmRww9evZz04K9bTP+vizlgff2PSF4qh+iJ5F+EtiywraeqxVlY++qpJGB47U3XvxoQLV+lBST6olkCsVbbEF7h2dald544CoD1YhP/dh1ETiCub0bsteRud7mBG0Z8J5OEoYDYgj49PbocMzKrF7rV7kyFqsAsN1egphX8QbxUHVssqRWlc6szsrwRbrt8qYjnxfWD4MGVLUXKnqIplAUM3QK/sc0S7WJ8oD2omxWOJfObkgMh0EBX6poEYrNhQLnoXxbCIXzDT62dqQ3o38EhZUqjJ/Z/wW20Gzhvhg5y7D253EM772fgPWHd4lfWOq6O+gSHO9ORbWaiPl/iNozcP7u+LYSjdSTof6KPPM/iyaOyUsYDtdDyewufXSUEKaQVQilX87gOon9hU9qI8Pj7uYiEc/P/H04bBWdJB8+fah05LbMbKb8Bhvzg=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xK3xJ+jVE6jE4CTMO/aM4pe6RyHTmr8yEDOD7Fw72dhXI54VDZV3/EUWxVQ0+Bpm25IpaIvgiNaP9Em6pGAK4NQQmO3yZ5mXq3OgqLI3G+YQ6E1kc1R7TwxhiLswjFoVBrPb3kSoQh7hzPHtSdZ4RIxD7p3zpY/cNHlJgz3tncJzA6EoYDEDIndsgW+Z8vEJnvYC55NVpSVDBNQOfWttpFJl+yuois0PgDshU5AaCDmua9BxDf1u+Z96J+obSZoLhCQjG9CgnkvhJ198t9F09tTrnSTEWSQEVwflV8jhtWIWHwfTJpu1idf5QSL+mpzO0rtALm2hNAnCWn4eksNw0hyl2nTDsyJigS7qFvs5pXMNSFJn6QbHLi1BLVXZlTpT0vhvOQPPWYk7HBrs/4i8cSdyoD77n8sXKZAMP+zj+wWV8gJmYWW9Lqx2KRuLASS3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:51:48.8766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3259372-dbad-4573-5594-08decb1789cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997711
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8603-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,siemens.com:email,ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime];
	FORGED_SENDER(0.00)[afd@ti.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:alexander.sverdlin@siemens.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CBAB6899CE

On 6/15/26 7:03 AM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Move the TI LP8864/LP8866 driver from drivers/leds/ to
> drivers/video/backlight/

Why move it? You can register a backlight device from any directory.

> and convert it to register a backlight class
> device as its primary interface.
> 

What do you mean by "primary"? You should be able to register with
both frameworks and have the driver interop between as needed.

> The motivation is a use case on a hot-pluggable segment of an I2C bus.
> The generic led-backlight driver (drivers/video/backlight/led_bl.c) is a
> platform driver and as such inherently non-hotpluggable.

That isn't strictly true, there is platform_device_{del,unregister}(), so
whatever your mechanism for removing the I2C device would be, the same
could be done to the led_bl device before then removing the I2C device.

We don't want to have to move every LED driver that could possibly
be used as a backlight to the backlight framework, the led_bl.c
handles adapting LED->backlight as needed. So what you really need
here is to de-couple led_bl.c from DT so it can better handle dynamic
add/remove. Then this LED driver simply could register a "led-backlight"
platform driver to handle the backlight interface, and remove the
backlight device when it itself (the LED device) is removed.

Andrew

  It cannot react
> to dynamic appearance/disappearance of the underlying I2C device. By
> making the LP8864 driver directly register a backlight class device, it
> becomes a native I2C driver that properly supports hot-plug/unplug
> events on the I2C bus.
> 
> Key changes:
> - Register a backlight class device using
>    devm_backlight_device_register() as the primary interface
> - Implement backlight_ops (update_status, get_brightness)
> - The hardware 16-bit brightness register (0x0000-0xFFFF) is directly
>    exposed as the backlight brightness range
> - Support DT properties "default-brightness" and "max-brightness"
>    from the backlight common binding
> - Include BL_CORE_SUSPENDRESUME for proper power management integration
> - Preserve backward-compatible LED class device registration: if the
>    "led" child node is present in the DT, an LED class device is also
>    registered (same as the original driver behavior)
> - Preserve the CONFIG_LEDS_LP8864 Kconfig symbol name so that existing
>    kernel configurations are not affected
> - Update MAINTAINERS to reflect the new file location
> 
> This will be noticeable for applications which already used the LP8864
> as a backend for the generic led-backlight platform driver, as a
> backlight device will now appear directly in addition to the LED class
> device. However, no in-tree device-trees reference this driver, so
> there is no mainline impact.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>   MAINTAINERS                                   |   2 +-
>   drivers/leds/Kconfig                          |  12 --
>   drivers/leds/Makefile                         |   1 -
>   drivers/video/backlight/Kconfig               |  15 +++
>   drivers/video/backlight/Makefile              |   1 +
>   .../backlight/lp8864_bl.c}                    | 111 ++++++++++++++----
>   6 files changed, 106 insertions(+), 36 deletions(-)
>   rename drivers/{leds/leds-lp8864.c => video/backlight/lp8864_bl.c} (70%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dbd4552236e64..250e8b1ed4bb5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26481,7 +26481,7 @@ M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
>   L:	linux-leds@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> -F:	drivers/leds/leds-lp8864.c
> +F:	drivers/video/backlight/lp8864_bl.c
>   
>   TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
>   M:	Nishanth Menon <nm@ti.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c8705..990cb9ef18c1e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -529,18 +529,6 @@ config LEDS_LP8860
>   	  on the LP8860 4 channel LED driver using the I2C communication
>   	  bus.
>   
> -config LEDS_LP8864
> -	tristate "LED support for the TI LP8864/LP8866 4/6 channel LED drivers"
> -	depends on LEDS_CLASS && I2C && OF
> -	select REGMAP_I2C
> -	help
> -	  If you say yes here you get support for the TI LP8864-Q1,
> -	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
> -	  drivers with I2C interface.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called leds-lp8864.
> -
>   config LEDS_CLEVO_MAIL
>   	tristate "Mail LED on Clevo notebook"
>   	depends on LEDS_CLASS && BROKEN
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 8fdb45d5b4393..5e624a48aa2a5 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -59,7 +59,6 @@ obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>   obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
>   obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>   obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
> -obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
>   obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
>   obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>   obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a7a3fbaf7c29e..82ecd7e46236d 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -514,6 +514,21 @@ config BACKLIGHT_LED
>   	  If you have a LCD backlight adjustable by LED class driver, say Y
>   	  to enable this driver.
>   
> +config LEDS_LP8864
> +	tristate "Backlight driver for TI LP8864/LP8866 4/6 channel LED drivers"
> +	depends on I2C && OF
> +	select REGMAP_I2C
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	help
> +	  If you say yes here you get support for the TI LP8864-Q1,
> +	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
> +	  drivers with I2C interface. The driver registers a backlight
> +	  class device and optionally an LED class device.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called lp8864_bl.
> +
>   endif # BACKLIGHT_CLASS_DEVICE
>   
>   endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 794820a98ed49..6a7287d01d81b 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -62,3 +62,4 @@ obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>   obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>   obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
>   obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> +obj-$(CONFIG_LEDS_LP8864)		+= lp8864_bl.o
> diff --git a/drivers/leds/leds-lp8864.c b/drivers/video/backlight/lp8864_bl.c
> similarity index 70%
> rename from drivers/leds/leds-lp8864.c
> rename to drivers/video/backlight/lp8864_bl.c
> index d05211b970c94..67b28f7daedd2 100644
> --- a/drivers/leds/leds-lp8864.c
> +++ b/drivers/video/backlight/lp8864_bl.c
> @@ -1,12 +1,13 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * TI LP8864/LP8866 4/6 Channel LED Driver
> + * TI LP8864/LP8866 4/6 Channel LED Backlight Driver
>    *
> - * Copyright (C) 2024 Siemens AG
> + * Copyright (C) 2024-2026 Siemens AG
>    *
>    * Based on LP8860 driver by Dan Murphy <dmurphy@ti.com>
>    */
>   
> +#include <linux/backlight.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/init.h>
> @@ -27,6 +28,8 @@
>   #define LP8864_LED_STATUS		0x12
>   #define   LP8864_LED_STATUS_WR_MASK	GENMASK(14, 9)	/* Writeable bits in the LED_STATUS reg */
>   
> +#define LP8864_MAX_BRIGHTNESS		0xffff
> +
>   /* Textual meaning for status bits, starting from bit 1 */
>   static const char *const lp8864_supply_status_msg[] = {
>   	"Vin under-voltage fault",
> @@ -71,13 +74,15 @@ static const char *const lp8864_led_status_msg[] = {
>   /**
>    * struct lp8864
>    * @client: Pointer to the I2C client
> - * @led_dev: led class device pointer
> + * @led_dev: optional led class device pointer
> + * @bl: backlight device pointer
>    * @regmap: Devices register map
>    * @led_status_mask: Helps to report LED fault only once
>    */
>   struct lp8864 {
>   	struct i2c_client *client;
> -	struct led_classdev led_dev;
> +	struct led_classdev *led_dev;
> +	struct backlight_device *bl;
>   	struct regmap *regmap;
>   	u16 led_status_mask;
>   };
> @@ -157,28 +162,59 @@ static int lp8864_fault_check(struct lp8864 *priv)
>   	return ret;
>   }
>   
> -static int lp8864_brightness_set(struct led_classdev *led_cdev,
> -				 enum led_brightness brt_val)
> +static int lp8864_brightness_set(struct lp8864 *priv, unsigned int brightness)
>   {
> -	struct lp8864 *priv = container_of(led_cdev, struct lp8864, led_dev);
> -	/* Scale 0..LED_FULL into 16-bit HW brightness */
> -	unsigned int val = brt_val * 0xffff / LED_FULL;
>   	int ret;
>   
>   	ret = lp8864_fault_check(priv);
>   	if (ret)
>   		return ret;
>   
> -	ret = regmap_write(priv->regmap, LP8864_BRT_CONTROL, val);
> +	ret = regmap_write(priv->regmap, LP8864_BRT_CONTROL, brightness);
>   	if (ret)
>   		dev_err(&priv->client->dev, "Failed to write brightness value\n");
>   
>   	return ret;
>   }
>   
> -static enum led_brightness lp8864_brightness_get(struct led_classdev *led_cdev)
> +static int lp8864_backlight_update_status(struct backlight_device *bl)
> +{
> +	return lp8864_brightness_set(bl_get_data(bl), backlight_get_brightness(bl));
> +}
> +
> +static int lp8864_backlight_get_brightness(struct backlight_device *bl)
>   {
> -	struct lp8864 *priv = container_of(led_cdev, struct lp8864, led_dev);
> +	struct lp8864 *priv = bl_get_data(bl);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, LP8864_BRT_CONTROL, &val);
> +	if (ret) {
> +		dev_err(&priv->client->dev, "Failed to read brightness value\n");
> +		return ret;
> +	}
> +
> +	return val;
> +}
> +
> +static const struct backlight_ops lp8864_backlight_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = lp8864_backlight_update_status,
> +	.get_brightness = lp8864_backlight_get_brightness,
> +};
> +
> +static int lp8864_led_brightness_set(struct led_classdev *led_cdev,
> +				     enum led_brightness brt_val)
> +{
> +	struct lp8864 *priv = dev_get_drvdata(led_cdev->dev->parent);
> +
> +	/* Scale 0..LED_FULL into 16-bit HW brightness */
> +	return lp8864_brightness_set(priv, brt_val * 0xffff / LED_FULL);
> +}
> +
> +static enum led_brightness lp8864_led_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct lp8864 *priv = dev_get_drvdata(led_cdev->dev->parent);
>   	unsigned int val;
>   	int ret;
>   
> @@ -212,18 +248,15 @@ static int lp8864_probe(struct i2c_client *client)
>   	struct device_node *np = dev_of_node(&client->dev);
>   	struct device_node *child_node;
>   	struct led_init_data init_data = {};
> +	struct backlight_device *bl;
> +	struct backlight_properties props;
>   	struct gpio_desc *enable_gpio;
> +	u32 val;
>   
>   	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>   
> -	child_node = of_get_next_available_child(np, NULL);
> -	if (!child_node) {
> -		dev_err(&client->dev, "No LED function defined\n");
> -		return -EINVAL;
> -	}
> -
>   	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
>   	if (ret && ret != -ENODEV)
>   		return dev_err_probe(&client->dev, ret, "Failed to enable vled regulator\n");
> @@ -238,8 +271,7 @@ static int lp8864_probe(struct i2c_client *client)
>   		return ret;
>   
>   	priv->client = client;
> -	priv->led_dev.brightness_set_blocking = lp8864_brightness_set;
> -	priv->led_dev.brightness_get = lp8864_brightness_get;
> +	i2c_set_clientdata(client, priv);
>   
>   	priv->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
>   	if (IS_ERR(priv->regmap))
> @@ -258,11 +290,46 @@ static int lp8864_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> +	/* Register backlight class device */
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = LP8864_MAX_BRIGHTNESS;
> +	props.brightness = LP8864_MAX_BRIGHTNESS;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	if (!device_property_read_u32(&client->dev, "max-brightness", &val))
> +		props.max_brightness = val;
> +
> +	if (!device_property_read_u32(&client->dev, "default-brightness", &val))
> +		props.brightness = val;
> +
> +	bl = devm_backlight_device_register(&client->dev, "lp8864-backlight",
> +					    &client->dev, priv,
> +					    &lp8864_backlight_ops, &props);
> +	if (IS_ERR(bl))
> +		return dev_err_probe(&client->dev, PTR_ERR(bl),
> +				     "Failed to register backlight device\n");
> +
> +	priv->bl = bl;
> +	backlight_update_status(bl);
> +
> +	/* Register LED class device if "led" child node is present */
> +	child_node = of_get_available_child_by_name(np, "led");
> +	if (!child_node)
> +		return 0;
> +
> +	priv->led_dev = devm_kzalloc(&client->dev, sizeof(*priv->led_dev), GFP_KERNEL);
> +	if (!priv->led_dev)
> +		return -ENOMEM;
> +
> +	priv->led_dev->brightness_set_blocking = lp8864_led_brightness_set;
> +	priv->led_dev->brightness_get = lp8864_led_brightness_get;
> +
>   	init_data.fwnode = of_fwnode_handle(child_node);
>   	init_data.devicename = "lp8864";
>   	init_data.default_label = ":display_cluster";
>   
> -	ret = devm_led_classdev_register_ext(&client->dev, &priv->led_dev, &init_data);
> +	ret = devm_led_classdev_register_ext(&client->dev, priv->led_dev, &init_data);
>   	if (ret)
>   		dev_err(&client->dev, "Failed to register LED device (%pe)\n", ERR_PTR(ret));
>   
> @@ -291,6 +358,6 @@ static struct i2c_driver lp8864_driver = {
>   };
>   module_i2c_driver(lp8864_driver);
>   
> -MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED driver");
> +MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED Backlight driver");
>   MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@siemens.com>");
>   MODULE_LICENSE("GPL");


