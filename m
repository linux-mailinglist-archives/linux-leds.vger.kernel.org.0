Return-Path: <linux-leds+bounces-7680-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMFFLDf42GmGkQgAu9opvQ
	(envelope-from <linux-leds+bounces-7680-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 15:16:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEB3D8091
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 15:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 568E2302E7C6
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 13:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388C0307AF0;
	Fri, 10 Apr 2026 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b="pElMn0Jl"
X-Original-To: linux-leds@vger.kernel.org
Received: from 18.mo581.mail-out.ovh.net (18.mo581.mail-out.ovh.net [188.165.56.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD08D324B1F
	for <linux-leds@vger.kernel.org>; Fri, 10 Apr 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.56.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826652; cv=none; b=ulB4Jd0yy1mWvnWsd/6uB0fLDfq6rxQMxkWM2RHKLmEer8MK49L+6avhB2Y5L6xQeb1DXjFKumXjXrikRgRklPKR3Hb4vB1n16CFHuOgVopAgPewWY/5fLqM8Oz6pDtKtpO90tjol1/bVuflcfV+8k7bmsKBjh5nYfwasNOJUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826652; c=relaxed/simple;
	bh=3CW4diUM/JB8LiWZnoXA4stnM/1uNg2TuLFEj95TcXU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=L4vhiEKKwxYAqDURHVDpKcgf+8KqtrSNz6uLqnBkH2/jQaFoiX1hxs8UM3uhsB8bLQhf0X+vMYJgD+89gJ8V/6tNVo4xOzzsQ/TUBNhvtTDLXKx/K5z2uDu7jmlWHCz6TqCSxMiyhvhsz2CyG3oZZUYGXBBFtLFlq39AXeUCYnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl; spf=pass smtp.mailfrom=milecki.pl; dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b=pElMn0Jl; arc=none smtp.client-ip=188.165.56.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.249.43])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4fsZvH1JRMz5vTp
	for <linux-leds@vger.kernel.org>; Fri, 10 Apr 2026 11:53:31 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-thxv6 (unknown [10.110.101.93])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3F4F5C015D;
	Fri, 10 Apr 2026 11:53:30 +0000 (UTC)
Received: from milecki.pl ([37.59.142.108])
	by ghost-submission-7d8d68f679-thxv6 with ESMTPSA
	id Q1CoCbrk2GlosAsA37Gi0A
	(envelope-from <rafal@milecki.pl>); Fri, 10 Apr 2026 11:53:30 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S0026f3801b7-5a6d-45c8-a682-cbea1b95ff79,
                    CB257AE30968F6DC1ADB9B1DFC9DF9D0FAE0E632) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp:91.134.92.225
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 13:53:27 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek
 <pavel@kernel.org>, devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Corvin_K=C3=B6hne?=
 <c.koehne@beckhoff.com>, Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy
 <dmurphy@ti.com>, Gergo Koteles <soyer@irl.hu>, INAGAKI Hiroshi
 <musashino.open@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>, Roderick
 Colenbrander <roderick@gaikai.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-binding: leds: publish common bindings under dual
 license
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Message-ID: <4fbad496f9f52e11f4ff3efe2a5ae4d0@milecki.pl>
X-Sender: rafal@milecki.pl
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 16481767265536823906
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEVdcfbvIOBJB2+bRFZN5uvglsDeTJ8QMQd6jIracklhyuhdcBcD8Ww3maFkZ8kXin/gDDz2L3u1T8MRzCXgDZz9SBrqf2axe7f3Va00KRBaXT9+sbp4qW3HcpxWQmyur05ln8PZ94dlYoKVza273GShBBSxFdgTntIEPD4yn4CBJSLMeWHD3I0Mz88aYvdWye5Tsl8VMrmv6aoKXWMYBPyEE4kKcTZR9K037BOc5yAoZEwhaSvlD71Bqzcb0exZDvDw34EHVv+u5aGyMOORbMK4NIRxUmDf0acHbqlRkUZNCm6NN3v0XK9owFAZhkWv0za+YkvRpfr0AdSSIv+SrfWZkFYreGCIx5IdYx6i+67HcX24ashb/r+4anb9qpag4ozhD0FjwWIPvimxpBCHnvEwPG/NV1pAN/YNIvR+hR4bb8lTC/YKPKGhPaVgvL6rWZMqncj9SVTppjjf1qg5kAYO/l2wFbY7faWMRCdiPXrD7WxO+hOGBzWCepfnMl3Y+kevLDLbAWD7CgcX7TbXcBOdtgxO3F+FPU8L7E3qRDfS21L2ldtPcuScQFAumJ2XEv+gC5x1WfRzs1iap/f0z83EKZ27SgFK+xLqY4ZjOMJL0H0V8BvSQjSeezoUOR7JEaAXDRMDgYxrr2fQ35KVVfn+v52biH+feD1Ndm4upXHPQ
DKIM-Signature: a=rsa-sha256; bh=m8v0/pj5YIHBXmpmtcD4RBpe85xEWaB0LLlNYUt+3rU=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1775822011; v=1;
 b=pElMn0Jli13QIPOARmikAjJsixTLKCgaScBCOR9rtLEH3yGDOjs6CrodNZyQjZmveXH3mzl1
 BNa/s1h2UvNggNzi5Iq3u3F8zDP06QJdyrcGbmucS1dZyk6iiYsgxrmh4eI0jXzX60lcHxQdOBw
 gEG9aH5M29MMumfbHNXdJTY1/ZRGnlNFuCYvdNtH9Hcly+kmxqJSJO9/M1WgjOrw97++UChFC2k
 r0CyPHv+0lMAmCLGF+wvvoOWyf47aAu5EkP5b7lO205bhrtfpdCrjLYHpucLAuEO028PTlmAUr1
 58W2QMHWKX1elB4Swz2E05FlljcqXJ88X4byyk5NkcqTA==
X-Spamd-Result: default: False [0.51 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	R_DKIM_ALLOW(-0.20)[milecki.pl:s=ovhmo3028686-selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7680-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[milecki.pl];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,beckhoff.com,ashleytowns.id.au,ti.com,irl.hu,gmail.com,schinagl.nl,ucw.cz,gaikai.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[milecki.pl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rafal@milecki.pl,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1FBEB3D8091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-08 08:29, Corvin Köhne wrote:
> Changes leds/common.h DT binding header file to be published under 
> GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.

Acked-by: Rafał Miłecki <rafal@milecki.pl>


> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
> ---
>  include/dt-bindings/leds/common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/leds/common.h 
> b/include/dt-bindings/leds/common.h
> index 4f017bea0123..b7bafbaf7df3 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>  /*
>   * This header provides macros for the common LEDs device tree 
> bindings.
>   *

-- 
Rafał Miłecki

