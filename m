Return-Path: <linux-leds+bounces-4333-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC911A6B727
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75FD03ACF25
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDE81E1DF1;
	Fri, 21 Mar 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cprMQ9GL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FE374EA
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742548981; cv=none; b=gbX6KI8BhbQzw29d7eOnTYAzZdINruevIjZGpYRznUD0nyhq1ExPd/ZteIsbHZMQiZK4aQwJJzu1/rneGimlQyE+J3Qcc/edo9YRacDZNs2G8bg4X/8iru2Y+59A3LIX/LLbAbRq3Y/cCRVTeVRisFTQgBEBJUaLv30n1YoxTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742548981; c=relaxed/simple;
	bh=tL3IECA1Hm6/ydpTNbEiBwaicmqKeP0hAN7nlwKPvRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAWUWc/X5g7lpnIOxkYLRSAOSUXk/g5GspI7LZfaCyUkpOzQWz2vy3DpBe40kDPfIHXHVInt6mQPQOpJh4bp69B+Vmeh8nU8y9xzeLvTJOOzBhHGFJ1zmYwE9fmoSYiGO9ywBkGFcakwk5g5xjRAmxel7B69QVRyrZ6vd8byYgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cprMQ9GL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F904C4CEE3;
	Fri, 21 Mar 2025 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742548981;
	bh=tL3IECA1Hm6/ydpTNbEiBwaicmqKeP0hAN7nlwKPvRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cprMQ9GL0wHMz25p5k9HkqfDK/h54czveHGqN5MlNBUzsQOj3Cb0SvRIlj0SErTbb
	 ALThTRvROVVA4FhrkEN82rw4TCH28CD59KAwNsdH4d2zYeqYaKlf+cy3JA4fm0to6j
	 eiQJSsdBlRCWNN1/WWtnFq5HX90Vdwc34cwl1DS1ZAM5/AIHCKbbwizjhz0hgF44TR
	 GmZkLvcvv5IoDvVeXWoL0s72J9PO8H0uQA9gJ0vB4qbT5DuFikkWK5m4qYr6ycUjKN
	 AB2qBs1GzU7IJMbzErLkSaVB4ATrQc49BuSzLJ7lVzI0pWQi/s+zFPqYd8ToVe/TL+
	 3Iw2Kf4s+woJw==
Date: Fri, 21 Mar 2025 09:22:57 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: broken Simatic leds
Message-ID: <20250321092257.GD1750245@google.com>
References: <CAHp75Vfe1KWDeHGYMbXdExF-7mwA_vXHL-3_TBGyyvMZwgjrJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vfe1KWDeHGYMbXdExF-7mwA_vXHL-3_TBGyyvMZwgjrJA@mail.gmail.com>

On Thu, 20 Mar 2025, Andy Shevchenko wrote:

> This broke build
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?h=for-leds-next&id=f33c17919d4489ccff3dd20adc5c02dad5139f09
> 
> Obviously you forgot to update parent Kconfig and Makefile.

Thanks for the report.

I have pushed a fix.  Please could you GTAL?

-- 
Lee Jones [李琼斯]

