Return-Path: <linux-leds+bounces-2071-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97F910E8B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 19:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598A91F233E2
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 17:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7D71B29BC;
	Thu, 20 Jun 2024 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io/PNz+W"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B21AB8F0;
	Thu, 20 Jun 2024 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904624; cv=none; b=uIr2CUlGd9dZyiKEd/4/VzucsJBfHfGPVtvIcYfmG/WQO4mEA4M1zf4kZLA6XL9cQVKejKjSh+W80erRlNRO+cFP724CPXsIE4Nsz2SOp3G+mvO9nox5ejFb8dEkdqPtz1HQm4U7RGsvYczHBH6qc8cE/BAJb7c/5AQftD1h+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904624; c=relaxed/simple;
	bh=iK02/V36i9hR8kwG3cCXAEbfm4PnmKo2X9b88lBJgjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvTybpx1UZR9dsp6V5D5Li0UCbOZvP9H55/c+uLOcBkA7AQR7VLtgjUcHkHAzQluh4qPep2rIHYFjaqQTkcVmXo7mghAtf0ptZBonGYe53maNNoCkzdlDmljy8s9wdPS5wZZQ3LFKFcscA/AcJooii1PbSJVDH8ut4GZKmcBX/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io/PNz+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53554C2BD10;
	Thu, 20 Jun 2024 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718904624;
	bh=iK02/V36i9hR8kwG3cCXAEbfm4PnmKo2X9b88lBJgjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io/PNz+WmqjDIH2KxtvUkQ2lgEP7c2QKC8Fb1nIVzRic6EQEE67qQMXJWRpA2v4Vh
	 rk91hji93MD9qrqK1Lmj6DuUKkmOEc7vmlFMRBxyXtUpq+fswYbPj14vk9O9tleeBS
	 N3aHPjdTAv+5ee4YAn2yzcfgoXfWSXtnOIHULBhgNw0iIr/o2qB5QvZ8+NFe52OAns
	 ZbAqV7/YXPF1Z4WKD7S0of1V5OC9cj7UfkfqYZuEUg+egnlSznVrLMO1Xv+V5A7KeF
	 yYO1LEJJ7YeYkbaiPrjOU4Dv/SaVm2B8uFG50bbskEj3g9dF9tRZGdmLTIYhhD4pqE
	 Ww6i7kRGLY9SA==
Date: Thu, 20 Jun 2024 18:30:19 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/20] leds: leds-lp55xx: overhaul driver
Message-ID: <20240620173019.GA1318296@google.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
 <171890216265.1289520.18025885103780443097.b4-ty@kernel.org>
 <66745e9b.df0a0220.41e53.a3af@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66745e9b.df0a0220.41e53.a3af@mx.google.com>

On Thu, 20 Jun 2024, Christian Marangi wrote:

> On Thu, Jun 20, 2024 at 05:49:22PM +0100, Lee Jones wrote:
> > On Sun, 16 Jun 2024 23:51:59 +0200, Christian Marangi wrote:
> > > This long series is (as requested) a big overhaul of the lp55xx based
> > > LED driver.
> > > 
> > > As notice for these kind of LED chip there was the bad habit of copy
> > > the old driver and just modify it enough to make it work with the new
> > > model. Till v4 I was also doing the same by following the pattern and
> > > the code format of previous driver.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> 
> Mh? What happen? I'm preparing v7 with the changes requested :(

Tooling issue, please ignore.

-- 
Lee Jones [李琼斯]

