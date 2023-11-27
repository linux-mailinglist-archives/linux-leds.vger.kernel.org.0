Return-Path: <linux-leds+bounces-168-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D887F9B40
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 116571C203A2
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 08:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61807D297;
	Mon, 27 Nov 2023 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmGsaP1o"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE33D28D;
	Mon, 27 Nov 2023 08:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C79EC433C7;
	Mon, 27 Nov 2023 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701072281;
	bh=jUFAJfcO1rkDyvEedV912gAmDtbtx04dTRR8mU+ZnnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmGsaP1of68Nju7apNbsHuuq3dGvvOU1koV4BM36yns8dZky3R9I/9HGwOZUg1xYA
	 oHWTl4EZgcU0olds/EOakFKeRciLBk7Cjtckx3pg1BI+Yy+ZJTg8jyP+3ePRqiVKJw
	 dFCfbSIYpnM3bx21h3d2Fdzve/6Zbts3qZTaRh1hfTpvkKOIKW8Cy7+oyWat+12tjU
	 7BroTkZXXzHPgjEyxm+cyezApG3Ku1GQUubnez2yUmT6u+27JXWZtRmtmwCLAEDTwe
	 q8NUIu2KQf7JV4wqlpZqoukt7M0WpGCiWjDl5zHKCClVIPqVm5jo/D0AdakiV+HLT9
	 Mvg2CAibAVmmQ==
Date: Mon, 27 Nov 2023 08:04:36 +0000
From: Lee Jones <lee@kernel.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Eckert.Florian@googlemail.com,
	jirislaby@kernel.org, pavel@ucw.cz, kabel@kernel.org,
	u.kleine-koenig@pengutronix.de, m.brock@vanmierlo.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [Patch v8 2/6] leds: ledtrig-tty: free allocated ttyname buffer
 on deactivate
Message-ID: <20231127080436.GA1470173@google.com>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-3-fe@dev.tdt.de>
 <2023112356-amount-undertook-cdb2@gregkh>
 <71eeb0fad7c6d2c4a407df34facee232@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71eeb0fad7c6d2c4a407df34facee232@dev.tdt.de>

On Mon, 27 Nov 2023, Florian Eckert wrote:

> 
> 
> On 2023-11-23 15:06, Greg KH wrote:
> > On Thu, Nov 09, 2023 at 09:50:34AM +0100, Florian Eckert wrote:
> > > The ttyname buffer for the ledtrig_tty_data struct is allocated in the
> > > sysfs ttyname_store() function. This buffer must be released on
> > > trigger
> > > deactivation. This was missing and is thus a memory leak.
> > > 
> > > While we are at it, the tty handler in the ledtrig_tty_data struct
> > > should
> > > also be returned in case of the trigger deactivation call.
> > > 
> > > Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
> > > Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> > > ---
> > >  drivers/leds/trigger/ledtrig-tty.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/leds/trigger/ledtrig-tty.c
> > > b/drivers/leds/trigger/ledtrig-tty.c
> > > index 8ae0d2d284af..3e69a7bde928 100644
> > > --- a/drivers/leds/trigger/ledtrig-tty.c
> > > +++ b/drivers/leds/trigger/ledtrig-tty.c
> > > @@ -168,6 +168,10 @@ static void ledtrig_tty_deactivate(struct
> > > led_classdev *led_cdev)
> > > 
> > >  	cancel_delayed_work_sync(&trigger_data->dwork);
> > > 
> > > +	kfree(trigger_data->ttyname);
> > > +	tty_kref_put(trigger_data->tty);
> > > +	trigger_data->tty = NULL;
> > > +
> > 
> > This should be a stand-alone patch with a proper cc: stable tag added as
> > well so that it can be accepted now, as it is independent of this new
> > feature you are adding.
> 
> I already send this to stable@vger.kernel.org [1].
> The patch already got an 'Reviewed-by:' from Uwe [2].

But then you posted this submission which superseded it in my inbox.

Only the latest patch will be processed when this happens.

> I hope I did everything right and it only slipped through?
> 
> I will omit the patch from the v9 patchset of 'ledtrig-tty'.
> This patch set will come later today with your requested changes.
> 
> Links;
> [1] https://lore.kernel.org/stable/20231106141205.3376954-1-fe@dev.tdt.de/
> [2] https://lore.kernel.org/stable/20231106144914.bflq2jxejdxs6zjb@pengutronix.de/
> 
> Best regards
> 
> Florian

-- 
Lee Jones [李琼斯]

