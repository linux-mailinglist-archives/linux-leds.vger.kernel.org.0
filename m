Return-Path: <linux-leds+bounces-4684-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8712ABBF39
	for <lists+linux-leds@lfdr.de>; Mon, 19 May 2025 15:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02BDC1889767
	for <lists+linux-leds@lfdr.de>; Mon, 19 May 2025 13:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4162D2797B2;
	Mon, 19 May 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ozbx3FKW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4E26A1B1;
	Mon, 19 May 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661586; cv=none; b=P0+u6DXDPLAyNSCJmOz2Cy9b4xXVpsMjiiTEMHiGJ5QumhA5IlFZvv2DK2o0+Q/X15Hu3CYOy+umSPRqiqtycn/0UnGDp+MlZcZWKnR2m800txgg2gq0SN80+MSBYBEmJwcAMDM3VFpeJl3lbgoC1PiUoAJnDZZIDpKp8pueNp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661586; c=relaxed/simple;
	bh=F52OCFw+EvMrXS6dXXrzs84UViGoYpa2a+bZkDjLHsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW8vUbJJ3X7zZGUgJ4gkKdShxFLERwmHMHYf8iSx1+GpFIQn38bKd6RMe3QIR0CVi3uhXjgrwxpVwcnxvZ7h4QV/KFeJj7apQ3/6k37pFDF/PBrTFHGpOg/DuC2Y/0EuONh8F/LhQA8cenTMDU/PbLyzlkaASYPpeOEgpIvzt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ozbx3FKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2894C4CEF0;
	Mon, 19 May 2025 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747661585;
	bh=F52OCFw+EvMrXS6dXXrzs84UViGoYpa2a+bZkDjLHsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ozbx3FKWjzQ+OxookiKSDd1h4dx0/rKLXUN31JjA4QOqLJXy7QPe3ZJs4UQxg8u3P
	 h/8RjNGpCXDp/FjYVTO9tn/YCWeDhhBtrKu5nSMZVYEHFmkQlr3BbwYxhOzMOUryw8
	 Po4SAK+HzNk3o0n+1hpATR59uNEsTCrQaGCQ9QbgfgoJ1nBEAMOCPihPuC5kQnav3F
	 +4fHriTlrL/njZp8Kv4inhlLvl+kwC//0tlPu0oo8KZ+Bsfvh7xiV57MlojZOAgKUv
	 bZl+NB2Fkb15BTc64TiR88pOzEooUaAJAHHqb4v3p0W03K+iI/h8N3aQXjnBkvfOQV
	 qqzyiOBx3EMLw==
Date: Mon, 19 May 2025 14:33:00 +0100
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, bettyzhou@google.com,
	ynaffit@google.com, tkjos@google.com
Subject: Re: [PATCH v2 0/5] leds: KUnit registration tests pertaining to
 init_data
Message-ID: <20250519133300.GA8794@google.com>
References: <20250515082830.800798-1-lee@kernel.org>
 <7c5a8768-2d19-40b9-a965-966a8900e703@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c5a8768-2d19-40b9-a965-966a8900e703@gmail.com>

On Sun, 18 May 2025, Jacek Anaszewski wrote:

> Hi Lee,
> 
> On 5/15/25 10:27, Lee Jones wrote:
> > Lots of drivers still register with the LED Class using init_data. Let's
> 
> What do you mean by "still"? Actually init_data is the new approach,
> that turns the LED core DT parser on, and is predestined for use with
> {devm_}led_classdev_register_ext() API.

Thanks for the information.  I'll update the wording.

-- 
Lee Jones [李琼斯]

