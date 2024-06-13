Return-Path: <linux-leds+bounces-1910-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C41F79077C4
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 18:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698CB1F23B4C
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8029612FB3C;
	Thu, 13 Jun 2024 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig/AtQeA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940B12FB2D;
	Thu, 13 Jun 2024 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718294730; cv=none; b=tmkUJSf34KnL+bbeQwIBpFD+geF4OMTQhjkf6VeexKIU2OnaTSnoDLcIOM7IirNWCIkJq0FFUq6gh03/X6jCBhSA2KjPWnHIhnzZ2MJsMmwwhbSqTHYimwm/JADSnqqj6HumopX2oHDLYMSQhHSFcv3mC0mSnnyLjEZXhBabUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718294730; c=relaxed/simple;
	bh=XRDbE68dIx7Dk2mbd2m9R43yww6elpy9SBxNaIxcv70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S9c0VbF1qsAmAtF+tytDO9/0poR2kssaMRA0aogcMMxO1oHIATHX95T1mhM8RqBc2L55mHdAAaTgWsxqAm0b2R8f2s6Ile9JOmpYif4uBEFBa/MGg/bDpoF8Gdh6AhXibBCRdRLQaWxJEWJKYE8wrP3cd3k5b9rveVvIaxz8ryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig/AtQeA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CFCC32789;
	Thu, 13 Jun 2024 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718294730;
	bh=XRDbE68dIx7Dk2mbd2m9R43yww6elpy9SBxNaIxcv70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ig/AtQeAadU0if9z5dYzmnCCNJ7BODMUJOhKvXOkwNqTum1jO1RMxGKgpddPW22JG
	 wohkWTN3+r9PvXO+HLvL8wsFv+c4x2F8DFyWk40kkXA9pd9v4Qur5LZHundbBbPxtV
	 A11rFXQOmjp2Z5igsZ8ouz9gyKLBztbvTQ9Ut09qjC5dol/fCFKWJBtjXyPUXwkny3
	 s1qJwi7BJS9+Cjs+nN1OTGCwYpuitSkFk67psA79U99+qY2i4JI2LCm1GBds19c5pQ
	 B4qFaF+hNc7YR/iQ/lWRaMflFN9bC5zRZpddAMRk//IbX6W70c9nF2nNnfWhsmbdzv
	 w01bE+2hUxkGg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20240606173037.3091598-1-andriy.shevchenko@linux.intel.com>
References: <20240606173037.3091598-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/6] leds: spi-byte: Cleanup, fix a leak, and make
 it agnostic
Message-Id: <171829472912.2690295.14539598916904056628.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:05:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 06 Jun 2024 20:29:17 +0300, Andy Shevchenko wrote:
> Clean up the driver, fix one leak, and make it possible to use outside
> of OF systems.
> 
> Andy Shevchenko (6):
>   leds: spi-byte: call of_node_put() on error path
>   leds: spi-byte: Get rid of custom led_init_default_state_get()
>   leds: spi-byte: Make use of device properties
>   leds: spi-byte: Utilise temporary variable for struct device
>   leds: spi-byte: Use devm_mutex_init() for mutex initialization
>   leds: spi-byte: Move OF ID table closer to their user
> 
> [...]

Applied, thanks!

[1/6] leds: spi-byte: call of_node_put() on error path
      commit: 057739faa00602ca64090e084a664715ee74eb3c
[2/6] leds: spi-byte: Get rid of custom led_init_default_state_get()
      commit: 9cb832b2c7bcd8b5decd9e9c07302c802ee25faa
[3/6] leds: spi-byte: Make use of device properties
      commit: 3e3735a40ec6694fa70ae20d33545783b9d555af
[4/6] leds: spi-byte: Utilise temporary variable for struct device
      commit: dc5f64e4c1531d935c239eb4db3957c5cf569bb6
[5/6] leds: spi-byte: Use devm_mutex_init() for mutex initialization
      commit: cc5f66ad5640340ab8fb5753acc7218e2b60d36c
[6/6] leds: spi-byte: Move OF ID table closer to their user
      commit: 2ac2628cc23cae5c3a317eaa7f0d3a1d9359a3c9

--
Lee Jones [李琼斯]


