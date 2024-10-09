Return-Path: <linux-leds+bounces-3021-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99C996E37
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 16:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19965B21717
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5AD6F307;
	Wed,  9 Oct 2024 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxdKjGvi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB23BBEB;
	Wed,  9 Oct 2024 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484672; cv=none; b=pS+jOwp67FARYrdDZMO7tkXlbohKGt6v7WA/6vWcsXiTeFHZouXZ0prayMHjilTM4XQ4/nJs+9ClMV6Uu1XxlBsasAHODrFEZZBxgFGerLG5FYUpXkhOY42JBfOaS1HsWnDrkGBwXPf/XXD7f1VZySZQ1CU+osatZ128mwHEquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484672; c=relaxed/simple;
	bh=JyLQXlIY3hprDRzvgOzkk+Vbr1Y+4p+d5HP4RlzTaZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oXycDdxFHS9FXiLvnrYJ5Mm+F+OkTCOictlXzmxWPP22dNZRYy3bAg3MfHqOIW3IzyXuxho4ma3aoR1YIaG22RAPFZ997zEa6I9dmaa6PvV+tUzsfc5IEYa0JIX/cZNU8ZsMbMUcC3M0BZhaHHnqmzw8A2WQG5IYBRHmuOr3z3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxdKjGvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6414C4CEC3;
	Wed,  9 Oct 2024 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728484672;
	bh=JyLQXlIY3hprDRzvgOzkk+Vbr1Y+4p+d5HP4RlzTaZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sxdKjGviAJH0+YKizfdW39acH/s6REtA60jR2V3PHixq45DkwgMdGJWa3vE1r/bsD
	 gAHa0fx4AYrPqwzLk1h4vgDv7gWh98PNlq717m+L3VcS8ucfhg0fhzbGfZSccciHor
	 wywmXaijCjj8kf6CW1FarYai9mWKHArr++6pCXVL5JkYGbpUpMErouf7ep9oZ1VQAx
	 EfOp/Hip2tzXVWto1/yMzD5ACbCs6V0JrNn5qYFf9eElT0XoiJ53pGPqi6737M8NgA
	 EUp/0va95vBshA6DwlHkePPw8lnkZiTfWXnTdWV8qyAw+RtvjQTkYlMslcrqe8KLVr
	 aW0NJYt+aZV+Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
Subject: Re: [PATCH 0/6] leds: Remove local leds.h where not required
Message-Id: <172848467067.595475.11662868342638735364.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 15:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 27 Sep 2024 23:37:39 +0200, Javier Carrasco wrote:
> There is a logical tendency to move elements from the local leds.h to
> the global one under include/linux/ to make them accessible for users
> outside the leds subsystem. On the other hand, some users of the local
> header, which also include the global one, do not need to include it
> anymore as the elements they required are no longer there.
> 
> That has been the case for leds-gpio and leds-pwm, which used to obtain
> led_init_default_state_get() from that header. I could not identify the
> reason why the rest of affected drivers included leds.h from the
> beginning, but I suppose they used to require something that might not
> be there anymore, or it was just added "by default". Either way, they
> don't require it in their current form.
> 
> [...]

Applied, thanks!

[1/6] leds: flash: Remove unused local leds.h
      commit: 827a0a3724c5e516b7c0dbfd3f0d907dc947a10b
[2/6] leds: multicolor: Remove unused local leds.h
      commit: 026432e7c26484eb613d8224c98e554c7bc7d768
[3/6] leds: gpio: Remove unused local leds.h
      commit: e7160d5ee369c016418ba239516d24f086130aa4
[4/6] leds: lp50xx: Remove unused local leds.h
      commit: d1aa93196ca601472f4300bed103ce74ff2e8a2b
[5/6] leds: pwm: Remove unused local leds.h
      commit: 9fd316962a2089f25db286c1042eeba3f08a2bed
[6/6] leds: turris-omnia: Remove unused local leds.h
      commit: 3cfd6ad3e1d9ea4ae2e13d384c3c95726593dae2

--
Lee Jones [李琼斯]


