Return-Path: <linux-leds+bounces-2556-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E389666EC
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2024 18:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E6D01F215EB
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2024 16:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA59B1B5ED3;
	Fri, 30 Aug 2024 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehLFRetI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2114B949;
	Fri, 30 Aug 2024 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725035429; cv=none; b=FjHcUhtvoDzpO2HveEPMNA69pNbNkBqu34CPgENA42jerlNAnmmrbPsyiAXAEoyRbBpwz46HNoYKD30KiKD648sARwigAVtSp3nbeoxAu1/seJ917h37N5EAZdJ4BfiQSri8ZtSm/0JWx+XDcZnmo4a+gfb5qPSCH+CmDokh1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725035429; c=relaxed/simple;
	bh=+XleoGvMIu7vWzlolqcvi3QD4HwPGFeNdxNXbuUZYgI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oOq4K7DxraqqfRptOtzm9Q+pznTnM1IvCSfAyvd3uvQ3gqHO27mT/oefqsXwrc2flmqtri5PegaySxiicJR4YlHDZyK9pKdpjXr2BXSAQN9bOtJvK7DwRPXrYB16pbSQGmsvB3YSIYwOn1dGPkwH/TxE3KbCfSI4QEitXahNSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehLFRetI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22330C4CEC7;
	Fri, 30 Aug 2024 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725035429;
	bh=+XleoGvMIu7vWzlolqcvi3QD4HwPGFeNdxNXbuUZYgI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ehLFRetIbC0L7Td4IaFMtIB9+i/zmd0zoT9NOwEu8JeKELSMZez4hYSkv3rPzlG1V
	 OYd7bDaIhelZWGdzzSXpTaUGVlNkfLZ93zcLfiGmV3b+NsUFklTc7WNx//GICgh1Lp
	 p0oUbMTPLvynt6v/QvSB6kGIhT0Qnyp9LfS+dVpbM10VtWL3m2Un0sOqdDQJ11A3o8
	 t3NUQPdjsCMxVpUHyZW0DbrQUIR+eoO2B6zMJ6dJyBfeyj5BxNXm2kkQVqQSjWhM2Y
	 AoM/eTlhlMWjBKmtCcRJmw1nWKNTtJ5fVsrYpJI5GwOBLEK+5WCG8mlkwQOc5PxYZV
	 lq/YLimUqP84w==
Received: from ip-10-30-226-235.us-west-2.compute.internal (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B72883809A81;
	Fri, 30 Aug 2024 16:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH resend] Bluetooth: Use led_set_brightness() in LED trigger
 activate() callback
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172503543072.2648350.9880242652165643665.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 16:30:30 +0000
References: <20240827105248.18177-1-hdegoede@redhat.com>
In-Reply-To: <20240827105248.18177-1-hdegoede@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org,
 linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Aug 2024 12:52:48 +0200 you wrote:
> A LED trigger's activate() callback gets called when the LED trigger
> gets activated for a specific LED, so that the trigger code can ensure
> the LED state matches the current state of the trigger condition
> (LED_FULL when HCI_UP is set in this case).
> 
> led_trigger_event() is intended for trigger condition state changes and
> iterates over _all_ LEDs which are controlled by this trigger changing
> the brightness of each of them.
> 
> [...]

Here is the summary with links:
  - [resend] Bluetooth: Use led_set_brightness() in LED trigger activate() callback
    https://git.kernel.org/bluetooth/bluetooth-next/c/669e8c8b5663

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



