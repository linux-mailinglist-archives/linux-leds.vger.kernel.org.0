Return-Path: <linux-leds+bounces-6706-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNmhF75jcmnfjQAAu9opvQ
	(envelope-from <linux-leds+bounces-6706-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 18:51:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F146BB81
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 18:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AF0B3017897
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 17:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C993A2AF3;
	Thu, 22 Jan 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgSz1S8R"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE70A2E1722;
	Thu, 22 Jan 2026 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101229; cv=none; b=emw43tVMix3kIqxLCf6rW+p3NYKmUZKxYR8QMFPOFS6o3Ed5V+liVL9O0FpZ6hVpZoLu9G3wRqOgXaX/g4oQxjjEgyxlq8GeLq8nuOP8SHc34ldzbgArDqf1kiDDM2Wj45X6L2Te/09iBGkgc7r5lGC1WgUteTNC74m3V3t619U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101229; c=relaxed/simple;
	bh=/R6aMuuaA/xXWppd1vUi1UGudZzNxsxrfPCJvQz1kQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WeMN8a/9Qz7HW6htGdUIZJ93vClVNZPd+yaVeu8pKbOnYbw6obSy1CQSFoPWfwKDjCXJ82fd7+AHCdZvkSQzcfan8MLSy6Km/7uCypz4lKHv/FjIVf179D6uAD+Nh+Q/N/iXB89xhQnyXhhI+GAwkVJ29Y35UuVYtj7zPbqMqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgSz1S8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB47DC116C6;
	Thu, 22 Jan 2026 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101228;
	bh=/R6aMuuaA/xXWppd1vUi1UGudZzNxsxrfPCJvQz1kQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TgSz1S8R5XLuWlrbPvkIWblMQftjJiVVVftsuHnogcLjO1xzvVrJazu8mJ+0lOWyU
	 e2k/7YW98YJavLwuuCr7xHAz1koggrT7TnMfuLlBVuj+/eRLNxWiaq3gD/AnTR599F
	 tJ5c6eFdfD0C9R1xqS/RN1tmFkfywQUsRMFDSI3I+dPrqAQByLr/JaOCEpgQxklXz7
	 Zw1K3PISMG0gM5GnUeaoxGN8F7W1vB+Ax8teZ76oeO2XBfPLkLmaReaHso+3Eo96gX
	 ZcirsAOPxBzxgZ1EzFt62YQZHfofpupBkZExY2ans5BcnhCZGmZYb59nwc5smTHLBm
	 admfQtjQIWdbA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260119-v6-19-topic-ti-lp5860-fixes-v1-1-3b297fbc0c4d@pengutronix.de>
References: <20260119-v6-19-topic-ti-lp5860-fixes-v1-1-3b297fbc0c4d@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: lp5860: Fix unused-but-set-variable
 warning
Message-Id: <176910122749.4059846.10330763114274646058.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 17:00:27 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6706-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05F146BB81
X-Rspamd-Action: no action

On Mon, 19 Jan 2026 13:43:03 +0100, Steffen Trumtrar wrote:
> In lp5860_led_init the ret variable is set to the return value of
> regmap_read. The ret is never returned or used which leads to a
> -Wunused-but-set-variable warning.
> 
> Propagate the return value from the regmap_read and get rid of the warning.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp5860: Fix unused-but-set-variable warning
      commit: 06915597fcc690896b7c3531a5686e7a312cd8c5

--
Lee Jones [李琼斯]


