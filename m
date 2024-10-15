Return-Path: <linux-leds+bounces-3092-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1F99E7EC
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 13:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A960F1F21434
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 11:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7225E1E7C34;
	Tue, 15 Oct 2024 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHov47xd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD31E764B;
	Tue, 15 Oct 2024 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728993578; cv=none; b=P4Zspx9PmV8j2kwdKN+hjNsoJmRcS7byP50m0RvFO1rV/dA/ZUHzxsKE6mlazdEXYwcfMDLCBi0Fda0BPeaX9kiEokUm7yVMFu9Nmxrt/czXxG8CW9A+M/Ij4lcYVoW5mz4i7Aptqylus8u/5HBz+BePGHOeMLHvvKm04IP6KSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728993578; c=relaxed/simple;
	bh=ODeceBYLRtueqmgHt8DfZfD2/pSz1xD49c/l3ljyl4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bfJcMYMcetBNUvlkaQ2u0Ucw3+5WUdY4xCZakZy1vsr1s94wloV3FlRSgK8v3MILI7XAiNGNOfek9ecKktyJj3/wiM0fuuMVObQqI4FIpfq74OdIoH1gJUhoi/dG9qjgRdCR+7Ch3Qp2Xog2atZy8hiJ4fZS+ff90QxDDcna97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHov47xd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D116C4CEC6;
	Tue, 15 Oct 2024 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728993577;
	bh=ODeceBYLRtueqmgHt8DfZfD2/pSz1xD49c/l3ljyl4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cHov47xdm6Ek2xh7pVECaTFOn/CA7c70thnr3vBzoyk6n9UMooyBfI7r1cuhGXx9l
	 m4tg+8BGKs1CNBhxbShxzsEJE65IyeDCA+UrgGOsp4Gb3EVUr6BWikzP8XsNVYZDf9
	 ox5j79Apdwi/p3XHKq5MRW0DcuogWC9uDhftOru47w2I8J21AYk3zIng/ed4UISWOg
	 Amkt4/XZjxsaqo6LN9K9bbjcEBXSM9h6aBiBh1z2uIf79FzhDSlswTAQnj4hgeaq2s
	 TxFjXdQY6ND7KUo+K6VmD2FrdrksK5x88R2DgdjD9bgG2phFeF0ZY1VZEsVcfw+qGL
	 Ef/O64oDvSEjw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Michal_Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20241009095635.2790613-1-michal.vokac@ysoft.com>
References: <20241009095635.2790613-1-michal.vokac@ysoft.com>
Subject: Re: (subset) [PATCH v2] leds: lp5562: Add multicolor brightness
 control
Message-Id: <172899357617.523868.14748410570100250879.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 12:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 09 Oct 2024 11:56:35 +0200, Michal Vokáč wrote:
> The framework for multicolor brightness control is already in place
> in the lp55xx-common code but the function to control the multicolor
> brightness for this particular chip is still missing.
> 
> Implement the multicolor_brightness_fn function to allow multicolor
> brightness control of LEDs connected to the LP5562 LED driver.
> 
> [...]

Applied, thanks!

[1/1] leds: lp5562: Add multicolor brightness control
      commit: 681d5fa6440cf0fd3f561638c598db18aa77e641

--
Lee Jones [李琼斯]


