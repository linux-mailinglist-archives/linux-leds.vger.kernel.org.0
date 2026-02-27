Return-Path: <linux-leds+bounces-7049-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Kq1NCcGomkGyQQAu9opvQ
	(envelope-from <linux-leds+bounces-7049-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 22:01:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC581BE08D
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 22:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A08E3085C04
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 21:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC64B43900C;
	Fri, 27 Feb 2026 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UBckn3sL"
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1D2DA749;
	Fri, 27 Feb 2026 21:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772226076; cv=none; b=pjrq1//ixAlci5r+vD4n2kKY7OP27p1o+grKS57Rl43lTNGa24BaIqaBC34V25LiX9rvHfez4sKsc5kMQWELgE6qQve/qVwSQtJNCptaS97wLNAsbtixgNnMB7glX2HwmqiVcaoHDSYbEscFa3CaVXFxnBGiknUXfGsVoThRW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772226076; c=relaxed/simple;
	bh=dhMlHkuhQgO9fqAM1j9HbinZd+d8HsqBXfzy4QjubEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nO8NRtjESbY1XoR2uc5xw3DQ7OzRw8/+9v3UBC5+JlRqTVA/CoSvkJlAJwU3QMmHGUgqlsL6Sq8ByQztNMI4dgn2XHB3oMQ60hEdcH4cFqWfxm3QLVdS2w7eKeRkTz19qTbVRdv4VVz5chiZvAIRXHBpP/MGoK0eZqBPtEBoI0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UBckn3sL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1L1kS6D4L2zCM9YUKlv5ILCnEk7OXo+eTMLIxeEB7oU=; b=UBckn3sLd0n0frnyVdZi1ahk9J
	x1QnCIB/5XT26YgDSK10SNRE8qOEqv8+Q++ZjNLuKbBXefC4/yDBqJb/ipgrIKLZOL5Q8c2Sz/bmj
	1394gm+qoNYHluO91HYYs25BeugasYohmzJ5PpEFcMZ7OcdWLSooeUSjpuPWrZkVb/GzDFOJdAE5e
	1lcsDpHgxVIvQzs/pPNiVdNBBLGyy9Fl1YyXLfTbSxpv9IMk1HbTiv7bk85QWcYtcF7tmAG5cMxgE
	1gsxcqM8ny7buC5H/tbyw5i7+itFBStkL+TsowZnNVIWvX7a5cAN+q2YjN0CXPGvvL9sCqqOaLm+z
	FE9uHrVA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4xR-000000099jQ-0hLd;
	Fri, 27 Feb 2026 21:01:09 +0000
Message-ID: <1c7e7ccc-c323-4f94-8c3f-8f4c0a34a642@infradead.org>
Date: Fri, 27 Feb 2026 13:01:08 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/9] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
To: Rong Zhang <i@rong.moe>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ike Panhc <ikepanhc@gmail.com>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, vsankar@lenovo.com,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-8-i@rong.moe>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260227190617.271388-8-i@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7049-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[rong.moe,kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 3AC581BE08D
X-Rspamd-Action: no action



On 2/27/26 11:06 AM, Rong Zhang wrote:
> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> index cf7733e30bace..4d84db1067b43 100644
> --- a/Documentation/leds/leds-class.rst
> +++ b/Documentation/leds/leds-class.rst
> @@ -255,9 +255,72 @@ the end use hw_control_set to activate hw control.
>  A trigger can use hw_control_get to check if a LED is already in hw control
>  and init their flags.
>  
> +Alternatively, a private trigger can be implemented along with the LED driver
> +if the hw control mode of the LED doesn't fit any generic trigger. To associate
> +the private trigger with the LED classdev, their `trigger_type` must be the same.
> +The name of the private trigger must be the same as `hw_control_trigger`. Since
> +both the LED classdev and the private trigger are in the same LED driver, it's not
> +necessary for them to coordinate via `hw_control_*` callbacks.
> +
>  When the LED is in hw control, no software blink is possible and doing so
>  will effectively disable hw control.
>  
> +Hardware initiated hw control mode transition
> +==========================================

The heading underline line must be at least as long as the heading line,
so please add more ================ here.

thanks.
-- 
~Randy


