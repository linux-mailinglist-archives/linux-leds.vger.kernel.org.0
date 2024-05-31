Return-Path: <linux-leds+bounces-1728-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E28D5F39
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 004D91F235F9
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AB514263A;
	Fri, 31 May 2024 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBDaNdj5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7A37D3F4;
	Fri, 31 May 2024 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150020; cv=none; b=IgTCsrUb0I9bJvIHPKP5a91oydU26bZsFL1FfGmUXf5mLbHAhYO4X/xgnyM3y+GPuYkvGJy2Vhzet0gbp1B2PLsAkTy6Y6P04eas6dXWmtlJc4QnDz8ByHhFDq+z3cnYcZONpYoXwiAo1BImBH/eONep3RQ8gFOVXrGsQtsBOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150020; c=relaxed/simple;
	bh=x6YrxgCuIC9cb+82N6X0rKHyCVymfCkKvZeGU9Wr/kI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qg1q/udpMSUDm77tkg3aYmzjLZ1sZnQNPpIuFf6B6M5Ft+LfNB3h3DrVDpv1XkWwZkKCUfJaD8VhS2ZhjkJR8ktrUUnzYWqIpWg8jETPyf9O3mm1sFFjkL/KQll3Y0luEzLyUcJjCXJFhCDZe7ObkyJlKF/UTk/2kgHwPtqjigE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBDaNdj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C3AC32786;
	Fri, 31 May 2024 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717150019;
	bh=x6YrxgCuIC9cb+82N6X0rKHyCVymfCkKvZeGU9Wr/kI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NBDaNdj5VTAI3zuvwIlhOXV34jecHBKVG3bTmGLGc8ZvnMUG1XLsEePOV1i2wcsSz
	 1J9GRbqQhaldUZBfC+PHFkORUyfFoPYvCf6YPmM2cPo/HPi9EACHOw6wxLN3zmiwRr
	 SQE0+7YocVgnleIRxUyziE/IGbS0Fng/CZhU0fEEIruX9EUS0FYNubjLsh1lMY8BpB
	 Nc7LxW+ZVQ8k9B0wkVcxnUmwMYGk+SKjOtB1KEx9CKPWa0Yqfw/oWAX8WWbSKfZyH6
	 1Z+dAugxq71B7cMyjINg0DRngdFvzxu0JzGCVf8RL9gvcgj1Hh7gX2x+vAqtCqV+p5
	 M3fTVWoH43YKg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <82a5cb26ff8af1865a790286bdbc3c4a2bd149f1.1714892598.git.christophe.jaillet@wanadoo.fr>
References: <82a5cb26ff8af1865a790286bdbc3c4a2bd149f1.1714892598.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: is31fl319x: Constify struct
 regmap_config
Message-Id: <171715001807.1011393.13624879216621879090.b4-ty@kernel.org>
Date: Fri, 31 May 2024 11:06:58 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Sun, 05 May 2024 09:03:32 +0200, Christophe JAILLET wrote:
> 'is31fl3190_regmap_config' and 'is31fl3196_regmap_config' are not modified
> in this diver and are only used as a const struct regmap_config.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   13827	   2002	     32	  15861	   3df5	drivers/leds/leds-is31fl319x.o
> 
> [...]

Applied, thanks!

[1/1] leds: is31fl319x: Constify struct regmap_config
      commit: eccf45fdbfcbc9890a02d53c0a6c45271c37969e

--
Lee Jones [李琼斯]


