Return-Path: <linux-leds+bounces-7528-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LWkOnAZxWnr6QQAu9opvQ
	(envelope-from <linux-leds+bounces-7528-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:33:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 806993348FD
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24C6730AB8FE
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 11:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4264D3A5456;
	Thu, 26 Mar 2026 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzMxtSWJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84F390CBF;
	Thu, 26 Mar 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524354; cv=none; b=KX16XkVaOjmNMF4qzgZcJMST1RgU67yTT0Pv3CDuoid4DqBe3dsh2Qv12xRDEPGASvd758YeEb1BwpnIXxaEMO+nMQdo27eBVIRoG5aSZjD1rFDbS4ucGw3X0BilEs0JCyx/E6G2iBdTy5XuJTDDXuwkiTFTSG39Y6Dg3Gpe328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524354; c=relaxed/simple;
	bh=2/7nhRAmy41Bic4w6xcNmvgsT7NMbUAserVminkrzGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F+mUL7cO4kdxMBPisINLsZt1yk7SSJlx44kkb7tEFKJaZvpZtF9sSZVpvUATDfiPPpjGvfbeQYi+BTCF90ffU0Z7352TdrMJrajfiKxdkL/NI0uw9RlyqMTuW0YNIq2YzvN4SFu2ZMt5pWdOzAp03GYNzAE5FE8AMsn7qT+jdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzMxtSWJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0DEC116C6;
	Thu, 26 Mar 2026 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774524353;
	bh=2/7nhRAmy41Bic4w6xcNmvgsT7NMbUAserVminkrzGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YzMxtSWJIPEQajuqdThkVzKF5zFqp/sCGX8mWURSE+kuss9WfwAbvuSdhg3dvd85K
	 6vqukVwggqMz+oPdlJxLGnIE3B58IYjyQw/frQ94Qh8nq8iQZ5JMwXmcFyPslBPm//
	 83xLitjc+fDwhndLYAKNp3gCOnuRIb62Nwkq6Z4uLijeg3lsGxE8M1OLwwhGpj/pGW
	 aLXbyGCinQg8n6GXhkQvyQDECB6B1flRsXtir4p/+uQAKezBt5yDT5QOvlCOn9GaLc
	 51ZvQmL57AUX0cUv5uukCakYQJM3cFUFyQbITk4JcUF2Np/enKtv1gl3m/0TdNTq/M
	 743hFmHlQ9cAQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Richard Lyu <richard.lyu@suse.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260320035451.31071-1-richard.lyu@suse.com>
References: <20260320035451.31071-1-richard.lyu@suse.com>
Subject: Re: (subset) [PATCH v2] leds: lm3642: use guard to simplify
 locking
Message-Id: <177452435245.1946046.15845086650275227922.b4-ty@b4>
Date: Thu, 26 Mar 2026 11:25:52 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
	TAGGED_FROM(0.00)[bounces-7528-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 806993348FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 11:54:52 +0800, Richard Lyu wrote:
> The mutex_lock()/mutex_unlock() pattern requires explicitly pairing
> lock and unlock calls. Use guard(mutex) instead so the lock is
> automatically released when the scope exits.
> 
> Convert to guard(mutex) in lm3642_torch_brightness_set(),
> lm3642_strobe_brightness_set(), and lm3642_indicator_brightness_set().
> Add #include <linux/cleanup.h> to support scoped guards.
> 
> [...]

Applied, thanks!

[1/1] leds: lm3642: use guard to simplify locking
      commit: a55e941e2283e931c8a292adc030c834f8ea0873

--
Lee Jones [李琼斯]


