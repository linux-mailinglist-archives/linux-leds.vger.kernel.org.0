Return-Path: <linux-leds+bounces-3073-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C1999FD4
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 11:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A864286AEA
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 09:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9518620C471;
	Fri, 11 Oct 2024 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpYZp+0e"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AFE20B1F4
	for <linux-leds@vger.kernel.org>; Fri, 11 Oct 2024 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637842; cv=none; b=KBBai9VAA84+y1gZOuJmmIozz8O6Nb4HVAOuS/NsYjSpCi39nLHr0I/NYncGTxlGUqL+19aG8YTQ0lEOVdSsyACE1WBsg9A+h5OJtSTuTLqfVKuIFzb2rOQ4cc3BrlwIy3CUANV3qLhDAY+OhNuNuIvk+xazxniJ6D54l15LrzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637842; c=relaxed/simple;
	bh=uMFX5Ozf5aaudcnEbnCHqrULVPatkHoyDJiHqJbdDJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnV1OUmFChIY3ZItQVQpwKB6pbkvatnUZlyXAZlDlLfWPi9TEnPKg0OpMSt6vqh0XsbyJw/z9Ht9877s0Vx0irm3CyyoRGEIDG4jARh0pWEouOt9eRYYlDtbUENLtd8yt8Rtlh0+/eGdJQXCH/2MhPkEHqC7E3TIAhwu8+V0pO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpYZp+0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5DEC4CEC3;
	Fri, 11 Oct 2024 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728637842;
	bh=uMFX5Ozf5aaudcnEbnCHqrULVPatkHoyDJiHqJbdDJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpYZp+0epDKmnlFOa7tYr1/VFWUwBpwOIKVKtV7TrfplLCPzdqVKKY6YpaBib27i0
	 K0PYb0iCvmO/+9CIaDvKj8HxkpmYNt2IE4jgPIJpfKm2lumIiuWxRfq5j0h5id1zrA
	 oCkBSNrJjgBkDqJEXr40pX/GeOoTG3m/PErzuvC53DJvTGgjHPpiqSt6+t8u9H+Ov4
	 GNa8hfuturQtQHHTh54BtEclN6V7iEAdRjUS9CXKjbbDoLGnnBqBo9+d6LEVoz1wY4
	 QoK+6GskSeTfOZ5IndrmFXEYsz1wEuyA8Xy5HryPlKjje1IrFzvIKA/yEf057foHSB
	 UKsuqojA0QPPQ==
Date: Fri, 11 Oct 2024 10:10:38 +0100
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Switch back to struct platform_driver::remove()
Message-ID: <20241011091038.GA3073012@google.com>
References: <20241010203622.839625-5-u.kleine-koenig@baylibre.com>
 <ZwjQ202CCspJS1K6@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZwjQ202CCspJS1K6@duo.ucw.cz>

On Fri, 11 Oct 2024, Pavel Machek wrote:

> Hi!
> 
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> 
> Would it make sense to wait few years with that? I feel this is going
> to cause problems with backports to stable...

Stable shouldn't be a consideration when taking Mainline commits.

This is the same strategy we used when we did probe_new for I2C devices.

-- 
Lee Jones [李琼斯]

