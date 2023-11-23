Return-Path: <linux-leds+bounces-112-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0C7F61DE
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 15:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35451C2104F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 14:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0682A33CCF;
	Thu, 23 Nov 2023 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZo0f+CL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCC433CC8
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 14:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAE1C433C7;
	Thu, 23 Nov 2023 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700750859;
	bh=+th0nIoDm1aaTnqJ4eM6ZXTyefMOYaMLSlSeSUCjtjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZo0f+CLMFYCcBTjYTUawrekLzgsPKFVVK7dGUuLcztUIWJoYKIV31J/zWOdbqLLj
	 +6xJAATodTiRJJy+Ll3TQBa8GaOyS+88QHHEM+Umo985t4LWSqucNd9buqN5s+F0qS
	 d6EFak9zGW7Q2FpFVu1ZI80EbL8iKJYTv1vYpmKAEpFT14Az+2xWh8HY6nbEAkKy77
	 lfolfJ+gtBOxKChZ03O3eZKtLzn+aQ4Gm3i92Ohi4b8MYhUe1ZkeKd5RaiEc1ZaB72
	 uo8luPBhZPDY/Gb/gR5fz1DN4o/m0GHjHEIBoqOnHyNDD+nxnDwcKhJ2QSJnaKXGR+
	 2So+TMpaoW6sw==
Date: Thu, 23 Nov 2023 14:47:35 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 2/4] leds: trigger: gpio: Convert to use kstrtox()
Message-ID: <20231123144735.GB1354538@google.com>
References: <20231103195310.948327-1-andriy.shevchenko@linux.intel.com>
 <20231103195310.948327-2-andriy.shevchenko@linux.intel.com>
 <20231123110538.GA1243364@google.com>
 <ZV9dd6khfmWmj6D_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV9dd6khfmWmj6D_@smile.fi.intel.com>

On Thu, 23 Nov 2023, Andy Shevchenko wrote:

> On Thu, Nov 23, 2023 at 11:05:38AM +0000, Lee Jones wrote:
> > On Fri, 03 Nov 2023, Andy Shevchenko wrote:
> 
> ...
> 
> > > -	ret = sscanf(buf, "%u", &desired_brightness);
> 
> "%u" (see man sscanf() for the details)
> 
> ...
> 
> > > +	ret = kstrtou8(buf, 10, &desired_brightness);
> > 
> > Where does 10 come from?
> 
> See above.

Hmmm ...

I see that this is generally accepted.  Although is looks like a recipe
for bugs to me.  It's a shame we don't have something that can take a
variable, derives its type, then calculates the maximum length if
converted to a string.

Anyway, I'm probably babbling now ...

-- 
Lee Jones [李琼斯]

