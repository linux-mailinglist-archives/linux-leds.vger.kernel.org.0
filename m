Return-Path: <linux-leds+bounces-304-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F1808CE9
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E001F20FA4
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 16:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877544652D;
	Thu,  7 Dec 2023 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3NXDXj9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AF46523
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A758C433C7;
	Thu,  7 Dec 2023 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701965290;
	bh=NLXrWGgCle+K9avDw3/pFbkiwulQiMz/pCPkfsPm0FA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F3NXDXj9k0DpPmkkEU2rQBExXjp50eszc3UfXVC3G1aGr4He5KbfhbBkZV65WRpWJ
	 B22vZrEVHoIdTTChWgxTfNl+6WJWcJ3xrSiBAoydKN0wJGmJQi7wssRxpQIEEGxY1o
	 KGv/DfYvqRV8VyRdm/shQwkjIbBjoUjH5DXnEKtUZC1sE2GYT+u3LYRvM2hfrR/35f
	 NMaHvuvguXmhbQgBHJk/m3rqwx8xSmxZMf07xg+JLnrapF3kXIZf8wWvnKZ3HcM3R6
	 b0VQXc/734ynwmVWyPL7yq+CKRh83a9Yb86TrBiDScbjCm/2LSR9OmeMGTvsJbfuYL
	 vLv5U5QRWSQxw==
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-leds@vger.kernel.org
In-Reply-To: <20231202183636.7055-1-wahrenst@gmx.net>
References: <20231202183636.7055-1-wahrenst@gmx.net>
Subject: Re: (subset) [PATCH V3] leds: gpio: Add kernel log if
 devm_fwnode_gpiod_get fails
Message-Id: <170196528908.120167.9684467256507607611.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 16:08:09 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sat, 02 Dec 2023 19:36:36 +0100, Stefan Wahren wrote:
> In case leds-gpio fails to get at least one of possibly many GPIOs
> from the DT (e.g. the GPIO is already requested) neither gpiolib nor
> the driver does provide any helpful error log:
> 
>     leds-gpio: probe of leds failed with error -16
> 
> As the driver knows better how to handle errors with such mandatory
> GPIOs, let's implement an error log which points to the affected
> GPIO.
> 
> [...]

Applied, thanks!

[1/1] leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
      commit: 430545cd13d0f554aaadb8b938ac0bdf7a70a413

--
Lee Jones [李琼斯]


