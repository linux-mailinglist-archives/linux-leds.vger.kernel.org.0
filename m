Return-Path: <linux-leds+bounces-2165-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A818191A151
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 10:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D66B1F23098
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 08:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF02770F9;
	Thu, 27 Jun 2024 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egYZCUA0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3C752F74;
	Thu, 27 Jun 2024 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719476557; cv=none; b=Tw9HsvPvOYzf5KbhkoyAns5XVXiBgs64dk+ZYimId4CGvGGJRry/YLpPPb2HIzG7XCLa9Ap4U7wN/Nr1wPQ15dapwvppPfw5VwgpCYHaVGNzvncL7ONftw7e6oQdYsJIrH9G2X9i52xWboFHzOazf/61IFmxASTD7zNOSLPB3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719476557; c=relaxed/simple;
	bh=Ve6FElwrMclzljUDMaNF6VU5q8bjO760NGenyBWusIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWaM/0JIIuqdanrl9nB3/ed2KB1AtG0ckJ+InrPfxNLy0qA7utVfSUPfXKLhT+y4rKEIVt6YgLb1KqM5dLx71xgY+1sgpay1fdLhMh9OBXfGJBelz9IN/XyWmzhJLkDBm0lCyEwzvMdT+Y404+QeKvSDmZ5pKd33PccQC4dWukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egYZCUA0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611D9C2BBFC;
	Thu, 27 Jun 2024 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719476556;
	bh=Ve6FElwrMclzljUDMaNF6VU5q8bjO760NGenyBWusIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egYZCUA08OmGPu1wGh4ztTVLfV7eiwHaicMKwbf0rDYF/Ofxre2MFAv1qIMfXYUKK
	 nS3uJKh3QcFDvNZAVIjXmdu/yYE6kiMp2ob96mL4191aocOiCriBFasw1xWr9jF4v8
	 EwRsRPjR7B7xEK0H7KLJ5MP2QMyFtQ9xlWHtPYaOvqYsTJLcRY2H/FO9DDKWcx0vyO
	 gEfo2Xjm1ZGmQRkeimFZ0+dAAyDcMNl/DyHusctFb+YbEvCMxiRAO7IaGqTcq2M67V
	 6JgdXE/UfMCYVvawhBUbYixV4wwZUrh7NukB0e9xqltYeurR1ya3jvahVPW1aDOMTJ
	 NFgjyvmCQyfvw==
Date: Thu, 27 Jun 2024 09:22:32 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
Message-ID: <20240627082232.GG2532839@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>
 <20240627070909.GD2532839@google.com>
 <873c2900-859d-40eb-97df-f45f714ed295@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <873c2900-859d-40eb-97df-f45f714ed295@web.de>

On Thu, 27 Jun 2024, Markus Elfring wrote:

> >>> Convert any entry of mutex lock/unlock to guard API and simplify code.
> >>
> >> Thanks that you would like to support another bit of collateral evolution.
> >>
> >> * Would you get into the mood to benefit any more from applications
> >>   of scope-based resource management?
> >
> > Why don't you submit them yourself instead of asking others to do work?
> 
> 1. The change resistance (or acceptance) is varying for possible software transformations
>    in wide ranges, isn't it?

How would that be any different for anyone else?

Resistance/acceptance should be based on patch quality alone.

> 2. I would appreciate better support and collaboration with additional development resources.

In what regard?

Make the changes and submit them.

What additional resources could you possibly need?

> 3. I hope that further improvements can be achieved also by the means of
>    the semantic patch language (Coccinelle software) in safer and more convenient ways.
>    Are you looking for any extensions according to the coccicheck tool?

Sounds good.  Submit a patch.

-- 
Lee Jones [李琼斯]

