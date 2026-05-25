Return-Path: <linux-leds+bounces-8318-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IlFHxqvFGqWPQcAu9opvQ
	(envelope-from <linux-leds+bounces-8318-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 22:20:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652B5CE41E
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 22:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 906E03002F73
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 20:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D4135E1D6;
	Mon, 25 May 2026 20:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GDCxrW8r"
X-Original-To: linux-leds@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE0C26E6F3;
	Mon, 25 May 2026 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740436; cv=none; b=MMTC2MWCz0/u+PZNAO75W6RgAZ1Yux0EnPpzgo6SZPY38KySoAjdZVcFUK2WgpVepLNAldnY/bGyGq16xMsZMC8KKJfTdPUFfVrc2dOk6m/gpCG0vfmhIqMD9Iq8dgJ0jgMDUoQsGhLs2JNO1ViVfVH5l1Y8Z0Zcfa7jon3ZYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740436; c=relaxed/simple;
	bh=YZ1yyqhl3w57lFN9tZhNep+gczLlMmoYi3YVsLEhg/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C1arHSdS2bl/qwMbNEhtb2oKTaehDbMz4puKXkSZFyhyAimCQkz5CXSej+Fm2VLdpwtvgxiST0C0qxfQ8qWkniYUPazoEDkG2zN4Jdaxn8QJcTwuL5wyuJa8g2HftLFguetAqiSa87/Cl78P3LhuB/+MVf+8+eigPckp9712+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GDCxrW8r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1C1F340E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740435; bh=iEqbfXEo5zV9+7JtMjZrdCNiVM2NI1tL2TnfmBDyYDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GDCxrW8rNuZvUbQPow7AskOSYzbqBm1au4LnzPZXpEQErNS10aFVPqzAWhLpmG892
	 CBQXz8UG0VUMxq8ougWOzzR74tqXVByTzDJR18N1pTk27fUheWq/+8iEBSrGgezW9B
	 Q812Md2IiqJ7PJREQwO9ep1WxPLd7Yspjq53CQb0YraAnHy6/PAv0lktxEGvXne0I0
	 9XIT/vd67NOM1xK192g9/dwJrq1HTI8H4tcA0pUmEYUqXws5xtnTZe93Pm4TTYNhPr
	 D7VZ+2p5qcDIsPqkpQXx4Qm4NyJr9oT/doqa4H1eK3+gL124I6HqGJu0ndsM/0IGNv
	 A9X9jMQgSCvWg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1C1F340E37;
	Mon, 25 May 2026 20:20:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakurai Shun <ssh1326@icloud.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typo in leds-lp55xx.rst
In-Reply-To: <20260517043303.17111-1-ssh1326@icloud.com>
References: <20260517043303.17111-1-ssh1326@icloud.com>
Date: Mon, 25 May 2026 14:20:34 -0600
Message-ID: <874ijv1bsd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8318-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[icloud.com,kernel.org,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,icloud.com:email]
X-Rspamd-Queue-Id: 8652B5CE41E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sakurai Shun <ssh1326@icloud.com> writes:

> Replace "regsister" with "register"
>
> Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
> ---
>  Documentation/leds/leds-lp55xx.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/leds/leds-lp55xx.rst b/Documentation/leds/leds-lp55xx.rst
> index 632e41cec..f60c7ec39 100644
> --- a/Documentation/leds/leds-lp55xx.rst
> +++ b/Documentation/leds/leds-lp55xx.rst
> @@ -18,7 +18,7 @@ The LP55xx common driver provides these features using exported functions.
>  
>    lp55xx_init_device() / lp55xx_deinit_device()
>    lp55xx_register_leds() / lp55xx_unregister_leds()
> -  lp55xx_regsister_sysfs() / lp55xx_unregister_sysfs()
> +  lp55xx_register_sysfs() / lp55xx_unregister_sysfs()

Applied, thanks.

jon

