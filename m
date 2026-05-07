Return-Path: <linux-leds+bounces-8026-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHyiDzF8/Gl0QgAAu9opvQ
	(envelope-from <linux-leds+bounces-8026-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 13:49:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D14E7B8E
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 13:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 970903017C35
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 11:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF583DC4CB;
	Thu,  7 May 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtgBG7Sr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CF391E4B;
	Thu,  7 May 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154418; cv=none; b=C018ZDZX/jOyt4rCRTz6a4IAUWEBA4fJ4mgRQ5qOb89E6jwh50XxYA8vxHqF5ooi01FwJjDPKaO49S7OS9dystB1QUGdNGjj9QijwBfdWg8xphVnqWnvPNyZnxhAkPCjIxZTB4tAdC32rlf36XZR927ytEWBezA7rplJn31PmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154418; c=relaxed/simple;
	bh=2AndrycR0/3s6II2PM1BIYJ7I54IysIjGHD+SZzsOsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d2mG4aiR5IngigzKjsdmYp/RHXaBYKk+ntTTfT+1CpX1tMdYoaJ6CZ7RidLHisBu3SOqZB29WT90PzW6ZzH11J2rUbdRIpiKF7e7KfJOd+yNN7gF2QBqqMzppJTRNS2FH8WzpObd8t3uoe7C2TfIRdSrzrq8esI0X1aTUM1uNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtgBG7Sr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1BDC2BCB2;
	Thu,  7 May 2026 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154418;
	bh=2AndrycR0/3s6II2PM1BIYJ7I54IysIjGHD+SZzsOsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GtgBG7SrZ+72JiBsGy1mf5PHFrkNSul7m5PgkQ8oY+FXpZFgjdQwPnuPBftsZV6VN
	 Ll1hWV7nq3BpPLCiQ9YaW2f5wZvSdq0ZJ7HlYOmadFcAruXNwin6ITDgccZlQDjbFT
	 OGLw5VJwX31nkXbG7MkeHYVxehr3eYs7ixV/pex13+RphFG25wWOGMJnicgKX6MB53
	 w1kiCDl7p3Mg5OCri+Xwdls4BpMUgaqzJrVRjVUco3bExzlp5ySsljwuq5z0XwxD+a
	 1IyXlqZ0dcye7SDW/RMtHc1zXlG0qQlLVAr6+vr701bSnRWXKcHOUQE2tbmFY/FRoU
	 reWHhbfgaWViQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Xinhong Hu <tp5092@foxmail.com>
Cc: lee@kernel.org, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, jkoolstra@xs4all.nl, 
 me@brighamcampbell.com
In-Reply-To: <tencent_26F6155ED10CA20CC65F62FD659218853809@qq.com>
References: <tencent_26F6155ED10CA20CC65F62FD659218853809@qq.com>
Subject: Re: (subset) [PATCH] docs: leds: fix sysfs ABI reference in
 lp5812.rst
Message-Id: <177815441666.1805014.14587236881098534018.b4-ty@b4>
Date: Thu, 07 May 2026 12:46:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: E82D14E7B8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8026-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,foxmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,lists.linux.dev,xs4all.nl,brighamcampbell.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 23 Apr 2026 18:39:10 +0800, Xinhong Hu wrote:
> Documentation/ABI/testing/sysfs-class-led-multicolor is a plain ABI
> description without a .rst suffix. The lp5812 documentation incorrectly
> referred to sysfs-class-led-multicolor.rst, which does not exist.
> 
> This was reported by documentation-file-ref-check (make refcheckdocs).
> 
> 
> [...]

Applied, thanks!

[1/1] docs: leds: fix sysfs ABI reference in lp5812.rst
      commit: 1f05106ff812466b491f2a8db752a06457878bf9

--
Lee Jones [李琼斯]


