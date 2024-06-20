Return-Path: <linux-leds+bounces-2065-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D0910D8C
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 18:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CBC1B26F71
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E06B1B3729;
	Thu, 20 Jun 2024 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqyrzE8L"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766171B3721;
	Thu, 20 Jun 2024 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902167; cv=none; b=OUbsf58DgFogXlTf+iyVSmCeWZfZXA7RA8DOhXTVvxcdb7wD9aUKLx6YdxUggTo0N2YSCt45ltfPMH32gGWSCiGhEBePnmVFMsOQMTQ1WYJAjE+O6fcodvGeoDR+sjyIm6pYsg1wnNBCV0yAlmaORcvrxeHuMWe4M/7A/Ij6sXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902167; c=relaxed/simple;
	bh=2j7dJ/sGH4orDi4/5SBeq2oBO7rsMD7deQTTqDsqVw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RPOZUAFIt9c34XmJkQ3NnNJ4fYCW84p7v+VdNC3HKtO9ejFyeuRVGZBumqiKcxDMN+zCBNujksQ5zWxtylIyBz69HPjXl0SebhH9CarehF61IREWuBrFJftJUluAWZKSnnrlK6ozMbl9MIxfeWjtgVhnjwI8ASWu0gzHGr7q5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqyrzE8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470B4C4AF07;
	Thu, 20 Jun 2024 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718902167;
	bh=2j7dJ/sGH4orDi4/5SBeq2oBO7rsMD7deQTTqDsqVw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZqyrzE8LJdirmN3bVv3aoiV7Nl7rGjbNswKYtg1Wbnw/m3tLwQJwO7QCKIwVrGlS+
	 eplytoBfL3fUfeCZmszKkIns0SMsB/cW/yJFFK3mLBPTslT99gbfT/PzdXXQW4fLeV
	 s7wZYkLuu6Uy+8VURcUQNL57VnOABpgsMCXqxd3BDYWr/9Ou4KXgQ2gpgTWAtWzYUK
	 1t4va1+50zLfAeLB36imOQGN6MauEqvB2z76kti6s9zwvw84VLl1tlH4/hCdVrIX4D
	 WE/3091oHJTXyLwby8jS2KtLR7LUOxwY3urMmF4aS9tM9sFDUxa3iy6l5gEvg+Yk0O
	 lsrkIzn0Y5USA==
From: Lee Jones <lee@kernel.org>
To: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Christopher Cordahi <christophercordahi@nanometrics.ca>
In-Reply-To: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
References: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
Subject: Re: [PATCH v2 0/4] leds: pca9532: Use hardware for blinking LEDs
Message-Id: <171890216503.1289520.4518628827248211084.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 17:49:25 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 17 Jun 2024 16:39:06 +0200, Bastien Curutchet wrote:
> This series aims to use hardware more often to blink LEDs.
> 
> The pca9532_set_blink() rejects asymmetric delays. So the core's software
> fallback is almost always used when we want to blink a LED. Removing
> this restriction revealed some conflicts between setting brightness and
> blinking as the same PWM (PWM0) configuration is used by all LEDs for
> both brightness and blinking.
> 
> [...]

Applied, thanks!

[1/4] leds: pca9532: Use defines to select PWM instance
      commit: 8df8c664cd6f1a58201f03849faf06115deaa928
[2/4] leds: pca9532: Use PWM1 for hardware blinking
      commit: 8a8f75fbfde181fbba6d67ba8606fcc4ef7fe5fa
[3/4] leds: pca9532: Explicitly disable hardware blink when PWM1 is unavailable
      commit: 5122d8e29cb64cd8c49bdae61236f68f265b6bb4
[4/4] leds: pca9532: Change default blinking frequency to 1Hz
      commit: cfe05eae52d4d60a53a97ce9d5e6b29bef6bfd60

--
Lee Jones [李琼斯]


