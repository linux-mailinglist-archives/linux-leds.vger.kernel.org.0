Return-Path: <linux-leds+bounces-1749-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 813F38D6208
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B785F1C24866
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5716E1586C9;
	Fri, 31 May 2024 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCiwrggC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B911586F4
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159255; cv=none; b=WZU0eOsCV1XAXHb/wx9xe2o1Y5eKZK7BfrVgvWg5JMwdgw09HQGk2xnSU5XLinuslreP4oMNFm8Ojwq4262lreuf707RSj0J6yvNgbYaKy8bu0BvR+5e197k7bu6mLwwJZU37FELrn48NSX0ko/GJLKHVpCoFCvIR+oC8HuAJto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159255; c=relaxed/simple;
	bh=GO0XAFePsx0JDFYEt0vDbY5BemCIE7BQqgwsz1bq0ZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X4a+z/pI/NbRgTsw53VaG+GiZjDFtV3boRkNLZQujihog9sUg/KGYiaavfj7WBAySgW+swD2ca1aXw4QXYz4HqN8iIc2aZjLkqKpUlLKbfOP7vb7x85GhaKKFN/z0+LU0DM/tmULPTFIRku7YLu/duzos8LCrHPO8RNQLB2eAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCiwrggC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE29AC32781;
	Fri, 31 May 2024 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717159254;
	bh=GO0XAFePsx0JDFYEt0vDbY5BemCIE7BQqgwsz1bq0ZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bCiwrggCcBwdYaJX3FMzN4tGZm2L5/tPd5bbmya2tpBDjGsO4M5wEPk0uzSTM0pyf
	 xdFcDccAZ3b+pF+IyUaJq6JzprFzo0dx8hJzuYfvy91zixAuIaVLVeK30Daf805jc0
	 GeBkLfAlbcRpJHosdESylR4z4Mg4yzNwK16IoVWDE1xSdX90dUHmibtV8KJKKI0ZD+
	 ppq18/9k0UO2Qv+2zyOnlOnDWCguRBckIlt9/a4guqzvei8RWJJok1J9T0/vKwljGE
	 BPdqoJ+92jKRZJ91VOXHuQ6UOFtLZOcWvYV8dLWd2XDs3GGGfkOFAEpAf9aB3yIBNn
	 Do72vtB0PLcew==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: Kate Hsuan <hpa@redhat.com>, linux-leds@vger.kernel.org
In-Reply-To: <20240507095111.27109-1-hdegoede@redhat.com>
References: <20240507095111.27109-1-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH] leds: trigger: Call synchronize_rcu() before
 calling trig->activate()
Message-Id: <171715925344.1069447.6433771300014046410.b4-ty@kernel.org>
Date: Fri, 31 May 2024 13:40:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Tue, 07 May 2024 11:51:11 +0200, Hans de Goede wrote:
> Some triggers call led_trigger_event() from their activate() callback
> to initialize the brightness of the LED for which the trigger is being
> activated.
> 
> In order for the LEDs initial state to be set correctly this requires that
> the led_trigger_event() call uses the new version of trigger->led_cdevs,
> which has the new LED.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: Call synchronize_rcu() before calling trig->activate()
      commit: 47b8a4059f8a8b2407ab22fad8775842c54e59c6

--
Lee Jones [李琼斯]


