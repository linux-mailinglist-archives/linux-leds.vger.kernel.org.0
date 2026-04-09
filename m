Return-Path: <linux-leds+bounces-7662-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INk/AyWv12kORggAu9opvQ
	(envelope-from <linux-leds+bounces-7662-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 15:52:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6B3CB983
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 15:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 834AA3013A53
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 13:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171A23CCFD3;
	Thu,  9 Apr 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzvurqJ8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292483CFF58;
	Thu,  9 Apr 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742418; cv=none; b=eQuIXX6N63v5S7qU6cGrWYRGxSyCui+tHr68k0eeIF7AB+EL8rRfwS+yIeIHA9hhRn0eLrEYoTwxeP4fZhUoOma6JsDoFywe6pBnI8WtfDhrMqrH17EN9MPHKY5tAHJoU9QB6u8gSB45YAy5eX77t2Pkd5296beTq2lai7JgFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742418; c=relaxed/simple;
	bh=B5jbnfOJBRE7zK2eH91pRAi0wxS/vkVLN6DX0FdfKZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wyx1SD6M9l7N/RktcFs0tk5DvkO0yNqsUd0ERraE245mgUqGbc2sfu8cD9Bd2QMAOi1RoOjXZptRi0h5wbiTPiLXUtvqnqfcwQjlRCo8TXf9cUyKyF0NPAii9lPRoGVv+8dDzduwtraxcVqd5iwK8bIocZ+CrkwQf1RLQQwmUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzvurqJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B988FC4CEF7;
	Thu,  9 Apr 2026 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775742417;
	bh=B5jbnfOJBRE7zK2eH91pRAi0wxS/vkVLN6DX0FdfKZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MzvurqJ85cB0HPwdB6OXI1Z9KIB/9ROAiRmxPomYEyz7or0vsEMdRVThExUBCxdkh
	 z/mZA4Xc8fSixmYwmnflRrsSQv1ALEMbEIlPOAhxU7ldTK3SqrEYLbZzMh17Um3T0K
	 ceCZ2gTNMd4mfjEKB/dCz9mKAv3E3xBWOpumDMj3mAkMjsaEh2XcO0w9758EXUt7L2
	 eXAo8pMOd2CD8IWCVoh0lGMvCX2vLh9ZdqYCIFmcZ5HcH6uR6qHMzU8gbGDMk0weEc
	 rgC1Dvy7XclFwKE/j+KtX64OPyb7YcG1CN03N+amzOcnMZfWDOzZ6EvI2yyY4Mj6qi
	 gCPQu8Ew5OPrg==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
Subject: Re: (subset) [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add
 new duty-cycle value
Message-Id: <177574241348.3361552.254159940051762818.b4-ty@b4>
Date: Thu, 09 Apr 2026 14:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,mess.org,baylibre.com,somainline.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7662-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1E6B3CB983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 18:07:27 +0000, Biswapriyo Nath wrote:
> 30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Applied, thanks!

[4/7] dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      commit: 2bbd36622df51f22e6902b0a0743d9354bc8f6d4

--
Lee Jones [李琼斯]


