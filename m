Return-Path: <linux-leds+bounces-7899-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CElnOOru8WmulgEAu9opvQ
	(envelope-from <linux-leds+bounces-7899-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 13:43:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDE493B02
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 13:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C65233030E90
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 11:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D723DE427;
	Wed, 29 Apr 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R58Smkwu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B63B37F746;
	Wed, 29 Apr 2026 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462966; cv=none; b=bHRrUzKTPjxiEgUSZzz4gMpSFQ7zf0itCNobEKU1lkDYLrXKyGFxiW7dCKTsdj6XRgBANtb+Pkqr82UdLvD8q6sxejZ/8ZQtnWDxcj/4gj5lUe8+3lOsVaoNHVPGknH8ugVz3uJw1t+sYRI1xJl1EtjS7y/cMbe7RXcq/Iocul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462966; c=relaxed/simple;
	bh=SsbTTYwYlbyQ+Fa8jyfz88tijB3m8NLLMKarM1z0z08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G6atCojJsvIvcexskE71nWlWboE0K3pwEd+dnLqax+i/2L8yHc8+ytoixrez2BrQmUxkKc7qpEAqccSglR6YUg+cOfLc7yoBrzX1kRC0nLKzZxSJfCKUJ18fjgHgyjnd9HLbYnmC/o/VauCLV3PxRAaSrn8U1UNYVjdUmbhXSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R58Smkwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C400FC19425;
	Wed, 29 Apr 2026 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777462965;
	bh=SsbTTYwYlbyQ+Fa8jyfz88tijB3m8NLLMKarM1z0z08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R58SmkwuiV8gLRyppUaa1aPYIcYYtWXSp5QCe3iNJDvuddtzgsDEC+Jn/uf1lBONV
	 qVDzVSdEqnNCOQUF36YQmMr/WNlbK2iuJstOc6w/eDCATK25hNm8fin6SbW8qLa88Y
	 U9azFRIYB3PAxg7e0CDJGc3KuJ4iOE27QGYFe0MZYqXn2eUQSTOC8tOgHnVivFyZWc
	 C6gbpyke94jjuBBHZshV0Tlgf+twmz3+YlOeWOGvzy4lja0bZz8S4Yg3ObnTc9/kTP
	 KpvrO23WY4NMRGF1K2QpGZtKadKOaugUkhDSQB7kUgWf7ktW+VrEdGavKL2cAXvjrH
	 cSLnJBUM5cKyg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Piotr Kubik <piotr@kubik.pl>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260408115106.379834-1-piotr@kubik.pl>
References: <20260408115106.379834-1-piotr@kubik.pl>
Subject: Re: (subset) [PATCH] leds: trigger: gpio: use
 GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-Id: <177746296451.1823731.11668525721199850172.b4-ty@b4>
Date: Wed, 29 Apr 2026 12:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 78CDE493B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7899-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 08 Apr 2026 13:51:06 +0200, Piotr Kubik wrote:
> When a GPIO is shared between the LED trigger driver and another driver,
> the LED trigger driver needs to request the GPIO with
> GPIOD_FLAGS_BIT_NONEXCLUSIVE to allow both drivers to monitor the same
> GPIO pin.
> 
> Without this flag, if another driver has already claimed the GPIO,
> theLED trigger driver's gpiod_get_optional() call fails silently,
> and the LED trigger doesn't work.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: gpio: use GPIOD_FLAGS_BIT_NONEXCLUSIVE
      commit: d9651eade266e822a3c152845dd2816de3e3a7a1

--
Lee Jones [李琼斯]


