Return-Path: <linux-leds+bounces-2188-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94896927B86
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 19:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE251F23CCB
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 17:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ACA1B1509;
	Thu,  4 Jul 2024 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+KdYzmg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ACC18AED;
	Thu,  4 Jul 2024 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112649; cv=none; b=nTr+SQ66S0l4EL2jkczDsvkeE6nRmsEpH4pvZ8rtFPmARvQoPZ6X3etnRCp9xIPUqeKT59buZTxLxlPEwBISn+rRPmXBiyWreNJppyFp1cbEUxxXAKpLGnUyH+YU5TSLgeEuknCRzW35QEjfJlv6g+arHXmW8UglfuJfqEraJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112649; c=relaxed/simple;
	bh=JeG2IzQfDXMWRGEgY0tRuwgzNcYTIw9XXTFAX5BmViU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e4or4FJF7xZ9pycgLb8ZBVBWiHnTrmP4ZTDOmq4sW0+pKr/hLzsKdKYKr/ka/OJwSM9Aj3ucrklkJhdudmzgN66Li6CTbVPMLa7B8umO8y9RmMSPhaGlMtohkjIEI3t+8Lko/6GZGrIJOEZibuVdHSKEn+L/5G5nmqRWUZaYqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+KdYzmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC33C3277B;
	Thu,  4 Jul 2024 17:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720112648;
	bh=JeG2IzQfDXMWRGEgY0tRuwgzNcYTIw9XXTFAX5BmViU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W+KdYzmgFDBE/WfG+flaoYbK2N7WK5ur44s5DjCsyTaZIEsM8bF7P1zrPbkAnOJXs
	 HdD9VaVdAjoSd46iH+jyF50oyhJyCU0fk4ejnuKrq8tz1vpok6nWhiVuQkCx2gvBhl
	 TiMFzmiO8cWRPxi1OHH0hB1kt29JHohZMaPqij1cXlSL5pzNsPPtxhjGzMA2x1eU4a
	 Wi00/tQvSuUlEkbNFVjQ8ZdyoY85aNBxwpm8+rbxxiEraxPsCh9VgfMCu/VrlUUh29
	 +iXh08OWDfUhMQZeOCc15MVVV1GZbYPWizgvIMDLIwnXgi4Xd9H0R15egG3Tz+o87r
	 Zqwgv8j6xBLrg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <ZoWJS_epjIMCYITg@stanley.mountain>
References: <ZoWJS_epjIMCYITg@stanley.mountain>
Subject: Re: (subset) [PATCH] leds: flash: leds-qcom-flash: Test the
 correct variable in init
Message-Id: <172011264702.552322.3898391925473000989.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 18:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 04 Jul 2024 10:19:32 -0500, Dan Carpenter wrote:
> This code was passing the incorrect pointer to PTR_ERR_OR_ZERO() so it
> always returned success.  It should have been checking the array element
> instead of the array itself.
> 
> 

Applied, thanks!

[1/1] leds: flash: leds-qcom-flash: Test the correct variable in init
      commit: b9bd590268485652b928110b5543057543b5d02b

--
Lee Jones [李琼斯]


