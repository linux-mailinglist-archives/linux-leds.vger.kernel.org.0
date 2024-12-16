Return-Path: <linux-leds+bounces-3614-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731069F2D5C
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 10:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 943457A2C23
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 09:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2F020124F;
	Mon, 16 Dec 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu+toPIt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55712201026
	for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2024 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342666; cv=none; b=shuB/7bfGhlT8jwrrUJIkPkn0h1SJQS+Z13296Dejy1kyH92XGi5/FZnVGWuDzxIuVK9jVfsBPFbgF3j1Q6spMhlTrGb+T8jLRla/nTvWB5+9wp9dKNW3pcIjXeprUteFyxry0pmu5jSvRFfkM+OL45kcXitfBMy8ZgTmVWrJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342666; c=relaxed/simple;
	bh=jEUqCNOoZENBgh8GFUqCrlDM0LR0Owp4LYxS3j6cN38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFiKjSip87fkiCKDhMjlMLD8PiuoMBgAbXuY7fDJmsuTZe5J07Y1k+OpvT8GQ1zyCmDv1zFDjT2N1TxagQl8DGBTOfApOb9tuy7NJ0BF80Mr8jL+nmieMY3ebxOz5p33xw0bPV1CWxQFvihQsov+8VT9J+nQWUc5lSqFPKzy3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu+toPIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243CFC4CED0;
	Mon, 16 Dec 2024 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734342665;
	bh=jEUqCNOoZENBgh8GFUqCrlDM0LR0Owp4LYxS3j6cN38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vu+toPIt31QMifnmqeWg9DjKCJQVoSJHSoJOWDFQR2LAlW2lG6vofNZieYm4UaaIZ
	 C3LxYZaFFIBkaVWxlYwWhRyXPYoRmHOZ4a/sJz/4rVS1b/H9RuVgugA+p+372AN91V
	 J/SVkDwyXz9lfh9b/PCIQNBy50Nj6Mc4qvUEWbcp7Q91Uz/eXzHCf3vNvRSVhwdKKU
	 snXSC6gkJrNHzqwoVvcoBQdrJhV9yPt1B7RzdFG/VI5Tr+hQW+rvNejgAb3sH8hHkv
	 Wy/Kvqg+Qwf/kFJM10aCPkrBjdfrmi1gN6oBSyPRBhkcH1Enw3mbMXHFtTG7YEqxx4
	 frus+rx7/Yq+w==
Date: Mon, 16 Dec 2024 09:51:02 +0000
From: Lee Jones <lee@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
Message-ID: <20241216095102.GI2418536@google.com>
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
 <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
 <303538E55468284B+287412a2-b1dc-45d0-af5d-c33c0c63acc5@radxa.com>
 <20241212190407.GM7139@google.com>
 <F60FA21FC28E019E+90aa034b-2edd-435a-a4c4-17910267089d@radxa.com>
 <20241213163540.GB2418536@google.com>
 <EF91924B2E892C4C+6a08f801-3ccc-4ccd-a700-c5fc569c11df@radxa.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EF91924B2E892C4C+6a08f801-3ccc-4ccd-a700-c5fc569c11df@radxa.com>

On Sat, 14 Dec 2024, FUKAUMI Naoki wrote:

> Hi Lee,
> 
> On 12/14/24 01:35, Lee Jones wrote:
> > On Fri, 13 Dec 2024, FUKAUMI Naoki wrote:
> > 
> > > Hi,
> > > 
> > > On 12/13/24 04:04, Lee Jones wrote:
> > > > On Tue, 10 Dec 2024, FUKAUMI Naoki wrote:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > Could you help me(write good commit message), anyone?
> > > > 
> > > > Surely you know what the changes you authored do and why you authored
> > > > them?  Write out a nice description in your first language then use
> > > > a free online translation tool to convert it into English.  It doesn't
> > > > have to be a novel.  Just describe what you're doing and why it's
> > > > needed.
> > > 
> > > I have no knowledge about electrical circuits...
> > 
> > You must know why you made this change?
> 
> I noticed strange behavior on Radxa E25 which have pwm-multicolor.
> 
> I compared leds-pwm.c:led_pwm_set() and
> leds-pwm-multicolor.c:led_pwm_mc_set(), and found difference.
> 
> Do the same fixed the problem, so I just thought this is correct fix.
> No knowledge was required.
> 
> Btw, this is enough for me.
> 
>  https://lore.kernel.org/linux-leds/d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at/T/#t
> 
> Please ignore my patch. Thank you very much  for your help, and sorry for
> wasting your time.

You didn't waste my time.

If you see any other issues, please feel free to submit them.

-- 
Lee Jones [李琼斯]

