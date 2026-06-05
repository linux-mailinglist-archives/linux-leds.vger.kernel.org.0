Return-Path: <linux-leds+bounces-8492-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WYBoL55/ImqVYwEAu9opvQ
	(envelope-from <linux-leds+bounces-8492-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 09:49:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DF64621D
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 09:49:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MWONeCtI;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8492-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8492-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD4A3056DF6
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 07:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F199847F2C2;
	Fri,  5 Jun 2026 07:48:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3247DD76;
	Fri,  5 Jun 2026 07:48:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645737; cv=none; b=ntWqLqskullAQji+Z7VG5FAo87x40m2MW3pcgOqiX+lXONfniITKSlK9ohLJDMCQyChj6j8yzUv+tzcOjF4EXttPa+UFW8LjRJpdRB3c1hKCDUNzLN93shuxkhW9yoNKZVCE7WQSNGamFh2ES4ZyNDHT+BIJHkf54NX1EUZ9mQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645737; c=relaxed/simple;
	bh=5/mNg13u4GtwKFhQoCET69wztRhrWnHcnBwAMdpeyFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JdbFJy/owD3N8gvHiG6OHNBaTeq0FIj0M+tJEsAsbmqwu5aQEbJnGFyYaYKIiYpBhey38fbx7wmZpZCZEtZhnGkt7liFBS8VVAV4EYNjqWpsTukzbQxb1Ee/dlqLZ6ZejP/tiH7kI7jcKwNmKGtibwtG/uUpH/HCz0TTXsbN7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWONeCtI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA811F00893;
	Fri,  5 Jun 2026 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780645734;
	bh=oHlOkVlEEtUAcB+5c378KEAcJDginA3sYLLUkHmDVEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MWONeCtIZvhf4OIZxKrvjFJ/KeT6xAmPFU3KflhWBV6PglHxkrY3UFg/pXS78Ua8A
	 eBhfSLVqCLyBOe3lotKvSfSx+Juu8/Yv4o0199oF+3hc7LTB6QhJRQcQdYIiSb8cUE
	 CbYfCHXn6szwigt+9Gh5rHj98m8+TNmW2+aqvq08Lbu8IXoiuRmSeln0b6snTu8GYF
	 MRjDV/tizUUpSu+KhkO+iQqqaOoKvBx1ROvYUx+mVRQj9m6wyDTAbuFf02/04aGGob
	 ViN0me56tpGfhz/viUZKHA5n8RfhZi2Sp21OR8bunaN5lFx/BImYhDbfKMHa1akTxk
	 yjeOYZn/zqGmQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260527-leds-tps6131x-ovp-v1-1-1ac70d03c9eb@emfend.at>
References: <20260527-leds-tps6131x-ovp-v1-1-1ac70d03c9eb@emfend.at>
Subject: Re: (subset) [PATCH] leds: tps6131x: increase overvoltage
 protection threshold to 6V
Message-Id: <178064573300.526157.3953699565939633685.b4-ty@b4>
Date: Fri, 05 Jun 2026 08:48:53 +0100
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:matthias.fend@emfend.at,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8492-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 644DF64621D

On Wed, 27 May 2026 12:26:51 +0200, Matthias Fend wrote:
> Currently, there may be cases where the overvoltage detection is triggered
> even with a valid and generally functioning hardware setup. This occurs,
> for example, when the input voltage exceeds the currently used overvoltage
> threshold of 4.65V (typical). Since input voltages up to 5V are supported,
> the threshold should be adjusted accordingly.
> 
> While the target output voltage setting has no effect on the LED operation
> used here, it indirectly selects the threshold for overvoltage detection.
> Set this to a value of 4.95V to select a threshold of 6V (typical).
> 
> [...]

Applied, thanks!

[1/1] leds: tps6131x: increase overvoltage protection threshold to 6V
      commit: cf9d871f6a13a8c6dc63bb73842c50ed95a127d9

--
Lee Jones [李琼斯]


