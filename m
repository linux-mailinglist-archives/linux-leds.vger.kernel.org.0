Return-Path: <linux-leds+bounces-9074-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t9qjIEVKVWrbmQAAu9opvQ
	(envelope-from <linux-leds+bounces-9074-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:27:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5856474F05A
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:27:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b="lKZT/mcJ";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9074-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9074-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202DD3055D75
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 20:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D9B35AC3B;
	Mon, 13 Jul 2026 20:27:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E834888F;
	Mon, 13 Jul 2026 20:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974466; cv=none; b=HLW9weeCka2dFPrpcptc2KuM8zwaP3xfWiExf2DAZzoY2R4/Ilt4R/a+CKkR9Vt/8XTxjivwn6yen57HxkTRkDwjG3RWvtQ1VrxhI4rQfTk9kkPWkMkiHStxi1FUm4Hiuuty1Uhr1eyimoquO1bQh1bYtrDDH1wpVDhyG4Sj1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974466; c=relaxed/simple;
	bh=Ngzkz5tvzhM82Dga29utEzWhgCbugFKT03qJQGOrNoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYxngCyji4Bdi5Fp2GLDenEqq/ump9VdbZfJdFNr0KKnOe6XRYJ7B7DtKSYA8aNgr8LsZJZYnITDWiZ+cYHXuu/ZbGqJbDOmSSjngkJJZ9qXa56k3PRZqW2mGc6IPldT8oiBnyduM1YZLBOz986Qncv50hwBdRtUdIKRB+cEX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lKZT/mcJ; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783974455;
	bh=Ngzkz5tvzhM82Dga29utEzWhgCbugFKT03qJQGOrNoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKZT/mcJFEGIzu/eU9wxhcOuc+BQLmuxQrSfLLXpxXrKi/getm2ck64j4oQmMSvoV
	 lqgmwJxubwYsUZaQ22VQAd9krJGNulG8lOHtKof7GfcVpNHH26w3+hNdTrVx9gHzsI
	 Qxdmf4hDe3O7rRvGY2iZSoEdJlCt2ZLQt3sfBCNs=
Date: Mon, 13 Jul 2026 22:27:35 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/9] leds: Add callback offloaded() to query the
 state of hardware control trigger
Message-ID: <2b1c347b-6598-4169-8b07-601a8b41faed@t-8ch.de>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
 <20260618-leds-trigger-hw-changed-v2-1-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-1-c28c44053cf3@rong.moe>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9074-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:i@rong.moe,m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,chromium.org,squebb.ca,gmail.com,linux.intel.com,lunn.ch,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5856474F05A

On 2026-06-18 00:47:55+0800, Rong Zhang wrote:
> There are multiple triggers implementing hardware control. However, the
> LED core doesn't really know the hardware control state since the
> coordination is done directly between the trigger and the LED device.
> 
> Add an offloaded() callback so that the LED core can query the hardware
> control state.

For review it would be easier if the code using the new callback was
introduced *before* the driver implementation.

> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  Documentation/leds/leds-class.rst | 5 +++++
>  include/linux/leds.h              | 1 +
>  2 files changed, 6 insertions(+)

(...)

