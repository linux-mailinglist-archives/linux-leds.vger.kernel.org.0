Return-Path: <linux-leds+bounces-3633-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57C9F4EE2
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 16:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48341883B6C
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 15:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0ED1F63E1;
	Tue, 17 Dec 2024 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMo04kF8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6C81F5415;
	Tue, 17 Dec 2024 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447906; cv=none; b=W/Na7l6P3yT24AFUEOWApWbqHLyrxsU5XudoOD8e/HDDtF/c1cbJ/KtDynTYbn2KfWGF451S+ueiPxd5PE/Tgfkz829jhupGbmAuuBPpKxmOUwo5lvDXtYRfd6gkwxFTDPX8fu98HMcDU/G2XjNAI2LfjrAvshTrjfYXduGpPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447906; c=relaxed/simple;
	bh=PN+GGT5vatsVMnoZuud+S7iAgcx6DWf9apRYhkSkm5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mVKWpPP2eSWM4q48QFf9/yohpmnui+JFnJymogiIONr4kWKEMeNMZTk0XOGhkg0B6tWxjC73tuEbBM2BeVDQvQbOLQ4jsoB2eBV6YhaI5NSfnbarpAA8WjVdDnLxvyXw1uZpi9GdVgeZO/lhFRdxdLcaNZSJulTdxIPRyHwGo6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMo04kF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BE8C4CED3;
	Tue, 17 Dec 2024 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447906;
	bh=PN+GGT5vatsVMnoZuud+S7iAgcx6DWf9apRYhkSkm5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qMo04kF80o5Fu/YReKtsdpUbJO1+uO/WRg0fSLSQHm1caSomtOj//vdsHYHJSNiVh
	 AI1pJnEJjyOBCOnJDPDrzRYoRIUaMUvomxVMKT7+nNkfsfoTXkvBJzSvxQ0Nfx0SJr
	 f7QjWbP0zaJHrb8JZZpTurOSYHC0wafeFxFdmWsckuh8d6ZHDn8Vq2vb8ZoHmbtM53
	 w3eqDdOgmAyQAtIKHRyIlOIGzFgfJhvuPINk1FSCkzDTsls+Xlu1ox7K2M+I8QkBiL
	 OtRKgYifjCMOmgKfCLnUINJ8baU4FMDltfCgINBfsVti8ukujjw7bZazk+NFQGvi0Q
	 JiEeo2rw1isSw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jakob Riepler <jakob+lkml@chaosfield.at>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
 <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
Subject: Re: (subset) [PATCH v2] leds: pwm-multicolor: Disable PWM when
 going to suspend
Message-Id: <173444790494.1886613.17095999437657304031.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 15:05:04 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 02 Dec 2024 13:07:51 +0100, Jakob Riepler wrote:
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


