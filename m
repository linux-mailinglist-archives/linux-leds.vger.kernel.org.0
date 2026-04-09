Return-Path: <linux-leds+bounces-7660-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFqPNE6h12kUQQgAu9opvQ
	(envelope-from <linux-leds+bounces-7660-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 14:53:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4D3CAA35
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 14:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00450301992B
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 12:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD0C2DFF3F;
	Thu,  9 Apr 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k935kUTL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6F175A81;
	Thu,  9 Apr 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738987; cv=none; b=fLSL6vKk22LiauaRSEf7MwHG6g2klrslTFtHAY6vBjRZriFEefiqwS9yNlYVQjikRQqztj9Cr2XQIuUnFi2hucYL4GS2Vl9h2C9/rPmwhdUhBx7POzYeDxsO6ATmZEWFwLc6uDaYb8RFK7DZhB/lknr7F/EVq8dS8tyuUrOHJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738987; c=relaxed/simple;
	bh=feW4+NERZIeANKnOhDjiBOp62xL2drfEq79UueEiNGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DUp/lAWSzOfWtYNWX3Rk4PJCKwNZFYjP7279xUAEUHsYIk30LLa0LCeutJw5Df8AHWnpYIR/+tij+BtUFn6Xfua2fJEjYuzsuqCfDnJo2wxko+oJS5I3nzJn7JWouRpfVMdXsMWFEx/hyiWpvzPG+nxPIFW9beLsBUbMXxmXcfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k935kUTL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F183C4CEF7;
	Thu,  9 Apr 2026 12:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738987;
	bh=feW4+NERZIeANKnOhDjiBOp62xL2drfEq79UueEiNGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k935kUTLthNFffYd41cUvwLGCtIfNL+U+7aZ14pRxVYD8YXiMDdV6nQxJyxX8u7vw
	 77Yu9mJ/dYjJF2mx+32gFYCkJAUKahz6aSLqSAN/mdMGFzHj3bR2GlejXcQBdhndrc
	 ueaXfqKaUl/+98spgO0RKcXvDV48Jgi2n0NMKEQlg4qqbZAm82TSLhxUkKV6gtRvtV
	 up5CGG0QSSTdf3IbVXa+aOzORC9+lSGbGCvoD310sqtMPOKk3tMFzsNpxzy+Ekowvs
	 tNDaFVYJXVFp//7eD5QMbpSG/RKoJc9ByaxD/lnAvHrRzPnL5ONiem7POOfx3iDTwW
	 o83wo6B2vzFDA==
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
In-Reply-To: <20260327102729.797254-1-andriy.shevchenko@linux.intel.com>
References: <20260327102729.797254-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: class: Make led_remove_lookup()
 NULL-aware
Message-Id: <177573898580.3322444.3067002798107722779.b4-ty@b4>
Date: Thu, 09 Apr 2026 13:49:45 +0100
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
	TAGGED_FROM(0.00)[bounces-7660-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63D4D3CAA35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 11:27:29 +0100, Andy Shevchenko wrote:
> It is a usual pattern in the kernel to make releasing functions be NULL-aware
> so they become a no-op. This helps reducing unneeded checks in the code where
> the given resource is optional.

Applied, thanks!

[1/1] leds: class: Make led_remove_lookup() NULL-aware
      commit: 7a43ccf85dfe06eef483c034e68b81ff326741aa

--
Lee Jones [李琼斯]


