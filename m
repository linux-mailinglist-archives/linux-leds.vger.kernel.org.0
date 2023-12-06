Return-Path: <linux-leds+bounces-272-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F4807122
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 14:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 491C8B20DC8
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 13:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D9C3A8D9;
	Wed,  6 Dec 2023 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd4z+QBc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F713A8C9;
	Wed,  6 Dec 2023 13:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48689C433C7;
	Wed,  6 Dec 2023 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701870444;
	bh=pN7ek/mF4Oc2DQGrSxYppSDy2KSxkWe9q08aNujDOf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jd4z+QBc8VWOIMuZ7yOWg1WhiF/HO0ejs5m34x9xAZGHeqT9sds1JobDii52CWUNF
	 K/Uv1RajgOejBlAW/B/n4/jO8ubSb5yP4v8tvLWGiXWX/4FCw40OtqtWKOmEbs8m5m
	 Ynzs+yYj2LMtjNmlgg64T7JL7rwhkh13fA1b3W5QASdTvD+biyWdLtpehhZJwMywxT
	 oSpr5j2d/PdYOG2WYdYCJ5x/pD97Ox0/qGeeIsoOBGQ3yN3npZRL+VZbGJ5VfFC1q2
	 TwdXoVgukkE1CRGIKVEraeXTg/zOpeuq58A/zW0R5K43QHbENJbH9JASGFzZ0crlx9
	 bLUwMEcTwMd7g==
Date: Wed, 6 Dec 2023 13:47:19 +0000
From: Lee Jones <lee@kernel.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, pavel@ucw.cz, kabel@kernel.org,
	u.kleine-koenig@pengutronix.de, m.brock@vanmierlo.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [Patch v8 0/6] ledtrig-tty: add additional tty state evaluation
Message-ID: <20231206134719.GF3375667@google.com>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <170142723852.3350831.6373465907279189004.b4-ty@kernel.org>
 <8acd2694429af4f7205db7d7bb39eab6@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8acd2694429af4f7205db7d7bb39eab6@dev.tdt.de>

On Fri, 01 Dec 2023, Florian Eckert wrote:

> 
> 
> On 2023-12-01 11:40, Lee Jones wrote:
> > On Thu, 09 Nov 2023 09:50:32 +0100, Florian Eckert wrote:
> > > Changes in v8:
> > > ==============
> > > - As requested by greg k-h [6], I have send the patch 2/7 of this
> > > series
> > >   about the memory leak also to stable.vger.kernel.org [7]. This has
> > >   already received a 'Reviewed-by' from Uwe [8].
> > > - As requested by Maarten, I have adopted his suggestion to invert
> > > the LED
> > >   blink, so that I do not have to save the 'state' in the tty data
> > >   struct [9].
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/6] tty: add new helper function tty_get_tiocm
> >       commit: 5d11a4709f552fa139c2439fead05daeb064a6f4
> > [2/6] leds: ledtrig-tty: free allocated ttyname buffer on deactivate
> >       (no commit info)
> > [3/6] leds: ledtrig-tty: change logging if get icount failed
> >       (no commit info)
> > [4/6] leds: ledtrig-tty: replace mutex with completion
> >       (no commit info)
> > [5/6] leds: ledtrig-tty: make rx tx activitate configurable
> >       (no commit info)
> > [6/6] leds: ledtrig-tty: add additional line state evaluation
> >       (no commit info)
> 
> I think that was a mistake? Patchset v9 is the correct patchset [1]?
> 
> Thanks for applying v9 [1]

It's automated.  Not sure what happened now.

Please check to ensure the correct set was applied.

-- 
Lee Jones [李琼斯]

