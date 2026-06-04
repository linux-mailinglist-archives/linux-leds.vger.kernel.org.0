Return-Path: <linux-leds+bounces-8479-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TTyZMn2DIWoUHwEAu9opvQ
	(envelope-from <linux-leds+bounces-8479-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 15:54:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A17E640903
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 15:54:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TsVFmzm5;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8479-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8479-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82C7F3007AC5
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 13:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D20840F8D8;
	Thu,  4 Jun 2026 13:41:14 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFBF47B435;
	Thu,  4 Jun 2026 13:41:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580474; cv=none; b=Z449TnAD5BthS4BHCG04BANjY+eFmHxglNtd4UjY+fanlqKGm5kONRsA6goeqnLIudY40i/mBy/jGCZapMksy+kVP3S0BrTwl9IsFl0Igj6rKs3OaQ67fTNa/9MH3eUv6gP0DyWvdRcxyHH0IQiUUWMZlUaGSbF7cPY9CmJnk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580474; c=relaxed/simple;
	bh=udhPSa/8KNRAz3E7J8Hr6RU/EsdQE8IWfZLE24H8d2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YrwmXwHCbb1D3KM9J1LLMMfu4L1Ft89G+gJr90shjabC2U6cST0FbOIpGt6J5eJWVwtQigyk2b9UzjoHZKTi5/ev+ZB13sUtTKN8iLsysis0upNjpWZQDbrdn+/W4CYJIzTFgWCmB1EHnrFgbvc8u5xMil/XQEKWuR6ifVP3Qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsVFmzm5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D051F00893;
	Thu,  4 Jun 2026 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580473;
	bh=zOzsmES2+XqkfH47uS90r5qpHz9BTlcN8pxvb/xrrQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TsVFmzm5R59qoeqpWKAiz7cXiKcSetJe+8Uxmej0sYcTPV0+EFHS156nAW4SSBSKG
	 tK3ypsEyr8HAs+UUOOqt1uqzvCSzsYtyCoF4mf92R7GtKctVMZYyKiWmiFhVlNoefl
	 44QnmNFzRrmYvlws4zGW1C2PSVhUHP9WHDxpMC8oXH1Vke18U2fjAVJS0X9gf0Zz2n
	 MYBQxbR1m3HJzV+lNm8rUb+hxPiVdRUgQvR5kK/gV/cG7oeTrzU9mVJdkW/gGK8P0t
	 0XeoIU8CcU5odKQefTKtrIf+/8H6FafrDus0eAdzpoVW5KqfAyiFQMalSgOb4QQCCy
	 MP2SXa/QOkofg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521181205.15130-1-alhouseenyousef@gmail.com>
References: <20260521181205.15130-1-alhouseenyousef@gmail.com>
Subject: Re: (subset) [PATCH] leds: uleds: return -EFAULT on copy_to_user()
 failure
Message-Id: <178058047176.4174549.2645359409149130123.b4-ty@b4>
Date: Thu, 04 Jun 2026 14:41:11 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:alhouseenyousef@gmail.com,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8479-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A17E640903

On Thu, 21 May 2026 20:12:05 +0200, Yousef Alhouseen wrote:
> uleds_read() copies the current brightness value to userspace but
> ignores copy_to_user() failures. It then clears the pending update and
> reports a successful full read even when no data was copied.
> 
> Return -EFAULT when the copy fails and leave the update pending so a
> later read can retry.
> 
> [...]

Applied, thanks!

[1/1] leds: uleds: return -EFAULT on copy_to_user() failure
      commit: ba8f07a62bbe3d481f104fc71c029373fa1ebc7e

--
Lee Jones [李琼斯]


