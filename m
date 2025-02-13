Return-Path: <linux-leds+bounces-3964-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB56A33CAB
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 11:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5524418849D1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 10:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A6B212F8F;
	Thu, 13 Feb 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmHE3b0S"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC27720AF66;
	Thu, 13 Feb 2025 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739442293; cv=none; b=b1FlgCse3wyAFPES8RDPwAoztpzvODObGG/1rDC99UteAlpXsW5J/tIACduCf5htxxLFdb2cv1zVMCJLj6wxs6oAeoGr0P/Sah9WK9t1AZWlw9a7MXwJcVkHUZkdW8qaUULIrCsmuC0R5kiB0L99emWTg8Y65Q3rFVrUibKmOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739442293; c=relaxed/simple;
	bh=xlGbVhIH0YE0BajkxMWWIdpcf/qwJL2JAnhZknrjXxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPNQoHwbYUmOnwZlMjy3h4twrPKDaO6IWVGOxs3OGoCKd9FKKEmJc8C5eZmMAmwa3aL1GxsQUhxBkI+V1KVhYS/kbW+7+AtJuGrR4rtjZ1mZZXPYdQ2wkkXleyNS9c5gW4wt2kG6gXzjzhvCqwOYN8Rg197yAYVYYWG0jcgBozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmHE3b0S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E015FC4CEE2;
	Thu, 13 Feb 2025 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739442293;
	bh=xlGbVhIH0YE0BajkxMWWIdpcf/qwJL2JAnhZknrjXxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmHE3b0So4c1GnxcqmAzyayaulCHqAPyK0L+bm8Rr5jwpO2cybCD69BFN9NIXeDCQ
	 xvZbDS/1+HfG8lm0uBSiW/0rkrD82dPAYIVBUL2kjb5RMx8Ql0003Sp/OKj78TItaU
	 1uNGofs+ZI+24WRQkYd84PvJ7TeYnq6TekYTQQ/JeTDOmvemmXvtLko/6TKP1TD1yk
	 Vz9Kf3C4FWQtXkjWz95EZutNSXALct5/958A/H+6WAUL6Th9XuWocZFqzCy0gaOxnp
	 96c3Z+wmFs99bYh/dQPBJ6tIrBR2QDSvuBlmt0NsKpy1EtShj2OqHa8G+OCmw3TSzT
	 fZasYEy6nrhaA==
Date: Thu, 13 Feb 2025 10:24:49 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access on
 race condition
Message-ID: <20250213102449.GC2756671@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250211133149.GN1868108@google.com>
 <CWLP123MB547308A731A2B7F1B7FF12DFC5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB547308A731A2B7F1B7FF12DFC5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Wed, 12 Feb 2025, Manuel Fombuena wrote:

> On Tue, 11 Feb 2025, Lee Jones wrote:
> 
> > On Sat, 01 Feb 2025, Manuel Fombuena wrote:
> > 
> > > st1202_dt_init() calls devm_led_classdev_register_ext() before the
> > > internal data structures are properly setup, so the leds become visible
> > > to user space while being partially initialized, leading to a window
> > > where trying to access them causes a NULL pointer access.
> > 
> > If this is true, you need to provide a Fixes: tag and to Cc: Stable.
> >
> > Documentation/process/stable-kernel-rules.rst
> > 
> 
> Yes, some circumstances have to confluence but it is reproducible under 
> normal use. I can send panic logs if you want to see the details.
> 
> Since this driver has been added in 6.14-rc1, I thought that, if applied,    
> this patch would be included in fixes before the final release and there 
> would be no need to apply it to -stable trees, as it is nowhere else at 
> the moment. But of course I will review the documentation and make changes as 
> suggested.

Then you need to separate the set into patches you expect to be
submitted to the -rcs and ones which can be applied during the next
cycle, then go to lengths to explain that either in the diff section of
each patch (preferred) or in the cover-letter.

Either way, you need Fixes: tags.

-- 
Lee Jones [李琼斯]

