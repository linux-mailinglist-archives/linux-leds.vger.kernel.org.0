Return-Path: <linux-leds+bounces-8838-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mfQDNptqRmpITwsAu9opvQ
	(envelope-from <linux-leds+bounces-8838-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 15:41:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1216F8721
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 15:41:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="C7/MnzY1";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8838-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8838-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C903301A12A
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 13:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4C64ADD84;
	Thu,  2 Jul 2026 13:41:38 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CAE4A3417;
	Thu,  2 Jul 2026 13:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999698; cv=none; b=YH+QP4oBSoZM0YuGla5keSJxtmadDx2fSqCaQdYdga77/zuPqN7uEMc7Wt5GzrsoaAJGk301KgyEIZGnBEigqFYaeC3oeA/WdTQncFb95Vu9p7wBR8K9wJIhdRI05hApoWb/9x6N+ape4lB8qIOGtuokq56GBaPvMaEqlf2inao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999698; c=relaxed/simple;
	bh=2q8Lu7ZUkRh+48AFcfk5cx0VE+GkD1QAUrI4P7Z0UGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFHIk4OhJFFazmYpzTlclAnIPRxIC6cvByCTKUXzoPfCzvihac6FqfMbwxbXRjecGvNPoTEJ2+u9pgPZrRul2UC8C4CC+dlxbXwLJHK8AzitiaYZp02Xy2+B5WvRuCcnATsX/sz1d/PsNItgu/r+1qqo48dg4IjgDOk0VsbDsWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7/MnzY1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB0B1F000E9;
	Thu,  2 Jul 2026 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782999697;
	bh=r/QdX4mWyc91WzptPvKcbo2h0yzYVAmzk5WLcMnBpJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7/MnzY1Bby+Vhkz2np9pueKznFwotVexX6KJVBMCVWA25RTCEN4jVk7BB+UhO4nr
	 D2mmSbPmI5Sz6LSvvP3CAXCnKmEtbCfs0RzeCyszO3+RPjQ8n/6jUZwSciILm6IM2y
	 Erj++7+tyf16pBemYwNo9mo9kFNDApqxmy2hmz3Qwdw+v6velxcDCsbs7rv2YLnpU8
	 qK8FAaMe8+INgdh7jojV2Gi+ruyFefQWeipLrfrOz7cAatPTruFKNJ8suGW5i7N4a/
	 7ItfhRfEkgH6AJYiWutS7dS/QMkkbbWtuyOsu5FO+kuT903cKIyzu4rGUa1s8jNVgE
	 m62y8m8HBSkTg==
Date: Thu, 2 Jul 2026 14:41:30 +0100
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/9] leds: Add support for hardware-initiated
 hardware control trigger transition
Message-ID: <20260702134130.GN2108533@google.com>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8838-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:i@rong.moe,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@weissschuh.net,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lunn.ch,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C1216F8721

On Thu, 18 Jun 2026, Rong Zhang wrote:

> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hardware
> control trigger. Meanwhile, such laptops also offer a shrotcut for
> cycling through brightness levels and auto mode. For example, on
> ThinkBook, pressing Fn+Space cycles keyboard backlight levels in the
> following sequence:

So we're effectively lifting something out of netdev and making it more
generic.  I don't generally have an issue with this, but the idea will
need more eyes on before I feel confident enough to review (for my
own little quirks) and merge it.

-- 
Lee Jones

