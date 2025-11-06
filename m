Return-Path: <linux-leds+bounces-6023-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A02C3B0A4
	for <lists+linux-leds@lfdr.de>; Thu, 06 Nov 2025 13:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD3446771A
	for <lists+linux-leds@lfdr.de>; Thu,  6 Nov 2025 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB26331A69;
	Thu,  6 Nov 2025 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MltggMR4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF5332B9AF;
	Thu,  6 Nov 2025 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433352; cv=none; b=Mfay81Y58tOx7nLv+GjcVW3XeAtoDIkbSwt5k2beH0aaZnSu4NVmGCdv9uuCDjQlfZe3+fdHXz2atIDdjqGLmwVU/B1XMo/JjAKb2UC4J7ODgIDdxFpP5mrJ0n4wDraFGSR0GPwVG7jca7RwGsgPlDwBtUzRCrs0CgKRO5t6emc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433352; c=relaxed/simple;
	bh=QDQywIaKu2zH70eH1xnpg06B3uDNQURKWA3m7AA4ORE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SGZMrGxpw1nML246rUz7CZR8mBg0yfeHHU0Ihy1k2Rsp9eBxEmsssTthVRAZM1U5BSWGzj287EjTBD8xnlGraPHejulJhdnAetlDmUJEAgWD9D7kEs+56SHUYOVgZNgss/8jt8Av4lRgKVtEW+OO3KiZJgJKXL6ZU8HuNZgEgT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MltggMR4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A704C4CEF7;
	Thu,  6 Nov 2025 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762433350;
	bh=QDQywIaKu2zH70eH1xnpg06B3uDNQURKWA3m7AA4ORE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MltggMR4vgtGdsLCj/gzb+sebtOBZR1wBC5RNGodC7rZMnaW1LlzNzBlVF0UtlYhw
	 Hv24uyvt5gq3Vbmxb66vBHEagw27oe/WocgXKDu+VOtEqJdfOdOsJYUsHcIBmN1yVi
	 69rU+AgyMEIn4r7MFRty35ln9cXRd+TlqApp1o8gjz6TFKzUeI7XMRvCXuAB9rgBCO
	 zyEYoyK0pa5Fst9R8GH4aaB4jqC7HzCGd/BDdDuCKdGlYoNUPf14lJk1bF05CUFklE
	 v47JpFVmU4EPxXqNQdt8VPEsNItfl4LzSAEWuj7TVLck/rMK9zyd4XYfsKB8ny8V5S
	 GQWhAx7BB2v2Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, 
 Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, stable@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251022063305.972190-1-christian@klarinett.li>
References: <20251022063305.972190-1-christian@klarinett.li>
Subject: Re: (subset) [PATCH v2] leds: leds-lp50xx: LP5009 supports 3
 modules for a total of 9 LEDs
Message-Id: <176243334879.1816120.5182924763211452993.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 12:49:08 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 22 Oct 2025 08:33:04 +0200, Christian Hitz wrote:
> LP5009 supports 9 LED outputs that are grouped into 3 modules.
> 
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> 
> 

Applied, thanks!

[1/1] leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
      commit: 5246e3673eeeccb4f5bf4f42375dd495d465ac15

--
Lee Jones [李琼斯]


