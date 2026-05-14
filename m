Return-Path: <linux-leds+bounces-8105-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBxnOiDKBWqFbQIAu9opvQ
	(envelope-from <linux-leds+bounces-8105-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 15:12:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7576B54224C
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 15:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 001BE300F786
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E48C2066DE;
	Thu, 14 May 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmr9++Ds"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164E13DF00C;
	Thu, 14 May 2026 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764317; cv=none; b=tg2DoS/jP4D5dFIm2EzzYzNsX2gBlIMdKzZVnvD1lmSeI+xU2ToLZ4HLYXCuVM/VUGS1gxsHZXRUZ+LH7b/kjVnGyktA1mPrjDNc7udZVROKVZKhZrk6pGYlLi89paukec4V1RrMjaaDhPlf/VdmswPPEpwnIsT+Qttfz/Eq2g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764317; c=relaxed/simple;
	bh=r4Q9SIpWO9jGhg0tMU+zZx/RZ5HqiorC2T974eOw4Yk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZopBcAll9BD4Ru5enPTvrKK1p27kNZIqJ73QG4nbQLHwHyCUXRTunTPXeMtuNIbX7kjo+RVCgLeFotrOacAoAMTpjj4OQNn4ousjLF1Q2z30xNnpZ8IjQfYSQeEHAqOgTzNjOFm2ItsjoiypalnVrrGN5lFQ9ymc62S7xjVeDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmr9++Ds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D19C2BCB3;
	Thu, 14 May 2026 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764316;
	bh=r4Q9SIpWO9jGhg0tMU+zZx/RZ5HqiorC2T974eOw4Yk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hmr9++DspzwMiUNw+yHgaL0CCwm3jXwD/hedkh/TtTMoHCtDWaMv3i8/ZYq7CdYjx
	 o88/7o/aafIdAq0U+4MI2f+uczsezVxzKIfD25Clzi3EpAO1Bakt6VzmQs+KkdBmIk
	 3r2fGqYHTOLF/3+lK1rZxuy+NkZL3DBhUxAX3SQz66jImI39dVkMaUDSUwnbz5Ic1N
	 ilFd4ViEpKIS/qOBoQb42kDrmIkh9DNZpIp9QVAfmiblxmW0NDfNmKh9xeER8tunmo
	 DzXcuLxTNIdKlY8i6bAqOD4y0NSwCGxq22eaA2EEbkQV8oa2pq4LPzsfcajGXqDEwq
	 lPYtRjQnm6sAA==
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260505-v6-14-topic-ti-lp5860-v10-1-ee29341a75e4@pengutronix.de>
References: <20260505-v6-14-topic-ti-lp5860-v10-1-ee29341a75e4@pengutronix.de>
Subject: Re: (subset) [PATCH v10] leds: add support for TI LP5860 LED
 driver chip
Message-Id: <177876431513.2727309.4928809608514635877.b4-ty@b4>
Date: Thu, 14 May 2026 14:11:55 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 7576B54224C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8105-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 05 May 2026 08:16:10 +0200, Steffen Trumtrar wrote:
> Add support for the Texas Instruments LP5860 LED driver chip
> via SPI interfaces.
> 
> The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> short and open detection of the individual channel select lines.
> 
> It can be connected to SPI or I2C bus. For now add support for SPI only.
> 
> [...]

Applied, thanks!

[1/1] leds: add support for TI LP5860 LED driver chip
      commit: 3daf2c4ef82b30d4cb017508f6857438ca44da41

--
Lee Jones [李琼斯]


