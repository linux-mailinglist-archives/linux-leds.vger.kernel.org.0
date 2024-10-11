Return-Path: <linux-leds+bounces-3072-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A1999FD2
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 11:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E151D285F37
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 09:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5C420C497;
	Fri, 11 Oct 2024 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp2W0zIR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850520C493
	for <linux-leds@vger.kernel.org>; Fri, 11 Oct 2024 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637769; cv=none; b=k9mqPKrAT/92twAIObEpI/zXSWA7wVzCHRi0b1Ppzz9tNazhHgtwtS/V4UgoDmvw4qQqKRZD+V6Cv6oIO3WCpeShZj6M+R9+MVFHuCg27EkKSk4IXe/GTL18VKmeeWcQVHXdP9upAc8HMvIJeMlnWObfrr1CVOBgJHYStDAkLSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637769; c=relaxed/simple;
	bh=2dYawn6DCXjQg/jvi5JrSr+eOkN0YsGInn45yWthHII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J0wcZy4rGBscmJSmOjmVrm+yGex8rBt27Lo2L/BUQ6RhX+xhtgMZ+B8ofq857sM3JTTqjonzVzzmAEmBM3N+Lbr8BMArpyxRqP7pSj5DnRE26EjQhi16x9SzidOY2UIW/yKn0oE256Pa2kyWzY1mtiia7S7Ka1CWoIaHI/5gLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp2W0zIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225F4C4CECF;
	Fri, 11 Oct 2024 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728637769;
	bh=2dYawn6DCXjQg/jvi5JrSr+eOkN0YsGInn45yWthHII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tp2W0zIRVMYMlYo9Jgf2FYU5TXY4c+861FCfLK/SLKXKBNAI3XNdiaNPjtxZZtz/x
	 fZxNGy56xxJMZBzWLFFxqtGyxpES46WhJLZLcVtRxBStxiWjV3iEltmDoC6J5CTm7z
	 4YNn/KaoGeBTYdFUkWlQfxPugZ52npnJE7Nzh1sELZw6eMKqtXNftGZXkOW6sU7Tre
	 I9xZF4Yx0EiavnelFvdueuVZm6TXEYVHmY3pFP7EXV0mspfEzL4yjuAwNPGi5BwQuQ
	 KRvjxNEL5AVcSenBynewmaexS+KAKHYVt9L2duxOPV6nENeW5f29zGGy22dXWrSzvd
	 +7AmZk47hP0TA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20241010203622.839625-5-u.kleine-koenig@baylibre.com>
References: <20241010203622.839625-5-u.kleine-koenig@baylibre.com>
Subject: Re: (subset) [PATCH] leds: Switch back to struct
 platform_driver::remove()
Message-Id: <172863776787.3130628.8143134267719524176.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 10:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 10 Oct 2024 22:36:23 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/leds/ to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Applied, thanks!

[1/1] leds: Switch back to struct platform_driver::remove()
      commit: 0791e9106c22c6909124c8199b783b60ea0933b0

--
Lee Jones [李琼斯]


