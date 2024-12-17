Return-Path: <linux-leds+bounces-3634-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81B9F4EC6
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 16:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8EF01624CB
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 15:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73231F7090;
	Tue, 17 Dec 2024 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCtC4/GQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0471F7088;
	Tue, 17 Dec 2024 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447909; cv=none; b=qPVIRbD5FI87Owwy6Lqi6sga9n8kXgUbbW4Tht7ODQtLtH/XLMQwRsGzn/zAbUQFC7rjVK8TgNNNA+g1rz5p21PQm7QHjQ8us7MnfT6nOXB3m6jhfsMgf4agTQ7va7W0jHT7IHDrEg9uA5o1eVW2HMrulDeTUT63KWqg0RM6Ujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447909; c=relaxed/simple;
	bh=JYsEFL2qSVAyBytqn2Joh27h4OPGNGBHE0AiV/H3nv8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nCoMCHlDhZOkG5IJzTMLDEbLFS12+p1hcJEePdQJAmHJ9Z6F3BNLMorPNCLHh0ZSXgE+P6knf7CktA/7awKm+fuG3GxoF5TdbowPZBilGskHSE5y0y/yU4HJdNZbBqhVLKZV3ag0MGKkwtH8aAdO64M76w0k5wNC4JXJqaa0b0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCtC4/GQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0E3C4CEDD;
	Tue, 17 Dec 2024 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447908;
	bh=JYsEFL2qSVAyBytqn2Joh27h4OPGNGBHE0AiV/H3nv8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mCtC4/GQO4UTdSOu2ik0K/RDRuMN3rlTRUS7UUxqrfOCIMMV87WPNBhEZviuLCU1O
	 ZKQi6YNO2XX98Rs3EkhqBzP9GYj88Mhy0U4JOudq7gi7NT++s/t5JEfcEXTBtdkAO0
	 WfUx/FFspKLwHu4DdtPN6zfO2I9Zvhx7rZSYTvx17eFJYsOe+5o3pQh0+f0JdgO36E
	 Z0wQQnadJbFoej0T52hSLOj0Pll1CO+WoLj2NACWjxL6ngJrvv52xO1zJKPlr7BcnN
	 ULnikPtb8+9wdEERk1My+0o+imhTxozQRi3fZuBE5SXIJNRFzlDgj2XFUqsj4qdgnt
	 gIzfi9MhpA/SQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jakob Riepler <jakob+lkml@paranoidlabs.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
References: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
Subject: Re: (subset) [PATCH v4] leds: pwm-multicolor: Disable PWM when
 going to suspend
Message-Id: <173444790659.1886613.13367326556110236101.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 15:05:06 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 16 Dec 2024 22:37:55 +0100, Jakob Riepler wrote:
> This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> has to be disabled for the PWM to enter suspend.
> Another positive side effect is that active-low LEDs now properly
> turn off instead of going back to full brightness when they are set to 0.
> 
> 

Applied, thanks!

[1/1] leds: pwm-multicolor: Disable PWM when going to suspend
      commit: 29df7025cff00dd9fa7cacbec979ede97ee775eb

--
Lee Jones [李琼斯]


