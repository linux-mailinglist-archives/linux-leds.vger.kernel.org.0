Return-Path: <linux-leds+bounces-7518-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMRMIPn/xGlC5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7518-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:44:25 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46826332896
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 356C03098A2F
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A59F34F24B;
	Thu, 26 Mar 2026 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNK1TTgG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E434EF17;
	Thu, 26 Mar 2026 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517536; cv=none; b=Ih1moHfgLHL5sdc/vRwa3p02wdvaLhVUMyAiB3a2jbH3DIgHn/Zjer0sNosqnVLhdwWb/2EpZdrZbWBSmCHkbzzhPGbYUoh2/7TjkwyzWHrPGwhg3o85jAux0TOAer9628HiFiHlWdchXwkyKNWveDRaiARiRfBnX+HjBB9q3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517536; c=relaxed/simple;
	bh=dHEuja9+7HhmNpxkX0MBgrul8w1apERhj52whn6gSzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pESaq20KV+IsUu3/sQNcqiEWDyUzKZLqvT7+8AZqt+uJdU70j1PzCg7nMLhL+0aCShQ+1U9DFEeX7BE0+yCsD1POR7vXQgQc5agt53coHTK1f5tkjsMJIzdTGS25qFmCskYgaiUCoI/pAwDr+aTVFdyIFO7r2sEYzYUb82RZ+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNK1TTgG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E7AC19423;
	Thu, 26 Mar 2026 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774517536;
	bh=dHEuja9+7HhmNpxkX0MBgrul8w1apERhj52whn6gSzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cNK1TTgGXqCIw56O7hMwMuKUaza7v6ndb4zio8qEFft6k6wufo6zeQPTXWzSibOTC
	 Yck7q50yGwWTGj3YPnYRgpSDfNlPD/dp+Vp4CeLMhyNsjjPbpcxwyI6H4y2PVzFP7g
	 Qj6WHl6SDRIWnXRiQJICSgYqWzmHxjAsrnwck7k4mv8lUGwP3K09SENvU5pFT/i2eP
	 gCgR72iBlcwKgSPbw5bsiV3ZR6BnDXH5bDO/sZ7NX1DhOfhlyQKU/URdhC+szjCBR4
	 FOAfiNT/fGTD1AkcBcBPtjvzrz57k39HOYsMiK4U2kzRAoA47kL8yddh1zOze0dPH4
	 8XQiZbEYvHnNg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
References: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
Subject: Re: [PATCH 0/2] Fall back to using software node name as LED name
Message-Id: <177451753505.1867408.15957400779792545142.b4-ty@b4>
Date: Thu, 26 Mar 2026 09:32:15 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7518-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46826332896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 18:43:26 -0700, Dmitry Torokhov wrote:
> This allows setting just name in software node representing an LED
> instance and forego "label" or other properties needed to form a name.
> This is helpful when converting old boards using bespoke platform data
> to software nodes/static device properties.

Applied, thanks!

[1/2] leds: core: implement fallback to software node name for LED names
      commit: 4f530c65487636dc1536b3fa1041f9a877a66a7f
[2/2] leds: core: fix formatting issues
      commit: 91dc0c2a152373c4004df7e36de45190b82089ab

--
Lee Jones [李琼斯]


