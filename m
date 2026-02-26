Return-Path: <linux-leds+bounces-7035-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD6kKnjFoGnImQQAu9opvQ
	(envelope-from <linux-leds+bounces-7035-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Feb 2026 23:13:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A00C1B039F
	for <lists+linux-leds@lfdr.de>; Thu, 26 Feb 2026 23:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4B3303E751
	for <lists+linux-leds@lfdr.de>; Thu, 26 Feb 2026 22:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C6C42B750;
	Thu, 26 Feb 2026 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6KOL+ni"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118AC2EBBA9;
	Thu, 26 Feb 2026 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143989; cv=none; b=S0ko0EbDj5K/7JC0m57rBhYrmMbYfvO9D8Sno3lOTJvsV2QvoeO/8Fl6hOLE+al08mHosz+4WlHkQ+OsBhRdUnYsuDsuFOeF9HM2E2xs6sNoKlGSu6mDMYmoO6oYzemExDF4hMW0IBAu6Vn8IHDzQlnEGUUSJDZIzFUyxmYXUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143989; c=relaxed/simple;
	bh=1f6IGq5PUW3/Jwv0okoqUYv52Yoyk6MWUMZAq+QzaKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oqLdQJ/73Ex+3g9U/FLX1QCow7ztIM2hZaaIWDFu/G3NLM4+WZhwPKTwahnt6omBXvhwOBMzYFk7zwavVYqkL0zfdrv+/6t3hno/cIhMEBF1Adeu2khHged+QcOStMxeYyLkR1gd261Uk8fHXjlNeaSTvt7QXDh6yiMEN5IXeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6KOL+ni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F45C116C6;
	Thu, 26 Feb 2026 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772143988;
	bh=1f6IGq5PUW3/Jwv0okoqUYv52Yoyk6MWUMZAq+QzaKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q6KOL+nigjYMd4sV4j5+n2zpUB/B2dl6TJmpwkiJCwAkmrt91Yg1fDZ1RZcDxY3f1
	 FlK38PVjwXU1jlpiQlF77f7xUp3W80oXK4AJAWXYX7tTi1lI6AQCoVhoVFHPRhH27e
	 4zv4sR9NNi36eBA3m+7ym58bcHKCLqDRBGqOmE4RG6uJ04Q8ZQx2mlQXnEs6qAGIey
	 ycDJSzfJ7uutSdwJZAlHGrdoHKjACWgo0hWTSTmp2wYkuKoxCCrHC80gzjqj3hkoj/
	 DCAfsUcvUJqaiA4G9MLoWe9kFowMlAKss/XEqFJNSn+lJqdM+Hvjvr/kl30qG8bjfR
	 8x5uwLnZag1ag==
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260223063858.12208-1-clamor95@gmail.com>
References: <20260223063858.12208-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v3 0/9] mfd: cpcap: convert documentation to
 schema and add Mot board support
Message-Id: <177214398588.275063.6738297743653752817.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 22:13:05 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7035-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A00C1B039F
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 08:38:49 +0200, Svyatoslav Ryhel wrote:
> The initial goal was only to add support for the CPCAP used in the Mot
> Tegra20 board; however, since the documentation was already partially
> converted, I decided to complete the conversion to schema too.
> 
> The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
> from TXT to YAML while preserving the original structure. Mot board
> compatibility was added to the regulator and core schema. Since these
> were one-line patches, they were not separated into dedicated commits;
> however, the commit message notes this for both cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/9] dt-bindings: regulator: cpcap-regulator: convert to DT schema
      commit: 5a8ffc5dca9c096fe9c8879fa3a2faff723fbb8a
[2/9] dt-bindings: regulator: cpcap-regulator: document Mot regulator
      commit: 0e5646030212856a7f022387a647694ba65e75a7
[3/9] regulator: cpcap-regulator: add support for Mot regulators
      commit: d90c0f78379454d51a428e312ac6db573060185c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


