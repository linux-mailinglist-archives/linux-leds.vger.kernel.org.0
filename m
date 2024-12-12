Return-Path: <linux-leds+bounces-3589-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45C9EF8DD
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 18:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE434286468
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 17:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A36D22370C;
	Thu, 12 Dec 2024 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgT3HkDl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DBD6F2FE;
	Thu, 12 Dec 2024 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734025440; cv=none; b=WDu7ZKtqJT24kF/A4qTFgInWw66PtulYe8lJiNNTgA72q9CHa0zhiwLvlfYxMDbkOyiWhdYKSlHWpCxYXK+FzQEQciV7dfKLaLIxLIRcW7bma00Mjk94XpvpbpHtWQL4+zqqLGfMK02RgiguXCbprb7yic2ZFnu6soAd8Ngqklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734025440; c=relaxed/simple;
	bh=eMPKHG81Jfy9CFPtQPGcPgeFeioLtB6U+anTkmb5+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KA7zbgSNfItmPReAlHDlDLuZP1213niEjy3R8YqP9/7RT147NyKuFoy8v19bw/gYN//Pz6e+dzXz7+XjgHdCU1O9XMP4+0DtpwpW16xAizEwh3YTTdmXyurQDb7/axq0ATSGjwpopLOn8cuikksl2eV1s2vnXVB5shJkRVQIiQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgT3HkDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D950AC4CECE;
	Thu, 12 Dec 2024 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734025440;
	bh=eMPKHG81Jfy9CFPtQPGcPgeFeioLtB6U+anTkmb5+u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgT3HkDlvvgQs/SpqlrZ3/k+zlYW3kngxx0p51CU45OolBLVH2VzMDP7iq9gWUpyG
	 zwf2RNgEcs/x2P51+kEgWzEvGfcGZ0OjdeWoUTfn0p1g+QhA+EQLWvGjFUN9IR3mj5
	 UnhFKoLkCimodRKetv+OhNnHPHjoGNvBq9jaoTKk5hovAKe3Bu/AmtLIsN3KjSCOcV
	 ERzuXkPwbXs2EUMMp0kGeqStEY/nAESQMkx58NP+54MZnf1SbY04vHOI1BFjzc6yxc
	 AMuFWT5AcEb+uvybtlqVAka3Ufr00N0H7iITeSY1iTtL/uuq0NTLdrxB5YM0Br5YIk
	 cS1S+PWd8wvpg==
Date: Thu, 12 Dec 2024 17:43:56 +0000
From: Lee Jones <lee@kernel.org>
To: Jakob Riepler <jakob+lkml@chaosfield.at>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] leds: pwm-multicolor: Disable PWM when going to
 suspend
Message-ID: <20241212174356.GJ7139@google.com>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
 <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>

On Mon, 02 Dec 2024, Jakob Riepler wrote:

> This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> has to be disabled for the PWM to enter suspend.
> Another positive side effect is that active-low LEDs now properly
> turn off instead of going back to full brightness when they are set to 0.
> 
> Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig@pengutronix.de/
> Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>
> ---
> Changes in v2:
>  - fix wrong line-breaks in patch

I get a warning that this patch is corrupt as well.

How are you creating them?

Please use `git format-patch`, `git send-email` or `b4`.

-- 
Lee Jones [李琼斯]

