Return-Path: <linux-leds+bounces-1769-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E78D6423
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78471C27043
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCA915D5AA;
	Fri, 31 May 2024 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNHR+J8B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40020176193;
	Fri, 31 May 2024 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164745; cv=none; b=lyRWQJFMzJ82QlC+ebj8Y22j2ziDBaWqY25xDx023MXDFnBNlMl6eAEiNRA7h9fVBeVBwKs7nGJVV4jqm+nZ7b6ZO6pJpfRPpMz5F1oVql0+B9JJHRnT7+3EYoWZT47ad2IhCmve9tLCxSxLZErZaOljfOZj2B+isgAD3pwVw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164745; c=relaxed/simple;
	bh=nE28feJXr8MPuJwuEZRSEsHxpTmzh4iG2yFFSYfyIBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZTrnSBkg1ytHLlZUZ98B9rptZSaLPZhAhGktyJMAssK3FGkaHDGkg6F46HDbEAhnNLY4Tem7KntWkKb/W1Vqz1kmJHIEZM9AU2+6yXvTA8IccSAtexLShu10VB2XCvnq4qrU4F631HNV/A/n2BDSPlwmRVkjfEVOBOyvD8KAjfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNHR+J8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2049EC4AF08;
	Fri, 31 May 2024 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717164744;
	bh=nE28feJXr8MPuJwuEZRSEsHxpTmzh4iG2yFFSYfyIBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DNHR+J8BC5mW9id4WWWHd7JyQ+k4VIq8JWrWB1y4icmwRs26+ZlCFFDBI9SUREwac
	 RUNKB7A6lF5higO8ga1VVxKf4p3OLjycx28XoEINCg/0Fp5ysq2QBj1TSQ/yedIT8z
	 xuShXtCgyrYgelRbnb+4Q2tdfZKEwUS058HByGfRvvHrP1B4yBdmPzmoU8RHfOnTZC
	 g5pGpKiuX7Z6aWYyjOyfWKfQVI4bGIxmlRrUAaUEpIMmDHic5v13kiIHWhNHr5YXDR
	 4PFagZxclHfaMeHC1BzS1vDQXyBzzml8MeSJd2kbcNJRCFBNp/CG0nOcVRFNEJS85d
	 UPJI01ya2jm6Q==
From: Lee Jones <lee@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Patrick Gansterer <paroga@paroga.com>
Cc: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20240526105136.721529-1-paroga@paroga.com>
References: <20240526105136.721529-1-paroga@paroga.com>
Subject: Re: [PATCH v6 0/2] backlight: Add new lm3509 backlight driver
Message-Id: <171716474187.1122706.14204003162391534648.b4-ty@kernel.org>
Date: Fri, 31 May 2024 15:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Sun, 26 May 2024 12:51:28 +0200, Patrick Gansterer wrote:
> This is a general driver for LM3509 backlight chip of TI.
> LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
> Dual Current Sinks. This driver supports OLED/White LED select, brightness
> control and sub/main control.
> The datasheet can be found at http://www.ti.com/product/lm3509.
> 

Applied, thanks!

[1/2] dt-bindings: backlight: Add Texas Instruments LM3509
      commit: 0aaee23d49a614b573ca51ab7758e77fcc3d7d14
[2/2] backlight: Add new lm3509 backlight driver
      commit: b72755f5b577357cac661cbf9048cad704eb4ad8

--
Lee Jones [李琼斯]


