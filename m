Return-Path: <linux-leds+bounces-2466-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CF954E6A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 18:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE54B245F5
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1C41BDA84;
	Fri, 16 Aug 2024 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQi/QKKE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336CE1DDF5;
	Fri, 16 Aug 2024 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824314; cv=none; b=NH1dtwMq2YsdzuVH/Jxk1z8RGyDyhsu9cp+25C0gLw6Q4wKauV1TTVWjug/64AJr3+CwVcrolYEuDOCQFNobB9Z1l8ZmKa3Cb+zSfw951ka+rb3QSEnhwaQMT/UjIGq5BwhnsXY7ledpNcTNGZrjnhAaAYYl4DMje7HY5MpXURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824314; c=relaxed/simple;
	bh=LDgOP9WVQfCrcitYGsxy1oplgK09T8t98MEAyrYzjYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mG+RP3xZBr/minu0ymE06dzlRCKK10stSjH3gf0xwlcrjekWUO8LzkGdi4T+aM0KcoF8TIlRX7W/8F/xUas3wi/GfNYqcErM66JryKPeK8TRFcwi75jJwu+Lm/bYva1nTbyA1zzGOK8fj3mYvPNEpHnQZmXMMHSS5vySI1D22eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQi/QKKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58C6C32782;
	Fri, 16 Aug 2024 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723824313;
	bh=LDgOP9WVQfCrcitYGsxy1oplgK09T8t98MEAyrYzjYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mQi/QKKE8oU7Jg2fnhqtL81/RqIzt6ILgXxAZlL1BF1MPE36Ex3zzE69h0h4btzkj
	 LFXUEflc+zOTv7i/wfPoOH25S78tFmQmMDDJIbjipfk4LGHpSMnMH+8OVeJrQrYVsp
	 6Uke3DWbf9ICVgUev+QDtGoO2b5Mb4UkvRU1lyZRGLd1o4xQOHHdmEh/gcPpgxBY46
	 x0fiLY3T5xa9CZDFg4DxsPqQIAtPqH1gaaQGXyHE5kRCRHSiXLpb2imtlxFlJV1dxw
	 poj13hFj3XwExqxByhaDcceORlwOWO6BfSLIYBBw0o7dl+dgcNqcz0gweVVStK5TlT
	 NqV70FycIpA/g==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Joseph Strauss <jstrauss@mailbox.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 George Stark <gnstark@salutedevices.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240807075614.2118068-1-arnd@kernel.org>
References: <20240807075614.2118068-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] leds: blinkm: fix
 CONFIG_LEDS_CLASS_MULTICOLOR dependency
Message-Id: <172382430351.3368067.16878264408726300501.b4-ty@kernel.org>
Date: Fri, 16 Aug 2024 17:05:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 07 Aug 2024 09:55:53 +0200, Arnd Bergmann wrote:
> With CONFIG_LEDS_CLASS_MULTICOLOR=m, a builtin leds-blinkm driver causes
> a link failure:
> 
> arm-linux-gnueabi-ld: drivers/leds/leds-blinkm.o: in function `blinkm_set_mc_brightness':
> leds-blinkm.c:(.text.blinkm_set_mc_brightness+0xc): undefined reference to `led_mc_calc_color_components'
> 
> Add a more specific dependency that only allows multicoler mode to
> be enabled for blinkm if it can build and link.
> 
> [...]

Applied, thanks!

[1/1] leds: blinkm: fix CONFIG_LEDS_CLASS_MULTICOLOR dependency
      commit: 17c40f3c94bc2279b879ea9ceb3eea973bcd1ac4

--
Lee Jones [李琼斯]


