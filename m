Return-Path: <linux-leds+bounces-4963-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC7AF5E5A
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 18:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DE6C4A2DFA
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 16:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1DA2F2702;
	Wed,  2 Jul 2025 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfWzo2tO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8250E2E7BD7;
	Wed,  2 Jul 2025 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473090; cv=none; b=jWoi87twEJ5ex0A57+suV9gmYpnVofAoRFbGohXYPqXxhFYM1yXx6JJhr/jlIkubHljwvkRYAyDg3R8giEFgOmPrMOy/fT2u0KtHeOhUMTcfBVwKoPKYlTsGes5I27wl9yAQUESwr9IxF5fzSRXchcKo+ysomBoB9PA0WQh2m40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473090; c=relaxed/simple;
	bh=WAkJcBJArZqwJHhbdOhFSY+GTzZg/mGoEPMrwP/VZmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cLjg4shJOBBqOOTvMBQy1dELB/wRn75zqQF3VR5Xt2SMqJbLXYiZr+GUU/JGksb6YGtrRb5hKLlyKuIYVWHY8+Y1Sfq6c1sgN/abZgfYsL7lSGQHARCnV1C8gmHowiCuwSYsa5KGAHg3cJMyMOUK/u4JpFEgVaQKjAdd/G9zLvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfWzo2tO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385CFC4CEE7;
	Wed,  2 Jul 2025 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473090;
	bh=WAkJcBJArZqwJHhbdOhFSY+GTzZg/mGoEPMrwP/VZmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MfWzo2tO+T4T9RGNaDKmq3dbug2rC+z7pcavBqMXsi+8TAvW/MGa9ihJpOBHjJk9g
	 +dCmDfr3q90Zpa/usqV3nt/kCFsG6+Hy4KbNtNJUr1vDQHWJCuP2P5N5tUH7IGHNVy
	 boWXrRi2+cuizHNPeY9vBZdKpL/6dw3ciRdoGFLhskNYfCUS3M830U8xA0+j1AoZ4A
	 DCWe+egKRHMYumQWyXHuaBVcxsjeEI/SGM/UFR10Ui3qqX5hVClsjvYKCb6wRS3O6G
	 zRaP+gDj2Kn1X31hW2rAaNTqQWMtqA7TtNKSeQuACMLMV9QdqYg2ghllKYlFM2cqaV
	 MhaACrTPWDTsw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>
In-Reply-To: <20250630092639.1574860-1-andriy.shevchenko@linux.intel.com>
References: <20250630092639.1574860-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: Unexport of_led_get()
Message-Id: <175147308895.3073440.9542203634129184231.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 17:18:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Mon, 30 Jun 2025 12:26:39 +0300, Andy Shevchenko wrote:
> There are no users outside the module.
> 
> 

Applied, thanks!

[1/1] leds: Unexport of_led_get()
      commit: cb335325b1431152f696c53e32465ba192cd119a

--
Lee Jones [李琼斯]


